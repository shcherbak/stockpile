#wms.inventory.sql

-- NEW DEFINITION

CREATE SCHEMA inventory_new
  AUTHORIZATION postgres;

COMMENT ON SCHEMA inventory
  IS 'inventory items definition';






-- Type: common.inventory_head

-- DROP TYPE common.inventory_head;

CREATE TYPE common.inventory_head AS
   (document_id bigint,
    gid uuid,
    display_name character varying,
    part_code character varying,
    version_num integer,
    document_date date,
    uom_code character varying,
    curr_fsmt common.document_fsmt,
    document_type common.document_kind);
ALTER TYPE common.inventory_head
  OWNER TO postgres;




CREATE TYPE common.inventory_kind AS ENUM
   ('ASSEMBLY',
    'PART',
    'BUYABLE',
    'CONSUMABLE',
    'PRODUCIBLE',
    'PRIMAL',
    'SALABLE',
    'STORABLE');
ALTER TYPE common.inventory_kind
  OWNER TO postgres;


CREATE TYPE common.uom_domain_kind AS ENUM
   ('LENGHT',
    'MASS',
    'QUANTITY',
    'VOLUME');
ALTER TYPE common.uom_domain_kind
  OWNER TO postgres;


CREATE TYPE common.unit_conversion_type AS
   (uom_code_from character varying,
    uom_code_to character varying,
    factor numeric);
ALTER TYPE common.unit_conversion_type
  OWNER TO postgres;



CREATE TABLE inventory.information
(
  part_code character varying NOT NULL,
  version_num integer NOT NULL DEFAULT 1,
  display_name character varying NOT NULL,
  published_date date NOT NULL DEFAULT now(),
  inventory_type common.inventory_kind NOT NULL,
  uom_code character varying,
  CONSTRAINT information_pkey PRIMARY KEY (part_code, version_num, inventory_type)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE inventory.information
  OWNER TO postgres;
COMMENT ON TABLE inventory.information
  IS 'inventory list';



-- Table: inventory.primal

-- DROP TABLE inventory.primal;

CREATE TABLE inventory.primal
(
-- Inherited from table inventory.information:  part_code character varying NOT NULL,
-- Inherited from table inventory.information:  version_num integer NOT NULL DEFAULT 1,
-- Inherited from table inventory.information:  display_name character varying NOT NULL,
-- Inherited from table inventory.information:  published_date date NOT NULL DEFAULT now(),
-- Inherited from table inventory.information:  inventory_type common.inventory_kind NOT NULL,
-- Inherited from table inventory.information:  uom_code character varying,
  CONSTRAINT primal_pkey PRIMARY KEY (part_code, version_num),
  CONSTRAINT primal_inventory_type_check CHECK (inventory_type = 'PRIMAL'::common.inventory_kind),
  CONSTRAINT primal_version_num_check CHECK (version_num = 1)
)
INHERITS (inventory.information)
WITH (
  OIDS=FALSE
);
ALTER TABLE inventory.primal
  OWNER TO postgres;
COMMENT ON TABLE inventory.primal
  IS 'mbom primal component';



-- Table: inventory.information

-- DROP TABLE inventory.information;

CREATE TABLE inventory.information2
(
  id bigserial NOT NULL,
  gid uuid NOT NULL DEFAULT uuid_generate_v1(),
  part_code character varying NOT NULL,
  display_name character varying,
  published_date date NOT NULL DEFAULT now(),
  CONSTRAINT information2_pkey PRIMARY KEY (id),
  CONSTRAINT information2_gid_key UNIQUE (gid),
  CONSTRAINT information2_part_code UNIQUE (part_code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE inventory.information2
  OWNER TO postgres;



-- Table: inventory.definition

-- DROP TABLE inventory.definition;

CREATE TABLE inventory.definition
(
  id bigserial NOT NULL,
  gid uuid NOT NULL DEFAULT uuid_generate_v1(),
  display_name character varying,
  version_num integer NOT NULL DEFAULT 1,
  published_date date NOT NULL DEFAULT now(),
  prev_fsmt common.document_fsmt,
  prev_fsmt_date timestamp with time zone,
  curr_fsmt common.document_fsmt NOT NULL DEFAULT 'PROPOSED'::common.document_fsmt,
  curr_fsmt_date timestamp with time zone NOT NULL DEFAULT now(),
  information_id bigint,
  uom_code character varying NOT NULL DEFAULT 'pcs'::character varying,
  CONSTRAINT definition_pkey PRIMARY KEY (id),
  CONSTRAINT definition_information_id_fkey FOREIGN KEY (information_id)
      REFERENCES inventory.information2 (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT definition_gid_key UNIQUE (gid),
  CONSTRAINT definition_information_id_version_num_key UNIQUE (information_id, version_num)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE inventory.definition
  OWNER TO postgres;


-- Function: inventory.convert_quantity(character varying, integer, common.quantity, character varying, character varying)

-- DROP FUNCTION inventory.convert_quantity(character varying, integer, common.quantity, character varying, character varying);

CREATE OR REPLACE FUNCTION inventory.convert_quantity(
    _part_code character varying,
    _version_num integer,
    _quantity common.quantity,
    _uom_code_from character varying,
    _uom_code_to character varying)
  RETURNS double precision AS
$BODY$

DECLARE
  __uom_domain_to character varying;
  __uom_domain_from character varying;
  __unit_conversion_factors common.unit_conversion_type[];
  __m common.unit_conversion_type;
  __exponentiation integer DEFAULT 1;

BEGIN

  /*
  case
    when __array @> ARRAY[30] then
      raise notice 'msg %', 0;
    when __array @> ARRAY[20] then
      raise notice 'msg %', 1;
    when __array @> ARRAY[10] then
      raise notice 'msg %', 0;
  end case;

  raise NOTICE 'array dump %', __unit_conversion_factors;
  raise NOTICE 'array unnest %', unnest(array[__unit_conversion_factors[1]]);


  case when __unit_conversion_factors @> ARRAY[(_uom_code_from,_uom_code_to,null)::mdm.unit_conversion_type] THEN
  RAISE NOTICE 'ok %', __unit_conversion_factors;
  else RAISE NOTICE 'not ok %', __unit_conversion_factors;
  end case
  
  */

  -- визначити домен одиниці виміру, до якої приводимо
  __uom_domain_to := uom.get_domain(_uom_code := _uom_code_to);
  -- визначити домен одиниці виміру, з якої приводимо
  __uom_domain_from := uom.get_domain(_uom_code := _uom_code_from);

  --RAISE NOTICE 'conversion from % to %', __uom_domain_to, __uom_domain_from;

  -- якщо той самий домен, то використовуємо коефіцієнт Сі
  IF (__uom_domain_from = __uom_domain_to) THEN
    --RAISE NOTICE 'formula = % * %', _quantity, mdm.get_factor(_uom_code_from, _uom_code_to);
    RETURN _quantity * uom.get_factor(_uom_code_from, _uom_code_to);
  END IF;

    __unit_conversion_factors := inventory.get_uom_conversion_factors(
      _part_code := _part_code,
      _version_num := _version_num,
      _uom_domain_from := __uom_domain_from,
      _uom_domain_to := __uom_domain_to);

    -- логіка перетворення з основного домену в додатковий
    IF (array_ndims(__unit_conversion_factors) >= 1) THEN

      FOREACH __m IN
        ARRAY __unit_conversion_factors
      LOOP 
        IF (__m.uom_code_from = _uom_code_from AND __m.uom_code_to = _uom_code_to) THEN
          RAISE NOTICE 'full forward match % to % = %',_uom_code_from, _uom_code_to, __m.factor;
          RETURN _quantity * (__m.factor ^ __exponentiation);
        END IF;
      END LOOP;

      FOREACH __m IN
        ARRAY __unit_conversion_factors
      LOOP 
        IF ( __m.uom_code_from = _uom_code_from) THEN
          RAISE NOTICE 'partial forward _from_ match % to % = %',_uom_code_from, __m.uom_code_to, __m.factor;
          RETURN _quantity *  
            (__m.factor ^ __exponentiation) *
            uom.get_factor(_uom_code_to, __m.uom_code_to);
        END IF;
      END LOOP;

      FOREACH __m IN
        ARRAY __unit_conversion_factors
      LOOP 
        IF ( __m.uom_code_to = _uom_code_to) THEN
          RAISE NOTICE 'partial forward _to_ match % to % = %',__m.uom_code_from, _uom_code_to, __m.factor;
          RETURN _quantity * 
            (__m.factor ^ __exponentiation) * 
            uom.get_factor(_uom_code_from, __m.uom_code_from);
        END IF;
      END LOOP;

      RAISE NOTICE 'finally forward match % to % = %', 
        __unit_conversion_factors[1].uom_code_from, 
        __unit_conversion_factors[1].uom_code_to, 
        __unit_conversion_factors[1].factor;
      RETURN _quantity * 
        uom.get_factor(_uom_code_from, __unit_conversion_factors[1].uom_code_from) * 
        (__unit_conversion_factors[1].factor ^ __exponentiation) *
        uom.get_factor(__unit_conversion_factors[1].uom_code_to, _uom_code_to);

    -- логіка перетворення з додаткового в основний домен
    ELSE
      __unit_conversion_factors := inventory.get_uom_conversion_factors(
        _part_code := _part_code,
        _version_num := _version_num,
        _uom_domain_from := __uom_domain_to,
        _uom_domain_to := __uom_domain_from);

      IF (array_ndims(__unit_conversion_factors) >= 1) THEN
        __exponentiation := -1;

        FOREACH __m IN
          ARRAY __unit_conversion_factors
        LOOP 
          IF (__m.uom_code_from = _uom_code_to AND __m.uom_code_to = _uom_code_from) THEN
            RAISE NOTICE 'full reverse match % to % = %',_uom_code_from, _uom_code_to, __m.factor;
            RETURN _quantity * (__m.factor ^ __exponentiation);
          END IF;
        END LOOP;

        FOREACH __m IN
          ARRAY __unit_conversion_factors
        LOOP 
          IF ( __m.uom_code_from = _uom_code_to) THEN
            RAISE NOTICE 'partial reverse _from_ match % to % = %',_uom_code_from, __m.uom_code_to, __m.factor;
            RETURN _quantity *  
              (__m.factor ^ __exponentiation) *
              uom.get_factor(_uom_code_from ,  __m.uom_code_to);
          END IF;
        END LOOP;

        FOREACH __m IN
          ARRAY __unit_conversion_factors
        LOOP 
          IF ( __m.uom_code_to = _uom_code_from) THEN
            RAISE NOTICE 'partial reverse _to_ match % to % = %',__m.uom_code_to, _uom_code_from, __m.factor;
            RETURN _quantity * 
              (__m.factor ^ __exponentiation) * 
              uom.get_factor(_uom_code_to, __m.uom_code_from);
          END IF;
        END LOOP;

        RAISE NOTICE 'finally reverse match % to % = %',
          __unit_conversion_factors[1].uom_code_from,
          __unit_conversion_factors[1].uom_code_to,
          __unit_conversion_factors[1].factor;
        RETURN _quantity * 
          uom.get_factor(_uom_code_from ,  __unit_conversion_factors[1].uom_code_to) *
          (__unit_conversion_factors[1].factor ^ __exponentiation) *
          uom.get_factor(__unit_conversion_factors[1].uom_code_from, _uom_code_to);

      ELSE
        --RETURN 987654321;
        RAISE EXCEPTION 'no conversion factor found for measure domains % and % for % version %',
          __uom_domain_from,
          __uom_domain_to, 
          _part_code,
          _version_num;
          
      END IF;

    END IF;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.convert_quantity(character varying, integer, common.quantity, character varying, character varying)
  OWNER TO postgres;





-- Function: inventory.destroy(bigint)

-- DROP FUNCTION inventory.destroy(bigint);

CREATE OR REPLACE FUNCTION inventory.destroy(__document_id bigint)
  RETURNS void AS
$BODY$
BEGIN
  DELETE FROM inventory.definition WHERE id = __document_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.destroy(bigint)
  OWNER TO postgres;





-- Function: inventory.get_base_uom(character varying, integer)

-- DROP FUNCTION inventory.get_base_uom(character varying, integer);

CREATE OR REPLACE FUNCTION inventory.get_base_uom(
    _part_code character varying,
    _version_num integer)
  RETURNS character varying AS
$BODY$
BEGIN
  RETURN 
    definition.uom_code
  FROM 
    inventory.information, 
    inventory.definition
  WHERE 
    information.id = definition.information_id AND
    information.part_code = _part_code AND 
    definition.version_num = _version_num;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_base_uom(character varying, integer)
  OWNER TO postgres;






-- Function: inventory.get_document(bigint)

-- DROP FUNCTION inventory.get_document(bigint);

CREATE OR REPLACE FUNCTION inventory.get_document(__document_id bigint)
  RETURNS common.inventory_document AS
$BODY$
BEGIN
  RETURN
    (inventory.get_head(__document_id),
    inventory.get_meas_spec(__document_id),
    inventory.get_kind_spec(__document_id))::common.inventory_document;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_document(bigint)
  OWNER TO postgres;




-- Function: inventory.get_head(bigint)

-- DROP FUNCTION inventory.get_head(bigint);

CREATE OR REPLACE FUNCTION inventory.get_head(__document_id bigint)
  RETURNS common.inventory_head AS
$BODY$
DECLARE
BEGIN
  RETURN 
    (definition.id, 
    definition.gid, 
    information.display_name, 
    information.part_code, 
    definition.version_num, 
    definition.published_date, 
    definition.uom_code, 
    definition.curr_fsmt,
    'INVENTORY'::common.document_kind
    )::common.inventory_head
  FROM 
    inventory.information, 
    inventory.definition
  WHERE 
    information.id = definition.information_id AND
    definition.id = __document_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_head(bigint)
  OWNER TO postgres;



-- Function: inventory.get_head_batch()

-- DROP FUNCTION inventory.get_head_batch();

CREATE OR REPLACE FUNCTION inventory.get_head_batch()
  RETURNS common.inventory_head[] AS
$BODY$
DECLARE
BEGIN
  RETURN 
    ARRAY (
      SELECT
        (definition.id, 
        definition.gid, 
        information.display_name, 
        information.part_code, 
        definition.version_num, 
        definition.published_date, 
        definition.uom_code, 
        definition.curr_fsmt,
        'INVENTORY'::common.document_kind
        )::common.inventory_head
      FROM 
        inventory.information, 
        inventory.definition
      WHERE 
        information.id = definition.information_id --AND
        --definition.id = __document_id
    );
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_head_batch()
  OWNER TO postgres;





-- Function: inventory.get_kind_spec(bigint)

-- DROP FUNCTION inventory.get_kind_spec(bigint);

CREATE OR REPLACE FUNCTION inventory.get_kind_spec(__document_id bigint)
  RETURNS common.inventory_kind[] AS
$BODY$
BEGIN
  RETURN
    ARRAY (
      SELECT 
        variety.inventory_type
      FROM 
        inventory.variety
      WHERE 
        variety.definition_id = __document_id
    );
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_kind_spec(bigint)
  OWNER TO postgres;


-- Function: inventory.get_meas_spec(bigint)

-- DROP FUNCTION inventory.get_meas_spec(bigint);

CREATE OR REPLACE FUNCTION inventory.get_meas_spec(__document_id bigint)
  RETURNS common.unit_conversion_type[] AS
$BODY$
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (definition.uom_code, 
        measurement.uom_code, 
        measurement.factor)::common.unit_conversion_type
      FROM 
        inventory.definition, 
        inventory.measurement
      WHERE 
        definition.id = measurement.definition_id AND 
        definition.id = __document_id
    );
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_meas_spec(bigint)
  OWNER TO postgres;






-- Function: inventory.get_uom_conversion_factors(character varying, integer, character varying, character varying)

-- DROP FUNCTION inventory.get_uom_conversion_factors(character varying, integer, character varying, character varying);

CREATE OR REPLACE FUNCTION inventory.get_uom_conversion_factors(
    _part_code character varying,
    _version_num integer,
    _uom_domain_from character varying,
    _uom_domain_to character varying)
  RETURNS common.unit_conversion_type[] AS
$BODY$
DECLARE  
BEGIN

  RETURN 
    ARRAY (
      SELECT
        (definition.uom_code, 
        measurement.uom_code, 
        measurement.factor)::common.unit_conversion_type
      FROM 
        inventory.definition, 
        inventory.measurement, 
        inventory.information, 
        uom.information uom_from, 
        uom.information uom_to
      WHERE 
        definition.id = measurement.definition_id AND
        information.id = definition.information_id AND
        uom_from.uom_code = definition.uom_code AND
        uom_to.uom_code = measurement.uom_code AND
        information.part_code = _part_code AND 
        definition.version_num = _version_num AND 
        uom_from.uom_domain = _uom_domain_from::common.uom_domain_kind AND 
        uom_to.uom_domain = _uom_domain_to::common.uom_domain_kind
      );

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.get_uom_conversion_factors(character varying, integer, character varying, character varying)
  OWNER TO postgres;




-- Function: inventory.init(common.inventory_head, common.unit_conversion_type[], common.inventory_kind[])

-- DROP FUNCTION inventory.init(common.inventory_head, common.unit_conversion_type[], common.inventory_kind[]);

CREATE OR REPLACE FUNCTION inventory.init(
    __head common.inventory_head,
    __meas common.unit_conversion_type[],
    __kind common.inventory_kind[])
  RETURNS bigint AS
$BODY$
DECLARE
  _information_id bigint;
  _definition_id bigint;
  _max_version_num integer;
BEGIN

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.version_num IS NULL) THEN
    __head.version_num := 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := 'NO-NAME';
  END IF;

  SELECT
    max(definition.version_num)
  FROM 
    inventory.information, 
    inventory.definition
  WHERE 
    information.id = definition.information_id AND
    information.part_code = __head.part_code --AND 
    --definition.version_num = __head.version_num
  INTO
    _max_version_num;


  -- replece with coalesce
  IF (_max_version_num IS NULL) THEN
    _max_version_num := 0;
  END IF;  

  _information_id := id FROM inventory.information WHERE part_code = __head.part_code;

  IF (_information_id IS NULL) THEN
    INSERT INTO
      inventory.information (
        id,
        display_name,
        published_date,
        part_code)
    VALUES (
      DEFAULT,
      __head.display_name,
      __head.document_date,
      __head.part_code)
    RETURNING id INTO _information_id;
  END IF;

  INSERT INTO
    inventory.definition (
      id,
      display_name,
      version_num,
      published_date,
      information_id)
  VALUES (
    DEFAULT,
    __head.display_name,
    _max_version_num + 1,
    __head.document_date,
    _information_id)
  RETURNING id INTO _definition_id;

  PERFORM inventory.set_meas_spec(_definition_id, __meas);
  PERFORM inventory.set_kind_spec(_definition_id, __kind);

  RETURN _definition_id;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.init(common.inventory_head, common.unit_conversion_type[], common.inventory_kind[])
  OWNER TO postgres;






-- Function: inventory.reinit(bigint, common.unit_conversion_type[], common.inventory_kind[])

-- DROP FUNCTION inventory.reinit(bigint, common.unit_conversion_type[], common.inventory_kind[]);

CREATE OR REPLACE FUNCTION inventory.reinit(
    __document_id bigint,
    __meas common.unit_conversion_type[],
    __kind common.inventory_kind[])
  RETURNS void AS
$BODY$
DECLARE
BEGIN

  DELETE FROM
    inventory.measurement
  WHERE
    definition_id = __document_id;
  
  DELETE FROM
    inventory.variety
  WHERE
    definition_id = __document_id;

  PERFORM inventory.set_meas_spec(__document_id, __meas);
  PERFORM inventory.set_kind_spec(__document_id, __kind);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.reinit(bigint, common.unit_conversion_type[], common.inventory_kind[])
  OWNER TO postgres;





-- Function: inventory.set_kind_spec(bigint, common.inventory_kind[])

-- DROP FUNCTION inventory.set_kind_spec(bigint, common.inventory_kind[]);

CREATE OR REPLACE FUNCTION inventory.set_kind_spec(
    __document_id bigint,
    __inventory_kinds common.inventory_kind[])
  RETURNS void AS
$BODY$
DECLARE
  _inventory_kind common.inventory_kind;
BEGIN
  FOREACH _inventory_kind IN
    ARRAY __inventory_kinds
  LOOP
    INSERT INTO 
      inventory.variety (
        definition_id,
        inventory_type)
    VALUES (
      __document_id,
      _inventory_kind);
  END LOOP;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.set_kind_spec(bigint, common.inventory_kind[])
  OWNER TO postgres;





-- Function: inventory.set_meas_spec(bigint, common.unit_conversion_type[])

-- DROP FUNCTION inventory.set_meas_spec(bigint, common.unit_conversion_type[]);

CREATE OR REPLACE FUNCTION inventory.set_meas_spec(
    __document_id bigint,
    __uom_conversion_factors common.unit_conversion_type[])
  RETURNS void AS
$BODY$
DECLARE
  _uom_conversion_factor common.unit_conversion_type;
BEGIN
  FOREACH _uom_conversion_factor IN 
    ARRAY __uom_conversion_factors
  LOOP
    INSERT INTO 
      inventory.measurement (
        definition_id,
        uom_code,
        factor)
    VALUES (
      __document_id,
      _uom_conversion_factor.uom_code_to,
      _uom_conversion_factor.factor);
  END LOOP;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION inventory.set_meas_spec(bigint, common.unit_conversion_type[])
  OWNER TO postgres;








-- Function: tests.__inventory__destroy()

-- DROP FUNCTION tests.__inventory__destroy();

CREATE OR REPLACE FUNCTION tests.__inventory__destroy()
  RETURNS void AS
$BODY$
DECLARE
  _head common.inventory_head;
BEGIN
  
  RAISE DEBUG '#trace Check __inventory__destroy()';

  INSERT INTO
    inventory.information
      (id, gid, part_code, display_name, published_date)
    VALUES
      (1, 'a711da30-fa3a-11e7-8e63-d4bed939923a', '22.16.050-001', 'fl-16-50', '2018-01-15'),
      (2, 'b39a3ff4-fa3a-11e7-8e64-d4bed939923a', '22.25.050-001', 'fl-25-50', '2018-01-15'),
      (3, 'f08b5682-fa3a-11e7-86da-d4bed939923a', '22.40.050-001', 'fl-40-50', '2018-01-15');

  INSERT INTO
    inventory.definition 
      (id, gid, display_name, version_num, published_date, prev_fsmt, prev_fsmt_date, curr_fsmt, curr_fsmt_date, information_id, uom_code)
    VALUES 
      (1, 'c9000ec8-fa3a-11e7-9489-d4bed939923a', 'fl-16-50', 1, '2018-01-10', NULL, NULL, 'DECOMMITTED', '2018-01-10', 1, 'pcs'),
      (2, 'd83fb96a-fa3a-11e7-948a-d4bed939923a', 'fl-25-50', 1, '2018-01-15', NULL, NULL, 'COMMITTED', '2018-01-15', 2, 'pcs'),
      (3, 'cf77e3ea-0b5c-4e62-be62-63704f4071b7', 'fl-25-50', 2, '2018-01-16', NULL, NULL, 'PROPOSED', '2018-01-16', 2, 'pcs'),
      (4, 'c792f74d-7e6e-4577-ad69-987f56af7af7', 'fl-40-50', 1, '2018-01-17', NULL, NULL, 'COMMITTED', '2018-01-17', 3, 'pcs');

  PERFORM inventory.destroy(1); -- + add not allowed delete test
  
  _head := inventory.get_head(1);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := inventory.get_head(3);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION tests.__inventory__destroy()
  OWNER TO postgres;






-- Function: tests.__inventory__get_head()

-- DROP FUNCTION tests.__inventory__get_head();

CREATE OR REPLACE FUNCTION tests.__inventory__get_head()
  RETURNS void AS
$BODY$
DECLARE
  _head common.inventory_head;
  _test_gid CONSTANT uuid := 'cf77e3ea-0b5c-4e62-be62-63704f4071b7';
  _test_display_name CONSTANT character varying := 'fl-25-50';
  _test_part_code CONSTANT character varying := '22.25.050-001';
  _test_document_date CONSTANT date := '2018-01-16'::date;
  _test_version_num CONSTANT integer := 2;
  _test_uom_code CONSTANT character varying := 'pcs';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_document_type CONSTANT common.document_kind := 'INVENTORY'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __inventory__get_head()';

  INSERT INTO
    inventory.information
      (id, gid, part_code, display_name, published_date)
    VALUES
      (1, 'a711da30-fa3a-11e7-8e63-d4bed939923a', '22.16.050-001', 'fl-16-50', '2018-01-15'),
      (2, 'b39a3ff4-fa3a-11e7-8e64-d4bed939923a', '22.25.050-001', 'fl-25-50', '2018-01-15'),
      (3, 'f08b5682-fa3a-11e7-86da-d4bed939923a', '22.40.050-001', 'fl-40-50', '2018-01-15');

  INSERT INTO
    inventory.definition 
      (id, gid, display_name, version_num, published_date, prev_fsmt, prev_fsmt_date, curr_fsmt, curr_fsmt_date, information_id, uom_code)
    VALUES 
      (1, 'c9000ec8-fa3a-11e7-9489-d4bed939923a', 'fl-16-50', 1, '2018-01-10', NULL, NULL, 'DECOMMITTED', '2018-01-10', 1, 'pcs'),
      (2, 'd83fb96a-fa3a-11e7-948a-d4bed939923a', 'fl-25-50', 1, '2018-01-15', NULL, NULL, 'COMMITTED', '2018-01-15', 2, 'pcs'),
      (3, 'cf77e3ea-0b5c-4e62-be62-63704f4071b7', 'fl-25-50', 2, '2018-01-16', NULL, NULL, 'PROPOSED', '2018-01-16', 2, 'pcs'),
      (4, 'c792f74d-7e6e-4577-ad69-987f56af7af7', 'fl-40-50', 1, '2018-01-17', NULL, NULL, 'COMMITTED', '2018-01-17', 3, 'pcs');

  _head := inventory.get_head(3);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_part_code, _head.part_code, 'Incorrect part_code value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_version_num, _head.version_num, 'Incorrect version_num value');
  PERFORM pgunit.assert_equals(_test_uom_code, _head.uom_code, 'Incorrect uom_code value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_document_type, _head.document_type, 'Incorrect document_type value');


  _head := inventory.get_head(4);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := inventory.get_head(5);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION tests.__inventory__get_head()
  OWNER TO postgres;







-- Function: tests.__inventory__init()

-- DROP FUNCTION tests.__inventory__init();

CREATE OR REPLACE FUNCTION tests.__inventory__init()
  RETURNS void AS
$BODY$
DECLARE
  _test_head CONSTANT common.inventory_head[] := ARRAY[(3, 'cf77e3ea-0b5c-4e62-be62-63704f4071b7', 'fl-25-50', '20.25.50-001', 2, '2018-01-16', 'pcs', 'PROPOSED', 'INVENTORY')]::common.inventory_head[];
  _test_meas CONSTANT common.unit_conversion_type[] := ARRAY[('pcs', 'pcs', 1), ('pcs', 'g', 1000)]::common.unit_conversion_type[];
  _test_kind CONSTANT common.inventory_kind[] := ARRAY[('ASSEMBLY'), ('STORABLE')]::common.inventory_kind[];
  _head common.inventory_head;
  _meas common.unit_conversion_type[];
  _kind common.inventory_kind[];
  _document_id bigint;
BEGIN

  RAISE DEBUG '#trace Check __inventory__init()';
  
  _document_id := inventory.init(_test_head[1], _test_meas, _test_kind);
  _head := inventory.get_head(_document_id);
  _meas := inventory.get_meas_spec(_document_id);
  _kind := inventory.get_kind_spec(_document_id);

  PERFORM pgunit.assert_array_equals(_test_meas, _meas, 'Incorrect _meas value');
  PERFORM pgunit.assert_array_equals(_test_kind, _kind, 'Incorrect _kind value');


END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION tests.__inventory__init()
  OWNER TO postgres;






-- Function: tests.__inventory__reinit()

-- DROP FUNCTION tests.__inventory__reinit();

CREATE OR REPLACE FUNCTION tests.__inventory__reinit()
  RETURNS void AS
$BODY$
DECLARE
  _test_head CONSTANT common.inventory_head[] := ARRAY[(3, 'cf77e3ea-0b5c-4e62-be62-63704f4071b7', 'fl-25-50', '20.25.50-001', 2, '2018-01-16', 'pcs', 'PROPOSED', 'INVENTORY')]::common.inventory_head[];
  _test_meas_init CONSTANT common.unit_conversion_type[] := ARRAY[('pcs', 'pcs', 1), ('pcs', 'g', 1000)]::common.unit_conversion_type[];
  _test_meas_reinit CONSTANT common.unit_conversion_type[] := ARRAY[('pcs', 'pcs', 1), ('pcs', 'kg', 10)]::common.unit_conversion_type[];
  _test_kind_init CONSTANT common.inventory_kind[] := ARRAY[('ASSEMBLY'), ('STORABLE')]::common.inventory_kind[];
  _test_kind_reinit CONSTANT common.inventory_kind[] := ARRAY[('PART'), ('CONSUMABLE')]::common.inventory_kind[];
  _head common.inventory_head;
  _meas common.unit_conversion_type[];
  _kind common.inventory_kind[];
  _document_id bigint;
BEGIN

  RAISE DEBUG '#trace Check __inventory__reinit()';
  
  _document_id := inventory.init(_test_head[1], _test_meas_init, _test_kind_init);
  PERFORM inventory.reinit(_document_id, _test_meas_reinit, _test_kind_reinit);
  _head := inventory.get_head(_document_id);
  _meas := inventory.get_meas_spec(_document_id);
  _kind := inventory.get_kind_spec(_document_id);

  PERFORM pgunit.assert_array_equals(_meas, _test_meas_reinit, 'Incorrect _meas_reinit value');
  PERFORM pgunit.assert_array_equals(_kind, _test_kind_reinit, 'Incorrect _kind_reinit value');

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION tests.__inventory__reinit()
  OWNER TO postgres;























