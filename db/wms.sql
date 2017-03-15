--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-03-15 14:09:24 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 12 (class 2615 OID 87597)
-- Name: adjustmentcredit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adjustmentcredit;


ALTER SCHEMA adjustmentcredit OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 87598)
-- Name: adjustmentdebit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adjustmentdebit;


ALTER SCHEMA adjustmentdebit OWNER TO postgres;

--
-- TOC entry 14 (class 2615 OID 87599)
-- Name: api; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA api;


ALTER SCHEMA api OWNER TO postgres;

--
-- TOC entry 15 (class 2615 OID 87600)
-- Name: balance; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA balance;


ALTER SCHEMA balance OWNER TO postgres;

--
-- TOC entry 16 (class 2615 OID 87601)
-- Name: binding; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA binding;


ALTER SCHEMA binding OWNER TO postgres;

--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA binding; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA binding IS 'bond';


--
-- TOC entry 17 (class 2615 OID 87602)
-- Name: common; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA common;


ALTER SCHEMA common OWNER TO postgres;

--
-- TOC entry 18 (class 2615 OID 87603)
-- Name: cutoff; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cutoff;


ALTER SCHEMA cutoff OWNER TO postgres;

--
-- TOC entry 19 (class 2615 OID 87604)
-- Name: delivery; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA delivery;


ALTER SCHEMA delivery OWNER TO postgres;

--
-- TOC entry 20 (class 2615 OID 87605)
-- Name: demand; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA demand;


ALTER SCHEMA demand OWNER TO postgres;

--
-- TOC entry 21 (class 2615 OID 87606)
-- Name: despatch; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA despatch;


ALTER SCHEMA despatch OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 87607)
-- Name: goal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA goal;


ALTER SCHEMA goal OWNER TO postgres;

--
-- TOC entry 23 (class 2615 OID 87608)
-- Name: issue; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA issue;


ALTER SCHEMA issue OWNER TO postgres;

--
-- TOC entry 24 (class 2615 OID 87609)
-- Name: lot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA lot;


ALTER SCHEMA lot OWNER TO postgres;

--
-- TOC entry 25 (class 2615 OID 87610)
-- Name: pgunit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgunit;


ALTER SCHEMA pgunit OWNER TO postgres;

--
-- TOC entry 26 (class 2615 OID 87611)
-- Name: picklist; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA picklist;


ALTER SCHEMA picklist OWNER TO postgres;

--
-- TOC entry 27 (class 2615 OID 87612)
-- Name: rebound; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rebound;


ALTER SCHEMA rebound OWNER TO postgres;

--
-- TOC entry 28 (class 2615 OID 87613)
-- Name: receipt; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA receipt;


ALTER SCHEMA receipt OWNER TO postgres;

--
-- TOC entry 29 (class 2615 OID 87614)
-- Name: reserve; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA reserve;


ALTER SCHEMA reserve OWNER TO postgres;

--
-- TOC entry 30 (class 2615 OID 87615)
-- Name: schedule; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schedule;


ALTER SCHEMA schedule OWNER TO postgres;

--
-- TOC entry 31 (class 2615 OID 87616)
-- Name: stockcard; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stockcard;


ALTER SCHEMA stockcard OWNER TO postgres;

--
-- TOC entry 32 (class 2615 OID 87617)
-- Name: stocktake; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stocktake;


ALTER SCHEMA stocktake OWNER TO postgres;

--
-- TOC entry 33 (class 2615 OID 87618)
-- Name: tests; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tests;


ALTER SCHEMA tests OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 87619)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 6 (class 3079 OID 87628)
-- Name: pldbgapi; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pldbgapi WITH SCHEMA public;


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pldbgapi; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pldbgapi IS 'server-side support for debugging PL/pgSQL functions';


--
-- TOC entry 5 (class 3079 OID 87665)
-- Name: plpgsql_check; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql_check WITH SCHEMA public;


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION plpgsql_check; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql_check IS 'extended check for plpgsql functions';


--
-- TOC entry 4 (class 3079 OID 87670)
-- Name: plprofiler; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plprofiler WITH SCHEMA public;


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION plprofiler; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plprofiler IS 'server-side support for profiling PL/pgSQL functions';


--
-- TOC entry 3 (class 3079 OID 87739)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = common, pg_catalog;

--
-- TOC entry 1399 (class 1247 OID 87751)
-- Name: cutoff_mode; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE cutoff_mode AS ENUM (
    'DISABLED',
    'PERMISSIVE',
    'ENFORCING'
);


ALTER TYPE cutoff_mode OWNER TO postgres;

--
-- TOC entry 1402 (class 1247 OID 87758)
-- Name: document_transition; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_transition AS ENUM (
    'PROPOSED',
    'COMMITTED',
    'DECOMMITTED'
);


ALTER TYPE document_transition OWNER TO postgres;

--
-- TOC entry 1405 (class 1247 OID 87766)
-- Name: document_type; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_type AS ENUM (
    'ADJUSTMENTCREDIT',
    'ADJUSTMENTDEBIT',
    'DELIVERY',
    'DEMAND',
    'DESPATCH',
    'GOAL',
    'ISSUE',
    'LOT',
    'PICKLIST',
    'REBOUND',
    'RECEIPT',
    'RESERVE',
    'STOCKTAKE',
    'CUTOFF'
);


ALTER TYPE document_type OWNER TO postgres;

--
-- TOC entry 1408 (class 1247 OID 87797)
-- Name: cutoff_registry; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE cutoff_registry AS (
	document_id bigint,
	gid uuid,
	display_name character varying,
	create_date date,
	facility_code character varying,
	curr_transition document_transition,
	doctype document_type,
	due_date date
);


ALTER TYPE cutoff_registry OWNER TO postgres;

--
-- TOC entry 1411 (class 1247 OID 87798)
-- Name: quantity; Type: DOMAIN; Schema: common; Owner: postgres
--

CREATE DOMAIN quantity AS numeric(20,4) DEFAULT 0
	CONSTRAINT quantity_is_positive CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN quantity OWNER TO postgres;

--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 1411
-- Name: DOMAIN quantity; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON DOMAIN quantity IS 'quantity domain';


--
-- TOC entry 1413 (class 1247 OID 87802)
-- Name: document_body; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_body AS (
	good_code character varying,
	quantity quantity,
	uom_code character varying
);


ALTER TYPE document_body OWNER TO postgres;

--
-- TOC entry 1416 (class 1247 OID 87805)
-- Name: document_head; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_head AS (
	document_id bigint,
	gid uuid,
	display_name character varying,
	create_date date,
	ship_to character varying,
	ship_from character varying,
	curr_transition document_transition,
	doctype document_type,
	due_date date
);


ALTER TYPE document_head OWNER TO postgres;

--
-- TOC entry 1419 (class 1247 OID 87808)
-- Name: document; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document AS (
	head document_head,
	body document_body[],
	doctype document_type
);


ALTER TYPE document OWNER TO postgres;

--
-- TOC entry 1422 (class 1247 OID 87809)
-- Name: quantity_signed; Type: DOMAIN; Schema: common; Owner: postgres
--

CREATE DOMAIN quantity_signed AS numeric(20,4) DEFAULT 0;


ALTER DOMAIN quantity_signed OWNER TO postgres;

--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 1422
-- Name: DOMAIN quantity_signed; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON DOMAIN quantity_signed IS 'quantity signed domain';


SET search_path = goal, pg_catalog;

--
-- TOC entry 1423 (class 1247 OID 87811)
-- Name: goal_transition; Type: TYPE; Schema: goal; Owner: postgres
--

CREATE TYPE goal_transition AS ENUM (
    'PROPOSED',
    'ADVISED',
    'REJECTED',
    'ACCEPTED',
    'CANCELED',
    'COMMITTED',
    'DECOMMITTED',
    'FAILED',
    'SATISFIED'
);


ALTER TYPE goal_transition OWNER TO postgres;

--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 1423
-- Name: TYPE goal_transition; Type: COMMENT; Schema: goal; Owner: postgres
--

COMMENT ON TYPE goal_transition IS 'transition type';


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 375 (class 1255 OID 87829)
-- Name: destroy(bigint); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM adjustmentcredit.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentcredit.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 376 (class 1255 OID 87830)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      adjustmentcredit.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      adjustmentcredit.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition;
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION adjustmentcredit.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 377 (class 1255 OID 87831)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.document_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentcredit.get_head(__document_id);
  _body := adjustmentcredit.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'adjustmentcredit % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  -- check if binded to issue
  SELECT 
    issue_to_adjustmentcredit.issue_id
  FROM 
    binding.issue_to_adjustmentcredit
  WHERE 
    issue_to_adjustmentcredit.adjustmentcredit_id = __document_id
  INTO
    _parent_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'adjustmentcredit is not binded %', __document_id;
  END IF;
    
  _parent_head := issue.get_head(_parent_id);

  IF (_parent_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'parent is not commited %', _parent_head.gid;
  END IF;

  FOR _row_from_select IN
  SELECT 
    good_code1 as good_code,
    quantity1 - COALESCE(quantity2, 0) as quantity,
    uom_code1 as uom_code
  FROM
    (SELECT
      body.good_code as good_code1, 
      body.quantity as quantity1, 
      body.uom_code AS uom_code1
    FROM 
      adjustmentcredit.body
    WHERE 
      body.head_id = __document_id) n1
  LEFT JOIN
    (SELECT 
      body.good_code as good_code2, 
      body.quantity AS quantity2, 
      body.uom_code AS uom_code2
    FROM 
      binding.issue_to_adjustmentcredit, 
      issue.body
    WHERE 
      issue_to_adjustmentcredit.issue_id = body.head_id AND
      issue_to_adjustmentcredit.adjustmentcredit_id = __document_id) n2
  ON (good_code1 = good_code2)
  LOOP
    IF (_row_from_select.quantity = 0) THEN
      DELETE FROM
        adjustmentcredit.body
      WHERE
        head_id = __document_id AND
        good_code = _row_from_select.good_code;
    ELSIF (_row_from_select.quantity > 0) THEN
      _array_to_loss := array_append(_array_to_loss, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    ELSIF (_row_from_select.quantity < 0) THEN
      _array_to_gain := array_append(_array_to_gain, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    END IF;
  END LOOP;
  
  PERFORM balance.gain_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_loss);
  PERFORM stockcard.assign_adjustmentcredit(
    __document_head := _head,
    __document_body := _body);

  UPDATE
    adjustmentcredit.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentcredit.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 378 (class 1255 OID 87832)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.document_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentcredit.get_head(__document_id);
  _body := adjustmentcredit.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'adjustmentcredit % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  -- check if binded to issue
  SELECT 
    issue_to_adjustmentcredit.issue_id
  FROM 
    binding.issue_to_adjustmentcredit
  WHERE 
    issue_to_adjustmentcredit.adjustmentcredit_id = __document_id
  INTO
    _parent_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'adjustmentcredit is not binded %', __document_id;
  END IF;
    
  _parent_head := issue.get_head(_parent_id);

  /*IF (_parent_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'parent is not commited %', _parent_head.gid;
    EXIT;
  END IF;*/

  FOR _row_from_select IN
  SELECT 
    good_code1 as good_code,
    quantity1 - COALESCE(quantity2, 0) as quantity,
    uom_code1 as uom_code
  FROM
    (SELECT
      body.good_code as good_code1, 
      body.quantity as quantity1, 
      body.uom_code AS uom_code1
    FROM 
      adjustmentcredit.body
    WHERE 
      body.head_id = __document_id) n1
  LEFT JOIN
    (SELECT 
      body.good_code as good_code2, 
      body.quantity AS quantity2, 
      body.uom_code AS uom_code2
    FROM 
      binding.issue_to_adjustmentcredit, 
      issue.body
    WHERE 
      issue_to_adjustmentcredit.issue_id = body.head_id AND
      issue_to_adjustmentcredit.adjustmentcredit_id = __document_id) n2
  ON (good_code1 = good_code2)
  LOOP
    IF (_row_from_select.quantity = 0) THEN
      DELETE FROM
        adjustmentcredit.body
      WHERE
        head_id = __document_id AND
        good_code = _row_from_select.good_code;
    ELSIF (_row_from_select.quantity > 0) THEN
      _array_to_gain := array_append(_array_to_gain, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    ELSIF (_row_from_select.quantity < 0) THEN
      _array_to_loss := array_append(_array_to_loss, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    END IF;
  END LOOP;
  
  PERFORM balance.gain_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_loss);
  PERFORM stockcard.deassign_adjustmentcredit(_head.document_id);

  UPDATE
    adjustmentcredit.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentcredit.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 379 (class 1255 OID 87833)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := adjustmentcredit.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('ADJUSTMENTCREDIT');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION adjustmentcredit.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 380 (class 1255 OID 87834)
-- Name: get_body(bigint); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          adjustmentcredit.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION adjustmentcredit.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 87835)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      adjustmentcredit.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentcredit.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 87836)
-- Name: get_head(bigint); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'ADJUSTMENTCREDIT'::common.document_type,
    due_date)::common.document_head
  FROM 
    adjustmentcredit.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentcredit.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 87837)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'ADJUSTMENTCREDIT'::common.document_type,
        due_date)::common.document_head
      FROM 
        adjustmentcredit.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION adjustmentcredit.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 87838)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'ADJUSTMENTCREDIT'::common.document_type,
        due_date)::common.document_head
      FROM 
        adjustmentcredit.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION adjustmentcredit.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 386 (class 1255 OID 87839)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      adjustmentcredit.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION adjustmentcredit.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 87840)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  INSERT INTO adjustmentcredit.head (id, create_date, due_date, ship_from, ship_to) VALUES (DEFAULT, __head.create_date, __head.due_date, __head.ship_from, __head.ship_to) 
    RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO adjustmentcredit.body VALUES (_document_id, _item.good_code, _item.quantity, _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION adjustmentcredit.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 87841)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    adjustmentcredit.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      adjustmentcredit.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION adjustmentcredit.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 87842)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    adjustmentcredit.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      adjustmentcredit.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION adjustmentcredit.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 390 (class 1255 OID 87843)
-- Name: destroy(bigint); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM adjustmentdebit.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentdebit.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 391 (class 1255 OID 87844)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      adjustmentdebit.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      adjustmentdebit.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION adjustmentdebit.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 87845)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.document_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentdebit.get_head(__document_id);
  _body := adjustmentdebit.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'adjustmentdebit % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  -- check if binded to receipt
  SELECT 
    receipt_to_adjustmentdebit.receipt_id
  FROM 
    binding.receipt_to_adjustmentdebit
  WHERE 
    receipt_to_adjustmentdebit.adjustmentdebit_id = __document_id
  INTO
    _parent_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'adjustmentdebit is not binded %', __document_id;
  END IF;
    
  _parent_head := receipt.get_head(_parent_id);

  IF (_parent_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'parent is not commited %', _parent_head.gid;
  END IF;

  FOR _row_from_select IN
  SELECT 
    good_code1 as good_code,
    quantity1 - COALESCE(quantity2, 0) as quantity,
    uom_code1 as uom_code
  FROM
    (SELECT
      body.good_code as good_code1, 
      body.quantity as quantity1, 
      body.uom_code AS uom_code1
    FROM 
      adjustmentdebit.body
    WHERE 
      body.head_id = __document_id) n1
  LEFT JOIN
    (SELECT 
      body.good_code as good_code2, 
      body.quantity AS quantity2, 
      body.uom_code AS uom_code2
    FROM 
      binding.receipt_to_adjustmentdebit, 
      receipt.body
    WHERE 
      receipt_to_adjustmentdebit.receipt_id = body.head_id AND
      receipt_to_adjustmentdebit.adjustmentdebit_id = __document_id) n2
  ON (good_code1 = good_code2)
  LOOP
    IF (_row_from_select.quantity = 0) THEN
      DELETE FROM
        adjustmentdebit.body
      WHERE
        head_id = __document_id AND
        good_code = _row_from_select.good_code;
    ELSIF (_row_from_select.quantity > 0) THEN
      _array_to_gain := array_append(_array_to_gain, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    ELSIF (_row_from_select.quantity < 0) THEN
      _array_to_loss := array_append(_array_to_loss, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    END IF;
  END LOOP;
  
  PERFORM balance.gain_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_loss);
  PERFORM stockcard.assign_adjustmentdebit(
    __document_head := _head,
    __document_body := _body);

  UPDATE
    adjustmentdebit.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentdebit.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 87846)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.document_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentdebit.get_head(__document_id);
  _body := adjustmentdebit.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'adjustmentdebit % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  -- check if binded to receipt
  SELECT 
    receipt_to_adjustmentdebit.receipt_id
  FROM 
    binding.receipt_to_adjustmentdebit
  WHERE 
    receipt_to_adjustmentdebit.adjustmentdebit_id = __document_id
  INTO
    _parent_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'adjustmentdebit is not binded %', __document_id;
  END IF;
    
  _parent_head := receipt.get_head(_parent_id);

  /*IF (_parent_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'parent is not commited %', _parent_head.gid;
    EXIT;
  END IF;*/

  FOR _row_from_select IN
  SELECT 
    good_code1 as good_code,
    quantity1 - COALESCE(quantity2, 0) as quantity,
    uom_code1 as uom_code
  FROM
    (SELECT
      body.good_code as good_code1, 
      body.quantity as quantity1, 
      body.uom_code AS uom_code1
    FROM 
      adjustmentdebit.body
    WHERE 
      body.head_id = __document_id) n1
  LEFT JOIN
    (SELECT 
      body.good_code as good_code2, 
      body.quantity AS quantity2, 
      body.uom_code AS uom_code2
    FROM 
      binding.receipt_to_adjustmentdebit, 
      receipt.body
    WHERE 
      receipt_to_adjustmentdebit.receipt_id = body.head_id AND
      receipt_to_adjustmentdebit.adjustmentdebit_id = __document_id) n2
  ON (good_code1 = good_code2)
  LOOP
    IF (_row_from_select.quantity = 0) THEN
      DELETE FROM
        adjustmentdebit.body
      WHERE
        head_id = __document_id AND
        good_code = _row_from_select.good_code;
    ELSIF (_row_from_select.quantity > 0) THEN
      _array_to_loss := array_append(_array_to_loss, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    ELSIF (_row_from_select.quantity < 0) THEN
      _array_to_gain := array_append(_array_to_gain, (_row_from_select.good_code, abs(_row_from_select.quantity), _row_from_select.uom_code)::common.document_body);
    END IF;
  END LOOP;
  
  PERFORM balance.gain_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.ship_from,
    __inventory := _array_to_loss);
  PERFORM stockcard.deassign_adjustmentdebit(__document_id);

  UPDATE
    adjustmentdebit.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentdebit.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 394 (class 1255 OID 87847)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := adjustmentdebit.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('ADJUSTMENTDEBIT');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION adjustmentdebit.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 87848)
-- Name: get_body(bigint); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          adjustmentdebit.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION adjustmentdebit.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 87849)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      adjustmentdebit.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentdebit.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 87850)
-- Name: get_head(bigint); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'ADJUSTMENTDEBIT'::common.document_type,
    due_date)::common.document_head
  FROM 
    adjustmentdebit.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentdebit.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 398 (class 1255 OID 87851)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'ADJUSTMENTDEBIT'::common.document_type,
        due_date)::common.document_head
      FROM 
        adjustmentdebit.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION adjustmentdebit.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 87852)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'ADJUSTMENTDEBIT'::common.document_type,
        due_date)::common.document_head
      FROM 
        adjustmentdebit.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION adjustmentdebit.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 400 (class 1255 OID 87853)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      adjustmentdebit.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION adjustmentdebit.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 401 (class 1255 OID 87854)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  INSERT INTO adjustmentdebit.head (id, create_date, due_date, ship_from, ship_to) VALUES (DEFAULT, __head.create_date, __head.due_date, __head.ship_from, __head.ship_to) 
    RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO adjustmentdebit.body VALUES (_document_id, _item.good_code, _item.quantity, _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION adjustmentdebit.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 87855)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    adjustmentdebit.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      adjustmentdebit.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION adjustmentdebit.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 87856)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    adjustmentdebit.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      adjustmentdebit.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION adjustmentdebit.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = balance, pg_catalog;

--
-- TOC entry 404 (class 1255 OID 87857)
-- Name: gain_en_route_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION gain_en_route_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      en_route_qty = en_route_qty + _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    IF NOT FOUND THEN
      INSERT INTO
        balance.balance (
          facility_code,
          good_code,
          uom_code,
          en_route_qty)
      VALUES (
        __facility_code,
        _item.good_code,
        _item.uom_code,
        _item.quantity);
    END IF;

    RAISE NOTICE 'balance of % gained on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.gain_en_route_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 87858)
-- Name: gain_on_hand_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION gain_on_hand_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      on_hand_qty = on_hand_qty + _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    IF NOT FOUND THEN
      INSERT INTO
        balance.balance (
          facility_code,
          good_code,
          uom_code,
          on_hand_qty)
      VALUES (
        __facility_code,
        _item.good_code,
        _item.uom_code,
        _item.quantity);
    END IF;

    RAISE NOTICE 'balance of % gained on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.gain_on_hand_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 407 (class 1255 OID 87859)
-- Name: gain_on_order_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION gain_on_order_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      on_order_qty = on_order_qty + _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    IF NOT FOUND THEN
      INSERT INTO
        balance.balance (
          facility_code,
          good_code,
          uom_code,
          on_order_qty)
      VALUES (
        __facility_code,
        _item.good_code,
        _item.uom_code,
        _item.quantity);
    END IF;

    RAISE NOTICE 'balance of % gained on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.gain_on_order_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 408 (class 1255 OID 87860)
-- Name: gain_reserved_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION gain_reserved_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      reserved_qty = reserved_qty + _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    IF NOT FOUND THEN
      INSERT INTO
        balance.balance (
          facility_code,
          good_code,
          uom_code,
          reserved_qty)
      VALUES (
        __facility_code,
        _item.good_code,
        _item.uom_code,
        _item.quantity);
    END IF;

    RAISE NOTICE 'balance of % gained on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.gain_reserved_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 409 (class 1255 OID 87861)
-- Name: get_on_hand_qty(character varying); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION get_on_hand_qty(__facility_code character varying) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
        (balance.good_code, 
        balance.on_hand_qty, 
        balance.uom_code)::common.document_body
      FROM 
        balance.balance
      WHERE 
        balance.facility_code = __facility_code
    );
END
$$;


ALTER FUNCTION balance.get_on_hand_qty(__facility_code character varying) OWNER TO postgres;

--
-- TOC entry 410 (class 1255 OID 87862)
-- Name: get_on_hand_qty(character varying, character varying[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION get_on_hand_qty(__facility_code character varying, __good_codes character varying[]) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
        (balance.good_code, 
        balance.on_hand_qty, 
        balance.uom_code)::common.document_body
      FROM 
        balance.balance
      WHERE 
        balance.facility_code = __facility_code AND
        balance.good_code = ANY(__good_codes)
    );
END
$$;


ALTER FUNCTION balance.get_on_hand_qty(__facility_code character varying, __good_codes character varying[]) OWNER TO postgres;

--
-- TOC entry 411 (class 1255 OID 87863)
-- Name: get_on_hand_qty(character varying, character varying); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION get_on_hand_qty(__facility_code character varying, __good_code character varying) RETURNS common.document_body
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_item common.document_body;
BEGIN

  --_item := 

-- improve: get good uom if item not in balance
RETURN 
  (balance.good_code, 
  balance.on_hand_qty, 
  balance.uom_code)::common.document_body
FROM 
  balance.balance
WHERE 
  balance.facility_code = __facility_code AND 
  balance.good_code = __good_code;

END;
$$;


ALTER FUNCTION balance.get_on_hand_qty(__facility_code character varying, __good_code character varying) OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 87864)
-- Name: loss_en_route_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION loss_en_route_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      en_route_qty = en_route_qty - _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    RAISE NOTICE 'balance of % lossed on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.loss_en_route_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 413 (class 1255 OID 87865)
-- Name: loss_on_hand_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION loss_on_hand_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      on_hand_qty = on_hand_qty - _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    RAISE NOTICE 'balance of % lossed on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.loss_on_hand_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 87866)
-- Name: loss_on_order_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION loss_on_order_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      on_order_qty = on_order_qty - _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    RAISE NOTICE 'balance of % lossed on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.loss_on_order_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 87867)
-- Name: loss_reserved_qty(character varying, common.document_body[]); Type: FUNCTION; Schema: balance; Owner: postgres
--

CREATE FUNCTION loss_reserved_qty(__facility_code character varying, __inventory common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  -- improve: add cast qty against uom and good

  FOREACH _item IN
    ARRAY __inventory
  LOOP
    UPDATE
      balance.balance
    SET
      reserved_qty = reserved_qty - _item.quantity
    WHERE
      facility_code = __facility_code AND
      good_code = _item.good_code;

    RAISE NOTICE 'balance of % lossed on % of %', _item.good_code, _item.quantity, _item.uom_code;
  END LOOP;

END;
$$;


ALTER FUNCTION balance.loss_reserved_qty(__facility_code character varying, __inventory common.document_body[]) OWNER TO postgres;

SET search_path = binding, pg_catalog;

--
-- TOC entry 416 (class 1255 OID 87868)
-- Name: bind_cutoff_and_adjustmentcredit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_adjustmentcredit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_adjustmentcredit (
      cutoff_id,
      adjustmentcredit_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_adjustmentcredit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 87869)
-- Name: bind_cutoff_and_adjustmentdebit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_adjustmentdebit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_adjustmentdebit (
      cutoff_id,
      adjustmentdebit_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_adjustmentdebit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 87870)
-- Name: bind_cutoff_and_delivery(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_delivery(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_delivery (
      cutoff_id,
      delivery_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_delivery(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 419 (class 1255 OID 87871)
-- Name: bind_cutoff_and_demand(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_demand(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_demand (
      cutoff_id,
      demand_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_demand(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 87872)
-- Name: bind_cutoff_and_despatch(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_despatch(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_despatch (
      cutoff_id,
      despatch_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_despatch(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 421 (class 1255 OID 87873)
-- Name: bind_cutoff_and_goal(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_goal(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_goal (
      cutoff_id,
      goal_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_goal(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 422 (class 1255 OID 87874)
-- Name: bind_cutoff_and_issue(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_issue(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_issue (
      cutoff_id,
      issue_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_issue(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 423 (class 1255 OID 87875)
-- Name: bind_cutoff_and_picklist(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_picklist(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_picklist (
      cutoff_id,
      picklist_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_picklist(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 87876)
-- Name: bind_cutoff_and_rebound(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_rebound(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_rebound (
      cutoff_id,
      rebound_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_rebound(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 425 (class 1255 OID 87877)
-- Name: bind_cutoff_and_receipt(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_receipt(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_receipt (
      cutoff_id,
      receipt_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_receipt(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 87878)
-- Name: bind_cutoff_and_reserve(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_reserve(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_reserve (
      cutoff_id,
      reserve_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_reserve(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 87879)
-- Name: bind_cutoff_and_stocktake(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_cutoff_and_stocktake(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.cutoff_to_stocktake (
      cutoff_id,
      stocktake_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_cutoff_and_stocktake(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 428 (class 1255 OID 87880)
-- Name: bind_delivery_and_receipt(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_delivery_and_receipt(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.delivery_to_receipt (
      delivery_id,
      receipt_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_delivery_and_receipt(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 429 (class 1255 OID 87881)
-- Name: bind_demand_and_picklist(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_demand_and_picklist(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.demand_to_picklist (
      demand_id,
      picklist_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_demand_and_picklist(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 87882)
-- Name: bind_demand_and_reserve(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_demand_and_reserve(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.demand_to_reserve (
      demand_id,
      reserve_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_demand_and_reserve(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 431 (class 1255 OID 87883)
-- Name: bind_goal_and_demand(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_goal_and_demand(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.goal_to_demand (
      goal_id,
      demand_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_goal_and_demand(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 432 (class 1255 OID 87884)
-- Name: bind_goal_and_despatch(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_goal_and_despatch(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.goal_to_despatch (
      goal_id,
      despatch_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_goal_and_despatch(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 433 (class 1255 OID 87885)
-- Name: bind_goal_and_issue(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_goal_and_issue(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.goal_to_issue (
      goal_id,
      issue_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_goal_and_issue(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 87886)
-- Name: bind_goal_and_picklist(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_goal_and_picklist(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.goal_to_picklist (
      goal_id,
      picklist_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_goal_and_picklist(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 435 (class 1255 OID 87887)
-- Name: bind_goal_and_reserve(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_goal_and_reserve(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.goal_to_reserve (
      goal_id,
      reserve_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_goal_and_reserve(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 436 (class 1255 OID 87888)
-- Name: bind_issue_and_adjustmentcredit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_issue_and_adjustmentcredit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.issue_to_adjustmentcredit (
      issue_id,
      adjustmentcredit_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_issue_and_adjustmentcredit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 87889)
-- Name: bind_issue_and_despatch(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_issue_and_despatch(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.issue_to_despatch (
      issue_id,
      despatch_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_issue_and_despatch(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 87890)
-- Name: bind_issue_and_rebound(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_issue_and_rebound(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.issue_to_rebound (
      issue_id,
      rebound_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_issue_and_rebound(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 439 (class 1255 OID 87891)
-- Name: bind_picklist_and_issue(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_picklist_and_issue(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.picklist_to_issue (
      picklist_id,
      issue_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_picklist_and_issue(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 440 (class 1255 OID 87892)
-- Name: bind_receipt_and_adjustmentdebit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_receipt_and_adjustmentdebit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.receipt_to_adjustmentdebit (
      receipt_id,
      adjustmentdebit_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_receipt_and_adjustmentdebit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 441 (class 1255 OID 87893)
-- Name: bind_receipt_and_rebound(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION bind_receipt_and_rebound(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    binding.receipt_to_rebound (
      receipt_id,
      rebound_id)
  VALUES (
    __parent_id,
    __child_id);

END;
$$;


ALTER FUNCTION binding.bind_receipt_and_rebound(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 87894)
-- Name: get_adjustmentcredit_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_adjustmentcredit_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        adjustmentcredit_id
      FROM 
        binding.cutoff_to_adjustmentcredit
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_adjustmentcredit_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 87895)
-- Name: get_adjustmentcredit_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_adjustmentcredit_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        adjustmentcredit_id
      FROM 
        binding.cutoff_to_adjustmentcredit
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_adjustmentcredit_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 87896)
-- Name: get_adjustmentcredit_binded_to_issue(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_adjustmentcredit_binded_to_issue(__issue_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN adjustmentcredit_id FROM binding.issue_to_adjustmentcredit WHERE issue_id = __issue_id;

END;
$$;


ALTER FUNCTION binding.get_adjustmentcredit_binded_to_issue(__issue_id bigint) OWNER TO postgres;

--
-- TOC entry 445 (class 1255 OID 87897)
-- Name: get_adjustmentdebit_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_adjustmentdebit_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        adjustmentdebit_id
      FROM 
        binding.cutoff_to_adjustmentdebit
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_adjustmentdebit_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 446 (class 1255 OID 87898)
-- Name: get_adjustmentdebit_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_adjustmentdebit_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        adjustmentdebit_id
      FROM 
        binding.cutoff_to_adjustmentdebit
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_adjustmentdebit_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 87899)
-- Name: get_adjustmentdebit_binded_to_receipt(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_adjustmentdebit_binded_to_receipt(__receipt_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN adjustmentdebit_id FROM binding.receipt_to_adjustmentdebit WHERE receipt_id = __receipt_id;

END;
$$;


ALTER FUNCTION binding.get_adjustmentdebit_binded_to_receipt(__receipt_id bigint) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 87900)
-- Name: get_cutoff_binded_to(common.document_head); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to(__head common.document_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
BEGIN
  CASE __head.doctype
    WHEN 'ADJUSTMENTCREDIT'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_adjustmentcredit(__head.document_id);
    WHEN 'ADJUSTMENTDEBIT'::common.document_type THEN
      _cutoff_id := binding.get_cutoff_binded_to_adjustmentdebit(__head.document_id);
    WHEN 'DELIVERY'::common.document_type THEN
      _cutoff_id := binding.get_cutoff_binded_to_delivery(__head.document_id);
    WHEN 'DEMAND'::common.document_type THEN
      _cutoff_id := binding.get_cutoff_binded_to_demand(__head.document_id);
    WHEN 'DESPATCH'::common.document_type THEN
      _cutoff_id := binding.get_cutoff_binded_to_despatch(__head.document_id);
    WHEN 'ISSUE'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_issue(__head.document_id);
    WHEN 'PICKLIST'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_picklist(__head.document_id);
    WHEN 'REBOUND'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_rebound(__head.document_id);
    WHEN 'RESERVE'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_reserve(__head.document_id);
    WHEN 'RECEIPT'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_receipt(__head.document_id);
    WHEN 'STOCKTAKE'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_stocktake(__head.document_id);
    WHEN 'GOAL'::common.document_type THEN 
      _cutoff_id := binding.get_cutoff_binded_to_goal(__head.document_id);
    ELSE
      RAISE EXCEPTION 'unsupported doctype %', __head.doctype;
  END CASE;

  RETURN _cutoff_id;
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 449 (class 1255 OID 87901)
-- Name: get_cutoff_binded_to_adjustmentcredit(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_adjustmentcredit(__adjustmentcredit_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_adjustmentcredit
  WHERE 
    adjustmentcredit_id = __adjustmentcredit_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_adjustmentcredit(__adjustmentcredit_id bigint) OWNER TO postgres;

--
-- TOC entry 450 (class 1255 OID 87902)
-- Name: get_cutoff_binded_to_adjustmentdebit(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_adjustmentdebit(__adjustmentdebit_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_adjustmentdebit
  WHERE 
    adjustmentdebit_id = __adjustmentdebit_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_adjustmentdebit(__adjustmentdebit_id bigint) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 87903)
-- Name: get_cutoff_binded_to_delivery(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_delivery(__delivery_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_delivery
  WHERE 
    delivery_id = __delivery_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_delivery(__delivery_id bigint) OWNER TO postgres;

--
-- TOC entry 452 (class 1255 OID 87904)
-- Name: get_cutoff_binded_to_demand(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_demand(__demand_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_demand
  WHERE 
    demand_id = __demand_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_demand(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 87905)
-- Name: get_cutoff_binded_to_despatch(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_despatch(__despatch_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_despatch
  WHERE 
    despatch_id = __despatch_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_despatch(__despatch_id bigint) OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 87906)
-- Name: get_cutoff_binded_to_goal(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_goal(__goal_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_goal
  WHERE 
    goal_id = __goal_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_goal(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 455 (class 1255 OID 87907)
-- Name: get_cutoff_binded_to_issue(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_issue(__issue_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_issue
  WHERE 
    issue_id = __issue_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_issue(__issue_id bigint) OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 87908)
-- Name: get_cutoff_binded_to_picklist(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_picklist(__picklist_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_picklist
  WHERE 
    picklist_id = __picklist_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_picklist(__picklist_id bigint) OWNER TO postgres;

--
-- TOC entry 457 (class 1255 OID 87909)
-- Name: get_cutoff_binded_to_rebound(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_rebound(__rebound_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_rebound
  WHERE 
    rebound_id = __rebound_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_rebound(__rebound_id bigint) OWNER TO postgres;

--
-- TOC entry 458 (class 1255 OID 87910)
-- Name: get_cutoff_binded_to_receipt(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_receipt(__receipt_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_receipt
  WHERE 
    receipt_id = __receipt_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_receipt(__receipt_id bigint) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 87911)
-- Name: get_cutoff_binded_to_reserve(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_reserve(__reserve_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_reserve
  WHERE 
    reserve_id = __reserve_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_reserve(__reserve_id bigint) OWNER TO postgres;

--
-- TOC entry 420 (class 1255 OID 87912)
-- Name: get_cutoff_binded_to_stocktake(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to_stocktake(__stocktake_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    cutoff_id
  FROM 
    binding.cutoff_to_stocktake
  WHERE 
    stocktake_id = __stocktake_id;
    
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to_stocktake(__stocktake_id bigint) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 87913)
-- Name: get_delivery_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_delivery_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        delivery_id
      FROM 
        binding.cutoff_to_delivery
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_delivery_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 87914)
-- Name: get_delivery_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_delivery_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        delivery_id
      FROM 
        binding.cutoff_to_delivery
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_delivery_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 87915)
-- Name: get_delivery_binded_to_receipt(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_delivery_binded_to_receipt(__receipt_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN delivery_id FROM binding.delivery_to_receipt WHERE receipt_id = __receipt_id;

END;
$$;


ALTER FUNCTION binding.get_delivery_binded_to_receipt(__receipt_id bigint) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 87916)
-- Name: get_demand_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_demand_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        demand_id
      FROM 
        binding.cutoff_to_demand
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_demand_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 87917)
-- Name: get_demand_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_demand_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        demand_id
      FROM 
        binding.cutoff_to_demand
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_demand_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 87918)
-- Name: get_demand_binded_to_goal(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_demand_binded_to_goal(__goal_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN demand_id FROM binding.goal_to_demand WHERE goal_id = __goal_id;

END;
$$;


ALTER FUNCTION binding.get_demand_binded_to_goal(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 87919)
-- Name: get_demand_binded_to_picklist(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_demand_binded_to_picklist(__picklist_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN demand_id FROM binding.demand_to_picklist WHERE picklist_id = __picklist_id;

END;
$$;


ALTER FUNCTION binding.get_demand_binded_to_picklist(__picklist_id bigint) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 87920)
-- Name: get_demand_binded_to_reserve(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_demand_binded_to_reserve(__reserve_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN demand_id FROM binding.demand_to_reserve WHERE reserve_id = __reserve_id;

END;
$$;


ALTER FUNCTION binding.get_demand_binded_to_reserve(__reserve_id bigint) OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 87921)
-- Name: get_despatch_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_despatch_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        despatch_id
      FROM 
        binding.cutoff_to_despatch
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_despatch_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 87922)
-- Name: get_despatch_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_despatch_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        despatch_id
      FROM 
        binding.cutoff_to_despatch
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_despatch_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 87923)
-- Name: get_despatch_binded_to_goal(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_despatch_binded_to_goal(__goal_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN despatch_id FROM binding.goal_to_despatch WHERE goal_id = __goal_id;

END;
$$;


ALTER FUNCTION binding.get_despatch_binded_to_goal(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 87924)
-- Name: get_despatch_binded_to_issue(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_despatch_binded_to_issue(__issue_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN despatch_id FROM binding.issue_to_despatch WHERE issue_id = __issue_id;

END;
$$;


ALTER FUNCTION binding.get_despatch_binded_to_issue(__issue_id bigint) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 87925)
-- Name: get_goal_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        goal_id
      FROM 
        binding.cutoff_to_goal
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 87926)
-- Name: get_goal_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        goal_id
      FROM 
        binding.cutoff_to_goal
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 87927)
-- Name: get_goal_binded_to_demand(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_demand(__demand_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN goal_id FROM binding.goal_to_demand WHERE demand_id = __demand_id;

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_demand(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 87928)
-- Name: get_goal_binded_to_despatch(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_despatch(__despatch_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN goal_id FROM binding.goal_to_despatch WHERE despatch_id = __despatch_id;

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_despatch(__despatch_id bigint) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 87929)
-- Name: get_goal_binded_to_issue(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_issue(__issue_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN goal_id FROM binding.goal_to_issue WHERE issue_id = __issue_id;

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_issue(__issue_id bigint) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 87930)
-- Name: get_goal_binded_to_picklist(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_picklist(__picklist_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN goal_id FROM binding.goal_to_picklist WHERE picklist_id = __picklist_id;

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_picklist(__picklist_id bigint) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 87931)
-- Name: get_goal_binded_to_reserve(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_goal_binded_to_reserve(__reserve_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN goal_id FROM binding.goal_to_reserve WHERE reserve_id = __reserve_id;

END;
$$;


ALTER FUNCTION binding.get_goal_binded_to_reserve(__reserve_id bigint) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 87932)
-- Name: get_issue_binded_to_adjustmentcredit(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_adjustmentcredit(__adjustmentcredit_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN issue_id FROM binding.issue_to_adjustmentcredit WHERE adjustmentcredit_id = __adjustmentcredit_id;

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_adjustmentcredit(__adjustmentcredit_id bigint) OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 87933)
-- Name: get_issue_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        issue_id
      FROM 
        binding.cutoff_to_issue
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 87934)
-- Name: get_issue_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        issue_id
      FROM 
        binding.cutoff_to_issue
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 87935)
-- Name: get_issue_binded_to_despatch(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_despatch(__despatch_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN issue_id FROM binding.issue_to_despatch WHERE despatch_id = __despatch_id;

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_despatch(__despatch_id bigint) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 87936)
-- Name: get_issue_binded_to_goal(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_goal(__goal_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN issue_id FROM binding.goal_to_issue WHERE goal_id = __goal_id;

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_goal(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 87937)
-- Name: get_issue_binded_to_picklist(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_picklist(__picklist_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN issue_id FROM binding.picklist_to_issue WHERE picklist_id = __picklist_id;

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_picklist(__picklist_id bigint) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 87938)
-- Name: get_issue_binded_to_rebound(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_issue_binded_to_rebound(__rebound_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN issue_id FROM binding.issue_to_rebound WHERE rebound_id = __rebound_id;

END;
$$;


ALTER FUNCTION binding.get_issue_binded_to_rebound(__rebound_id bigint) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 87939)
-- Name: get_picklist_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_picklist_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        picklist_id
      FROM 
        binding.cutoff_to_picklist
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_picklist_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 87940)
-- Name: get_picklist_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_picklist_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        picklist_id
      FROM 
        binding.cutoff_to_picklist
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_picklist_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 87941)
-- Name: get_picklist_binded_to_demand(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_picklist_binded_to_demand(__demand_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN picklist_id FROM binding.demand_to_picklist WHERE demand_id = __demand_id;

END;
$$;


ALTER FUNCTION binding.get_picklist_binded_to_demand(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 87942)
-- Name: get_picklist_binded_to_goal(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_picklist_binded_to_goal(__goal_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN picklist_id FROM binding.goal_to_picklist WHERE goal_id = __goal_id;

END;
$$;


ALTER FUNCTION binding.get_picklist_binded_to_goal(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 87943)
-- Name: get_picklist_binded_to_issue(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_picklist_binded_to_issue(__issue_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN picklist_id FROM binding.picklist_to_issue WHERE issue_id = __issue_id;

END;
$$;


ALTER FUNCTION binding.get_picklist_binded_to_issue(__issue_id bigint) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 87944)
-- Name: get_rebound_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_rebound_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        rebound_id
      FROM 
        binding.cutoff_to_rebound
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_rebound_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 87945)
-- Name: get_rebound_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_rebound_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        rebound_id
      FROM 
        binding.cutoff_to_rebound
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_rebound_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 87946)
-- Name: get_rebound_binded_to_issue(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_rebound_binded_to_issue(__issue_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN rebound_id FROM binding.issue_to_rebound WHERE issue_id = __issue_id;

END;
$$;


ALTER FUNCTION binding.get_rebound_binded_to_issue(__issue_id bigint) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 87947)
-- Name: get_rebound_binded_to_receipt(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_rebound_binded_to_receipt(__receipt_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN rebound_id FROM binding.receipt_to_rebound WHERE receipt_id = __receipt_id;

END;
$$;


ALTER FUNCTION binding.get_rebound_binded_to_receipt(__receipt_id bigint) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 87948)
-- Name: get_receipt_binded_to_adjustmentdebit(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_receipt_binded_to_adjustmentdebit(__adjustmentdebit_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN receipt_id FROM binding.receipt_to_adjustmentdebit WHERE adjustmentdebit_id = __adjustmentdebit_id;

END;
$$;


ALTER FUNCTION binding.get_receipt_binded_to_adjustmentdebit(__adjustmentdebit_id bigint) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 87949)
-- Name: get_receipt_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_receipt_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        receipt_id
      FROM 
        binding.cutoff_to_receipt
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_receipt_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 87950)
-- Name: get_receipt_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_receipt_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        receipt_id
      FROM 
        binding.cutoff_to_receipt
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_receipt_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 87951)
-- Name: get_receipt_binded_to_delivery(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_receipt_binded_to_delivery(__delivery_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN receipt_id FROM binding.delivery_to_receipt WHERE delivery_id = __delivery_id;

END;
$$;


ALTER FUNCTION binding.get_receipt_binded_to_delivery(__delivery_id bigint) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 87952)
-- Name: get_receipt_binded_to_rebound(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_receipt_binded_to_rebound(__rebound_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN receipt_id FROM binding.receipt_to_rebound WHERE rebound_id = __rebound_id;

END;
$$;


ALTER FUNCTION binding.get_receipt_binded_to_rebound(__rebound_id bigint) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 87953)
-- Name: get_reserve_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_reserve_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        reserve_id
      FROM 
        binding.cutoff_to_reserve
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_reserve_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 87954)
-- Name: get_reserve_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_reserve_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        reserve_id
      FROM 
        binding.cutoff_to_reserve
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_reserve_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 87955)
-- Name: get_reserve_binded_to_demand(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_reserve_binded_to_demand(__demand_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN reserve_id FROM binding.demand_to_reserve WHERE demand_id = __demand_id;

END;
$$;


ALTER FUNCTION binding.get_reserve_binded_to_demand(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 87956)
-- Name: get_reserve_binded_to_goal(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_reserve_binded_to_goal(__goal_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN reserve_id FROM binding.goal_to_reserve WHERE goal_id = __goal_id;

END;
$$;


ALTER FUNCTION binding.get_reserve_binded_to_goal(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 87957)
-- Name: get_stocktake_binded_to_cutoff(bigint[]); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_stocktake_binded_to_cutoff(__cutoff_ids bigint[]) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT 
        stocktake_id
      FROM 
        binding.cutoff_to_stocktake
      WHERE 
        cutoff_id = ANY(__cutoff_ids)
      );

END;
$$;


ALTER FUNCTION binding.get_stocktake_binded_to_cutoff(__cutoff_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 87958)
-- Name: get_stocktake_binded_to_cutoff(bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_stocktake_binded_to_cutoff(__cutoff_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN
    ARRAY (
      SELECT
        stocktake_id
      FROM 
        binding.cutoff_to_stocktake
      WHERE 
        cutoff_id = __cutoff_id
      );

END;
$$;


ALTER FUNCTION binding.get_stocktake_binded_to_cutoff(__cutoff_id bigint) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 87959)
-- Name: unbind_cutoff_and_adjustmentcredit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_adjustmentcredit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_adjustmentcredit
  WHERE 
    cutoff_id = __parent_id AND
    adjustmentcredit_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_adjustmentcredit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 506 (class 1255 OID 87960)
-- Name: unbind_cutoff_and_adjustmentdebit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_adjustmentdebit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_adjustmentdebit
  WHERE 
    cutoff_id = __parent_id AND
    adjustmentdebit_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_adjustmentdebit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 87961)
-- Name: unbind_cutoff_and_delivery(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_delivery(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_delivery
  WHERE 
    cutoff_id = __parent_id AND
    delivery_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_delivery(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 87962)
-- Name: unbind_cutoff_and_demand(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_demand(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_demand
  WHERE 
    cutoff_id = __parent_id AND
    demand_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_demand(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 87963)
-- Name: unbind_cutoff_and_despatch(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_despatch(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_despatch
  WHERE 
    cutoff_id = __parent_id AND
    despatch_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_despatch(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 87964)
-- Name: unbind_cutoff_and_goal(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_goal(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_goal
  WHERE 
    cutoff_id = __parent_id AND
    goal_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_goal(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 511 (class 1255 OID 87965)
-- Name: unbind_cutoff_and_issue(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_issue(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_issue
  WHERE 
    cutoff_id = __parent_id AND
    issue_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_issue(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 512 (class 1255 OID 87966)
-- Name: unbind_cutoff_and_picklist(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_picklist(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_picklist
  WHERE 
    cutoff_id = __parent_id AND
    picklist_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_picklist(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 87967)
-- Name: unbind_cutoff_and_rebound(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_rebound(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_rebound
  WHERE 
    cutoff_id = __parent_id AND
    rebound_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_rebound(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 87968)
-- Name: unbind_cutoff_and_receipt(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_receipt(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_receipt
  WHERE 
    cutoff_id = __parent_id AND
    receipt_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_receipt(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 87969)
-- Name: unbind_cutoff_and_reserve(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_reserve(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_reserve
  WHERE 
    cutoff_id = __parent_id AND
    reserve_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_reserve(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 87970)
-- Name: unbind_cutoff_and_stocktake(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_cutoff_and_stocktake(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.cutoff_to_stocktake
  WHERE 
    cutoff_id = __parent_id AND
    stocktake_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_cutoff_and_stocktake(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 517 (class 1255 OID 87971)
-- Name: unbind_delivery_and_receipt(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_delivery_and_receipt(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.delivery_to_receipt
  WHERE 
    delivery_id = __parent_id AND
    receipt_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_delivery_and_receipt(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 518 (class 1255 OID 87972)
-- Name: unbind_demand_and_picklist(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_demand_and_picklist(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.demand_to_picklist
  WHERE 
    demand_id = __parent_id AND
    picklist_id = __child_id;
END;
$$;


ALTER FUNCTION binding.unbind_demand_and_picklist(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 519 (class 1255 OID 87973)
-- Name: unbind_demand_and_reserve(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_demand_and_reserve(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.demand_to_reserve
  WHERE 
    demand_id = __parent_id AND
    reserve_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_demand_and_reserve(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 87974)
-- Name: unbind_goal_and_demand(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_goal_and_demand(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.goal_to_demand
  WHERE 
    goal_id = __parent_id AND
    demand_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_goal_and_demand(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 521 (class 1255 OID 87975)
-- Name: unbind_goal_and_despatch(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_goal_and_despatch(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.goal_to_despatch
  WHERE 
    goal_id = __parent_id AND
    despatch_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_goal_and_despatch(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 87976)
-- Name: unbind_goal_and_issue(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_goal_and_issue(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.goal_to_issue
  WHERE 
    goal_id = __parent_id AND
    issue_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_goal_and_issue(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 523 (class 1255 OID 87977)
-- Name: unbind_goal_and_picklist(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_goal_and_picklist(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.goal_to_picklist
  WHERE 
    goal_id = __parent_id AND
    picklist_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_goal_and_picklist(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 524 (class 1255 OID 87978)
-- Name: unbind_goal_and_reserve(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_goal_and_reserve(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.goal_to_reserve
  WHERE 
    goal_id = __parent_id AND
    reserve_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_goal_and_reserve(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 525 (class 1255 OID 87979)
-- Name: unbind_issue_and_adjustmentcredit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_issue_and_adjustmentcredit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.issue_to_adjustmentcredit
  WHERE 
    issue_id = __parent_id AND
    adjustmentcredit_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_issue_and_adjustmentcredit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 87980)
-- Name: unbind_issue_and_despatch(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_issue_and_despatch(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.issue_to_despatch
  WHERE 
    issue_id = __parent_id AND
    despatch_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_issue_and_despatch(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 527 (class 1255 OID 87981)
-- Name: unbind_issue_and_rebound(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_issue_and_rebound(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.issue_to_rebound
  WHERE 
    issue_id = __parent_id AND
    rebound_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_issue_and_rebound(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 528 (class 1255 OID 87982)
-- Name: unbind_picklist_and_issue(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_picklist_and_issue(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.picklist_to_issue
  WHERE 
    picklist_id = __parent_id AND
    issue_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_picklist_and_issue(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 529 (class 1255 OID 87983)
-- Name: unbind_receipt_and_adjustmentdebit(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_receipt_and_adjustmentdebit(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.receipt_to_adjustmentdebit
  WHERE 
    receipt_id = __parent_id AND
    adjustmentdebit_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_receipt_and_adjustmentdebit(__parent_id bigint, __child_id bigint) OWNER TO postgres;

--
-- TOC entry 530 (class 1255 OID 87984)
-- Name: unbind_receipt_and_rebound(bigint, bigint); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION unbind_receipt_and_rebound(__parent_id bigint, __child_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  DELETE FROM
    binding.receipt_to_rebound
  WHERE 
    receipt_id = __parent_id AND
    rebound_id = __child_id;

END;
$$;


ALTER FUNCTION binding.unbind_receipt_and_rebound(__parent_id bigint, __child_id bigint) OWNER TO postgres;

SET search_path = common, pg_catalog;

--
-- TOC entry 531 (class 1255 OID 87985)
-- Name: convert_goal_to_document_transition(goal.goal_transition); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_goal_to_document_transition(__goal_transition goal.goal_transition) RETURNS document_transition
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;  
BEGIN

  CASE __goal_transition
    WHEN 'PROPOSED'::goal.goal_transition THEN 
      _document_transition := 'PROPOSED'::common.document_transition;

    WHEN 'ADVISED'::goal.goal_transition THEN
      _document_transition := 'PROPOSED'::common.document_transition;

    WHEN 'REJECTED'::goal.goal_transition THEN
      _document_transition := 'PROPOSED'::common.document_transition;

    WHEN 'ACCEPTED'::goal.goal_transition THEN
      _document_transition := 'PROPOSED'::common.document_transition;

    WHEN 'CANCELED'::goal.goal_transition THEN
      _document_transition := 'PROPOSED'::common.document_transition;

    WHEN 'COMMITTED'::goal.goal_transition THEN
      _document_transition := 'COMMITTED'::common.document_transition;

    WHEN 'DECOMMITTED'::goal.goal_transition THEN 
      _document_transition := 'DECOMMITTED'::common.document_transition;

    WHEN 'FAILED'::goal.goal_transition THEN 
      _document_transition := 'COMMITTED'::common.document_transition;

    WHEN 'SATISFIED'::goal.goal_transition THEN 
      _document_transition := 'COMMITTED'::common.document_transition;

    ELSE
      RAISE EXCEPTION 'unsupported goal_transition %', __goal_transition;

  END CASE;

  RETURN _document_transition;

END;
$$;


ALTER FUNCTION common.convert_goal_to_document_transition(__goal_transition goal.goal_transition) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 87986)
-- Name: disallow_editing_of_committed_document_head(); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_head() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'UPDATE') THEN

    IF (OLD.curr_transition = 'COMMITTED'::common.document_transition AND NEW.curr_transition <> 'DECOMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %, %', OLD.id, OLD.gid, OLD.curr_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN

    IF (OLD.curr_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to delete document %, %', OLD.id, OLD.curr_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION common.disallow_editing_of_committed_document_head() OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 87987)
-- Name: get_cutoff_mode(document_type); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_cutoff_mode(__document_type document_type) RETURNS cutoff_mode
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_mode common.cutoff_mode;
BEGIN

  SELECT
    cutoff_mode_applied
  FROM 
    common.cutoff_policy
  WHERE 
    document_type_name = __document_type
  INTO
    _cutoff_mode;
  IF NOT FOUND THEN
    _cutoff_mode := 'DISABLED'::common.cutoff_mode;
  END IF;

  RETURN _cutoff_mode;

END;
$$;


ALTER FUNCTION common.get_cutoff_mode(__document_type document_type) OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 87988)
-- Name: get_document_abbrevation(document_type); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_document_abbrevation(__doctype document_type) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _abbrevation character varying;
  _abbrevation_default CONSTANT character varying DEFAULT 'UNDEFINED';
BEGIN
  SELECT
    abbrevation
  FROM 
    common.document_abbrevation
  WHERE 
    doctype = __doctype
  INTO 
    _abbrevation;
  IF (NOT FOUND) THEN
    _abbrevation := _abbrevation_default;
  END IF;
  RETURN _abbrevation;
END;
$$;


ALTER FUNCTION common.get_document_abbrevation(__doctype document_type) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 87989)
-- Name: get_document_head_types(cutoff_mode); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_document_head_types(__cutoff_mode cutoff_mode) RETURNS document_type[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY (
      SELECT
        document_type_name
      FROM 
        common.cutoff_policy
      WHERE 
        cutoff_mode_applied = __cutoff_mode
    );

END;
$$;


ALTER FUNCTION common.get_document_head_types(__cutoff_mode cutoff_mode) OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 87990)
-- Name: get_stocktake_mode(document_type); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_stocktake_mode(__document_type document_type) RETURNS cutoff_mode
    LANGUAGE plpgsql
    AS $$
DECLARE
  _stocktake_mode common.cutoff_mode;
BEGIN

  SELECT
    stocktake_mode_applied
  FROM 
    common.stocktake_policy
  WHERE 
    document_type_name = __document_type
  INTO
    _stocktake_mode;
  IF NOT FOUND THEN
    _stocktake_mode := 'DISABLED'::common.cutoff_mode;
  END IF;

  RETURN _stocktake_mode;

END;
$$;


ALTER FUNCTION common.get_stocktake_mode(__document_type document_type) OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 87991)
-- Name: number_encode2(integer, boolean); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION number_encode2(__number integer, __upper_only boolean DEFAULT true) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _a_char CONSTANT character varying(1) DEFAULT 'A'; --'ZERO'-char
  _ascii_offset CONSTANT integer DEFAULT 65; -- ASCII offset
  _ascii_mid_offset1 integer DEFAULT 0; -- ASCII offset between 'Z' and 'a'
  _ascii_mid_offset2 integer DEFAULT 0; -- ASCII offset between 'Z' and 'a'
  _numeral_base integer;
  _first_char character varying(1);
  _second_char character varying(1);
  
BEGIN

  -- ватіранти імені для функції: 
  -- варіанти поведінки функції: 

  /*
    функція повертає буквенний код заданого числа з основою 26 (A-Z) або 52 (A-Z,a-z)
  */

  IF (__upper_only) THEN
    _numeral_base := 26;
  ELSE
    _numeral_base := 52;
  END IF;

  IF (__number < 0 OR __number >= power(_numeral_base, 2)) THEN
    RAISE EXCEPTION '__number is out of range : 0 ... %', (power(_numeral_base, 2) - 1);
  END IF;

  IF (_numeral_base = 52 AND ((__number / _numeral_base) > 25)) THEN
    _ascii_mid_offset1 := 6;
  ELSE
    _ascii_mid_offset1 := 0;
  END IF;

  IF (_numeral_base = 52 AND ((__number % _numeral_base) > 25)) THEN
    _ascii_mid_offset2 := 6;
  ELSE 
    _ascii_mid_offset2 := 0;
  END IF;

  IF (__number < _numeral_base) THEN
    _first_char := _a_char;
    _second_char := chr(_ascii_offset + _ascii_mid_offset2 + __number);
  ELSE
    _first_char :=  chr(_ascii_offset + _ascii_mid_offset1 + (__number / _numeral_base));
    _second_char := chr(_ascii_offset + _ascii_mid_offset2 + (__number % _numeral_base));
  END IF;

  --RAISE NOTICE 'return __number % ', __number;
  --RAISE NOTICE 'return __upper_only % ', __upper_only;
  --RAISE NOTICE 'return _a_char % ', _a_char;
  --RAISE NOTICE 'return _ascii_offset % ', _ascii_offset;
  --RAISE NOTICE 'return _ascii_mid_offset1 % ', _ascii_mid_offset1;
  --RAISE NOTICE 'return _ascii_mid_offset2 % ', _ascii_mid_offset2;
  --RAISE NOTICE 'return _numeral_base % ', _numeral_base;
  --RAISE NOTICE 'return _first_char % ', _first_char;
  --RAISE NOTICE 'return _second_char % ', _second_char;
  
  RETURN concat(_first_char, _second_char);

END;
$$;


ALTER FUNCTION common.number_encode2(__number integer, __upper_only boolean) OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 87992)
-- Name: number_encode4(integer, boolean); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION number_encode4(__number integer, __upper_only boolean DEFAULT true) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numeral_base integer;
  _v1 integer;
  _v2 integer;
  _v3 integer;
  _v4 integer;
  
BEGIN

  -- ватіранти імені для функції: 
  -- варіанти поведінки функції: 
  /*
    >>> 10 ** 2 * 26 ** 2 -1
    67599
    >>> 10 ** 2 * 52 ** 2 -1
    270399
  */


  /*
    функція повертає буквенний код заданого числа з основою 26 (A-Z) або 52 (A-Z,a-z)
  */

  IF (__upper_only) THEN
    _numeral_base := 26;
  ELSE
    _numeral_base := 52;
  END IF;

  IF (__number < 0 OR __number >= (power(_numeral_base, 2) * 100)) THEN
    RAISE EXCEPTION '__number is out of range : 0 ... %', ((power(_numeral_base, 2) * 100) - 1);
  END IF;

  _v1 := __number / 100;
  _v2 := __number % 100;
  _v3 := _v2 / 10;
  _v4 := _v2 % 10;
  
  RETURN concat(_v4, common.number_encode2(_v1, __upper_only), _v3);

END;
$$;


ALTER FUNCTION common.number_encode4(__number integer, __upper_only boolean) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 87993)
-- Name: raise_custom_exception(text); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION raise_custom_exception(__condition_name text DEFAULT 'unknown_exception'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _record record;
BEGIN

  --SET search_path = err, pg_catalog;
  --select raise_custom_exception();
  --select raise_custom_exception('invalid_test_data');
  --select raise_custom_exception('INCORRECT_INPUT');

  SELECT INTO _record
    message,
    detail,
    hint,
    errcode
  FROM
    common.exception_code
  WHERE
    condition_name = __condition_name;

  IF FOUND THEN
    RAISE EXCEPTION USING MESSAGE = _record.message, 
      DETAIL = _record.detail, 
      HINT = _record.hint, 
      ERRCODE = _record.errcode; 
  ELSE
    RAISE EXCEPTION USING MESSAGE = 'raise_custom_exception(): Unknown Condition Name set to condition_name';
  END IF;

END;
$$;


ALTER FUNCTION common.raise_custom_exception(__condition_name text) OWNER TO postgres;

--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION raise_custom_exception(__condition_name text); Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON FUNCTION raise_custom_exception(__condition_name text) IS 'Raise exception using mesage text from exception_code table';


--
-- TOC entry 540 (class 1255 OID 87994)
-- Name: remake_head(document_head, bigint, uuid, character varying, date, character varying, character varying, document_transition, document_type, date); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION remake_head(__head document_head, __document_id bigint DEFAULT NULL::bigint, __gid uuid DEFAULT NULL::uuid, __display_name character varying DEFAULT NULL::character varying, __create_date date DEFAULT NULL::date, __ship_to character varying DEFAULT NULL::character varying, __ship_from character varying DEFAULT NULL::character varying, __curr_transition document_transition DEFAULT NULL::document_transition, __doctype document_type DEFAULT NULL::document_type, __due_date date DEFAULT NULL::date) RETURNS document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN

  IF (__document_id IS NOT NULL) THEN
    __head.document_id := __document_id;
  END IF;

  IF (__gid IS NOT NULL) THEN
    __head.gid := __gid;
  END IF;

  IF (__display_name IS NOT NULL) THEN
    __head.display_name := __display_name;
  END IF;

  IF (__create_date IS NOT NULL) THEN
    __head.create_date := __create_date;
  END IF;

  IF (__ship_to IS NOT NULL) THEN
    __head.ship_to := __ship_to;
  END IF;

  IF (__ship_from IS NOT NULL) THEN
    __head.ship_from := __ship_from;
  END IF;

  IF (__curr_transition IS NOT NULL) THEN
    __head.curr_transition := __curr_transition;
  END IF;

  IF (__doctype IS NOT NULL) THEN
    __head.doctype := __doctype;
  END IF;

  IF (__due_date IS NOT NULL) THEN
    __head.due_date := __due_date;
  END IF;

  IF (__head.create_date > __head.due_date) THEN
    __head.due_date := __head.create_date;
  END IF;

  RETURN __head;

END;
$$;


ALTER FUNCTION common.remake_head(__head document_head, __document_id bigint, __gid uuid, __display_name character varying, __create_date date, __ship_to character varying, __ship_from character varying, __curr_transition document_transition, __doctype document_type, __due_date date) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 87995)
-- Name: set_prev_doc_transition(); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION set_prev_doc_transition() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'UPDATE' AND NEW.curr_transition != OLD.curr_transition) THEN
    NEW.prev_transition := OLD.curr_transition;
    NEW.prev_transition_date := OLD.curr_transition_date;
    NEW.curr_transition_date := now();
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION common.set_prev_doc_transition() OWNER TO postgres;

SET search_path = cutoff, pg_catalog;

--
-- TOC entry 542 (class 1255 OID 87996)
-- Name: destroy(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM cutoff.registry WHERE id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 543 (class 1255 OID 87997)
-- Name: do_blockers_check(common.cutoff_registry, common.document_type, date, date); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_check(__registry common.cutoff_registry, __document_type common.document_type, __date_start date, __date_end date) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_heads common.document_head[];
BEGIN
  CASE __document_type
    WHEN 'ADJUSTMENTCREDIT'::common.document_type THEN 
      _document_heads := adjustmentcredit.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'ADJUSTMENTDEBIT'::common.document_type THEN
      _document_heads := adjustmentdebit.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'DELIVERY'::common.document_type THEN
      _document_heads := delivery.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'DEMAND'::common.document_type THEN
      _document_heads := demand.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'DESPATCH'::common.document_type THEN
      _document_heads := despatch.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'ISSUE'::common.document_type THEN 
      _document_heads := issue.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'PICKLIST'::common.document_type THEN 
      _document_heads := picklist.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'REBOUND'::common.document_type THEN 
      _document_heads := rebound.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'RESERVE'::common.document_type THEN 
      _document_heads := reserve.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'STOCKTAKE'::common.document_type THEN 
      _document_heads := stocktake.get_head_batch_proposed(
          __facility_code := __registry.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    ELSE
      -- do nothing
  END CASE;
  PERFORM cutoff.do_blockers_denote(
      __document_id := __registry.document_id,
      __head := _document_heads);
END;
$$;


ALTER FUNCTION cutoff.do_blockers_check(__registry common.cutoff_registry, __document_type common.document_type, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 544 (class 1255 OID 87998)
-- Name: do_blockers_delete(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_delete(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM cutoff.blocker WHERE registry_id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.do_blockers_delete(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 87999)
-- Name: do_blockers_denote(bigint, common.document_head[]); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_denote(__document_id bigint, __head common.document_head[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    cutoff.blocker (
      registry_id, 
      blocker_document) 
  VALUES (
    __document_id, 
    unnest(__head)::common.document_head);

END;
$$;


ALTER FUNCTION cutoff.do_blockers_denote(__document_id bigint, __head common.document_head[]) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 88000)
-- Name: do_blockers_exclude(common.cutoff_registry, common.document_type, date, date); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_exclude(__registry common.cutoff_registry, __document_type common.document_type, __date_start date, __date_end date) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_heads common.document_head[];
  _document_head common.document_head;
  _past_cutof_ids bigint[];
BEGIN
  _past_cutof_ids := cutoff.get_all_comitted(__facility_code := __registry.facility_code);

  CASE __document_type
    WHEN 'ADJUSTMENTCREDIT'::common.document_type THEN 
      _document_heads := adjustmentcredit.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_adjustmentcredit(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := adjustmentcredit.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_adjustmentcredit(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'ADJUSTMENTDEBIT'::common.document_type THEN
      _document_heads := adjustmentdebit.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_adjustmentdebit(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := adjustmentdebit.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_adjustmentdebit(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'DELIVERY'::common.document_type THEN
      _document_heads := delivery.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_delivery(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := delivery.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_delivery(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'DEMAND'::common.document_type THEN
      _document_heads := demand.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_demand(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := demand.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_demand(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'DESPATCH'::common.document_type THEN
      _document_heads := despatch.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_despatch(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := despatch.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_despatch(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'ISSUE'::common.document_type THEN 
      _document_heads := issue.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_issue(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := issue.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_issue(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;
    WHEN 'PICKLIST'::common.document_type THEN 
      _document_heads := picklist.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_picklist(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := picklist.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_picklist(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'REBOUND'::common.document_type THEN 
      _document_heads := rebound.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_rebound(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := rebound.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_rebound(__registry.document_id, _document_head.document_id);
      END LOOP;

    WHEN 'RESERVE'::common.document_type THEN 
      _document_heads := reserve.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_reserve(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := reserve.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_reserve(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'STOCKTAKE'::common.document_type THEN 
      _document_heads := stocktake.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
          PERFORM binding.unbind_cutoff_and_stocktake(
              __parent_id := __registry.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := stocktake.get_head_batch_proposed(__registry.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_stocktake(
            __parent_id := __registry.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    ELSE
      -- do nothing
  END CASE;
END;
$$;


ALTER FUNCTION cutoff.do_blockers_exclude(__registry common.cutoff_registry, __document_type common.document_type, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 88001)
-- Name: do_commit(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_head_types common.document_type[];
  _document_head_type common.document_type;
  _registry common.cutoff_registry;
  _date_start date;
  _date_end date;
  _has_blockers boolean;
BEGIN

  _registry := cutoff.get_registry(__document_id := __document_id);
  _date_start := cutoff.get_last_cutoff_date(_registry.facility_code);
  _date_end := _registry.due_date;

  -- check state
  IF (_registry.curr_transition = 'COMMITTED') THEN
    RAISE EXCEPTION 'cutoff already committed';
  END IF;

  _has_blockers := cutoff.has_blockers(__document_id := __document_id);
  -- cleart previously blockers analyze result
  IF (_has_blockers IS TRUE) THEN
    PERFORM cutoff.do_blockers_delete(__document_id := __document_id);
  END IF;

  -- analyze blockers
  _document_head_types := common.get_document_head_types(__cutoff_mode := 'ENFORCING'::common.cutoff_mode);
  FOREACH _document_head_type IN
    ARRAY _document_head_types
  LOOP
    PERFORM cutoff.do_blockers_check(
        __registry := _registry, 
        __document_type := _document_head_type, 
        __date_start := _date_start, 
        __date_end := _date_end);
  END LOOP;

  _has_blockers := cutoff.has_blockers(__document_id := __document_id);
  IF (_has_blockers IS TRUE) THEN
    RAISE WARNING 'there is bloking documents. can not perform commit of cutoff %', __document_id;
    RETURN; 
  END IF;

  _document_head_types := common.get_document_head_types(__cutoff_mode := 'PERMISSIVE'::common.cutoff_mode);
  FOREACH _document_head_type IN
    ARRAY _document_head_types
  LOOP
    PERFORM cutoff.do_blockers_exclude(
        __registry := _registry, 
        __document_type := _document_head_type, 
        __date_start := _date_start, 
        __date_end := _date_end);
  END LOOP;

  UPDATE
    cutoff.registry
  SET
    curr_transition = 'COMMITTED'
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION cutoff.do_commit(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 88002)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _registry common.cutoff_registry;
BEGIN

  _registry := cutoff.get_registry(__document_id);

  IF (_registry.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'cutoff % not committed. exiting', _registry.gid;
    RETURN;
  END IF;

  UPDATE
    cutoff.registry
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  DELETE FROM binding.cutoff_to_adjustmentcredit WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_adjustmentdebit WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_delivery WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_demand WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_goal WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_issue WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_picklist WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_rebound WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_receipt WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_reserve WHERE cutoff_id = __document_id;
  DELETE FROM binding.cutoff_to_stocktake WHERE cutoff_id = __document_id;

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'cutoff'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION cutoff.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 88003)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := cutoff.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('CUTOFF');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION cutoff.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 553 (class 1255 OID 88004)
-- Name: get_all_comitted(character varying); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION get_all_comitted(__facility_code character varying) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY (
      SELECT
        id
      FROM 
        cutoff.registry
      WHERE 
        facility_code = __facility_code AND
        curr_transition = 'COMMITTED'::common.document_transition
    );
END;
$$;


ALTER FUNCTION cutoff.get_all_comitted(__facility_code character varying) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 88005)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      cutoff.registry
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 555 (class 1255 OID 88006)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      cutoff.registry
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION cutoff.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 1009 (class 1255 OID 88007)
-- Name: get_last_cutoff_date(character varying); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION get_last_cutoff_date(__facility_code character varying) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  __cutoff_date date;
BEGIN
  SELECT
    registry.due_date
  FROM 
    cutoff.registry
  WHERE 
    registry.curr_transition = 'COMMITTED'::common.document_transition AND 
    registry.facility_code = __facility_code
  ORDER BY
    registry.due_date DESC
  LIMIT 1
  INTO __cutoff_date;
  IF NOT FOUND THEN
    __cutoff_date := schedule.get_date_of_julianized_day(1);
  END IF;
  RETURN __cutoff_date;
END;
$$;


ALTER FUNCTION cutoff.get_last_cutoff_date(__facility_code character varying) OWNER TO postgres;

--
-- TOC entry 556 (class 1255 OID 88008)
-- Name: get_registry(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION get_registry(__document_id bigint) RETURNS common.cutoff_registry
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    facility_code,
    curr_transition,
    'CUTOFF'::common.document_type,
    due_date)::common.cutoff_registry
  FROM 
    cutoff.registry
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.get_registry(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 88009)
-- Name: has_blockers(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION has_blockers(__document_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM
    blocker.registry_id
  FROM 
    cutoff.blocker
  WHERE 
    blocker.registry_id = __document_id
  LIMIT 1;
  IF FOUND THEN
    RETURN true;
  ELSE 
    RETURN false;
  END IF;
END;
$$;


ALTER FUNCTION cutoff.has_blockers(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 88010)
-- Name: init(common.cutoff_registry); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION init(__registry common.cutoff_registry) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_id bigint;
BEGIN

  IF (__registry.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field FACILITY_CODE is not defined';
  END IF;

  IF (__registry.create_date IS NULL) THEN
    __registry.create_date := now()::date;
  END IF;

  IF (__registry.due_date IS NULL) THEN
    __registry.due_date := __registry.create_date + 1;
  END IF;

  IF (__registry.display_name IS NULL) THEN
    __registry.display_name := cutoff.generate_display_name(
        __create_date := __registry.create_date,
        __facility_code := __registry.facility_code);
  END IF;

  INSERT INTO
    cutoff.registry (
      id, 
      display_name,
      create_date, 
      due_date, 
      facility_code)
  VALUES (
    DEFAULT, 
    __registry.display_name,
    __registry.create_date, 
    __registry.due_date, 
    __registry.facility_code) 
  RETURNING id INTO _document_id;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION cutoff.init(__registry common.cutoff_registry) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 88011)
-- Name: is_document_locked(common.document_head); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION is_document_locked(__head common.document_head) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  _last_cutoff_date date;
  _cutoff_mode common.cutoff_mode;
  _is_locked boolean;
  _binded_cutoff bigint;
BEGIN
  _last_cutoff_date := cutoff.get_last_cutoff_date(__head.ship_from);
  _cutoff_mode := common.get_cutoff_mode(__head.doctype);

  IF (__head.create_date > _last_cutoff_date) THEN
    _is_locked := false;
  ELSE
    IF (_cutoff_mode = 'ENFORCING') THEN
      _is_locked := true;
    ELSIF (_cutoff_mode = 'PERMISSIVE') THEN
      _binded_cutoff := binding.get_cutoff_binded_to(__head);
      IF (_binded_cutoff IS NOT NULL) THEN
        _is_locked := false;
      ELSE
        _is_locked := true;
      END IF;
    ELSE
      _is_locked := false; --!
    END IF;
  END IF;

  RETURN _is_locked;
END;
$$;


ALTER FUNCTION cutoff.is_document_locked(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 88012)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    cutoff.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      cutoff.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION cutoff.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

SET search_path = delivery, pg_catalog;

--
-- TOC entry 548 (class 1255 OID 88013)
-- Name: destroy(bigint); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM delivery.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION delivery.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 88014)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      delivery.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      delivery.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION delivery.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 88015)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _child_id bigint;
BEGIN

  _head := delivery.get_head(__document_id);
  _body := delivery.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'delivery % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    delivery.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_order_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  SELECT 
    delivery_to_receipt.receipt_id
  FROM 
    binding.delivery_to_receipt
  WHERE 
    delivery_to_receipt.delivery_id = __document_id
  INTO 
    _child_id;
  IF NOT FOUND THEN
    _child_id := receipt.init(_head, _body);

    PERFORM binding.bind_delivery_and_receipt(
      __parent_id := __document_id,
      __child_id := _child_id);
  END IF;
  
  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'delivery'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION delivery.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 563 (class 1255 OID 88016)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _child_id bigint;
  _child_head common.document_head;
BEGIN

  _head := delivery.get_head(__document_id);
  _body := delivery.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'delivery % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  SELECT 
    delivery_to_receipt.receipt_id
  FROM 
    binding.delivery_to_receipt
  WHERE 
    delivery_to_receipt.delivery_id = __document_id
  INTO 
    _child_id;
  IF FOUND THEN
    _child_head := receipt.get_head(_child_id);
    IF (_child_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'binded receipt % is commited. exiting', _child_head.gid;
    END IF;
  END IF;

  UPDATE
    delivery.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.loss_on_order_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'delivery'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION delivery.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 88017)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := delivery.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('DELIVERY');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION delivery.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 88018)
-- Name: get_body(bigint); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          delivery.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION delivery.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 88019)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      delivery.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION delivery.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 88020)
-- Name: get_head(bigint); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'DELIVERY'::common.document_type,
    due_date)::common.document_head
  FROM 
    delivery.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION delivery.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 88021)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'DELIVERY'::common.document_type,
        due_date)::common.document_head
      FROM 
        delivery.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION delivery.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 88022)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'DELIVERY'::common.document_type,
        due_date)::common.document_head
      FROM 
        delivery.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION delivery.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 570 (class 1255 OID 88023)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      delivery.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION delivery.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 571 (class 1255 OID 88024)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_to IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_TO is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := delivery.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_to);
  END IF;

  INSERT INTO
    delivery.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      delivery.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION delivery.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 88025)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    delivery.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      delivery.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION delivery.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 88026)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    delivery.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      delivery.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION delivery.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = demand, pg_catalog;

--
-- TOC entry 574 (class 1255 OID 88027)
-- Name: destroy(bigint); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM demand.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION demand.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 575 (class 1255 OID 88028)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      demand.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition;
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      demand.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION demand.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 1007 (class 1255 OID 88029)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _is_locked boolean;
BEGIN

  _head := demand.get_head(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'demand % already committed. exiting', _head.gid;
    --RETURN;
  END IF;

  _is_locked := cutoff.is_document_locked(_head);
  IF (_is_locked = true) THEN
    RAISE EXCEPTION 'demand % is locked by cutoff. exiting', _head.gid;
    --RETURN;
  END IF;

  _body := demand.get_body(__document_id);
  _is_locked := stocktake.is_document_locked(_head, _body);
  IF (_is_locked = true) THEN
    RAISE EXCEPTION 'demand % is locked by stocktake. exiting', _head.gid;
    --RETURN;
  END IF;

  UPDATE
    demand.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'DEMAND'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION demand.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 1008 (class 1255 OID 88030)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _is_locked boolean;
BEGIN

  _head := demand.get_head(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'demand % not committed. exiting', _head.gid;
  END IF;

  _is_locked := cutoff.is_document_locked(_head);
  IF (_is_locked = true) THEN
    RAISE EXCEPTION 'demand % is locked by cutoff. exiting', _head.gid;
  END IF;

  _body := demand.get_body(__document_id);
  _is_locked := stocktake.is_document_locked(_head, _body);
  IF (_is_locked = true) THEN
    RAISE EXCEPTION 'demand % is locked by stocktake. exiting', _head.gid;
  END IF;

  UPDATE
    demand.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'DEMAND'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION demand.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 88031)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := demand.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('DEMAND');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION demand.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 88032)
-- Name: get_body(bigint); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          demand.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION demand.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 88033)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      demand.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION demand.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 88034)
-- Name: get_head(bigint); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'DEMAND'::common.document_type,
    due_date)::common.document_head
  FROM 
    demand.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION demand.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 88035)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'DEMAND'::common.document_type,
        due_date)::common.document_head
      FROM 
        demand.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION demand.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 88036)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'DEMAND'::common.document_type,
        due_date)::common.document_head
      FROM 
        demand.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION demand.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 88037)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      demand.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION demand.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 582 (class 1255 OID 88038)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := demand.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_from);
  END IF;

  INSERT INTO
    demand.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      demand.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION demand.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 88039)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    demand.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      demand.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION demand.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 88040)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    demand.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      demand.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION demand.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = despatch, pg_catalog;

--
-- TOC entry 585 (class 1255 OID 88041)
-- Name: destroy(bigint); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM despatch.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION despatch.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 586 (class 1255 OID 88042)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      despatch.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      despatch.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION despatch.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 88043)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _reserve_id bigint;
  _reserve_head common.document_head;
  _reserve_body common.document_body[];
  _picklist_id bigint;
  _picklist_head common.document_head;
  _picklist_body common.document_body[];
BEGIN

  _head := despatch.get_head(__document_id);
  
  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'despatch % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  -- has isue binding?
  PERFORM issue_id FROM binding.issue_to_despatch WHERE despatch_id = __document_id;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'despatch % not binded to any issue.', __document_id;
  END IF;

  UPDATE
    despatch.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  SELECT 
    picklist_head.id
  INTO
    _picklist_id
  FROM 
    despatch.head despatch_head, 
    picklist.head picklist_head, 
    binding.goal_to_picklist, 
    binding.goal_to_despatch
  WHERE 
    despatch_head.id = goal_to_despatch.despatch_id AND
    picklist_head.id = goal_to_picklist.picklist_id AND
    goal_to_despatch.goal_id = goal_to_picklist.goal_id AND
    despatch_head.id = __document_id;
  IF FOUND THEN
    _picklist_head := picklist.get_head(_picklist_id);
    _picklist_body := picklist.get_body(_picklist_id);
    PERFORM balance.loss_en_route_qty(
        __facility_code := _picklist_head.ship_from,
        __inventory := _picklist_body);
  END IF;

  SELECT 
    reserve_head.id
  INTO
    _reserve_id
  FROM 
    despatch.head despatch_head, 
    reserve.head reserve_head, 
    binding.goal_to_reserve, 
    binding.goal_to_despatch
  WHERE 
    despatch_head.id = goal_to_despatch.despatch_id AND
    reserve_head.id = goal_to_reserve.reserve_id AND
    goal_to_despatch.goal_id = goal_to_reserve.goal_id AND
    despatch_head.id = __document_id;
  IF FOUND THEN
    _reserve_head := reserve.get_head(_reserve_id);
    _reserve_body := reserve.get_body(_reserve_id);
  PERFORM balance.loss_reserved_qty(
        __facility_code := _reserve_head.ship_from,
        __inventory := _reserve_body);
  END IF;

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'DESPATCH'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION despatch.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 88044)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  RAISE WARNING 'despatch % can not be decommitted. not possible to implement', __document_id;
  RETURN;

END;
$$;


ALTER FUNCTION despatch.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 88045)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := despatch.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('DESPATCH');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION despatch.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 88046)
-- Name: get_body(bigint); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          despatch.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION despatch.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 592 (class 1255 OID 88047)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      despatch.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION despatch.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 593 (class 1255 OID 88048)
-- Name: get_head(bigint); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'DESPATCH'::common.document_type,
    due_date)::common.document_head
  FROM 
    despatch.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION despatch.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 88049)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'DESPATCH'::common.document_type,
        due_date)::common.document_head
      FROM 
        despatch.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION despatch.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 88050)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'DESPATCH'::common.document_type,
        due_date)::common.document_head
      FROM 
        despatch.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION despatch.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 596 (class 1255 OID 88051)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      despatch.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION despatch.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 88052)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := despatch.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_from);
  END IF;

  INSERT INTO
    despatch.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      despatch.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION despatch.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 88053)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    despatch.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      despatch.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION despatch.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 88054)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    despatch.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      despatch.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION despatch.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = goal, pg_catalog;

--
-- TOC entry 600 (class 1255 OID 88055)
-- Name: analyze_ability(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION analyze_ability(__demand_id bigint) RETURNS goal_transition
    LANGUAGE plpgsql
    AS $$
BEGIN

  PERFORM 
    good_code
  FROM 
    demand.body
  WHERE 
    head_id = __demand_id
  EXCEPT
  SELECT 
    body.good_code
  FROM 
    demand.body
  INNER JOIN
    demand.head ON (head.id = body.head_id)
  LEFT JOIN
    balance.balance ON (body.good_code = balance.good_code and head.ship_from = balance.facility_code)
  WHERE
    body.head_id = __demand_id AND
    (COALESCE(balance.on_hand_qty, 0.0::common.quantity) - COALESCE(balance.reserved_qty, 0.0::common.quantity)) >= body.quantity;
  IF NOT FOUND THEN
    RAISE NOTICE 'demand % can be accepted', __demand_id;
    RETURN 'ACCEPTED'::goal.goal_transition;
  END IF;

  PERFORM 
    good_code
  FROM 
    demand.body
  WHERE 
    head_id = __demand_id
  EXCEPT
  SELECT 
    body.good_code
  FROM 
    demand.body
  INNER JOIN
    demand.head ON (head.id = body.head_id)
  LEFT JOIN
    balance.balance ON (body.good_code = balance.good_code and head.ship_from = balance.facility_code)
  WHERE
    body.head_id = __demand_id AND
    (COALESCE(balance.on_hand_qty, 0.0::common.quantity) - COALESCE(balance.reserved_qty, 0.0::common.quantity)) <= 0;
  IF NOT FOUND THEN
    RAISE NOTICE 'demand % must be rejected', __demand_id;
    RETURN 'REJECTED'::goal.goal_transition;
  ELSE 
    RAISE NOTICE 'demand % can be advised', __demand_id;
    RETURN 'ADVISED'::goal.goal_transition;
  END IF;

END;
$$;


ALTER FUNCTION goal.analyze_ability(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 88056)
-- Name: analyze_outcome(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION analyze_outcome(__goal_id bigint) RETURNS goal_transition
    LANGUAGE plpgsql
    AS $$
BEGIN

  PERFORM  
    body.good_code, 
    body.quantity, 
    body.uom_code
  FROM 
    despatch.body, 
    binding.goal_to_despatch
  WHERE 
    goal_to_despatch.despatch_id = body.head_id AND
    goal_to_despatch.goal_id = __goal_id
  EXCEPT
  SELECT 
    body.good_code, 
    body.quantity, 
    body.uom_code
  FROM 
    binding.goal_to_demand, 
    demand.body
  WHERE 
    goal_to_demand.demand_id = body.head_id AND
    goal_to_demand.goal_id = __goal_id;
  IF NOT FOUND THEN
    RAISE NOTICE 'goal % is satisfied', __goal_id;
    RETURN 'SATISFIED'::goal.goal_transition;
  ELSE
    RAISE NOTICE 'goal % is failed', __goal_id;
    RETURN 'FAILED'::goal.goal_transition;
  END IF;

END;
$$;


ALTER FUNCTION goal.analyze_outcome(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 602 (class 1255 OID 88057)
-- Name: apprise(bigint, common.document_type, common.document_transition); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION apprise(__source_id bigint, __source_type common.document_type, __source_state common.document_transition) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _msg text;
  _state text;
  _head common.document_head;
  _body common.document_body[];
  _goal_analysis_result goal.goal_transition;
  _goal_transition goal.goal_transition;
  _goal_id bigint;
  _demand_id bigint;
  _reserve_id bigint;
  _picklist_id bigint;
  _issue_id bigint;
  _despatch_id bigint;
BEGIN

/*
  demand.commit           decommit - goal.cancel if goal.state < committed
    reserve.commit        decommit
    picklist.init         destroy
  goal.accept

  picklist.commit         decommit
    issue.commit          decommit - goal.decommit if goal.state < committed
      despatch.init
  goal.commit

  despatch.commit         !despatch not decommitable
  goal.satisfy
*/

  CASE __source_type
    WHEN 'DEMAND'::common.document_type THEN
      _msg := 'demand';
      _demand_id := __source_id;
      _goal_id := binding.get_goal_binded_to_demand(_demand_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN
          _state := 'committed';
          _head := demand.get_head(_demand_id);
          _head := common.remake_head(__head := _head, __create_date := now()::date);
          _body := demand.get_body(_demand_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_head);
            PERFORM binding.bind_goal_and_demand(_goal_id, _demand_id);
          END IF;
          _goal_analysis_result := goal.analyze_ability(_demand_id);
          CASE _goal_analysis_result
            WHEN 'ACCEPTED' THEN
              _reserve_id := reserve.init(_head, _body);
              _picklist_id := picklist.init(_head, _body);
              PERFORM reserve.do_commit(_reserve_id, false);
              PERFORM binding.bind_goal_and_reserve(_goal_id, _reserve_id);
              PERFORM binding.bind_goal_and_picklist(_goal_id, _picklist_id);
              PERFORM binding.bind_demand_and_picklist(_demand_id, _picklist_id);
              PERFORM binding.bind_demand_and_reserve(_demand_id, _reserve_id);
            WHEN 'ADVISED' THEN
              _body := goal.give_advise(_demand_id);
              PERFORM demand.do_decommit(_demand_id, false);
              PERFORM demand.reinit(_demand_id, _body);
            WHEN 'REJECTED' THEN
              -- do nothing
            ELSE
              RAISE EXCEPTION 'unexpected goal % analysis result: %', _goal_id, _goal_analysis_result;
          END CASE;

          UPDATE goal.registry SET curr_transition = _goal_analysis_result where id = _goal_id;

        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'decommiting standalone demand %', _demand_id;
            RETURN;
          END IF;
          _goal_transition := goal.get_curr_transition(_goal_id);
          IF (_goal_transition < 'COMMITTED' ) THEN
            _reserve_id := binding.get_reserve_binded_to_goal(_goal_id); 
            _picklist_id := binding.get_picklist_binded_to_goal(_goal_id);
            PERFORM picklist.destroy(_picklist_id);
            PERFORM reserve.do_decommit(_reserve_id, false);
            PERFORM reserve.destroy(_reserve_id);
            UPDATE goal.registry SET curr_transition = 'CANCELED' where id = _goal_id; 
          ELSE
            RAISE EXCEPTION 'can not decommit demand %', _demand_id;
          END IF;
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'RESERVE'::common.document_type THEN
      _msg := 'reserve';
      _reserve_id := __source_id;
      _goal_id := binding.get_goal_binded_to_reserve(_reserve_id);

      CASE __source_state
        WHEN 'COMMITTED' THEN
          _state := 'committed';
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'commiting standalone reserve %', _reserve_id;
            RETURN;
          END IF;
        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'decommiting standalone reserve %', _reserve_id;
            RETURN;
          END IF;
          _goal_transition := goal.get_curr_transition(_goal_id);
          IF (_goal_transition < 'COMMITTED' ) THEN
            _demand_id := binding.get_demand_binded_to_goal(_goal_id);
            _picklist_id := binding.get_picklist_binded_to_goal(_goal_id);
            PERFORM demand.do_decommit(_demand_id, false);
            PERFORM picklist.destroy(_picklist_id);            
            PERFORM reserve.destroy(_reserve_id);
            UPDATE goal.registry SET curr_transition = 'CANCELED' where id = _goal_id; 
          ELSE
            RAISE EXCEPTION 'can not decommit reserve %', _reserve_id;
          END IF;
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'PICKLIST'::common.document_type THEN
      _msg := 'picklist';
      _picklist_id := __source_id;
      _goal_id := binding.get_goal_binded_to_picklist(_picklist_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN
          _state := 'committed';
          _head := picklist.get_head(_picklist_id);
          _head := common.remake_head(__head := _head, __create_date := now()::date);
          _body := picklist.get_body(_picklist_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_head);
            PERFORM binding.bind_goal_and_picklist(_goal_id, _picklist_id);
          END IF;
          _issue_id := issue.init(_head, _body);
          PERFORM binding.bind_picklist_and_issue(_picklist_id, _issue_id);
          PERFORM binding.bind_goal_and_issue(_goal_id, _issue_id);
          PERFORM issue.do_commit(_issue_id, false);
          _despatch_id := despatch.init(_head, _body);
          PERFORM binding.bind_issue_and_despatch(_issue_id, _despatch_id);
          PERFORM binding.bind_goal_and_despatch(_goal_id, _despatch_id);
          -- UPDATE goal.registry SET curr_transition = 'ACCEPTED' where id = _goal_id;
          UPDATE goal.registry SET curr_transition = 'COMMITTED' where id = _goal_id;

        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'decommiting standalone picklist %', _picklist_id;
            RETURN;
          END IF;
          _goal_transition := goal.get_curr_transition(_goal_id);
          IF (_goal_transition > 'COMMITTED' ) THEN
            RAISE EXCEPTION 'can not decommit picklist %', _picklist_id;
          ELSE
            _issue_id := binding.get_issue_binded_to_goal(_goal_id);
            _reserve_id := binding.get_reserve_binded_to_goal(_goal_id);
            _demand_id := binding.get_demand_binded_to_goal(_goal_id);
            PERFORM issue.do_decommit(_issue_id, false);
            PERFORM reserve.do_decommit(_reserve_id, false);
            PERFORM demand.do_decommit(_demand_id, false);
            PERFORM issue.destroy(_issue_id);
            PERFORM reserve.destroy(_reserve_id);
            PERFORM picklist.destroy(_picklist_id);
            UPDATE goal.registry SET curr_transition = 'CANCELED' where id = _goal_id;
          END IF;
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'ISSUE'::common.document_type THEN
      _msg := 'issue';
      _issue_id := __source_id;
      _goal_id := binding.get_goal_binded_to_issue(_issue_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN          
          _state := 'committed';
          _head := issue.get_head(_issue_id);
          _head := common.remake_head(__head := _head, __create_date := now()::date);
          _body := issue.get_body(_issue_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_head);
            PERFORM binding.bind_goal_and_issue(_goal_id, _issue_id);
            UPDATE goal.registry SET curr_transition = 'ACCEPTED' where id = _goal_id;
          END IF;
          _despatch_id := despatch.init(_head, _body);
          PERFORM binding.bind_issue_and_despatch(_issue_id, _despatch_id);
          PERFORM binding.bind_goal_and_despatch(_goal_id, _despatch_id);
          UPDATE goal.registry SET curr_transition = 'COMMITTED' where id = _goal_id;
        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          --RAISE EXCEPTION '% % : DECOMMITTED hook not implemented yet.', _msg, _issue_id;
          --TODO:
          /*
          если цель в финальном состоянии
            ошибка
          иначе
            удаление транспортной
            просто декомит, который позволит правки расходной 
          */
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'decommiting standalone issue %', _issue_id;
            RETURN;
          END IF;
          _goal_transition := goal.get_curr_transition(_goal_id);
          IF (_goal_transition > 'COMMITTED' ) THEN
            RAISE EXCEPTION 'can not decommit picklist %', _issue_id;
          END IF;
          _despatch_id := binding.get_despatch_binded_to_issue(_issue_id);
          PERFORM despatch.destroy(_despatch_id);
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'DESPATCH'::common.document_type THEN
      _msg := 'despatch';
      _despatch_id := __source_id;
      _goal_id := binding.get_goal_binded_to_despatch(_despatch_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN
          _state := 'committed';
          IF (_goal_id IS NULL) THEN
            RAISE NOTICE 'daspatch % has no binding to goal. nothing to do.', _despatch_id;
            RETURN;
          ELSE
            _goal_analysis_result := goal.analyze_outcome(_goal_id);
            UPDATE goal.registry SET curr_transition = _goal_analysis_result where id = _goal_id;
            RAISE NOTICE 'goal % is %', _goal_id, _goal_analysis_result;
          END IF;
        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          RAISE EXCEPTION '% % : DECOMMITTED hook not implemented yet.', _msg, _despatch_id;
        ELSE
          _state := 'unknown';
      END CASE;
    ELSE
      _msg := 'other';
      _state := 'n/a';
  END CASE;

  RAISE NOTICE 'case is: %, state is: %', _msg, _state;

END;
$$;


ALTER FUNCTION goal.apprise(__source_id bigint, __source_type common.document_type, __source_state common.document_transition) OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 88059)
-- Name: destroy(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM goal.registry WHERE id = __document_id;
END;
$$;


ALTER FUNCTION goal.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 88060)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := goal.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('GOAL');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION goal.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 605 (class 1255 OID 88061)
-- Name: get_curr_transition(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION get_curr_transition(__goal_id bigint) RETURNS goal_transition
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN curr_transition FROM goal.registry WHERE id = __goal_id;

END;
$$;


ALTER FUNCTION goal.get_curr_transition(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 606 (class 1255 OID 88062)
-- Name: get_head(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition::common.document_transition,
    'GOAL'::common.document_type,
    due_date)::common.document_head
  FROM 
    goal.registry
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION goal.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 607 (class 1255 OID 88063)
-- Name: give_advise(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION give_advise(__demand_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_item common.document_body;
  --_document_id bigint;
BEGIN

  RETURN
    ARRAY (
      SELECT 
        (balance.good_code,
        body.quantity,
        body.uom_code)::common.document_body
      FROM 
        balance.balance, 
        demand.body,
        demand.head
      WHERE 
        head.id = __demand_id AND
        head.id = body.head_id AND
        head.ship_from = balance.facility_code AND
        balance.good_code = body.good_code AND
        (COALESCE(balance.on_hand_qty, 0.0::common.quantity) - COALESCE(balance.reserved_qty, 0.0::common.quantity)) >= body.quantity
      UNION
      SELECT
        (balance.good_code,
        balance.on_hand_qty,
        body.uom_code)::common.document_body
      FROM 
        balance.balance, 
        demand.body,
        demand.head
      WHERE 
        head.id = __demand_id AND
        head.id = body.head_id AND
        head.ship_from = balance.facility_code AND
        balance.good_code = body.good_code AND
        (COALESCE(balance.on_hand_qty, 0.0::common.quantity) - COALESCE(balance.reserved_qty, 0.0::common.quantity)) < body.quantity AND
        (COALESCE(balance.on_hand_qty, 0.0::common.quantity) - COALESCE(balance.reserved_qty, 0.0::common.quantity)) <> 0
      );

  /*RETURN 
    ARRAY (
      SELECT 
        (balance.good_code,
        body.quantity,
        body.uom_code)::common.document_body
      FROM 
        balance.balance, 
        demand.body,
        demand.head
      WHERE 
        head.id = __demand_id AND
        head.id = body.head_id AND
        head.ship_from = balance.facility_code AND
        balance.good_code = body.good_code AND
        balance.available_qty >= body.quantity
      UNION
      SELECT
        (balance.good_code,
        balance.available_qty,
        body.uom_code)::common.document_body
      FROM 
        balance.balance, 
        demand.body,
        demand.head
      WHERE 
        head.id = __demand_id AND
        head.id = body.head_id AND
        head.ship_from = balance.facility_code AND
        balance.good_code = body.good_code AND
        balance.available_qty < body.quantity AND
        balance.available_qty <> 0
    );*/

END;
$$;


ALTER FUNCTION goal.give_advise(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 608 (class 1255 OID 88064)
-- Name: init(common.document_head); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := goal.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_from);
  END IF;

  INSERT INTO
    goal.registry (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION goal.init(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 609 (class 1255 OID 88065)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    goal.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      goal.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION goal.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 610 (class 1255 OID 88066)
-- Name: set_prev_goal_transition(); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION set_prev_goal_transition() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'UPDATE' AND NEW.curr_transition != OLD.curr_transition) THEN
    NEW.prev_transition := OLD.curr_transition;
    NEW.prev_transition_date := OLD.curr_transition_date;
    NEW.curr_transition_date := now();
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION goal.set_prev_goal_transition() OWNER TO postgres;

SET search_path = issue, pg_catalog;

--
-- TOC entry 611 (class 1255 OID 88067)
-- Name: destroy(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM issue.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION issue.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 612 (class 1255 OID 88068)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      issue.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      issue.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION issue.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 614 (class 1255 OID 88069)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := issue.get_head(__document_id);
  _body := issue.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'issue % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    issue.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.loss_on_hand_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  PERFORM stockcard.assign_issue(
      __document_head := _head,
      __document_body := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'ISSUE'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION issue.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 615 (class 1255 OID 88070)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _adjustment_id bigint;
BEGIN

  _head := issue.get_head(__document_id);
  _body := issue.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'issue % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    issue.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  SELECT 
    issue_to_adjustmentcredit.adjustmentcredit_id
  FROM 
    binding.issue_to_adjustmentcredit
  WHERE 
    issue_to_adjustmentcredit.issue_id = __document_id
  INTO
    _adjustment_id;
  IF FOUND THEN
    PERFORM adjustmentcredit.do_decommit(_adjustment_id);
    DELETE FROM 
      adjustmentcredit.head
    WHERE
      id = _adjustment_id;
  END IF;

  PERFORM balance.gain_on_hand_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  PERFORM stockcard.deassign_issue(
      __document_id := __document_id);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'ISSUE'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION issue.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 616 (class 1255 OID 88071)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := issue.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('ISSUE');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION issue.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 617 (class 1255 OID 88072)
-- Name: get_body(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          issue.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION issue.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 618 (class 1255 OID 88073)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      issue.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION issue.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 619 (class 1255 OID 88074)
-- Name: get_head(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'ISSUE'::common.document_type,
    due_date)::common.document_head
  FROM 
    issue.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION issue.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 88075)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'ISSUE'::common.document_type,
        due_date)::common.document_head
      FROM 
        issue.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION issue.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 88076)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'ISSUE'::common.document_type,
        due_date)::common.document_head
      FROM 
        issue.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION issue.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 622 (class 1255 OID 88077)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      issue.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION issue.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 88078)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := issue.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_from);
  END IF;

  INSERT INTO
    issue.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      issue.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION issue.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 613 (class 1255 OID 88079)
-- Name: make_adjustment(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION make_adjustment(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _child_id bigint;
BEGIN
  _head := issue.get_head(__document_id);
  _head := common.remake_head(__head := _head, __create_date := now()::date);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'can not adjust decommitted document %', _head.gid;
  END IF; 
  
  _body := issue.get_body(__document_id);
  _child_id := adjustmentcredit.init(_head, _body);
  PERFORM binding.bind_issue_and_adjustmentcredit(__document_id, _child_id);
END;
$$;


ALTER FUNCTION issue.make_adjustment(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 624 (class 1255 OID 88080)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    issue.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      issue.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION issue.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 625 (class 1255 OID 88081)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    issue.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      issue.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION issue.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = pgunit, pg_catalog;

--
-- TOC entry 626 (class 1255 OID 88082)
-- Name: assert_array_equals(anyelement, anyelement, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_array_equals(_expected anyelement, _actual anyelement, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF _expected IS NULL THEN
    RAISE EXCEPTION '#incorrect_expected_value NULL';
  END IF;
  IF NOT (_expected::varchar[] @> _actual::varchar[] AND _actual::varchar[] @> _expected::varchar[])
     OR _actual IS NULL
     OR (array_dims(_expected) <> array_dims(_actual))
  THEN
    RAISE EXCEPTION E'#assert_array_equals\n%\nExpected: %\nActual: %', _message, _expected, _actual;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_array_equals(_expected anyelement, _actual anyelement, _message character varying) OWNER TO postgres;

--
-- TOC entry 627 (class 1255 OID 88083)
-- Name: assert_equals(anyelement, anyelement, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_equals(_expected anyelement, _actual anyelement, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF _expected IS NULL THEN
    RAISE EXCEPTION '#incorrect_expected_value NULL';
  END IF;
  IF _expected IS DISTINCT FROM _actual THEN
    RAISE EXCEPTION E'#assert_equals\n%\nExpected: %\nActual: %', _message, _expected, _actual;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_equals(_expected anyelement, _actual anyelement, _message character varying) OWNER TO postgres;

--
-- TOC entry 628 (class 1255 OID 88084)
-- Name: assert_false(boolean, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_false(_value boolean, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF _value OR _value IS NULL THEN
    RAISE EXCEPTION E'#assert_false\n%\nValue: %', _message, _value;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_false(_value boolean, _message character varying) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 88085)
-- Name: assert_not_equals(anyelement, anyelement, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_not_equals(_expected anyelement, _actual anyelement, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF _expected IS NULL THEN
    RAISE EXCEPTION '#incorrect_expected_value NULL';
  END IF;
  IF _expected IS NOT DISTINCT FROM _actual THEN
    RAISE EXCEPTION E'#assert_not_equals\n%\nExpected: %\nActual: %', _message, _expected, _actual;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_not_equals(_expected anyelement, _actual anyelement, _message character varying) OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 88086)
-- Name: assert_not_null(anyelement, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_not_null(_value anyelement, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF _value IS NULL THEN
    RAISE EXCEPTION E'#assert_not_null\n%', _message;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_not_null(_value anyelement, _message character varying) OWNER TO postgres;

--
-- TOC entry 631 (class 1255 OID 88087)
-- Name: assert_null(anyelement, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_null(_value anyelement, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF _value IS NOT NULL THEN
    RAISE EXCEPTION E'#assert_null\n%\nValue: %', _message, _value;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_null(_value anyelement, _message character varying) OWNER TO postgres;

--
-- TOC entry 632 (class 1255 OID 88088)
-- Name: assert_true(boolean, character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION assert_true(_value boolean, _message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NOT _value OR _value IS NULL THEN
    RAISE EXCEPTION E'#assert_true\n%\nValue: %', _message, _value;
  END IF;
END;
$$;


ALTER FUNCTION pgunit.assert_true(_value boolean, _message character varying) OWNER TO postgres;

--
-- TOC entry 633 (class 1255 OID 88089)
-- Name: fail(character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION fail(_message character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION E'#fail\n%', _message;
END;
$$;


ALTER FUNCTION pgunit.fail(_message character varying) OWNER TO postgres;

--
-- TOC entry 634 (class 1255 OID 88090)
-- Name: run_test(character varying); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION run_test(_sp character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
  EXECUTE 'SELECT ' || _sp;
  RAISE EXCEPTION '#OK';
EXCEPTION
  WHEN others THEN
    RETURN SQLERRM;
END;
$$;


ALTER FUNCTION pgunit.run_test(_sp character varying) OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 88091)
-- Name: test_assert_array_equals(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_assert_array_equals() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  -- EMPTY ARRAYS

  PERFORM pgunit.assert_array_equals('{}'::varchar[], '{}'::varchar[], _message);

  BEGIN
    PERFORM pgunit.assert_array_equals('{}'::varchar[], array['1']::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 18';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_array_equals(array['1']::varchar[], '{}'::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 28';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_array_equals(array['1']::varchar[], NULL::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 38';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_array_equals('{}'::varchar[], NULL::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 48';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_array_equals(NULL::varchar[], array['1']::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 58';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#incorrect_expected_value %' THEN
        RAISE;
      END IF;
  END;

  -- UNARY ARRAY

  PERFORM pgunit.assert_array_equals(array['1']::varchar[], array['1']::varchar[], _message);

  BEGIN
    PERFORM pgunit.assert_array_equals(array['2']::varchar[], array['1']::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 72';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;

  -- ARRAYS

  PERFORM pgunit.assert_array_equals(array['1', '2']::varchar[], array['1', '2']::varchar[], _message);
  PERFORM pgunit.assert_array_equals(array['2', '1']::varchar[], array['1', '2']::varchar[], _message);
  PERFORM pgunit.assert_array_equals(array['1', '2', '3']::varchar[], array['1', '3', '2']::varchar[], _message);


  BEGIN
    PERFORM pgunit.assert_array_equals(array['1', '2', '3']::varchar[], array['1', '3', '2', '2']::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 77';
  EXCEPTION
  WHEN others THEN
    IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
      RAISE;
    END IF;
  END;


  BEGIN
    PERFORM pgunit.assert_array_equals(array['1', '2', '3']::varchar[], array['1', '2', '2']::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 89';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_array_equals(array['1', '2', '3']::varchar[], array['4', '5', '6']::varchar[], _message);
    RAISE EXCEPTION 'Epic fail. Line: 99';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_array_equals\n%' THEN
        RAISE;
      END IF;
  END;
END;
$$;


ALTER FUNCTION pgunit.test_assert_array_equals() OWNER TO postgres;

--
-- TOC entry 636 (class 1255 OID 88092)
-- Name: test_assert_equals(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_assert_equals() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE

  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  -- INT

  PERFORM pgunit.assert_equals(1::int, 1::int, _message);

  BEGIN
    PERFORM pgunit.assert_equals(1::int, 2::int, _message);
    RAISE EXCEPTION 'Epic fail. Line: 18';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_equals\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_equals(1::int, NULL::int, _message);
    RAISE EXCEPTION 'Epic fail. Line: 28';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_equals\n%' THEN
        RAISE;
      END IF;
  END;

  -- INT8

  PERFORM pgunit.assert_equals(1::int8, 1::int8, _message);

  BEGIN
    PERFORM pgunit.assert_equals(1::int8, 2::int8, _message);
    RAISE EXCEPTION 'Epic fail. Line: 42';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_equals\n%' THEN
        RAISE;
      END IF;
  END;

  -- NUMERIC

  PERFORM pgunit.assert_equals(1.1::numeric, 1.1::numeric, _message);

  BEGIN
    PERFORM pgunit.assert_equals(1.1::numeric, 1.2::numeric, _message);
    RAISE EXCEPTION 'Epic fail. Line: 56';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_equals\n%' THEN
        RAISE;
      END IF;
  END;

  -- VARCHAR

  PERFORM pgunit.assert_equals('1.1'::varchar, '1.1'::varchar, _message);

  BEGIN
    PERFORM pgunit.assert_equals('1.1'::varchar, '1.1 '::varchar, _message);
    RAISE EXCEPTION 'Epic fail. Line: 70';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_equals\n%' THEN
        RAISE;
      END IF;
  END;

  -- TEXT

  PERFORM pgunit.assert_equals('1.1'::text, '1.1'::text, _message);

  BEGIN
    PERFORM pgunit.assert_equals('1.1'::text, '1.1 '::text, _message);
    RAISE EXCEPTION 'Epic fail. Line: 84';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_equals\n%' THEN
        RAISE;
      END IF;
  END;
END;
$$;


ALTER FUNCTION pgunit.test_assert_equals() OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 88093)
-- Name: test_assert_false(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_assert_false() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE

  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  PERFORM pgunit.assert_false(False, _message);

  BEGIN
    PERFORM pgunit.assert_false(True, _message);
    RAISE EXCEPTION 'Epic fail. Line: 16';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_false\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_false(NULL::boolean, _message);
    RAISE EXCEPTION 'Epic fail. Line: 26';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_false\n%' THEN
        RAISE;
      END IF;
  END;

END;
$$;


ALTER FUNCTION pgunit.test_assert_false() OWNER TO postgres;

--
-- TOC entry 639 (class 1255 OID 88094)
-- Name: test_assert_not_null(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_assert_not_null() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE

  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  -- INT4

  PERFORM pgunit.assert_not_null(1::int4, _message);

  BEGIN
    PERFORM pgunit.assert_not_null(NULL::int4, _message);
    RAISE EXCEPTION 'Epic fail. Line: 18';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_not_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- INT8

  PERFORM pgunit.assert_not_null(1::int8, _message);

  BEGIN
    PERFORM pgunit.assert_not_null(NULL::int8, _message);
    RAISE EXCEPTION 'Epic fail. Line: 32';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_not_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- NUMERIC

  PERFORM pgunit.assert_not_null(1.1::numeric, _message);

  BEGIN
    PERFORM pgunit.assert_not_null(NULL::numeric, _message);
    RAISE EXCEPTION 'Epic fail. Line: 46';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_not_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- VARCHAR

  PERFORM pgunit.assert_not_null('1.1'::varchar, _message);

  BEGIN
    PERFORM pgunit.assert_not_null(NULL::varchar, _message);
    RAISE EXCEPTION 'Epic fail. Line: 60';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_not_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- TEXT

  PERFORM pgunit.assert_not_null('1.1'::text, _message);

  BEGIN
    PERFORM pgunit.assert_not_null(NULL::text, _message);
    RAISE EXCEPTION 'Epic fail. Line: 74';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_not_null\n%' THEN
        RAISE;
      END IF;
  END;
END;
$$;


ALTER FUNCTION pgunit.test_assert_not_null() OWNER TO postgres;

--
-- TOC entry 640 (class 1255 OID 88095)
-- Name: test_assert_null(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_assert_null() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE

  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  -- INT4

  PERFORM pgunit.assert_null(NULL::int4, _message);

  BEGIN
    PERFORM pgunit.assert_null(1::int4, _message);
    RAISE EXCEPTION 'Epic fail. Line: 18';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- INT8

  PERFORM pgunit.assert_null(NULL::int8, _message);


  BEGIN
    PERFORM pgunit.assert_null(1::int8, _message);
    RAISE EXCEPTION 'Epic fail. Line: 33';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- NUMERIC

  PERFORM pgunit.assert_null(NULL::numeric, _message);

  BEGIN
    PERFORM pgunit.assert_null(1.1::numeric, _message);
    RAISE EXCEPTION 'Epic fail. Line: 47';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- VARCHAR

  PERFORM pgunit.assert_null(NULL::varchar, _message);

  BEGIN
    PERFORM pgunit.assert_null('1.1'::varchar, _message);
    RAISE EXCEPTION 'Epic fail. Line: 61';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_null\n%' THEN
        RAISE;
      END IF;
  END;

  -- TEXT

  PERFORM pgunit.assert_null(NULL::text, _message);

  BEGIN
    PERFORM pgunit.assert_null('1.1'::text, _message);
    RAISE EXCEPTION 'Epic fail. Line: 75';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_null\n%' THEN
        RAISE;
      END IF;
  END;
END;
$$;


ALTER FUNCTION pgunit.test_assert_null() OWNER TO postgres;

--
-- TOC entry 641 (class 1255 OID 88096)
-- Name: test_assert_true(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_assert_true() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  PERFORM pgunit.assert_true(True, _message);

  BEGIN
    PERFORM pgunit.assert_true(False, _message);
    RAISE EXCEPTION 'Epic fail. Line: 16';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_true\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_true(NULL::boolean, _message);
    RAISE EXCEPTION 'Epic fail. Line: 26';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_true\n%' THEN
        RAISE;
      END IF;
  END;
END;
$$;


ALTER FUNCTION pgunit.test_assert_true() OWNER TO postgres;

--
-- TOC entry 642 (class 1255 OID 88097)
-- Name: test_fail(); Type: FUNCTION; Schema: pgunit; Owner: postgres
--

CREATE FUNCTION test_fail() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _message  text;
BEGIN
  _message := 'qazwxedc';
  BEGIN
    PERFORM pgunit.fail(_message);
    RAISE EXCEPTION 'Epic fail. Line: 14';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#fail\n%' THEN
        RAISE;
      END IF;
  END;
END;
$$;


ALTER FUNCTION pgunit.test_fail() OWNER TO postgres;

SET search_path = picklist, pg_catalog;

--
-- TOC entry 643 (class 1255 OID 88098)
-- Name: destroy(bigint); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM picklist.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION picklist.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 644 (class 1255 OID 88099)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      picklist.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      picklist.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION picklist.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 645 (class 1255 OID 88100)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := picklist.get_head(__document_id);
  _body := picklist.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'picklist % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    picklist.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.gain_en_route_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'PICKLIST'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION picklist.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 647 (class 1255 OID 88101)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := picklist.get_head(__document_id);
  _body := picklist.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'picklist % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    picklist.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.loss_en_route_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'PICKLIST'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION picklist.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 648 (class 1255 OID 88102)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := picklist.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('PICKLIST');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION picklist.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 649 (class 1255 OID 88103)
-- Name: get_body(bigint); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          picklist.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION picklist.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 650 (class 1255 OID 88104)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      picklist.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION picklist.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 651 (class 1255 OID 88105)
-- Name: get_head(bigint); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'PICKLIST'::common.document_type,
    due_date)::common.document_head
  FROM 
    picklist.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION picklist.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 652 (class 1255 OID 88106)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'PICKLIST'::common.document_type,
        due_date)::common.document_head
      FROM 
        picklist.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION picklist.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 88107)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'PICKLIST'::common.document_type,
        due_date)::common.document_head
      FROM 
        picklist.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION picklist.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 88108)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      picklist.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION picklist.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 655 (class 1255 OID 88109)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := picklist.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_from);
  END IF;

  INSERT INTO
    picklist.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      picklist.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION picklist.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 656 (class 1255 OID 88110)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    picklist.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      picklist.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION picklist.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 657 (class 1255 OID 88111)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    picklist.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      picklist.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION picklist.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = rebound, pg_catalog;

--
-- TOC entry 658 (class 1255 OID 88112)
-- Name: destroy(bigint); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM rebound.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION rebound.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 88113)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      rebound.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      rebound.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION rebound.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 88114)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := rebound.get_head(__document_id);
  _body := rebound.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'rebound % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    rebound.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_order_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'rebound'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION rebound.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 88115)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := rebound.get_head(__document_id);
  _body := rebound.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'rebound % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    rebound.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.loss_on_order_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'rebound'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION rebound.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 661 (class 1255 OID 88116)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := rebound.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('REBOUND');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION rebound.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 88117)
-- Name: get_body(bigint); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          rebound.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION rebound.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 663 (class 1255 OID 88118)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      rebound.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION rebound.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 88119)
-- Name: get_head(bigint); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'REBOUND'::common.document_type,
    due_date)::common.document_head
  FROM 
    rebound.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION rebound.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 88120)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'REBOUND'::common.document_type,
        due_date)::common.document_head
      FROM 
        rebound.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION rebound.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 88121)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'REBOUND'::common.document_type,
        due_date)::common.document_head
      FROM 
        rebound.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION rebound.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 88122)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      rebound.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION rebound.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 88123)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_to IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_TO is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := rebound.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_to);
  END IF;

  INSERT INTO
    rebound.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      rebound.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION rebound.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 646 (class 1255 OID 88124)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    rebound.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      rebound.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION rebound.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 88125)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    rebound.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      rebound.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION rebound.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = receipt, pg_catalog;

--
-- TOC entry 550 (class 1255 OID 88126)
-- Name: destroy(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM receipt.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION receipt.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 670 (class 1255 OID 88127)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      receipt.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      receipt.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION receipt.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 671 (class 1255 OID 88128)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _parent_head common.document_head;
  _body common.document_body[];
  _parent_body common.document_body[];
  _parent_id bigint;
BEGIN

  _head := receipt.get_head(__document_id);
  _body := receipt.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'receipt % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  SELECT 
    delivery_to_receipt.delivery_id
  FROM 
    binding.delivery_to_receipt
  WHERE 
    delivery_to_receipt.receipt_id = __document_id
  INTO
    _parent_id;
  IF FOUND THEN
    _parent_head := delivery.get_head(_parent_id);
    IF (_parent_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
      _parent_body := delivery.get_body(_parent_id);
      PERFORM balance.loss_on_order_qty(
          __facility_code := _parent_head.ship_from,
          __inventory := _parent_body);
    END IF;
  END IF;

  UPDATE
    receipt.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_hand_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  PERFORM stockcard.assign_receipt(
      __document_head := _head,
      __document_body := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'receipt'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION receipt.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 88129)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _parent_head common.document_head;
  _body common.document_body[];
  _parent_body common.document_body[];
  _parent_id bigint;
  _adjustment_id bigint;
BEGIN

  _head := receipt.get_head(__document_id);
  _body := receipt.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'receipt % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  SELECT 
    delivery_to_receipt.delivery_id
  FROM 
    binding.delivery_to_receipt
  WHERE 
    delivery_to_receipt.receipt_id = __document_id
  INTO
    _parent_id;
  IF FOUND THEN
    _parent_head := delivery.get_head(_parent_id);
    IF (_parent_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
      _parent_body := delivery.get_body(_parent_id);
      PERFORM balance.gain_on_order_qty(
          __facility_code := _parent_head.ship_from,
          __inventory := _parent_body);
    END IF;
  END IF;

  UPDATE
    receipt.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  SELECT 
    receipt_to_adjustmentdebit.adjustmentdebit_id
  FROM 
    binding.receipt_to_adjustmentdebit
  WHERE 
    receipt_to_adjustmentdebit.receipt_id = __document_id
  INTO
    _adjustment_id;
  IF FOUND THEN
    PERFORM adjustmentdebit.do_decommit(_adjustment_id);
    DELETE FROM 
      adjustmentdebit.head
    WHERE
      id = _adjustment_id;
  END IF;

  PERFORM balance.loss_on_hand_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  PERFORM stockcard.deassign_receipt(
      __document_id := __document_id);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'receipt'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION receipt.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 88130)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := receipt.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('RECEIPT');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION receipt.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 88131)
-- Name: get_body(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          receipt.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION receipt.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 88132)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      receipt.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION receipt.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 676 (class 1255 OID 88133)
-- Name: get_head(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'RECEIPT'::common.document_type,
    due_date)::common.document_head
  FROM 
    receipt.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION receipt.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 88134)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'RECEIPT'::common.document_type,
        due_date)::common.document_head
      FROM 
        receipt.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION receipt.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 88135)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'RECEIPT'::common.document_type,
        due_date)::common.document_head
      FROM 
        receipt.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION receipt.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 88136)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      receipt.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION receipt.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 681 (class 1255 OID 88137)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_to IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_TO is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := receipt.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_to);
  END IF;

  INSERT INTO
    receipt.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      receipt.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION receipt.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 682 (class 1255 OID 88138)
-- Name: make_adjustment(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION make_adjustment(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _child_id bigint;
BEGIN
  _head := receipt.get_head(__document_id);
  _head := common.remake_head(__head := _head, __create_date := now()::date);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE EXCEPTION 'can not adjust decommitted document %', _head.gid;
  END IF; 

  _body := receipt.get_body(__document_id);
  _child_id := adjustmentdebit.init(_head, _body);
  PERFORM binding.bind_receipt_and_adjustmentdebit(__document_id, _child_id);
END;
$$;


ALTER FUNCTION receipt.make_adjustment(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 683 (class 1255 OID 88139)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    receipt.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      receipt.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION receipt.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 684 (class 1255 OID 88140)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    receipt.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      receipt.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION receipt.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = reserve, pg_catalog;

--
-- TOC entry 685 (class 1255 OID 88141)
-- Name: destroy(bigint); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM reserve.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION reserve.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 686 (class 1255 OID 88142)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      reserve.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      reserve.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION reserve.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 687 (class 1255 OID 88143)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION do_commit(__reserve_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := reserve.get_head(__reserve_id);
  _body := reserve.get_body(__reserve_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'reserve % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    reserve.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __reserve_id;

  PERFORM balance.gain_reserved_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__reserve_id,
        __source_type := 'RESERVE'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION reserve.do_commit(__reserve_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 88144)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := reserve.get_head(__document_id);
  _body := reserve.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'reserve % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    reserve.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.loss_reserved_qty(
      __facility_code := _head.ship_from,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'RESERVE'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;

END;
$$;


ALTER FUNCTION reserve.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 689 (class 1255 OID 88145)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := reserve.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('RESERVE');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION reserve.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 88146)
-- Name: get_body(bigint); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          reserve.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION reserve.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 88147)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      reserve.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION reserve.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 690 (class 1255 OID 88148)
-- Name: get_head(bigint); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'RESERVE'::common.document_type,
    due_date)::common.document_head
  FROM 
    reserve.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION reserve.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 691 (class 1255 OID 88149)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'RESERVE'::common.document_type,
        due_date)::common.document_head
      FROM 
        reserve.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION reserve.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 88150)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'RESERVE'::common.document_type,
        due_date)::common.document_head
      FROM 
        reserve.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION reserve.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 693 (class 1255 OID 88151)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      reserve.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION reserve.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 694 (class 1255 OID 88152)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := reserve.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_from);
  END IF;

  INSERT INTO
    reserve.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      reserve.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION reserve.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 695 (class 1255 OID 88153)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    reserve.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      reserve.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION reserve.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 88154)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    reserve.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      reserve.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION reserve.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = schedule, pg_catalog;

--
-- TOC entry 697 (class 1255 OID 88155)
-- Name: get_date_of_julianized_day(integer); Type: FUNCTION; Schema: schedule; Owner: postgres
--

CREATE FUNCTION get_date_of_julianized_day(__jylianized_day integer) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  _julianized_day_date date;
BEGIN

  SELECT 
    calendar.calendar_date
  FROM 
    schedule.calendar
  WHERE 
    calendar.julianized_day = __jylianized_day
  ORDER BY
    calendar.calendar_date ASC
  LIMIT 1
  INTO
    _julianized_day_date;

  IF (NOT FOUND) THEN
    RAISE EXCEPTION 'No schedule found for day number: %', __jylianized_day;
  END IF;

  RETURN _julianized_day_date;

END;
$$;


ALTER FUNCTION schedule.get_date_of_julianized_day(__jylianized_day integer) OWNER TO postgres;

--
-- TOC entry 698 (class 1255 OID 88156)
-- Name: get_julianized_day(date); Type: FUNCTION; Schema: schedule; Owner: postgres
--

CREATE FUNCTION get_julianized_day(__date date) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _julianized_day integer;
BEGIN

  SELECT
    calendar.julianized_day
  FROM 
    schedule.calendar
  WHERE 
    calendar.calendar_date = __date
  INTO
    _julianized_day;

  IF (NOT FOUND) THEN
    RAISE EXCEPTION 'No schedule found for date: %', __date;
  END IF;

  RETURN _julianized_day;

END;
$$;


ALTER FUNCTION schedule.get_julianized_day(__date date) OWNER TO postgres;

--
-- TOC entry 699 (class 1255 OID 88157)
-- Name: get_julianized_week(date); Type: FUNCTION; Schema: schedule; Owner: postgres
--

CREATE FUNCTION get_julianized_week(__date date) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _julianized_week integer;
BEGIN

  SELECT
    calendar.julianized_week
  FROM 
    schedule.calendar
  WHERE 
    calendar.calendar_date = __date
  INTO
    _julianized_week;

  IF (NOT FOUND) THEN
    RAISE EXCEPTION 'No schedule found for date: %', __date;
  END IF;

  RETURN _julianized_week;

END;
$$;


ALTER FUNCTION schedule.get_julianized_week(__date date) OWNER TO postgres;

SET search_path = stockcard, pg_catalog;

--
-- TOC entry 700 (class 1255 OID 88158)
-- Name: assign_adjustmentcredit(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentcredit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := adjustmentcredit.get_head(__document_id);
  _body := adjustmentcredit.get_body(__document_id);

  PERFORM stockcard.assign_adjustmentcredit(_head, _body);

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.assign_adjustmentcredit(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 88159)
-- Name: assign_adjustmentcredit(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentcredit(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _parent_doc_id bigint;
  _parent_doc_head common.document_head;
BEGIN

  SELECT 
    issue_to_adjustmentcredit.issue_id
  FROM 
    binding.issue_to_adjustmentcredit
  WHERE 
    issue_to_adjustmentcredit.adjustmentcredit_id = __document_head.document_id
  INTO 
    _parent_doc_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'not binded adjustment, %', __document_head.document_id;
  ELSE
    _parent_doc_head := issue.get_head(_parent_doc_id);
  END IF;

  FOREACH _item IN
    ARRAY __document_body
  LOOP

    INSERT INTO
      stockcard.registry (
        document_gid, 
        document_type, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        issued_uom, 
        issued_qty,
        adjusted_uom,
        adjusted_qty)
    VALUES (
      _parent_doc_head.gid,
      'ISSUE'::common.document_type,
      _parent_doc_head.display_name,
      _parent_doc_head.create_date,
      _parent_doc_head.ship_from,
      _parent_doc_head.ship_to,
      _item.good_code,
      _item.uom_code,
      0.0,
      _item.uom_code,
      _item.quantity
      )
    ON CONFLICT (document_gid, good_code) DO
    UPDATE
      --stockcard.registry
    SET
      adjusted_uom = _item.uom_code, 
      adjusted_qty = _item.quantity
    /*WHERE 
      document_gid = _parent_doc_head.gid AND 
      good_code = _item.good_code*/;

  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_adjustmentcredit(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 704 (class 1255 OID 88160)
-- Name: assign_adjustmentdebit(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentdebit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := adjustmentdebit.get_head(__document_id);
  _body := adjustmentdebit.get_body(__document_id);

  PERFORM stockcard.assign_adjustmentdebit(_head, _body);

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.assign_adjustmentdebit(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 705 (class 1255 OID 88161)
-- Name: assign_adjustmentdebit(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentdebit(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _parent_doc_id bigint;
  _parent_doc_head common.document_head;
BEGIN

  SELECT 
    receipt_to_adjustmentdebit.receipt_id
  FROM 
    binding.receipt_to_adjustmentdebit
  WHERE 
    receipt_to_adjustmentdebit.adjustmentdebit_id = __document_head.document_id
  INTO 
    _parent_doc_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'not binded adjustment, %', __document_head.document_id;
  ELSE
    _parent_doc_head := receipt.get_head(_parent_doc_id);
  END IF;

  FOREACH _item IN
    ARRAY __document_body
  LOOP

    INSERT INTO
      stockcard.registry (
        document_gid, 
        document_type, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        receipt_uom, 
        receipt_qty,
        adjusted_uom,
        adjusted_qty)
    VALUES (
      _parent_doc_head.gid,
      'RECEIPT'::common.document_type,
      _parent_doc_head.display_name,
      _parent_doc_head.create_date,
      _parent_doc_head.ship_from,
      _parent_doc_head.ship_to,
      _item.good_code,
      _item.uom_code,
      0.0,
      _item.uom_code,
      _item.quantity
      )
    ON CONFLICT (document_gid, good_code) DO
    UPDATE
      --stockcard.registry
    SET
      adjusted_uom = _item.uom_code, 
      adjusted_qty = _item.quantity
    /*WHERE 
      document_gid = _parent_doc_head.gid AND 
      good_code = _item.good_code*/;

  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_adjustmentdebit(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 706 (class 1255 OID 88162)
-- Name: assign_issue(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_issue(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := issue.get_head(__document_id);
  _body := issue.get_body(__document_id);

  PERFORM stockcard.assign_issue(_head, _body)

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.assign_issue(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 707 (class 1255 OID 88163)
-- Name: assign_issue(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_issue(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.registry (
        document_gid, 
        document_type, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        issued_uom, 
        issued_qty)
    VALUES (
      __document_head.gid,
      'ISSUE'::common.document_type,
      __document_head.display_name,
      __document_head.create_date,
      __document_head.ship_from,
      __document_head.ship_to,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_issue(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 708 (class 1255 OID 88164)
-- Name: assign_rebound(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_rebound(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := rebound.get_head(__document_id);
  _body := rebound.get_body(__document_id);

  PERFORM stockcard.assign_rebound(_head, _body);

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.assign_rebound(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 709 (class 1255 OID 88165)
-- Name: assign_rebound(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_rebound(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.registry (
        document_gid, 
        document_type, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        rebounded_uom, 
        rebounded_qty)
    VALUES (
      __document_head.gid,
      'REBOUND'::common.document_type,
      __document_head.display_name,
      __document_head.create_date,
      __document_head.ship_from,
      __document_head.ship_to,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_rebound(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 710 (class 1255 OID 88166)
-- Name: assign_receipt(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_receipt(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := receipt.get_head(__document_id);
  _body := receipt.get_body(__document_id);

  PERFORM stockcard.assign_receipt(_head, _body);

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.assign_receipt(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 711 (class 1255 OID 88167)
-- Name: assign_receipt(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_receipt(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.registry (
        document_gid, 
        document_type, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        receipt_uom, 
        receipt_qty)
    VALUES (
      __document_head.gid,
      'RECEIPT'::common.document_type,
      __document_head.display_name,
      __document_head.create_date,
      __document_head.ship_from,
      __document_head.ship_to,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_receipt(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 701 (class 1255 OID 88168)
-- Name: assign_stocktake(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_stocktake(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
BEGIN

  _head := stocktake.get_head(__document_id);
  _body := stocktake.get_body(__document_id);

  PERFORM stockcard.assign_stocktake(_head, _body);

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.assign_stocktake(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 88169)
-- Name: assign_stocktake(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_stocktake(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.registry (
        document_gid, 
        document_type, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        stocktake_uom, 
        stocktake_qty)
    VALUES (
      __document_head.gid,
      'STOCKTAKE'::common.document_type,
      __document_head.display_name,
      __document_head.create_date,
      __document_head.ship_from,
      __document_head.ship_to,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_stocktake(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 713 (class 1255 OID 88170)
-- Name: deassign_adjustmentcredit(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION deassign_adjustmentcredit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _parent_doc_gid uuid;
  _parent_doc_id bigint;
BEGIN

  SELECT 
    issue_to_adjustmentcredit.issue_id
  FROM 
    binding.issue_to_adjustmentcredit
  WHERE 
    issue_to_adjustmentcredit.adjustmentcredit_id = __document_id
  INTO 
    _parent_doc_id;

  _parent_doc_gid := issue.get_gid_by_id(_parent_doc_id);

  UPDATE 
    stockcard.registry
  SET 
    adjusted_qty = 0.0,
    adjusted_uom = NULL
  WHERE
    document_gid = _parent_doc_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_adjustmentcredit(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 714 (class 1255 OID 88171)
-- Name: deassign_adjustmentdebit(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION deassign_adjustmentdebit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _parent_doc_gid uuid;
  _parent_doc_id bigint;
BEGIN

  SELECT 
    receipt_to_adjustmentdebit.receipt_id
  FROM 
    binding.receipt_to_adjustmentdebit
  WHERE 
    receipt_to_adjustmentdebit.adjustmentdebit_id = __document_id
  INTO 
    _parent_doc_id;

  _parent_doc_gid := receipt.get_gid_by_id(_parent_doc_id);

  UPDATE 
    stockcard.registry
  SET 
    adjusted_qty = 0.0,
    adjusted_uom = NULL
  WHERE
    document_gid = _parent_doc_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_adjustmentdebit(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 715 (class 1255 OID 88172)
-- Name: deassign_issue(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION deassign_issue(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_gid uuid;
BEGIN

  _document_gid := issue.get_gid_by_id(__document_id);

  DELETE FROM
    stockcard.registry
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_issue(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 716 (class 1255 OID 88173)
-- Name: deassign_rebound(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION deassign_rebound(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_gid uuid;
BEGIN

  _document_gid := rebound.get_gid_by_id(__document_id);

  DELETE FROM
    stockcard.registry
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_rebound(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 717 (class 1255 OID 88174)
-- Name: deassign_receipt(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION deassign_receipt(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_gid uuid;
BEGIN

  _document_gid := receipt.get_gid_by_id(__document_id);

  DELETE FROM
    stockcard.registry
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_receipt(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 718 (class 1255 OID 88175)
-- Name: deassign_stocktake(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION deassign_stocktake(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_gid uuid;
BEGIN

  _document_gid := stocktake.get_gid_by_id(__document_id);

  DELETE FROM
    stockcard.registry
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_stocktake(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 723 (class 1255 OID 88176)
-- Name: get_stocktake_recent_date(character varying, character varying[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION get_stocktake_recent_date(__facility_code character varying, __good_codes character varying[]) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  _recent_stocktake_date date;
BEGIN

  SELECT 
    max(registry.document_date) as recent_stocktake_date
  FROM 
    stockcard.registry
  WHERE 
    registry.document_type = 'STOCKTAKE' AND 
    registry.good_code = ANY(__good_codes) AND
    registry.facility_code = __facility_code
  INTO _recent_stocktake_date;
  IF NOT FOUND THEN
    _recent_stocktake_date := schedule.get_date_of_julianized_day(1);
  END IF;

  RETURN _recent_stocktake_date;

END;
$$;


ALTER FUNCTION stockcard.get_stocktake_recent_date(__facility_code character varying, __good_codes character varying[]) OWNER TO postgres;

--
-- TOC entry 1010 (class 1255 OID 88177)
-- Name: get_stocktake_recent_date(character varying, character varying); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION get_stocktake_recent_date(__facility_code character varying, __good_code character varying) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  _recent_stocktake_date date;
BEGIN

  SELECT 
    max(registry.document_date) as recent_stocktake_date
  FROM 
    stockcard.registry
  WHERE 
    registry.document_type = 'STOCKTAKE' AND 
    registry.good_code = __good_code AND
    registry.facility_code = __facility_code
  INTO _recent_stocktake_date;
  IF NOT FOUND THEN
    _recent_stocktake_date := schedule.get_date_of_julianized_day(1);
  END IF;

  RETURN _recent_stocktake_date;

END;
$$;


ALTER FUNCTION stockcard.get_stocktake_recent_date(__facility_code character varying, __good_code character varying) OWNER TO postgres;

SET search_path = stocktake, pg_catalog;

--
-- TOC entry 719 (class 1255 OID 88178)
-- Name: check_commit(common.document_head); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION check_commit(__head common.document_head) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

  PERFORM 
    head.gid, 
    head.display_name
  FROM 
    receipt.head
  WHERE 
    head.ship_to = __head.ship_from AND 
    head.curr_transition = 'PROPOSED' AND 
    head.create_date <= __head.create_date
  UNION
  SELECT 
    head.gid, 
    head.display_name
  FROM 
    issue.head
  WHERE 
    head.ship_from = __head.ship_from AND 
    head.curr_transition = 'PROPOSED' AND 
    head.create_date <= __head.create_date;

  IF FOUND THEN
    RETURN false;
  ELSE
    RETURN true;
  END IF;

END;
$$;


ALTER FUNCTION stocktake.check_commit(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 720 (class 1255 OID 88179)
-- Name: destroy(bigint); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM stocktake.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION stocktake.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 721 (class 1255 OID 88180)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_transition common.document_transition;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_transition
    FROM 
      stocktake.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_transition; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_transition
    FROM 
      stocktake.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_transition;

    IF (_document_transition = 'COMMITTED'::common.document_transition) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_transition; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION stocktake.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 724 (class 1255 OID 88181)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _stocktake_item common.document_body;
  _balance_item common.document_body;
  _diff_qty common.quantity_signed;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
BEGIN

  _head := stocktake.get_head(__document_id);
  _body := stocktake.get_body(__document_id);

  IF (_head.curr_transition = 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'stocktake % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  IF (NOT stocktake.check_commit(_head)) THEN
    RAISE NOTICE 'OK';
    --EXIT;
  ELSE 
    RAISE NOTICE 'NOT OK';
    --EXIT;
  END IF;

  FOREACH _stocktake_item IN
    ARRAY _body
  LOOP
    _balance_item := balance.get_on_hand_qty(_head.ship_from, _stocktake_item.good_code);
    IF (_balance_item IS NULL) THEN
      _diff_qty := _stocktake_item.quantity;
    ELSE
      _diff_qty := _stocktake_item.quantity - _balance_item.quantity;
    END IF;

    IF (_diff_qty < 0) THEN
      _array_to_loss := array_append(_array_to_loss, (_stocktake_item.good_code, abs(_diff_qty), _stocktake_item.uom_code)::common.document_body);
      --PERFORM balance.loss_on_hand_qty();
    ELSIF (_diff_qty > 0) THEN
      _array_to_gain := array_append(_array_to_gain, (_stocktake_item.good_code, _diff_qty, _stocktake_item.uom_code)::common.document_body);
      --PERFORM balance.gain_on_hand_qty();
    ELSE
      --do nothing
    END IF;

    UPDATE
      stocktake.body
    SET
      diff_qty = _diff_qty
    WHERE
      head_id = __document_id AND
      good_code = _stocktake_item.good_code;

    RAISE NOTICE 'blnc % %', _stocktake_item.good_code, _diff_qty;
  END LOOP;

  UPDATE
    stocktake.head
  SET
    curr_transition = 'COMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_hand_qty(
    __facility_code := _head.ship_from,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _head.ship_from,
    __inventory := _array_to_loss);
  PERFORM stockcard.assign_stocktake(
    __document_head := _head,
    __document_body := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'stocktake'::common.document_type,
        __source_state := 'COMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION stocktake.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 725 (class 1255 OID 88182)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _body common.document_body[];
  _stocktake_item record;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
BEGIN

  _head := stocktake.get_head(__document_id);
  _body := stocktake.get_body(__document_id);

  IF (_head.curr_transition <> 'COMMITTED'::common.document_transition) THEN
    RAISE NOTICE 'stocktake % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  FOR _stocktake_item IN
  SELECT 
    body.good_code, 
    body.uom_code, 
    body.diff_qty
  FROM 
    stocktake.body
  WHERE 
    body.head_id = 95
  LOOP
    IF (_stocktake_item.diff_qty > 0) THEN
      _array_to_loss := array_append(_array_to_loss, (_stocktake_item.good_code, _stocktake_item.diff_qty, _stocktake_item.uom_code)::common.document_body);
      --PERFORM balance.loss_on_hand_qty();
    ELSIF (_stocktake_item.diff_qty < 0) THEN
      _array_to_gain := array_append(_array_to_gain, (_stocktake_item.good_code, abs(_stocktake_item.diff_qty), _stocktake_item.uom_code)::common.document_body);
      --PERFORM balance.gain_on_hand_qty();
    ELSE
      --do nothing
    END IF;
  END LOOP;

  UPDATE
    stocktake.head
  SET
    curr_transition = 'DECOMMITTED'::common.document_transition
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_hand_qty(
    __facility_code := _head.ship_from,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _head.ship_from,
    __inventory := _array_to_loss);
  PERFORM stockcard.deassign_stocktake(
    __document_id := _head.document_id);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'stocktake'::common.document_type,
        __source_state := 'DECOMMITTED'::common.document_transition);
  END IF;*/

END;
$$;


ALTER FUNCTION stocktake.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 726 (class 1255 OID 88183)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION generate_display_name(__create_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_type_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__create_date);
  _sequence_number := stocktake.numerator_nextval(__facility_code, _week_number);
  _document_type_code := common.get_document_abbrevation('STOCKTAKE');

  RETURN concat(_document_type_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION stocktake.generate_display_name(__create_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 727 (class 1255 OID 88184)
-- Name: get_body(bigint); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION get_body(__document_id bigint) RETURNS common.document_body[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY(
      SELECT 
          (good_code, 
          quantity, 
          uom_code)::common.document_body
        FROM 
          stocktake.body
        WHERE 
          head_id = __document_id
    );
END
$$;


ALTER FUNCTION stocktake.get_body(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 728 (class 1255 OID 88185)
-- Name: get_gid_by_id(bigint); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION get_gid_by_id(__document_id bigint) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN gid
    FROM 
      stocktake.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION stocktake.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 729 (class 1255 OID 88186)
-- Name: get_head(bigint); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.document_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    create_date,
    ship_to,
    ship_from,
    curr_transition,
    'STOCKTAKE'::common.document_type,
    due_date)::common.document_head
  FROM 
    stocktake.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION stocktake.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 730 (class 1255 OID 88187)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'STOCKTAKE'::common.document_type,
        due_date)::common.document_head
      FROM 
        stocktake.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION stocktake.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 731 (class 1255 OID 88188)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.document_head[]
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN
    ARRAY (
      SELECT 
        (id, 
        gid, 
        display_name,
        create_date,
        ship_to,
        ship_from,
        curr_transition,
        'STOCKTAKE'::common.document_type,
        due_date)::common.document_head
      FROM 
        stocktake.head
      WHERE 
        ship_from = __facility_code AND
        curr_transition = 'PROPOSED' AND
        create_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION stocktake.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 732 (class 1255 OID 88189)
-- Name: get_id_by_gid(uuid); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION get_id_by_gid(__document_gid uuid) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  --_id bigint;
BEGIN
  RETURN id
    FROM 
      stocktake.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION stocktake.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 733 (class 1255 OID 88190)
-- Name: init(common.document_head); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _document_id bigint;
BEGIN

  _body := balance.get_on_hand_qty(__facility_code := __head.ship_from);

  _document_id := stocktake.init(
      __head := __head,
      __body := _body);

  RETURN _document_id;

END;
$$;


ALTER FUNCTION stocktake.init(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 734 (class 1255 OID 88191)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.ship_from IS NULL) THEN
    RAISE EXCEPTION 'field SHIP_FROM is not defined';
  END IF;

  IF (__head.create_date IS NULL) THEN
    __head.create_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.create_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := stocktake.generate_display_name(
        __create_date := __head.create_date,
        __facility_code := __head.ship_to);
  END IF;

  INSERT INTO
    stocktake.head (
      id, 
      display_name,
      create_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.create_date, 
    __head.due_date, 
    __head.ship_from, 
    __head.ship_to) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO
      stocktake.body (
        head_id, 
        good_code, 
        quantity, 
        uom_code)
    VALUES (
      _document_id,
      _item.good_code,
      _item.quantity,
      _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION stocktake.init(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 722 (class 1255 OID 88192)
-- Name: init(common.document_head, character varying[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __good_codes character varying[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _document_id bigint;
BEGIN

  _body := balance.get_on_hand_qty(
      __facility_code := __head.ship_from,
      __good_codes := __good_codes);

  _document_id := stocktake.init(
      __head := __head,
      __body := _body);

  RETURN _document_id;

END;
$$;


ALTER FUNCTION stocktake.init(__head common.document_head, __good_codes character varying[]) OWNER TO postgres;

--
-- TOC entry 735 (class 1255 OID 88193)
-- Name: is_document_locked(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION is_document_locked(__head common.document_head, __body common.document_body[]) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  _recent_stocktake_date date;
  _stocktake_mode common.cutoff_mode;
  _is_locked boolean;
  _good_codes character varying[];
BEGIN
  _stocktake_mode := common.get_stocktake_mode(__head.doctype);
  _good_codes := ARRAY(SELECT good_code from unnest(__body))::character varying[];
  _recent_stocktake_date := stockcard.get_stocktake_recent_date(__head.ship_from, _good_codes);

  IF (__head.create_date > _recent_stocktake_date) THEN
    _is_locked := false;
  ELSE
    IF (_stocktake_mode = 'ENFORCING') THEN
      _is_locked := true;
    ELSE
      _is_locked := false; --!
    END IF;
  END IF;

  RETURN _is_locked;
END;
$$;


ALTER FUNCTION stocktake.is_document_locked(__head common.document_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 736 (class 1255 OID 88194)
-- Name: numerator_nextval(character varying, integer); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION numerator_nextval(__facility_code character varying, __julianized_week integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  _seqence_number integer;
BEGIN

  UPDATE
    stocktake.numerator
  SET
    current_value = current_value + 1
  WHERE
    julianized_week = __julianized_week AND
    facility_code = __facility_code
  RETURNING current_value INTO _seqence_number;

  IF (NOT FOUND) THEN
    INSERT INTO
      stocktake.numerator (
        facility_code,
        julianized_week,
        current_value)
    VALUES (
      __facility_code, 
      __julianized_week,
      1)
    RETURNING current_value INTO _seqence_number;
  END IF;
  
  RETURN _seqence_number;

END;
$$;


ALTER FUNCTION stocktake.numerator_nextval(__facility_code character varying, __julianized_week integer) OWNER TO postgres;

--
-- TOC entry 737 (class 1255 OID 88195)
-- Name: reinit(bigint, common.document_body[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION reinit(__document_id bigint, __body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  DELETE FROM
    stocktake.body
  WHERE 
    head_id = __document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO 
      stocktake.body (
        head_id,
        good_code,
        quantity,
        uom_code)
    VALUES (
      __document_id, 
      _item.good_code, 
      _item.quantity, 
      _item.uom_code);
  END LOOP;

END;
$$;


ALTER FUNCTION stocktake.reinit(__document_id bigint, __body common.document_body[]) OWNER TO postgres;

SET search_path = tests, pg_catalog;

--
-- TOC entry 738 (class 1255 OID 88196)
-- Name: __adjustmentcredit__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__destroy()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM adjustmentcredit.destroy(101); -- + add not allowed delete test
  
  _head := adjustmentcredit.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := adjustmentcredit.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__destroy() OWNER TO postgres;

--
-- TOC entry 739 (class 1255 OID 88197)
-- Name: __adjustmentcredit__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__generate_display_name()';

  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := adjustmentcredit.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('AJC-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__generate_display_name() OWNER TO postgres;

--
-- TOC entry 740 (class 1255 OID 88198)
-- Name: __adjustmentcredit__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_body()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO adjustmentcredit.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO adjustmentcredit.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO adjustmentcredit.body VALUES (103, 'good3', 3.0, 'm');

  _body := adjustmentcredit.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_body() OWNER TO postgres;

--
-- TOC entry 741 (class 1255 OID 88199)
-- Name: __adjustmentcredit__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_gid_by_id()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := adjustmentcredit.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 742 (class 1255 OID 88200)
-- Name: __adjustmentcredit__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTCREDIT-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ADJUSTMENTCREDIT'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_head()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := adjustmentcredit.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := adjustmentcredit.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := adjustmentcredit.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_head() OWNER TO postgres;

--
-- TOC entry 743 (class 1255 OID 88201)
-- Name: __adjustmentcredit__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTCREDIT-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ADJUSTMENTCREDIT'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_head_batch()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := adjustmentcredit.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_head_batch() OWNER TO postgres;

--
-- TOC entry 744 (class 1255 OID 88202)
-- Name: __adjustmentcredit__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTCREDIT-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ADJUSTMENTCREDIT'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_head_batch_proposed()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := adjustmentcredit.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 745 (class 1255 OID 88203)
-- Name: __adjustmentcredit__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_id_by_gid()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := adjustmentcredit.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 746 (class 1255 OID 88204)
-- Name: __adjustmentcredit__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTCREDIT-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__init()';
  
  _document_id := adjustmentcredit.init(_test_head[1], _test_body);
  _head := adjustmentcredit.get_head(_document_id);
  _body := adjustmentcredit.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__init() OWNER TO postgres;

--
-- TOC entry 747 (class 1255 OID 88205)
-- Name: __adjustmentcredit__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__numerator_nextval()';

  INSERT INTO adjustmentcredit.numerator VALUES ('A1', 1, 100);
  INSERT INTO adjustmentcredit.numerator VALUES ('A1', 2, 10);
  INSERT INTO adjustmentcredit.numerator VALUES ('B1', 1, 200);

  _numerator := adjustmentcredit.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := adjustmentcredit.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 748 (class 1255 OID 88206)
-- Name: __adjustmentcredit__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTCREDIT-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__reinit()';
  
  _document_id := adjustmentcredit.init(_test_head[1], _test_body_init);
  PERFORM adjustmentcredit.reinit(_document_id, _test_body_reinit);
  _head := adjustmentcredit.get_head(_document_id);
  _body := adjustmentcredit.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__reinit() OWNER TO postgres;

--
-- TOC entry 749 (class 1255 OID 88207)
-- Name: __adjustmentdebit__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__destroy()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM adjustmentdebit.destroy(101); -- + add not allowed delete test
  
  _head := adjustmentdebit.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := adjustmentdebit.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__destroy() OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 88208)
-- Name: __adjustmentdebit__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := adjustmentdebit.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('AJD-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__generate_display_name() OWNER TO postgres;

--
-- TOC entry 750 (class 1255 OID 88209)
-- Name: __adjustmentdebit__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_body()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO adjustmentdebit.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO adjustmentdebit.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO adjustmentdebit.body VALUES (103, 'good3', 3.0, 'm');

  _body := adjustmentdebit.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_body() OWNER TO postgres;

--
-- TOC entry 751 (class 1255 OID 88210)
-- Name: __adjustmentdebit__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_gid_by_id()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := adjustmentdebit.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 752 (class 1255 OID 88211)
-- Name: __adjustmentdebit__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTDEBIT-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ADJUSTMENTDEBIT'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_head()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := adjustmentdebit.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := adjustmentdebit.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := adjustmentdebit.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_head() OWNER TO postgres;

--
-- TOC entry 753 (class 1255 OID 88212)
-- Name: __adjustmentdebit__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTDEBIT-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ADJUSTMENTDEBIT'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_head_batch()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := adjustmentdebit.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_head_batch() OWNER TO postgres;

--
-- TOC entry 754 (class 1255 OID 88213)
-- Name: __adjustmentdebit__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTDEBIT-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ADJUSTMENTDEBIT'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_head_batch_proposed()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := adjustmentdebit.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 755 (class 1255 OID 88214)
-- Name: __adjustmentdebit__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_id_by_gid()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := adjustmentdebit.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 756 (class 1255 OID 88215)
-- Name: __adjustmentdebit__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTDEBIT-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__init()';
  
  _document_id := adjustmentdebit.init(_test_head[1], _test_body);
  _head := adjustmentdebit.get_head(_document_id);
  _body := adjustmentdebit.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__init() OWNER TO postgres;

--
-- TOC entry 757 (class 1255 OID 88216)
-- Name: __adjustmentdebit__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__numerator_nextval()';

  INSERT INTO adjustmentdebit.numerator VALUES ('A1', 1, 100);
  INSERT INTO adjustmentdebit.numerator VALUES ('A1', 2, 10);
  INSERT INTO adjustmentdebit.numerator VALUES ('B1', 1, 200);

  _numerator := adjustmentdebit.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := adjustmentdebit.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 758 (class 1255 OID 88217)
-- Name: __adjustmentdebit__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTDEBIT-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__reinit()';
  
  _document_id := adjustmentdebit.init(_test_head[1], _test_body_init);
  PERFORM adjustmentdebit.reinit(_document_id, _test_body_reinit);
  _head := adjustmentdebit.get_head(_document_id);
  _body := adjustmentdebit.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__reinit() OWNER TO postgres;

--
-- TOC entry 759 (class 1255 OID 88218)
-- Name: __balance__gain_en_route_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__gain_en_route_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_en_route_qty CONSTANT common.quantity := 100;
  _test_good2_en_route_qty CONSTANT common.quantity := 200;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_en_route_qty common.quantity;
  _good2_en_route_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__gain_en_route_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 0, 0, 0, 0, 0);
  
  PERFORM balance.gain_en_route_qty(_test_facility_code, _test_document_body);
  SELECT en_route_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_en_route_qty;
  SELECT en_route_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_en_route_qty;

  PERFORM pgunit.assert_equals(_test_good1_en_route_qty, _good1_en_route_qty, 'Incorrect _good1_en_route_qty value');
  PERFORM pgunit.assert_equals(_test_good2_en_route_qty, _good2_en_route_qty, 'Incorrect _good1_en_route_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__gain_en_route_qty() OWNER TO postgres;

--
-- TOC entry 760 (class 1255 OID 88219)
-- Name: __balance__gain_on_hand_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__gain_on_hand_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_on_hand_qty CONSTANT common.quantity := 100;
  _test_good2_on_hand_qty CONSTANT common.quantity := 200;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_on_hand_qty common.quantity;
  _good2_on_hand_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__gain_on_hand_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 0, 0, 0, 0, 0);
  
  PERFORM balance.gain_on_hand_qty(_test_facility_code, _test_document_body);
  SELECT on_hand_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_on_hand_qty;
  SELECT on_hand_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_on_hand_qty;

  PERFORM pgunit.assert_equals(_test_good1_on_hand_qty, _good1_on_hand_qty, 'Incorrect _good1_on_hand_qty value');
  PERFORM pgunit.assert_equals(_test_good2_on_hand_qty, _good2_on_hand_qty, 'Incorrect _good1_on_hand_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__gain_on_hand_qty() OWNER TO postgres;

--
-- TOC entry 761 (class 1255 OID 88220)
-- Name: __balance__gain_on_order_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__gain_on_order_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_on_order_qty CONSTANT common.quantity := 100;
  _test_good2_on_order_qty CONSTANT common.quantity := 200;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_on_order_qty common.quantity;
  _good2_on_order_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__gain_on_order_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 0, 0, 0, 0, 0);
  
  PERFORM balance.gain_on_order_qty(_test_facility_code, _test_document_body);
  SELECT on_order_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_on_order_qty;
  SELECT on_order_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_on_order_qty;

  PERFORM pgunit.assert_equals(_test_good1_on_order_qty, _good1_on_order_qty, 'Incorrect _good1_on_order_qty value');
  PERFORM pgunit.assert_equals(_test_good2_on_order_qty, _good2_on_order_qty, 'Incorrect _good1_on_order_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__gain_on_order_qty() OWNER TO postgres;

--
-- TOC entry 762 (class 1255 OID 88221)
-- Name: __balance__gain_reserved_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__gain_reserved_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_reserved_qty CONSTANT common.quantity := 100;
  _test_good2_reserved_qty CONSTANT common.quantity := 200;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_reserved_qty common.quantity;
  _good2_reserved_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__gain_reserved_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 0, 0, 0, 0, 0);
  
  PERFORM balance.gain_reserved_qty(_test_facility_code, _test_document_body);
  SELECT reserved_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_reserved_qty;
  SELECT reserved_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_reserved_qty;

  PERFORM pgunit.assert_equals(_test_good1_reserved_qty, _good1_reserved_qty, 'Incorrect _good1_reserved_qty value');
  PERFORM pgunit.assert_equals(_test_good2_reserved_qty, _good2_reserved_qty, 'Incorrect _good1_reserved_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__gain_reserved_qty() OWNER TO postgres;

--
-- TOC entry 763 (class 1255 OID 88222)
-- Name: __balance__get_on_hand_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__get_on_hand_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body_0 CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm')]::common.document_body[];
  _test_document_body_1 CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good_codes CONSTANT character varying[] := ARRAY['good1', 'good2']::character varying[];
  _test_facility_code CONSTANT character varying := 'A1';
  _balance_1 common.document_body[];
  _balance_0 common.document_body;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__get_on_hand_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 0, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 200, 0, 0, 0, 0);
  
  _balance_0 := balance.get_on_hand_qty(_test_facility_code, 'good1');
  PERFORM pgunit.assert_equals(_test_document_body_0[1], _balance_0, 'Incorrect _balance_0 value');
  
  _balance_1 := balance.get_on_hand_qty(_test_facility_code);
  PERFORM pgunit.assert_equals(_test_document_body_1, _balance_1, 'Incorrect _balance_1 value');
  
  _balance_1 := balance.get_on_hand_qty(_test_facility_code, _test_good_codes);
  PERFORM pgunit.assert_equals(_test_document_body_1, _balance_1, 'Incorrect _balance_1 value');

END;
$$;


ALTER FUNCTION tests.__balance__get_on_hand_qty() OWNER TO postgres;

--
-- TOC entry 764 (class 1255 OID 88223)
-- Name: __balance__loss_en_route_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__loss_en_route_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_en_route_qty CONSTANT common.quantity := 900;
  _test_good2_en_route_qty CONSTANT common.quantity := 800;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_en_route_qty common.quantity;
  _good2_en_route_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__loss_en_route_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 1000, 1000, 1000, 1000, 1000);
  
  PERFORM balance.loss_en_route_qty(_test_facility_code, _test_document_body);
  SELECT en_route_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_en_route_qty;
  SELECT en_route_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_en_route_qty;

  PERFORM pgunit.assert_equals(_test_good1_en_route_qty, _good1_en_route_qty, 'Incorrect _good1_en_route_qty value');
  PERFORM pgunit.assert_equals(_test_good2_en_route_qty, _good2_en_route_qty, 'Incorrect _good1_en_route_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__loss_en_route_qty() OWNER TO postgres;

--
-- TOC entry 765 (class 1255 OID 88224)
-- Name: __balance__loss_on_hand_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__loss_on_hand_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_on_hand_qty CONSTANT common.quantity := 900;
  _test_good2_on_hand_qty CONSTANT common.quantity := 800;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_on_hand_qty common.quantity;
  _good2_on_hand_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__loss_on_hand_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 1000, 1000, 1000, 1000, 1000);
  
  PERFORM balance.loss_on_hand_qty(_test_facility_code, _test_document_body);
  SELECT on_hand_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_on_hand_qty;
  SELECT on_hand_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_on_hand_qty;

  PERFORM pgunit.assert_equals(_test_good1_on_hand_qty, _good1_on_hand_qty, 'Incorrect _good1_on_hand_qty value');
  PERFORM pgunit.assert_equals(_test_good2_on_hand_qty, _good2_on_hand_qty, 'Incorrect _good1_on_hand_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__loss_on_hand_qty() OWNER TO postgres;

--
-- TOC entry 766 (class 1255 OID 88225)
-- Name: __balance__loss_on_order_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__loss_on_order_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_on_order_qty CONSTANT common.quantity := 900;
  _test_good2_on_order_qty CONSTANT common.quantity := 800;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_on_order_qty common.quantity;
  _good2_on_order_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__loss_on_order_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 1000, 1000, 1000, 1000, 1000);
  
  PERFORM balance.loss_on_order_qty(_test_facility_code, _test_document_body);
  SELECT on_order_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_on_order_qty;
  SELECT on_order_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_on_order_qty;

  PERFORM pgunit.assert_equals(_test_good1_on_order_qty, _good1_on_order_qty, 'Incorrect _good1_on_order_qty value');
  PERFORM pgunit.assert_equals(_test_good2_on_order_qty, _good2_on_order_qty, 'Incorrect _good1_on_order_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__loss_on_order_qty() OWNER TO postgres;

--
-- TOC entry 767 (class 1255 OID 88226)
-- Name: __balance__loss_reserved_qty(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __balance__loss_reserved_qty() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_body CONSTANT common.document_body[] := ARRAY[('good1', 100, 'm'), ('good2', 200, 'm')]::common.document_body[];
  _test_good1_reserved_qty CONSTANT common.quantity := 900;
  _test_good2_reserved_qty CONSTANT common.quantity := 800;
  _test_facility_code CONSTANT character varying := 'A1';
  _good1_reserved_qty common.quantity;
  _good2_reserved_qty common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __balance__loss_reserved_qty()';

  INSERT INTO balance.balance VALUES ('B1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 1000, 1000, 1000, 1000, 1000);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 1000, 1000, 1000, 1000, 1000);
  
  PERFORM balance.loss_reserved_qty(_test_facility_code, _test_document_body);
  SELECT reserved_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good1' INTO _good1_reserved_qty;
  SELECT reserved_qty FROM balance.balance WHERE facility_code = _test_facility_code AND good_code = 'good2' INTO _good2_reserved_qty;

  PERFORM pgunit.assert_equals(_test_good1_reserved_qty, _good1_reserved_qty, 'Incorrect _good1_reserved_qty value');
  PERFORM pgunit.assert_equals(_test_good2_reserved_qty, _good2_reserved_qty, 'Incorrect _good1_reserved_qty value');

END;
$$;


ALTER FUNCTION tests.__balance__loss_reserved_qty() OWNER TO postgres;

--
-- TOC entry 768 (class 1255 OID 88227)
-- Name: __binding__bind_cutoff_and_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_adjustmentcredit_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_adjustmentcredit()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_adjustmentcredit(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_adjustmentcredit WHERE adjustmentcredit_id = _test_adjustmentcredit_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 769 (class 1255 OID 88228)
-- Name: __binding__bind_cutoff_and_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_adjustmentdebit_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_adjustmentdebit()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_adjustmentdebit(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_adjustmentdebit WHERE adjustmentdebit_id = _test_adjustmentdebit_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 770 (class 1255 OID 88229)
-- Name: __binding__bind_cutoff_and_delivery(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_delivery() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_delivery_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_delivery()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_delivery(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_delivery WHERE delivery_id = _test_delivery_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_delivery() OWNER TO postgres;

--
-- TOC entry 771 (class 1255 OID 88230)
-- Name: __binding__bind_cutoff_and_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_demand_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_demand()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_demand(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_demand WHERE demand_id = _test_demand_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_demand() OWNER TO postgres;

--
-- TOC entry 773 (class 1255 OID 88231)
-- Name: __binding__bind_cutoff_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_despatch_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_despatch()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_despatch(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_despatch WHERE despatch_id = _test_despatch_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_despatch() OWNER TO postgres;

--
-- TOC entry 774 (class 1255 OID 88232)
-- Name: __binding__bind_cutoff_and_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_goal_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_goal()';

  INSERT INTO goal.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_goal(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_goal WHERE goal_id = _test_goal_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_goal() OWNER TO postgres;

--
-- TOC entry 775 (class 1255 OID 88233)
-- Name: __binding__bind_cutoff_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_issue_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_issue()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_issue(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_issue WHERE issue_id = _test_issue_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_issue() OWNER TO postgres;

--
-- TOC entry 776 (class 1255 OID 88234)
-- Name: __binding__bind_cutoff_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_picklist_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_picklist()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_picklist(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_picklist WHERE picklist_id = _test_picklist_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_picklist() OWNER TO postgres;

--
-- TOC entry 777 (class 1255 OID 88235)
-- Name: __binding__bind_cutoff_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_rebound_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_rebound()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_rebound(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_rebound WHERE rebound_id = _test_rebound_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_rebound() OWNER TO postgres;

--
-- TOC entry 778 (class 1255 OID 88236)
-- Name: __binding__bind_cutoff_and_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_receipt_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_receipt()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_receipt(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_receipt WHERE receipt_id = _test_receipt_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_receipt() OWNER TO postgres;

--
-- TOC entry 779 (class 1255 OID 88237)
-- Name: __binding__bind_cutoff_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_reserve_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_reserve()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_reserve(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_reserve WHERE reserve_id = _test_reserve_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_reserve() OWNER TO postgres;

--
-- TOC entry 780 (class 1255 OID 88238)
-- Name: __binding__bind_cutoff_and_stocktake(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_cutoff_and_stocktake() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 202;
  _test_stocktake_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_stocktake()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_stocktake(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_stocktake WHERE stocktake_id = _test_stocktake_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_stocktake() OWNER TO postgres;

--
-- TOC entry 781 (class 1255 OID 88239)
-- Name: __binding__bind_delivery_and_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_delivery_and_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _delivery_id bigint;
  _receipt_id bigint;
  _test_delivery_id CONSTANT bigint := 202;
  _test_receipt_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_delivery_and_receipt()';

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_delivery_and_receipt(202, 102);
  SELECT delivery_id FROM binding.delivery_to_receipt WHERE receipt_id = _test_receipt_id INTO _delivery_id;
  PERFORM pgunit.assert_equals(_test_delivery_id, _delivery_id, 'Incorrect _delivery_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_delivery_and_receipt() OWNER TO postgres;

--
-- TOC entry 782 (class 1255 OID 88240)
-- Name: __binding__bind_demand_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_demand_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _picklist_id bigint;
  _test_demand_id CONSTANT bigint := 202;
  _test_picklist_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_demand_and_picklist()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_demand_and_picklist(202, 102);
  SELECT demand_id FROM binding.demand_to_picklist WHERE picklist_id = _test_picklist_id INTO _demand_id;
  PERFORM pgunit.assert_equals(_test_demand_id, _demand_id, 'Incorrect _demand_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_demand_and_picklist() OWNER TO postgres;

--
-- TOC entry 783 (class 1255 OID 88241)
-- Name: __binding__bind_demand_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_demand_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _reserve_id bigint;
  _test_demand_id CONSTANT bigint := 202;
  _test_reserve_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_demand_and_reserve()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_demand_and_reserve(202, 102);
  SELECT demand_id FROM binding.demand_to_reserve WHERE reserve_id = _test_reserve_id INTO _demand_id;
  PERFORM pgunit.assert_equals(_test_demand_id, _demand_id, 'Incorrect _demand_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_demand_and_reserve() OWNER TO postgres;

--
-- TOC entry 784 (class 1255 OID 88242)
-- Name: __binding__bind_goal_and_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _demand_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_demand_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_demand()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_goal_and_demand(202, 102);
  SELECT goal_id FROM binding.goal_to_demand WHERE demand_id = _test_demand_id INTO _goal_id;
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_goal_and_demand() OWNER TO postgres;

--
-- TOC entry 785 (class 1255 OID 88243)
-- Name: __binding__bind_goal_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _despatch_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_despatch_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_despatch()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_goal_and_despatch(202, 102);
  SELECT goal_id FROM binding.goal_to_despatch WHERE despatch_id = _test_despatch_id INTO _goal_id;
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_goal_and_despatch() OWNER TO postgres;

--
-- TOC entry 786 (class 1255 OID 88244)
-- Name: __binding__bind_goal_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _issue_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_issue_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_issue()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_goal_and_issue(202, 102);
  SELECT goal_id FROM binding.goal_to_issue WHERE issue_id = _test_issue_id INTO _goal_id;
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_goal_and_issue() OWNER TO postgres;

--
-- TOC entry 787 (class 1255 OID 88245)
-- Name: __binding__bind_goal_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _picklist_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_picklist_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_picklist()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_goal_and_picklist(202, 102);
  SELECT goal_id FROM binding.goal_to_picklist WHERE picklist_id = _test_picklist_id INTO _goal_id;
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_goal_and_picklist() OWNER TO postgres;

--
-- TOC entry 788 (class 1255 OID 88246)
-- Name: __binding__bind_goal_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _reserve_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_reserve_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_reserve()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_goal_and_reserve(202, 102);
  SELECT goal_id FROM binding.goal_to_reserve WHERE reserve_id = _test_reserve_id INTO _goal_id;
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_goal_and_reserve() OWNER TO postgres;

--
-- TOC entry 772 (class 1255 OID 88247)
-- Name: __binding__bind_issue_and_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_issue_and_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _adjustmentcredit_id bigint;
  _test_issue_id CONSTANT bigint := 202;
  _test_adjustmentcredit_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_adjustmentcredit()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_issue_and_adjustmentcredit(202, 102);
  SELECT issue_id FROM binding.issue_to_adjustmentcredit WHERE adjustmentcredit_id = _test_adjustmentcredit_id INTO _issue_id;
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_issue_and_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 789 (class 1255 OID 88248)
-- Name: __binding__bind_issue_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_issue_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _despatch_id bigint;
  _test_issue_id CONSTANT bigint := 202;
  _test_despatch_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_despatch()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_issue_and_despatch(202, 102);
  SELECT issue_id FROM binding.issue_to_despatch WHERE despatch_id = _test_despatch_id INTO _issue_id;
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_issue_and_despatch() OWNER TO postgres;

--
-- TOC entry 790 (class 1255 OID 88249)
-- Name: __binding__bind_issue_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_issue_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _rebound_id bigint;
  _test_issue_id CONSTANT bigint := 202;
  _test_rebound_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_rebound()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_issue_and_rebound(202, 102);
  SELECT issue_id FROM binding.issue_to_rebound WHERE rebound_id = _test_rebound_id INTO _issue_id;
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_issue_and_rebound() OWNER TO postgres;

--
-- TOC entry 791 (class 1255 OID 88250)
-- Name: __binding__bind_picklist_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_picklist_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _picklist_id bigint;
  _issue_id bigint;
  _test_picklist_id CONSTANT bigint := 202;
  _test_issue_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_picklist_and_issue()';

  INSERT INTO picklist.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_picklist_and_issue(202, 102);
  SELECT picklist_id FROM binding.picklist_to_issue WHERE issue_id = _test_issue_id INTO _picklist_id;
  PERFORM pgunit.assert_equals(_test_picklist_id, _picklist_id, 'Incorrect _picklist_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_picklist_and_issue() OWNER TO postgres;

--
-- TOC entry 792 (class 1255 OID 88251)
-- Name: __binding__bind_receipt_and_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_receipt_and_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _adjustmentdebit_id bigint;
  _test_receipt_id CONSTANT bigint := 202;
  _test_adjustmentdebit_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_receipt_and_adjustmentdebit()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_receipt_and_adjustmentdebit(202, 102);
  SELECT receipt_id FROM binding.receipt_to_adjustmentdebit WHERE adjustmentdebit_id = _test_adjustmentdebit_id INTO _receipt_id;
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_receipt_and_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 794 (class 1255 OID 88252)
-- Name: __binding__bind_receipt_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_receipt_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _rebound_id bigint;
  _test_receipt_id CONSTANT bigint := 202;
  _test_rebound_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_receipt_and_rebound()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_receipt_and_rebound(202, 102);
  SELECT receipt_id FROM binding.receipt_to_rebound WHERE rebound_id = _test_rebound_id INTO _receipt_id;
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_receipt_and_rebound() OWNER TO postgres;

--
-- TOC entry 795 (class 1255 OID 88253)
-- Name: __binding__get_adjustmentcredit_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_adjustmentcredit_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _adjustmentcredit_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_cutoff_and_adjustmentcredit()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,103);

  _adjustmentcredit_ids := binding.get_adjustmentcredit_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_adjustmentcredit_ids, 1);
  PERFORM pgunit.assert_equals(_test_adjustmentcredit_id, _adjustmentcredit_ids[1], 'Incorrect _adjustmentcredit_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _adjustmentcredit_ids := binding.get_adjustmentcredit_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_adjustmentcredit_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_adjustmentcredit_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 796 (class 1255 OID 88254)
-- Name: __binding__get_adjustmentcredit_binded_to_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_adjustmentcredit_binded_to_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _adjustmentcredit_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_adjustmentcredit()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (203,103);

  _adjustmentcredit_id := binding.get_adjustmentcredit_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_adjustmentcredit_id, _adjustmentcredit_id, 'Incorrect _adjustmentcredit_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_adjustmentcredit_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 797 (class 1255 OID 88255)
-- Name: __binding__get_adjustmentdebit_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_adjustmentdebit_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _adjustmentdebit_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_adjustmentdebit_binded_to_cutoff()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,103);

  _adjustmentdebit_ids := binding.get_adjustmentdebit_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_adjustmentdebit_ids, 1);
  PERFORM pgunit.assert_equals(_test_adjustmentdebit_id, _adjustmentdebit_ids[1], 'Incorrect _adjustmentdebit_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _adjustmentdebit_ids := binding.get_adjustmentdebit_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_adjustmentdebit_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_adjustmentdebit_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 798 (class 1255 OID 88256)
-- Name: __binding__get_adjustmentdebit_binded_to_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_adjustmentdebit_binded_to_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _adjustmentdebit_id bigint;
  _test_receipt_id CONSTANT bigint := 201;
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_receipt_and_adjustmentdebit()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (203,103);

  _adjustmentdebit_id := binding.get_adjustmentdebit_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_adjustmentdebit_id, _adjustmentdebit_id, 'Incorrect _adjustmentdebit_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_adjustmentdebit_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 799 (class 1255 OID 88257)
-- Name: __binding__get_cutoff_binded_to(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id_01 bigint;
  _cutoff_id_02 bigint;
  _cutoff_id_03 bigint;
  _cutoff_id_04 bigint;
  _cutoff_id_05 bigint;
  _cutoff_id_06 bigint;
  _cutoff_id_07 bigint;
  _cutoff_id_08 bigint;
  _cutoff_id_09 bigint;
  _cutoff_id_10 bigint;
  _delivery_head common.document_head;
  _demand_head common.document_head;
  _despatch_head common.document_head;
  _goal_head common.document_head;
  _issue_head common.document_head;
  _picklist_head common.document_head;
  _rebound_head common.document_head;
  _receipt_head common.document_head;
  _reserve_head common.document_head;
  _stocktake_head common.document_head;
  _test_cutoff_id CONSTANT bigint := 201;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to()';

  INSERT INTO delivery.head VALUES (1001, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (1101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (1201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (1301, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (1401, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (1501, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (1601, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (1701, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (1801, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (1901, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO cutoff.registry VALUES (_test_cutoff_id, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_delivery VALUES (_test_cutoff_id,1001);
  INSERT INTO binding.cutoff_to_demand VALUES (_test_cutoff_id,1101);
  INSERT INTO binding.cutoff_to_despatch VALUES (_test_cutoff_id,1201);
  INSERT INTO binding.cutoff_to_goal VALUES (_test_cutoff_id,1301);
  INSERT INTO binding.cutoff_to_issue VALUES (_test_cutoff_id,1401);
  INSERT INTO binding.cutoff_to_picklist VALUES (_test_cutoff_id,1501);
  INSERT INTO binding.cutoff_to_rebound VALUES (_test_cutoff_id,1601);
  INSERT INTO binding.cutoff_to_receipt VALUES (_test_cutoff_id,1701);
  INSERT INTO binding.cutoff_to_reserve VALUES (_test_cutoff_id,1801);
  INSERT INTO binding.cutoff_to_stocktake VALUES (_test_cutoff_id,1901);

  _delivery_head := delivery.get_head(1001);
  _demand_head := demand.get_head(1101);
  _despatch_head := despatch.get_head(1201);
  _goal_head := goal.get_head(1301);
  _issue_head := issue.get_head(1401);
  _picklist_head := picklist.get_head(1501);
  _rebound_head := rebound.get_head(1601);
  _receipt_head := receipt.get_head(1701);
  _reserve_head := reserve.get_head(1801);
  _stocktake_head := stocktake.get_head(1901);

  _cutoff_id_01 := binding.get_cutoff_binded_to(_delivery_head);
  _cutoff_id_02 := binding.get_cutoff_binded_to(_demand_head);
  _cutoff_id_03 := binding.get_cutoff_binded_to(_despatch_head);
  _cutoff_id_04 := binding.get_cutoff_binded_to(_goal_head);
  _cutoff_id_05 := binding.get_cutoff_binded_to(_issue_head);
  _cutoff_id_06 := binding.get_cutoff_binded_to(_picklist_head);
  _cutoff_id_07 := binding.get_cutoff_binded_to(_rebound_head);
  _cutoff_id_08 := binding.get_cutoff_binded_to(_receipt_head);
  _cutoff_id_09 := binding.get_cutoff_binded_to(_reserve_head);
  _cutoff_id_10 := binding.get_cutoff_binded_to(_stocktake_head);

  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_01, 'Incorrect _cutoff_id_01 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_02, 'Incorrect _cutoff_id_02 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_03, 'Incorrect _cutoff_id_03 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_04, 'Incorrect _cutoff_id_04 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_05, 'Incorrect _cutoff_id_05 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_06, 'Incorrect _cutoff_id_06 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_07, 'Incorrect _cutoff_id_07 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_08, 'Incorrect _cutoff_id_08 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_09, 'Incorrect _cutoff_id_09 value');
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id_10, 'Incorrect _cutoff_id_10 value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to() OWNER TO postgres;

--
-- TOC entry 800 (class 1255 OID 88258)
-- Name: __binding__get_cutoff_binded_to_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _adjustmentcredit_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_adjustmentcredit()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_adjustmentcredit(_test_adjustmentcredit_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 793 (class 1255 OID 88259)
-- Name: __binding__get_cutoff_binded_to_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _adjustmentdebit_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_adjustmentdebit()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_adjustmentdebit(_test_adjustmentdebit_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 801 (class 1255 OID 88260)
-- Name: __binding__get_cutoff_binded_to_delivery(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_delivery() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _delivery_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_delivery_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_delivery()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_delivery VALUES (201,101);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,102);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_delivery(_test_delivery_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_delivery() OWNER TO postgres;

--
-- TOC entry 802 (class 1255 OID 88261)
-- Name: __binding__get_cutoff_binded_to_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _demand_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_demand()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_demand VALUES (201,101);
  INSERT INTO binding.cutoff_to_demand VALUES (202,102);
  INSERT INTO binding.cutoff_to_demand VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_demand(_test_demand_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_demand() OWNER TO postgres;

--
-- TOC entry 803 (class 1255 OID 88262)
-- Name: __binding__get_cutoff_binded_to_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _despatch_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_despatch()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_despatch VALUES (201,101);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,102);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_despatch(_test_despatch_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_despatch() OWNER TO postgres;

--
-- TOC entry 804 (class 1255 OID 88263)
-- Name: __binding__get_cutoff_binded_to_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _goal_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_goal_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_goal()';

  INSERT INTO goal.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_goal VALUES (201,101);
  INSERT INTO binding.cutoff_to_goal VALUES (202,102);
  INSERT INTO binding.cutoff_to_goal VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 805 (class 1255 OID 88264)
-- Name: __binding__get_cutoff_binded_to_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _issue_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_issue()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_issue VALUES (201,101);
  INSERT INTO binding.cutoff_to_issue VALUES (202,102);
  INSERT INTO binding.cutoff_to_issue VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 806 (class 1255 OID 88265)
-- Name: __binding__get_cutoff_binded_to_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _picklist_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_picklist()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_picklist VALUES (201,101);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,102);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_picklist(_test_picklist_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_picklist() OWNER TO postgres;

--
-- TOC entry 807 (class 1255 OID 88266)
-- Name: __binding__get_cutoff_binded_to_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _rebound_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_rebound()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_rebound VALUES (201,101);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,102);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_rebound(_test_rebound_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_rebound() OWNER TO postgres;

--
-- TOC entry 808 (class 1255 OID 88267)
-- Name: __binding__get_cutoff_binded_to_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _receipt_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_receipt()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_receipt VALUES (201,101);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,102);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 809 (class 1255 OID 88268)
-- Name: __binding__get_cutoff_binded_to_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _reserve_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_reserve()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_reserve VALUES (201,101);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,102);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_reserve(_test_reserve_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_reserve() OWNER TO postgres;

--
-- TOC entry 810 (class 1255 OID 88269)
-- Name: __binding__get_cutoff_binded_to_stocktake(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_cutoff_binded_to_stocktake() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _stocktake_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_stocktake_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_cutoff_binded_to_stocktake()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_stocktake VALUES (201,101);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,102);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_stocktake(_test_stocktake_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_stocktake() OWNER TO postgres;

--
-- TOC entry 811 (class 1255 OID 88270)
-- Name: __binding__get_delivery_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_delivery_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _delivery_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_delivery_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_delivery_binded_to_cutoff()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_delivery VALUES (201,101);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,102);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,103);

  _delivery_ids := binding.get_delivery_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_delivery_ids, 1);
  PERFORM pgunit.assert_equals(_test_delivery_id, _delivery_ids[1], 'Incorrect _delivery_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _delivery_ids := binding.get_delivery_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_delivery_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_delivery_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 812 (class 1255 OID 88271)
-- Name: __binding__get_delivery_binded_to_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_delivery_binded_to_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _delivery_id bigint;
  _receipt_id bigint;
  _test_delivery_id CONSTANT bigint := 201;
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_delivery_binded_to_receipt()';

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.delivery_to_receipt VALUES (201,101);
  INSERT INTO binding.delivery_to_receipt VALUES (202,102);
  INSERT INTO binding.delivery_to_receipt VALUES (203,103);

  _delivery_id := binding.get_delivery_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_delivery_id, _delivery_id, 'Incorrect _delivery_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_delivery_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 813 (class 1255 OID 88272)
-- Name: __binding__get_demand_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_demand_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _demand_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_demand_binded_to_cutoff()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_demand VALUES (201,101);
  INSERT INTO binding.cutoff_to_demand VALUES (202,102);
  INSERT INTO binding.cutoff_to_demand VALUES (202,103);

  _demand_ids := binding.get_demand_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_demand_ids, 1);
  PERFORM pgunit.assert_equals(_test_demand_id, _demand_ids[1], 'Incorrect _demand_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _demand_ids := binding.get_demand_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_demand_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_demand_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 814 (class 1255 OID 88273)
-- Name: __binding__get_demand_binded_to_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_demand_binded_to_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _demand_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_demand()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_demand VALUES (201,101);
  INSERT INTO binding.goal_to_demand VALUES (202,102);
  INSERT INTO binding.goal_to_demand VALUES (203,103);

  _demand_id := binding.get_demand_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_demand_id, _demand_id, 'Incorrect _demand_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_demand_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 815 (class 1255 OID 88274)
-- Name: __binding__get_demand_binded_to_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_demand_binded_to_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _picklist_id bigint;
  _test_demand_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_demand_binded_to_picklist()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.demand_to_picklist VALUES (201,101);
  INSERT INTO binding.demand_to_picklist VALUES (202,102);
  INSERT INTO binding.demand_to_picklist VALUES (203,103);

  _demand_id := binding.get_demand_binded_to_picklist(_test_picklist_id);
  PERFORM pgunit.assert_equals(_test_demand_id, _demand_id, 'Incorrect _demand_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_demand_binded_to_picklist() OWNER TO postgres;

--
-- TOC entry 816 (class 1255 OID 88275)
-- Name: __binding__get_demand_binded_to_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_demand_binded_to_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _reserve_id bigint;
  _test_demand_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_demand_binded_to_reserve()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.demand_to_reserve VALUES (201,101);
  INSERT INTO binding.demand_to_reserve VALUES (202,102);
  INSERT INTO binding.demand_to_reserve VALUES (203,103);

  _demand_id := binding.get_demand_binded_to_reserve(_test_reserve_id);
  PERFORM pgunit.assert_equals(_test_demand_id, _demand_id, 'Incorrect _demand_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_demand_binded_to_reserve() OWNER TO postgres;

--
-- TOC entry 817 (class 1255 OID 88276)
-- Name: __binding__get_despatch_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_despatch_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _despatch_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_despatch_binded_to_cutoff()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_despatch VALUES (201,101);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,102);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,103);

  _despatch_ids := binding.get_despatch_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_despatch_ids, 1);
  PERFORM pgunit.assert_equals(_test_despatch_id, _despatch_ids[1], 'Incorrect _despatch_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _despatch_ids := binding.get_despatch_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_despatch_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_despatch_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 818 (class 1255 OID 88277)
-- Name: __binding__get_despatch_binded_to_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_despatch_binded_to_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _despatch_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_despatch()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_despatch VALUES (201,101);
  INSERT INTO binding.goal_to_despatch VALUES (202,102);
  INSERT INTO binding.goal_to_despatch VALUES (203,103);

  _despatch_id := binding.get_despatch_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_despatch_id, _despatch_id, 'Incorrect _despatch_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_despatch_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 819 (class 1255 OID 88278)
-- Name: __binding__get_despatch_binded_to_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_despatch_binded_to_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _despatch_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_despatch()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_despatch VALUES (201,101);
  INSERT INTO binding.issue_to_despatch VALUES (202,102);
  INSERT INTO binding.issue_to_despatch VALUES (203,103);

  _despatch_id := binding.get_despatch_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_despatch_id, _despatch_id, 'Incorrect _despatch_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_despatch_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 820 (class 1255 OID 88279)
-- Name: __binding__get_goal_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_goal_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _goal_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_goal_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_goal_binded_to_cutoff()';

  INSERT INTO goal.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_goal VALUES (201,101);
  INSERT INTO binding.cutoff_to_goal VALUES (202,102);
  INSERT INTO binding.cutoff_to_goal VALUES (202,103);

  _goal_ids := binding.get_goal_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_goal_ids, 1);
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_ids[1], 'Incorrect _goal_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _goal_ids := binding.get_goal_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_goal_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_goal_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 821 (class 1255 OID 88280)
-- Name: __binding__get_goal_binded_to_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_goal_binded_to_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _demand_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_goal_binded_to_demand()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_demand VALUES (201,101);
  INSERT INTO binding.goal_to_demand VALUES (202,102);
  INSERT INTO binding.goal_to_demand VALUES (203,103);

  _goal_id := binding.get_goal_binded_to_demand(_test_demand_id);
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_goal_binded_to_demand() OWNER TO postgres;

--
-- TOC entry 822 (class 1255 OID 88281)
-- Name: __binding__get_goal_binded_to_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_goal_binded_to_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _despatch_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_goal_binded_to_despatch()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_despatch VALUES (201,101);
  INSERT INTO binding.goal_to_despatch VALUES (202,102);
  INSERT INTO binding.goal_to_despatch VALUES (203,103);

  _goal_id := binding.get_goal_binded_to_despatch(_test_despatch_id);
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_goal_binded_to_despatch() OWNER TO postgres;

--
-- TOC entry 823 (class 1255 OID 88282)
-- Name: __binding__get_goal_binded_to_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_goal_binded_to_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _issue_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_goal_binded_to_issue()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_issue VALUES (201,101);
  INSERT INTO binding.goal_to_issue VALUES (202,102);
  INSERT INTO binding.goal_to_issue VALUES (203,103);

  _goal_id := binding.get_goal_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_goal_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 824 (class 1255 OID 88283)
-- Name: __binding__get_goal_binded_to_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_goal_binded_to_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _picklist_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_goal_binded_to_picklist()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_picklist VALUES (201,101);
  INSERT INTO binding.goal_to_picklist VALUES (202,102);
  INSERT INTO binding.goal_to_picklist VALUES (203,103);

  _goal_id := binding.get_goal_binded_to_picklist(_test_picklist_id);
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_goal_binded_to_picklist() OWNER TO postgres;

--
-- TOC entry 825 (class 1255 OID 88284)
-- Name: __binding__get_goal_binded_to_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_goal_binded_to_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _reserve_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_goal_binded_to_reserve()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_reserve VALUES (201,101);
  INSERT INTO binding.goal_to_reserve VALUES (202,102);
  INSERT INTO binding.goal_to_reserve VALUES (203,103);

  _goal_id := binding.get_goal_binded_to_reserve(_test_reserve_id);
  PERFORM pgunit.assert_equals(_test_goal_id, _goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_goal_binded_to_reserve() OWNER TO postgres;

--
-- TOC entry 826 (class 1255 OID 88285)
-- Name: __binding__get_issue_binded_to_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_issue_binded_to_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _adjustmentcredit_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_issue_binded_to_adjustmentcredit()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (203,103);

  _issue_id := binding.get_issue_binded_to_adjustmentcredit(_test_adjustmentcredit_id);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 827 (class 1255 OID 88286)
-- Name: __binding__get_issue_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_issue_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _issue_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_issue_binded_to_cutoff()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_issue VALUES (201,101);
  INSERT INTO binding.cutoff_to_issue VALUES (202,102);
  INSERT INTO binding.cutoff_to_issue VALUES (202,103);

  _issue_ids := binding.get_issue_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_issue_ids, 1);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_ids[1], 'Incorrect _issue_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _issue_ids := binding.get_issue_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_issue_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 828 (class 1255 OID 88287)
-- Name: __binding__get_issue_binded_to_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_issue_binded_to_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _despatch_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_issue_binded_to_despatch()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_despatch VALUES (201,101);
  INSERT INTO binding.issue_to_despatch VALUES (202,102);
  INSERT INTO binding.issue_to_despatch VALUES (203,103);

  _issue_id := binding.get_issue_binded_to_despatch(_test_despatch_id);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_despatch() OWNER TO postgres;

--
-- TOC entry 829 (class 1255 OID 88288)
-- Name: __binding__get_issue_binded_to_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_issue_binded_to_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _issue_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_issue()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_issue VALUES (201,101);
  INSERT INTO binding.goal_to_issue VALUES (202,102);
  INSERT INTO binding.goal_to_issue VALUES (203,103);

  _issue_id := binding.get_issue_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 830 (class 1255 OID 88289)
-- Name: __binding__get_issue_binded_to_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_issue_binded_to_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _picklist_id bigint;
  _issue_id bigint;
  _test_picklist_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_picklist_and_issue()';

  INSERT INTO picklist.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.picklist_to_issue VALUES (201,101);
  INSERT INTO binding.picklist_to_issue VALUES (202,102);
  INSERT INTO binding.picklist_to_issue VALUES (203,103);

  _issue_id := binding.get_issue_binded_to_picklist(_test_picklist_id);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_picklist() OWNER TO postgres;

--
-- TOC entry 831 (class 1255 OID 88290)
-- Name: __binding__get_issue_binded_to_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_issue_binded_to_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _rebound_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_issue_binded_to_rebound()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_rebound VALUES (201,101);
  INSERT INTO binding.issue_to_rebound VALUES (202,102);
  INSERT INTO binding.issue_to_rebound VALUES (203,103);

  _issue_id := binding.get_issue_binded_to_rebound(_test_rebound_id);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_rebound() OWNER TO postgres;

--
-- TOC entry 832 (class 1255 OID 88291)
-- Name: __binding__get_picklist_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_picklist_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _picklist_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_picklist_binded_to_cutoff()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_picklist VALUES (201,101);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,102);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,103);

  _picklist_ids := binding.get_picklist_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_picklist_ids, 1);
  PERFORM pgunit.assert_equals(_test_picklist_id, _picklist_ids[1], 'Incorrect _picklist_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _picklist_ids := binding.get_picklist_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_picklist_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_picklist_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 833 (class 1255 OID 88292)
-- Name: __binding__get_picklist_binded_to_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_picklist_binded_to_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _picklist_id bigint;
  _test_demand_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_demand_and_picklist()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.demand_to_picklist VALUES (201,101);
  INSERT INTO binding.demand_to_picklist VALUES (202,102);
  INSERT INTO binding.demand_to_picklist VALUES (203,103);

  _picklist_id := binding.get_picklist_binded_to_demand(_test_demand_id);
  PERFORM pgunit.assert_equals(_test_picklist_id, _picklist_id, 'Incorrect _picklist_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_picklist_binded_to_demand() OWNER TO postgres;

--
-- TOC entry 834 (class 1255 OID 88293)
-- Name: __binding__get_picklist_binded_to_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_picklist_binded_to_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _picklist_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_picklist()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_picklist VALUES (201,101);
  INSERT INTO binding.goal_to_picklist VALUES (202,102);
  INSERT INTO binding.goal_to_picklist VALUES (203,103);

  _picklist_id := binding.get_picklist_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_picklist_id, _picklist_id, 'Incorrect _picklist_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_picklist_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 835 (class 1255 OID 88294)
-- Name: __binding__get_picklist_binded_to_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_picklist_binded_to_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _picklist_id bigint;
  _issue_id bigint;
  _test_picklist_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_picklist_binded_to_issue()';

  INSERT INTO picklist.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.picklist_to_issue VALUES (201,101);
  INSERT INTO binding.picklist_to_issue VALUES (202,102);
  INSERT INTO binding.picklist_to_issue VALUES (203,103);

  _picklist_id := binding.get_picklist_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_picklist_id, _picklist_id, 'Incorrect _picklist_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_picklist_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 836 (class 1255 OID 88295)
-- Name: __binding__get_rebound_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_rebound_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _rebound_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_rebound_binded_to_cutoff()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_rebound VALUES (201,101);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,102);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,103);

  _rebound_ids := binding.get_rebound_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_rebound_ids, 1);
  PERFORM pgunit.assert_equals(_test_rebound_id, _rebound_ids[1], 'Incorrect _rebound_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _rebound_ids := binding.get_rebound_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_rebound_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_rebound_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 837 (class 1255 OID 88296)
-- Name: __binding__get_rebound_binded_to_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_rebound_binded_to_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _rebound_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_rebound()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_rebound VALUES (201,101);
  INSERT INTO binding.issue_to_rebound VALUES (202,102);
  INSERT INTO binding.issue_to_rebound VALUES (203,103);

  _rebound_id := binding.get_rebound_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_rebound_id, _rebound_id, 'Incorrect _rebound_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_rebound_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 838 (class 1255 OID 88297)
-- Name: __binding__get_rebound_binded_to_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_rebound_binded_to_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _rebound_id bigint;
  _test_receipt_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_receipt_and_rebound()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_rebound VALUES (201,101);
  INSERT INTO binding.receipt_to_rebound VALUES (202,102);
  INSERT INTO binding.receipt_to_rebound VALUES (203,103);

  _rebound_id := binding.get_rebound_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_rebound_id, _rebound_id, 'Incorrect _rebound_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_rebound_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 839 (class 1255 OID 88298)
-- Name: __binding__get_receipt_binded_to_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_receipt_binded_to_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _adjustmentdebit_id bigint;
  _test_receipt_id CONSTANT bigint := 201;
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_receipt_binded_to_adjustmentdebit()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (203,103);

  _receipt_id := binding.get_receipt_binded_to_adjustmentdebit(_test_adjustmentdebit_id);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 840 (class 1255 OID 88299)
-- Name: __binding__get_receipt_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_receipt_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _receipt_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_receipt_binded_to_cutoff()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_receipt VALUES (201,101);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,102);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,103);

  _receipt_ids := binding.get_receipt_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_receipt_ids, 1);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_ids[1], 'Incorrect _receipt_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _receipt_ids := binding.get_receipt_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_receipt_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 841 (class 1255 OID 88300)
-- Name: __binding__get_receipt_binded_to_delivery(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_receipt_binded_to_delivery() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _delivery_id bigint;
  _receipt_id bigint;
  _test_delivery_id CONSTANT bigint := 201;
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_delivery_and_receipt()';

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.delivery_to_receipt VALUES (201,101);
  INSERT INTO binding.delivery_to_receipt VALUES (202,102);
  INSERT INTO binding.delivery_to_receipt VALUES (203,103);

  _receipt_id := binding.get_receipt_binded_to_delivery(_test_delivery_id);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_delivery() OWNER TO postgres;

--
-- TOC entry 842 (class 1255 OID 88301)
-- Name: __binding__get_receipt_binded_to_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_receipt_binded_to_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _rebound_id bigint;
  _test_receipt_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_receipt_binded_to_rebound()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_rebound VALUES (201,101);
  INSERT INTO binding.receipt_to_rebound VALUES (202,102);
  INSERT INTO binding.receipt_to_rebound VALUES (203,103);

  _receipt_id := binding.get_receipt_binded_to_rebound(_test_rebound_id);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_rebound() OWNER TO postgres;

--
-- TOC entry 843 (class 1255 OID 88302)
-- Name: __binding__get_reserve_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_reserve_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _reserve_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_reserve_binded_to_cutoff()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_reserve VALUES (201,101);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,102);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,103);

  _reserve_ids := binding.get_reserve_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_reserve_ids, 1);
  PERFORM pgunit.assert_equals(_test_reserve_id, _reserve_ids[1], 'Incorrect _reserve_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _reserve_ids := binding.get_reserve_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_reserve_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_reserve_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 844 (class 1255 OID 88303)
-- Name: __binding__get_reserve_binded_to_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_reserve_binded_to_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _reserve_id bigint;
  _test_demand_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_demand_and_reserve()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.demand_to_reserve VALUES (201,101);
  INSERT INTO binding.demand_to_reserve VALUES (202,102);
  INSERT INTO binding.demand_to_reserve VALUES (203,103);

  _reserve_id := binding.get_reserve_binded_to_demand(_test_demand_id);
  PERFORM pgunit.assert_equals(_test_reserve_id, _reserve_id, 'Incorrect _reserve_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_reserve_binded_to_demand() OWNER TO postgres;

--
-- TOC entry 845 (class 1255 OID 88304)
-- Name: __binding__get_reserve_binded_to_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_reserve_binded_to_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _reserve_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_reserve()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_reserve VALUES (201,101);
  INSERT INTO binding.goal_to_reserve VALUES (202,102);
  INSERT INTO binding.goal_to_reserve VALUES (203,103);

  _reserve_id := binding.get_reserve_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_reserve_id, _reserve_id, 'Incorrect _reserve_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_reserve_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 846 (class 1255 OID 88305)
-- Name: __binding__get_stocktake_binded_to_cutoff(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__get_stocktake_binded_to_cutoff() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _stocktake_ids bigint[];
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_stocktake_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__get_stocktake_binded_to_cutoff()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_stocktake VALUES (201,101);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,102);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,103);

  _stocktake_ids := binding.get_stocktake_binded_to_cutoff(_test_cutoff_id);
  _array_lengh := array_length(_stocktake_ids, 1);
  PERFORM pgunit.assert_equals(_test_stocktake_id, _stocktake_ids[1], 'Incorrect _stocktake_ids value');
  PERFORM pgunit.assert_equals(1, _array_lengh, 'Incorrect _array_lengh value');

  _stocktake_ids := binding.get_stocktake_binded_to_cutoff(_test_cutoff_ids);
  _array_lengh := array_length(_stocktake_ids, 1);
  PERFORM pgunit.assert_equals(2, _array_lengh, 'Incorrect _array_lengh value');

END;
$$;


ALTER FUNCTION tests.__binding__get_stocktake_binded_to_cutoff() OWNER TO postgres;

--
-- TOC entry 847 (class 1255 OID 88306)
-- Name: __binding__unbind_cutoff_and_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _adjustmentcredit_ids bigint[];
  _adjustmentcredit_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_adjustmentcredit()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_adjustmentcredit(_test_cutoff_id, _test_adjustmentcredit_id);
  SELECT cutoff_id FROM binding.cutoff_to_adjustmentcredit WHERE adjustmentcredit_id = _test_adjustmentcredit_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 848 (class 1255 OID 88307)
-- Name: __binding__unbind_cutoff_and_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _adjustmentdebit_ids bigint[];
  _adjustmentdebit_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_adjustmentdebit()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_adjustmentdebit(_test_cutoff_id, _test_adjustmentdebit_id);
  SELECT cutoff_id FROM binding.cutoff_to_adjustmentdebit WHERE adjustmentdebit_id = _test_adjustmentdebit_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 849 (class 1255 OID 88308)
-- Name: __binding__unbind_cutoff_and_delivery(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_delivery() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _delivery_ids bigint[];
  _delivery_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_delivery_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_delivery()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_delivery VALUES (201,101);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,102);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_delivery(_test_cutoff_id, _test_delivery_id);
  SELECT cutoff_id FROM binding.cutoff_to_delivery WHERE delivery_id = _test_delivery_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_delivery() OWNER TO postgres;

--
-- TOC entry 850 (class 1255 OID 88309)
-- Name: __binding__unbind_cutoff_and_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _demand_ids bigint[];
  _demand_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_demand()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_demand VALUES (201,101);
  INSERT INTO binding.cutoff_to_demand VALUES (202,102);
  INSERT INTO binding.cutoff_to_demand VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_demand(_test_cutoff_id, _test_demand_id);
  SELECT cutoff_id FROM binding.cutoff_to_demand WHERE demand_id = _test_demand_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_demand() OWNER TO postgres;

--
-- TOC entry 851 (class 1255 OID 88310)
-- Name: __binding__unbind_cutoff_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _despatch_ids bigint[];
  _despatch_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_despatch()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_despatch VALUES (201,101);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,102);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_despatch(_test_cutoff_id, _test_despatch_id);
  SELECT cutoff_id FROM binding.cutoff_to_despatch WHERE despatch_id = _test_despatch_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_despatch() OWNER TO postgres;

--
-- TOC entry 852 (class 1255 OID 88311)
-- Name: __binding__unbind_cutoff_and_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _goal_ids bigint[];
  _goal_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_goal_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_goal()';

  INSERT INTO goal.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_goal VALUES (201,101);
  INSERT INTO binding.cutoff_to_goal VALUES (202,102);
  INSERT INTO binding.cutoff_to_goal VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_goal(_test_cutoff_id, _test_goal_id);
  SELECT cutoff_id FROM binding.cutoff_to_goal WHERE goal_id = _test_goal_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_goal() OWNER TO postgres;

--
-- TOC entry 853 (class 1255 OID 88312)
-- Name: __binding__unbind_cutoff_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _issue_ids bigint[];
  _issue_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_issue()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_issue VALUES (201,101);
  INSERT INTO binding.cutoff_to_issue VALUES (202,102);
  INSERT INTO binding.cutoff_to_issue VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_issue(_test_cutoff_id, _test_issue_id);
  SELECT cutoff_id FROM binding.cutoff_to_issue WHERE issue_id = _test_issue_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_issue() OWNER TO postgres;

--
-- TOC entry 854 (class 1255 OID 88313)
-- Name: __binding__unbind_cutoff_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _picklist_ids bigint[];
  _picklist_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_picklist()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_picklist VALUES (201,101);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,102);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_picklist(_test_cutoff_id, _test_picklist_id);
  SELECT cutoff_id FROM binding.cutoff_to_picklist WHERE picklist_id = _test_picklist_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_picklist() OWNER TO postgres;

--
-- TOC entry 855 (class 1255 OID 88314)
-- Name: __binding__unbind_cutoff_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _rebound_ids bigint[];
  _rebound_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_rebound()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_rebound VALUES (201,101);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,102);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_rebound(_test_cutoff_id, _test_rebound_id);
  SELECT cutoff_id FROM binding.cutoff_to_rebound WHERE rebound_id = _test_rebound_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_rebound() OWNER TO postgres;

--
-- TOC entry 856 (class 1255 OID 88315)
-- Name: __binding__unbind_cutoff_and_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _receipt_ids bigint[];
  _receipt_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_receipt()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_receipt VALUES (201,101);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,102);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_receipt(_test_cutoff_id, _test_receipt_id);
  SELECT cutoff_id FROM binding.cutoff_to_receipt WHERE receipt_id = _test_receipt_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_receipt() OWNER TO postgres;

--
-- TOC entry 857 (class 1255 OID 88316)
-- Name: __binding__unbind_cutoff_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _reserve_ids bigint[];
  _reserve_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_reserve()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_reserve VALUES (201,101);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,102);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_reserve(_test_cutoff_id, _test_reserve_id);
  SELECT cutoff_id FROM binding.cutoff_to_reserve WHERE reserve_id = _test_reserve_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_reserve() OWNER TO postgres;

--
-- TOC entry 858 (class 1255 OID 88317)
-- Name: __binding__unbind_cutoff_and_stocktake(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_stocktake() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _array_lengh integer;
  _stocktake_ids bigint[];
  _stocktake_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[202]::bigint[];
  _test_stocktake_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_stocktake()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_stocktake VALUES (201,101);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,102);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,103);

  PERFORM binding.unbind_cutoff_and_stocktake(_test_cutoff_id, _test_stocktake_id);
  SELECT cutoff_id FROM binding.cutoff_to_stocktake WHERE stocktake_id = _test_stocktake_id INTO _cutoff_id;
  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_cutoff_and_stocktake() OWNER TO postgres;

--
-- TOC entry 859 (class 1255 OID 88318)
-- Name: __binding__unbind_delivery_and_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_delivery_and_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _delivery_id bigint;
  _receipt_id bigint;
  _test_delivery_id CONSTANT bigint := 201;
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_delivery_and_receipt()';

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.delivery_to_receipt VALUES (201,101);
  INSERT INTO binding.delivery_to_receipt VALUES (202,102);
  INSERT INTO binding.delivery_to_receipt VALUES (203,103);

  PERFORM binding.unbind_delivery_and_receipt(_test_delivery_id, _test_receipt_id);
  SELECT delivery_id FROM binding.delivery_to_receipt WHERE receipt_id = _test_receipt_id INTO _delivery_id;
  PERFORM pgunit.assert_null(_delivery_id, 'Incorrect _delivery_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_delivery_and_receipt() OWNER TO postgres;

--
-- TOC entry 860 (class 1255 OID 88319)
-- Name: __binding__unbind_demand_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_demand_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _picklist_id bigint;
  _test_demand_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_demand_and_picklist()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.demand_to_picklist VALUES (201,101);
  INSERT INTO binding.demand_to_picklist VALUES (202,102);
  INSERT INTO binding.demand_to_picklist VALUES (203,103);

  PERFORM binding.unbind_demand_and_picklist(_test_demand_id, _test_picklist_id);
  SELECT demand_id FROM binding.demand_to_picklist WHERE picklist_id = _test_picklist_id INTO _demand_id;
  PERFORM pgunit.assert_null(_demand_id, 'Incorrect _demand_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_demand_and_picklist() OWNER TO postgres;

--
-- TOC entry 861 (class 1255 OID 88320)
-- Name: __binding__unbind_demand_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_demand_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
  _reserve_id bigint;
  _test_demand_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_demand_and_reserve()';

  INSERT INTO demand.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.demand_to_reserve VALUES (201,101);
  INSERT INTO binding.demand_to_reserve VALUES (202,102);
  INSERT INTO binding.demand_to_reserve VALUES (203,103);

  PERFORM binding.unbind_demand_and_reserve(_test_demand_id, _test_reserve_id);
  SELECT demand_id FROM binding.demand_to_reserve WHERE reserve_id = _test_reserve_id INTO _demand_id;
  PERFORM pgunit.assert_null(_demand_id, 'Incorrect _demand_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_demand_and_reserve() OWNER TO postgres;

--
-- TOC entry 862 (class 1255 OID 88321)
-- Name: __binding__unbind_goal_and_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_goal_and_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _demand_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_goal_and_demand()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_demand VALUES (201,101);
  INSERT INTO binding.goal_to_demand VALUES (202,102);
  INSERT INTO binding.goal_to_demand VALUES (203,103);

  PERFORM binding.unbind_goal_and_demand(_test_goal_id, _test_demand_id);
  SELECT goal_id FROM binding.goal_to_demand WHERE demand_id = _test_demand_id INTO _goal_id;
  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_goal_and_demand() OWNER TO postgres;

--
-- TOC entry 863 (class 1255 OID 88322)
-- Name: __binding__unbind_goal_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_goal_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _despatch_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_goal_and_despatch()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_despatch VALUES (201,101);
  INSERT INTO binding.goal_to_despatch VALUES (202,102);
  INSERT INTO binding.goal_to_despatch VALUES (203,103);

  PERFORM binding.unbind_goal_and_despatch(_test_goal_id, _test_despatch_id);
  SELECT goal_id FROM binding.goal_to_despatch WHERE despatch_id = _test_despatch_id INTO _goal_id;
  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_goal_and_despatch() OWNER TO postgres;

--
-- TOC entry 864 (class 1255 OID 88323)
-- Name: __binding__unbind_goal_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_goal_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _issue_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_goal_and_issue()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_issue VALUES (201,101);
  INSERT INTO binding.goal_to_issue VALUES (202,102);
  INSERT INTO binding.goal_to_issue VALUES (203,103);

  PERFORM binding.unbind_goal_and_issue(_test_goal_id, _test_issue_id);
  SELECT goal_id FROM binding.goal_to_issue WHERE issue_id = _test_issue_id INTO _goal_id;
  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_goal_and_issue() OWNER TO postgres;

--
-- TOC entry 865 (class 1255 OID 88324)
-- Name: __binding__unbind_goal_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_goal_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _picklist_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_goal_and_picklist()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_picklist VALUES (201,101);
  INSERT INTO binding.goal_to_picklist VALUES (202,102);
  INSERT INTO binding.goal_to_picklist VALUES (203,103);

  PERFORM binding.unbind_goal_and_picklist(_test_goal_id, _test_picklist_id);
  SELECT goal_id FROM binding.goal_to_picklist WHERE picklist_id = _test_picklist_id INTO _goal_id;
  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_goal_and_picklist() OWNER TO postgres;

--
-- TOC entry 866 (class 1255 OID 88325)
-- Name: __binding__unbind_goal_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_goal_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _reserve_id bigint;
  _test_goal_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_goal_and_reserve()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.goal_to_reserve VALUES (201,101);
  INSERT INTO binding.goal_to_reserve VALUES (202,102);
  INSERT INTO binding.goal_to_reserve VALUES (203,103);

  PERFORM binding.unbind_goal_and_reserve(_test_goal_id, _test_reserve_id);
  SELECT goal_id FROM binding.goal_to_reserve WHERE reserve_id = _test_reserve_id INTO _goal_id;
  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_goal_and_reserve() OWNER TO postgres;

--
-- TOC entry 867 (class 1255 OID 88326)
-- Name: __binding__unbind_issue_and_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_issue_and_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _adjustmentcredit_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_issue_and_adjustmentcredit()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.issue_to_adjustmentcredit VALUES (203,103);

  PERFORM binding.unbind_issue_and_adjustmentcredit(_test_issue_id, _test_adjustmentcredit_id);
  SELECT issue_id FROM binding.issue_to_adjustmentcredit WHERE adjustmentcredit_id = _test_adjustmentcredit_id INTO _issue_id;
  PERFORM pgunit.assert_null(_issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_issue_and_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 868 (class 1255 OID 88327)
-- Name: __binding__unbind_issue_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_issue_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _despatch_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_issue_and_despatch()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_despatch VALUES (201,101);
  INSERT INTO binding.issue_to_despatch VALUES (202,102);
  INSERT INTO binding.issue_to_despatch VALUES (203,103);

  PERFORM binding.unbind_issue_and_despatch(_test_issue_id, _test_despatch_id);
  SELECT issue_id FROM binding.issue_to_despatch WHERE despatch_id = _test_despatch_id INTO _issue_id;
  PERFORM pgunit.assert_null(_issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_issue_and_despatch() OWNER TO postgres;

--
-- TOC entry 869 (class 1255 OID 88328)
-- Name: __binding__unbind_issue_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_issue_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _rebound_id bigint;
  _test_issue_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_issue_and_rebound()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.issue_to_rebound VALUES (201,101);
  INSERT INTO binding.issue_to_rebound VALUES (202,102);
  INSERT INTO binding.issue_to_rebound VALUES (203,103);

  PERFORM binding.unbind_issue_and_rebound(_test_issue_id, _test_rebound_id);
  SELECT issue_id FROM binding.issue_to_rebound WHERE rebound_id = _test_rebound_id INTO _issue_id;
  PERFORM pgunit.assert_null(_issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_issue_and_rebound() OWNER TO postgres;

--
-- TOC entry 870 (class 1255 OID 88329)
-- Name: __binding__unbind_picklist_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_picklist_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _picklist_id bigint;
  _issue_id bigint;
  _test_picklist_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_picklist_and_issue()';

  INSERT INTO picklist.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.picklist_to_issue VALUES (201,101);
  INSERT INTO binding.picklist_to_issue VALUES (202,102);
  INSERT INTO binding.picklist_to_issue VALUES (203,103);

  PERFORM binding.unbind_picklist_and_issue(_test_picklist_id, _test_issue_id);
  SELECT picklist_id FROM binding.picklist_to_issue WHERE issue_id = _test_issue_id INTO _picklist_id;
  PERFORM pgunit.assert_null(_picklist_id, 'Incorrect _picklist_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_picklist_and_issue() OWNER TO postgres;

--
-- TOC entry 871 (class 1255 OID 88330)
-- Name: __binding__unbind_receipt_and_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_receipt_and_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _adjustmentdebit_id bigint;
  _test_receipt_id CONSTANT bigint := 201;
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_receipt_and_adjustmentdebit()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (203,103);

  PERFORM binding.unbind_receipt_and_adjustmentdebit(_test_receipt_id, _test_adjustmentdebit_id);
  SELECT receipt_id FROM binding.receipt_to_adjustmentdebit WHERE adjustmentdebit_id = _test_adjustmentdebit_id INTO _receipt_id;
  PERFORM pgunit.assert_null(_receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_receipt_and_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 872 (class 1255 OID 88331)
-- Name: __binding__unbind_receipt_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_receipt_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _rebound_id bigint;
  _test_receipt_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_receipt_and_rebound()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_rebound VALUES (201,101);
  INSERT INTO binding.receipt_to_rebound VALUES (202,102);
  INSERT INTO binding.receipt_to_rebound VALUES (203,103);

  PERFORM binding.unbind_receipt_and_rebound(_test_receipt_id, _test_rebound_id);
  SELECT receipt_id FROM binding.receipt_to_rebound WHERE rebound_id = _test_rebound_id INTO _receipt_id;
  PERFORM pgunit.assert_null(_receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__unbind_receipt_and_rebound() OWNER TO postgres;

--
-- TOC entry 873 (class 1255 OID 88332)
-- Name: __common__get_cutoff_mode(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_cutoff_mode() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_policy common.cutoff_mode;
  _test_cutoff_policy CONSTANT common.cutoff_mode := 'ENFORCING'::common.cutoff_mode;
BEGIN
  
  RAISE DEBUG '#trace Check __common__get_cutoff_mode()';

  TRUNCATE TABLE common.cutoff_policy;

  INSERT INTO common.cutoff_policy VALUES ('ISSUE', 'ENFORCING');

  _cutoff_policy := common.get_cutoff_mode('ISSUE');

  PERFORM pgunit.assert_equals(_test_cutoff_policy, _cutoff_policy, 'Incorrect _cutoff_policy value');

END;
$$;


ALTER FUNCTION tests.__common__get_cutoff_mode() OWNER TO postgres;

--
-- TOC entry 874 (class 1255 OID 88333)
-- Name: __common__get_document_abbrevation(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_document_abbrevation() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _abbrevation character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __common__get_document_abbrevation()';
  
  _abbrevation := common.get_document_abbrevation('ISSUE');
  PERFORM pgunit.assert_equals('GIN', _abbrevation, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__common__get_document_abbrevation() OWNER TO postgres;

--
-- TOC entry 875 (class 1255 OID 88334)
-- Name: __common__get_document_head_types(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_document_head_types() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_head_types CONSTANT common.document_type[] := ARRAY['ISSUE', 'RECEIPT']::common.document_type[];
  _document_head_types common.document_type[];
BEGIN
  
  RAISE DEBUG '#trace Check __common__get_document_head_types()';

  TRUNCATE TABLE common.cutoff_policy;
  INSERT INTO common.cutoff_policy VALUES ('ISSUE', 'PERMISSIVE');
  INSERT INTO common.cutoff_policy VALUES ('RECEIPT', 'PERMISSIVE');
  INSERT INTO common.cutoff_policy VALUES ('DEMAND', 'ENFORCING');
  
  _document_head_types := common.get_document_head_types('PERMISSIVE');
  PERFORM pgunit.assert_array_equals(_test_document_head_types, _document_head_types, 'Incorrect _document_head_types value');

END;
$$;


ALTER FUNCTION tests.__common__get_document_head_types() OWNER TO postgres;

--
-- TOC entry 876 (class 1255 OID 88335)
-- Name: __common__get_stocktake_mode(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_stocktake_mode() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_policy common.cutoff_mode;
  _test_cutoff_policy CONSTANT common.cutoff_mode := 'ENFORCING'::common.cutoff_mode;
BEGIN
  
  RAISE DEBUG '#trace Check __common__get_stocktake_mode()';

  TRUNCATE TABLE common.stocktake_policy;

  INSERT INTO common.stocktake_policy VALUES ('ISSUE', 'ENFORCING');

  _cutoff_policy := common.get_stocktake_mode('ISSUE');

  PERFORM pgunit.assert_equals(_test_cutoff_policy, _cutoff_policy, 'Incorrect _cutoff_policy value');

END;
$$;


ALTER FUNCTION tests.__common__get_stocktake_mode() OWNER TO postgres;

--
-- TOC entry 878 (class 1255 OID 88336)
-- Name: __common__remake_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__remake_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head_in CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','B1','A1','PROPOSED','DEMAND','2017-02-01'))]::common.document_head[];
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __common__remake_head()';
  
  _head := common.remake_head(
      __head := _test_head_in[1],
      __document_id := 100::bigint,
      __gid := 'e2a05252-0503-11e7-aec1-d4bed939923a'::uuid,
      __display_name := 'NEWNAME'::character varying,
      __create_date := '2017-03-01'::date,
      __ship_to := 'D1'::character varying,
      __ship_from := 'E1'::character varying,
      __curr_transition := 'COMMITTED'::common.document_transition,
      __doctype := 'ISSUE'::common.document_type,
      __due_date := '2017-04-01'::date);
  PERFORM pgunit.assert_equals(100::bigint, _head.document_id, 'Incorrect document_id value');
  PERFORM pgunit.assert_equals('e2a05252-0503-11e7-aec1-d4bed939923a'::uuid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals('NEWNAME'::character varying, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals('2017-03-01'::date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals('D1'::character varying, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals('E1'::character varying, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals('ISSUE'::common.document_type, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals('COMMITTED'::common.document_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals('2017-04-01'::date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__common__remake_head() OWNER TO postgres;

--
-- TOC entry 879 (class 1255 OID 88337)
-- Name: __cutoff__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__destroy()';

  INSERT INTO cutoff.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM cutoff.destroy(101); -- + add not allowed delete test
  
  SELECT id FROM cutoff.registry WHERE id = 101 INTO _cutoff_id;

  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__cutoff__destroy() OWNER TO postgres;

--
-- TOC entry 880 (class 1255 OID 88338)
-- Name: __cutoff__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := cutoff.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('CUT-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__cutoff__generate_display_name() OWNER TO postgres;

--
-- TOC entry 881 (class 1255 OID 88339)
-- Name: __cutoff__get_all_comitted(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__get_all_comitted() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_cutoff_ids CONSTANT bigint[] := ARRAY[101, 102]::bigint[];
  _cutoff_ids bigint[];
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__get_all_comitted()';

  INSERT INTO cutoff.registry VALUES (101, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-01', '2017-02-01', NULL, '2017-02-01', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (102, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-02', '2017-02-02', NULL, '2017-02-02', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (103, 'a4e3ee18-082f-11e7-8a43-d4bed939923a', 'CUTOFF-03', '2017-02-02', NULL, '2017-02-02', 'B1', 'DECOMMITTED', '2017-02-04 22:46:51.810833+02', 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _cutoff_ids := cutoff.get_all_comitted('B1');
  PERFORM pgunit.assert_array_equals(_test_cutoff_ids, _cutoff_ids, 'Incorrect _cutoff_ids value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_all_comitted() OWNER TO postgres;

--
-- TOC entry 882 (class 1255 OID 88340)
-- Name: __cutoff__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__get_gid_by_id()';

  INSERT INTO cutoff.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := cutoff.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 883 (class 1255 OID 88341)
-- Name: __cutoff__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__get_id_by_gid()';

  INSERT INTO cutoff.registry VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, '2017-03-02', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := cutoff.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 877 (class 1255 OID 88342)
-- Name: __cutoff__get_last_cutoff_date(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__get_last_cutoff_date() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_date_a1 CONSTANT date := '2017-02-01';
  _test_date_b1 CONSTANT date := '2017-01-01';
  _date_a1 date;
  _date_b1 date;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__get_last_cutoff_date()';

  INSERT INTO schedule.calendar VALUES ('2017-01-01',1,1,1,1);
  INSERT INTO schedule.calendar VALUES ('2017-01-02',2,1,2,1);
  INSERT INTO cutoff.registry VALUES (101, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, '2017-02-01', 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.registry VALUES (102, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-02-02', NULL, '2017-02-02', 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');

  _date_a1 := cutoff.get_last_cutoff_date('A1');
  _date_b1 := cutoff.get_last_cutoff_date('B1');
  PERFORM pgunit.assert_equals(_test_date_a1, _date_a1, 'Incorrect _date_a1 value');
  PERFORM pgunit.assert_equals(_test_date_b1, _date_b1, 'Incorrect _date_b1 value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_last_cutoff_date() OWNER TO postgres;

--
-- TOC entry 884 (class 1255 OID 88343)
-- Name: __cutoff__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__numerator_nextval()';

  INSERT INTO cutoff.numerator VALUES ('A1', 1, 100);
  INSERT INTO cutoff.numerator VALUES ('A1', 2, 10);
  INSERT INTO cutoff.numerator VALUES ('B1', 1, 200);

  _numerator := cutoff.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := cutoff.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__cutoff__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 885 (class 1255 OID 88344)
-- Name: __delivery__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__destroy()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM delivery.destroy(101); -- + add not allowed delete test
  
  _head := delivery.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := delivery.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__delivery__destroy() OWNER TO postgres;

--
-- TOC entry 886 (class 1255 OID 88345)
-- Name: __delivery__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := delivery.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GDL-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__delivery__generate_display_name() OWNER TO postgres;

--
-- TOC entry 887 (class 1255 OID 88346)
-- Name: __delivery__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_body()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO delivery.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO delivery.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO delivery.body VALUES (103, 'good3', 3.0, 'm');

  _body := delivery.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_body() OWNER TO postgres;

--
-- TOC entry 888 (class 1255 OID 88347)
-- Name: __delivery__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_gid_by_id()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := delivery.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 889 (class 1255 OID 88348)
-- Name: __delivery__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DELIVERY'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := delivery.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := delivery.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := delivery.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head() OWNER TO postgres;

--
-- TOC entry 890 (class 1255 OID 88349)
-- Name: __delivery__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DELIVERY'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head_batch()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := delivery.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head_batch() OWNER TO postgres;

--
-- TOC entry 891 (class 1255 OID 88350)
-- Name: __delivery__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DELIVERY'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head_batch_proposed()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := delivery.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 893 (class 1255 OID 88351)
-- Name: __delivery__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_id_by_gid()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := delivery.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 894 (class 1255 OID 88352)
-- Name: __delivery__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DELIVERY-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__init()';
  
  _document_id := delivery.init(_test_head[1], _test_body);
  _head := delivery.get_head(_document_id);
  _body := delivery.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__delivery__init() OWNER TO postgres;

--
-- TOC entry 895 (class 1255 OID 88353)
-- Name: __delivery__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__numerator_nextval()';

  INSERT INTO delivery.numerator VALUES ('A1', 1, 100);
  INSERT INTO delivery.numerator VALUES ('A1', 2, 10);
  INSERT INTO delivery.numerator VALUES ('B1', 1, 200);

  _numerator := delivery.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := delivery.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__delivery__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 896 (class 1255 OID 88354)
-- Name: __delivery__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DELIVERY-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__reinit()';
  
  _document_id := delivery.init(_test_head[1], _test_body_init);
  PERFORM delivery.reinit(_document_id, _test_body_reinit);
  _head := delivery.get_head(_document_id);
  _body := delivery.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__delivery__reinit() OWNER TO postgres;

--
-- TOC entry 897 (class 1255 OID 88355)
-- Name: __demand__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__destroy()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM demand.destroy(101); -- + add not allowed delete test
  
  _head := demand.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := demand.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__demand__destroy() OWNER TO postgres;

--
-- TOC entry 1011 (class 1255 OID 88356)
-- Name: __demand__do_commit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__do_commit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _transition_01 goal.goal_transition;
  _transition_02 goal.goal_transition;
  _transition_03 goal.goal_transition;
  _goal_id_01 bigint;
  _goal_id_02 bigint;
  _goal_id_03 bigint;
  _reserve_id_01 bigint;
  _reserve_id_02 bigint;
  _reserve_id_03 bigint;
  _test_transition_01 CONSTANT goal.goal_transition := 'ACCEPTED'::goal.goal_transition;
  _test_transition_02 CONSTANT goal.goal_transition := 'ADVISED'::goal.goal_transition;
  _test_transition_03 CONSTANT goal.goal_transition := 'REJECTED'::goal.goal_transition;
  --_body common.document_body[];
  --_test_body CONSTANT common.document_body[] := ARRAY[('good1', 100.0, 'm'), ('good2', 100.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __demand__do_comit()';

  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);

  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 100, 0, 0, 0, 0);

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-02', NULL, '2017-01-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO demand.body VALUES (101, 'good1', 50.0, 'm');
  INSERT INTO demand.body VALUES (101, 'good2', 50.0, 'm');
  INSERT INTO demand.body VALUES (102, 'good1', 150.0, 'm');
  INSERT INTO demand.body VALUES (102, 'good2', 150.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good3', 100.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good4', 100.0, 'm');

  PERFORM demand.do_commit(101, true);
  PERFORM demand.do_commit(102, true);
  PERFORM demand.do_commit(103, true);
  _goal_id_01 := binding.get_goal_binded_to_demand(101);
  _goal_id_02 := binding.get_goal_binded_to_demand(102);
  _goal_id_03 := binding.get_goal_binded_to_demand(103);
  _transition_01 := goal.get_curr_transition(_goal_id_01);
  _transition_02 := goal.get_curr_transition(_goal_id_02);
  _transition_03 := goal.get_curr_transition(_goal_id_03);
  _reserve_id_01 := binding.get_reserve_binded_to_demand(101);
  _reserve_id_02 := binding.get_reserve_binded_to_demand(102);
  _reserve_id_03 := binding.get_reserve_binded_to_demand(103);
  PERFORM pgunit.assert_equals(_test_transition_01, _transition_01, 'Incorrect _transition_01 value');
  PERFORM pgunit.assert_equals(_test_transition_02, _transition_02, 'Incorrect _transition_02 value');
  PERFORM pgunit.assert_equals(_test_transition_03, _transition_03, 'Incorrect _transition_03 value');
  PERFORM pgunit.assert_not_null(_reserve_id_01, 'Incorrect _reserve_id_01 value');
  PERFORM pgunit.assert_null(_reserve_id_02, 'Incorrect _reserve_id_02 value');
  PERFORM pgunit.assert_null(_reserve_id_03, 'Incorrect _reserve_id_03 value');

END;
$$;


ALTER FUNCTION tests.__demand__do_commit() OWNER TO postgres;

--
-- TOC entry 898 (class 1255 OID 88357)
-- Name: __demand__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := demand.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GDD-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__demand__generate_display_name() OWNER TO postgres;

--
-- TOC entry 899 (class 1255 OID 88358)
-- Name: __demand__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_body()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO demand.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good3', 3.0, 'm');

  _body := demand.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__demand__get_body() OWNER TO postgres;

--
-- TOC entry 900 (class 1255 OID 88359)
-- Name: __demand__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_gid_by_id()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := demand.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__demand__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 901 (class 1255 OID 88360)
-- Name: __demand__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DEMAND-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DEMAND'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_head()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := demand.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := demand.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := demand.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__demand__get_head() OWNER TO postgres;

--
-- TOC entry 902 (class 1255 OID 88361)
-- Name: __demand__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DEMAND-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DEMAND'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_head_batch()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := demand.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__demand__get_head_batch() OWNER TO postgres;

--
-- TOC entry 903 (class 1255 OID 88362)
-- Name: __demand__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DEMAND-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DEMAND'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_head_batch_proposed()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := demand.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__demand__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 904 (class 1255 OID 88363)
-- Name: __demand__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_id_by_gid()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := demand.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__demand__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 905 (class 1255 OID 88364)
-- Name: __demand__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','B1','A1','PROPOSED','DEMAND','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__init()';
  
  _document_id := demand.init(_test_head[1], _test_body);
  _head := demand.get_head(_document_id);
  _body := demand.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__demand__init() OWNER TO postgres;

--
-- TOC entry 906 (class 1255 OID 88365)
-- Name: __demand__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __demand__numerator_nextval()';

  INSERT INTO demand.numerator VALUES ('A1', 1, 100);
  INSERT INTO demand.numerator VALUES ('A1', 2, 10);
  INSERT INTO demand.numerator VALUES ('B1', 1, 200);

  _numerator := demand.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := demand.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__demand__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 907 (class 1255 OID 88366)
-- Name: __demand__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','B1','A1','PROPOSED','DEMAND','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__reinit()';
  
  _document_id := demand.init(_test_head[1], _test_body_init);
  PERFORM demand.reinit(_document_id, _test_body_reinit);
  _head := demand.get_head(_document_id);
  _body := demand.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__demand__reinit() OWNER TO postgres;

--
-- TOC entry 908 (class 1255 OID 88367)
-- Name: __despatch__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__destroy()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM despatch.destroy(101); -- + add not allowed delete test
  
  _head := despatch.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := despatch.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__despatch__destroy() OWNER TO postgres;

--
-- TOC entry 909 (class 1255 OID 88368)
-- Name: __despatch__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := despatch.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GDN-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__despatch__generate_display_name() OWNER TO postgres;

--
-- TOC entry 910 (class 1255 OID 88369)
-- Name: __despatch__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_body()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO despatch.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO despatch.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO despatch.body VALUES (103, 'good3', 3.0, 'm');

  _body := despatch.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_body() OWNER TO postgres;

--
-- TOC entry 911 (class 1255 OID 88370)
-- Name: __despatch__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_gid_by_id()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := despatch.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 912 (class 1255 OID 88371)
-- Name: __despatch__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DESPATCH-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DESPATCH'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_head()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := despatch.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := despatch.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := despatch.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_head() OWNER TO postgres;

--
-- TOC entry 913 (class 1255 OID 88372)
-- Name: __despatch__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DESPATCH-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DESPATCH'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_head_batch()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := despatch.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_head_batch() OWNER TO postgres;

--
-- TOC entry 914 (class 1255 OID 88373)
-- Name: __despatch__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DESPATCH-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'DESPATCH'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_head_batch_proposed()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := despatch.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 915 (class 1255 OID 88374)
-- Name: __despatch__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_id_by_gid()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := despatch.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 916 (class 1255 OID 88375)
-- Name: __despatch__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DESPATCH-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__init()';
  
  _document_id := despatch.init(_test_head[1], _test_body);
  _head := despatch.get_head(_document_id);
  _body := despatch.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__despatch__init() OWNER TO postgres;

--
-- TOC entry 917 (class 1255 OID 88376)
-- Name: __despatch__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__numerator_nextval()';

  INSERT INTO despatch.numerator VALUES ('A1', 1, 100);
  INSERT INTO despatch.numerator VALUES ('A1', 2, 10);
  INSERT INTO despatch.numerator VALUES ('B1', 1, 200);

  _numerator := despatch.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := despatch.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__despatch__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 918 (class 1255 OID 88377)
-- Name: __despatch__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DESPATCH-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__reinit()';
  
  _document_id := despatch.init(_test_head[1], _test_body_init);
  PERFORM despatch.reinit(_document_id, _test_body_reinit);
  _head := despatch.get_head(_document_id);
  _body := despatch.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__despatch__reinit() OWNER TO postgres;

--
-- TOC entry 919 (class 1255 OID 88378)
-- Name: __goal__analyze_ability(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__analyze_ability() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _transition_01 goal.goal_transition;
  _transition_02 goal.goal_transition;
  _transition_03 goal.goal_transition;
  _test_transition_01 CONSTANT goal.goal_transition := 'ACCEPTED'::goal.goal_transition;
  _test_transition_02 CONSTANT goal.goal_transition := 'ADVISED'::goal.goal_transition;
  _test_transition_03 CONSTANT goal.goal_transition := 'REJECTED'::goal.goal_transition;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__analyze_ability()';

  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 100, 0, 0, 0, 0);

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO demand.body VALUES (101, 'good1', 100.0, 'm');
  INSERT INTO demand.body VALUES (101, 'good2', 100.0, 'm');
  INSERT INTO demand.body VALUES (102, 'good1', 150.0, 'm');
  INSERT INTO demand.body VALUES (102, 'good2', 150.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good3', 100.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good4', 100.0, 'm');

  _transition_01 := goal.analyze_ability(101);
  _transition_02 := goal.analyze_ability(102);
  _transition_03 := goal.analyze_ability(103);
  PERFORM pgunit.assert_equals(_test_transition_01, _transition_01, 'Incorrect _transition_01 value');
  PERFORM pgunit.assert_equals(_test_transition_02, _transition_02, 'Incorrect _transition_02 value');
  PERFORM pgunit.assert_equals(_test_transition_03, _transition_03, 'Incorrect _transition_03 value');

END;
$$;


ALTER FUNCTION tests.__goal__analyze_ability() OWNER TO postgres;

--
-- TOC entry 920 (class 1255 OID 88379)
-- Name: __goal__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__destroy()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM goal.destroy(201); -- + add not allowed delete test
  
  SELECT id FROM goal.registry WHERE id = 201 INTO _goal_id;

  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__goal__destroy() OWNER TO postgres;

--
-- TOC entry 921 (class 1255 OID 88380)
-- Name: __goal__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := goal.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GOL-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__goal__generate_display_name() OWNER TO postgres;

--
-- TOC entry 922 (class 1255 OID 88381)
-- Name: __goal__get_curr_transition(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__get_curr_transition() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_trasition goal.goal_transition;
  _test_goal_trasition CONSTANT goal.goal_transition := 'COMMITTED'::goal.goal_transition;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__get_curr_transition()';

  INSERT INTO goal.registry VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.registry VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _goal_trasition :=  goal.get_curr_transition(202);

  PERFORM pgunit.assert_equals(_test_goal_trasition, _goal_trasition, 'Incorrect _goal_trasition value');

END;
$$;


ALTER FUNCTION tests.__goal__get_curr_transition() OWNER TO postgres;

--
-- TOC entry 923 (class 1255 OID 88382)
-- Name: __goal__give_advise(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__give_advise() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1', 100.0, 'm'), ('good2', 100.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __goal__give_advise()';

  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 100, 0, 0, 0, 0);

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO demand.body VALUES (101, 'good1', 100.0, 'm');
  INSERT INTO demand.body VALUES (101, 'good2', 100.0, 'm');
  INSERT INTO demand.body VALUES (102, 'good1', 150.0, 'm');
  INSERT INTO demand.body VALUES (102, 'good2', 150.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good3', 100.0, 'm');
  INSERT INTO demand.body VALUES (103, 'good4', 100.0, 'm');

  _body := goal.give_advise(102);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__goal__give_advise() OWNER TO postgres;

--
-- TOC entry 924 (class 1255 OID 88383)
-- Name: __goal__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __goal__numerator_nextval()';

  INSERT INTO goal.numerator VALUES ('A1', 1, 100);
  INSERT INTO goal.numerator VALUES ('A1', 2, 10);
  INSERT INTO goal.numerator VALUES ('B1', 1, 200);

  _numerator := goal.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := goal.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__goal__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 925 (class 1255 OID 88384)
-- Name: __issue__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__destroy()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM issue.destroy(101); -- + add not allowed delete test
  
  _head := issue.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := issue.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__issue__destroy() OWNER TO postgres;

--
-- TOC entry 926 (class 1255 OID 88385)
-- Name: __issue__do_commit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__do_commit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _despatch_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__do_comit()';

  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 50, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 100, 50, 0, 0, 0);

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO issue.body VALUES (101, 'good1', 50.0, 'm');
  INSERT INTO issue.body VALUES (101, 'good2', 50.0, 'm');

  PERFORM issue.do_commit(101, true);
  _goal_id := binding.get_goal_binded_to_issue(101);
  _despatch_id := binding.get_despatch_binded_to_goal(_goal_id);

  PERFORM pgunit.assert_not_null(_goal_id, 'Incorrect _goal_id value');
  PERFORM pgunit.assert_not_null(_despatch_id, 'Incorrect _despatch_id value');

END;
$$;


ALTER FUNCTION tests.__issue__do_commit() OWNER TO postgres;

--
-- TOC entry 892 (class 1255 OID 88386)
-- Name: __issue__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := issue.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GIN-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__issue__generate_display_name() OWNER TO postgres;

--
-- TOC entry 927 (class 1255 OID 88387)
-- Name: __issue__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_body()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO issue.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO issue.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO issue.body VALUES (103, 'good3', 3.0, 'm');

  _body := issue.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__issue__get_body() OWNER TO postgres;

--
-- TOC entry 928 (class 1255 OID 88388)
-- Name: __issue__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_gid_by_id()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := issue.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__issue__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 929 (class 1255 OID 88389)
-- Name: __issue__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ISSUE-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ISSUE'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_head()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := issue.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := issue.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := issue.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__issue__get_head() OWNER TO postgres;

--
-- TOC entry 930 (class 1255 OID 88390)
-- Name: __issue__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ISSUE-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ISSUE'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_head_batch()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := issue.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__issue__get_head_batch() OWNER TO postgres;

--
-- TOC entry 931 (class 1255 OID 88391)
-- Name: __issue__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ISSUE-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'ISSUE'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_head_batch_proposed()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := issue.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__issue__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 932 (class 1255 OID 88392)
-- Name: __issue__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_id_by_gid()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := issue.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__issue__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 933 (class 1255 OID 88393)
-- Name: __issue__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ISSUE-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__init()';
  
  _document_id := issue.init(_test_head[1], _test_body);
  _head := issue.get_head(_document_id);
  _body := issue.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__issue__init() OWNER TO postgres;

--
-- TOC entry 934 (class 1255 OID 88394)
-- Name: __issue__make_adjustment(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__make_adjustment() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _adjustment_id bigint;
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __issue__make_adjustment()';

  INSERT INTO schedule.calendar VALUES (now()::date, 8, 7, 6, 5);

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO issue.body VALUES (101, 'good2', 2.0, 'm');
  INSERT INTO issue.body VALUES (101, 'good3', 3.0, 'm');

  UPDATE issue.head SET curr_transition = 'COMMITTED' WHERE id = 101;

  PERFORM issue.make_adjustment(101);
  _adjustment_id := binding.get_adjustmentcredit_binded_to_issue(101);
  _body := adjustmentcredit.get_body(_adjustment_id);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__issue__make_adjustment() OWNER TO postgres;

--
-- TOC entry 935 (class 1255 OID 88395)
-- Name: __issue__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __issue__numerator_nextval()';

  INSERT INTO issue.numerator VALUES ('A1', 1, 100);
  INSERT INTO issue.numerator VALUES ('A1', 2, 10);
  INSERT INTO issue.numerator VALUES ('B1', 1, 200);

  _numerator := issue.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := issue.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__issue__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 936 (class 1255 OID 88396)
-- Name: __issue__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ISSUE-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__reinit()';
  
  _document_id := issue.init(_test_head[1], _test_body_init);
  PERFORM issue.reinit(_document_id, _test_body_reinit);
  _head := issue.get_head(_document_id);
  _body := issue.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__issue__reinit() OWNER TO postgres;

--
-- TOC entry 937 (class 1255 OID 88397)
-- Name: __picklist__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__destroy()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM picklist.destroy(101); -- + add not allowed delete test
  
  _head := picklist.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := picklist.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__picklist__destroy() OWNER TO postgres;

--
-- TOC entry 938 (class 1255 OID 88398)
-- Name: __picklist__do_commit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__do_commit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _issue_id bigint;
  _despatch_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__do_comit()';

  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 50, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 100, 50, 0, 0, 0);

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO picklist.body VALUES (101, 'good1', 50.0, 'm');
  INSERT INTO picklist.body VALUES (101, 'good2', 50.0, 'm');

  PERFORM picklist.do_commit(101, true);
  _goal_id := binding.get_goal_binded_to_picklist(101);
  _issue_id := binding.get_issue_binded_to_goal(_goal_id);
  _despatch_id := binding.get_despatch_binded_to_goal(_goal_id);

  PERFORM pgunit.assert_not_null(_goal_id, 'Incorrect _goal_id value');
  PERFORM pgunit.assert_not_null(_issue_id, 'Incorrect _issue_id value');
  PERFORM pgunit.assert_not_null(_despatch_id, 'Incorrect _despatch_id value');

END;
$$;


ALTER FUNCTION tests.__picklist__do_commit() OWNER TO postgres;

--
-- TOC entry 939 (class 1255 OID 88399)
-- Name: __picklist__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := picklist.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GPL-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__picklist__generate_display_name() OWNER TO postgres;

--
-- TOC entry 940 (class 1255 OID 88400)
-- Name: __picklist__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_body()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO picklist.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO picklist.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO picklist.body VALUES (103, 'good3', 3.0, 'm');

  _body := picklist.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_body() OWNER TO postgres;

--
-- TOC entry 941 (class 1255 OID 88401)
-- Name: __picklist__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_gid_by_id()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := picklist.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 942 (class 1255 OID 88402)
-- Name: __picklist__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'PICKLIST-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'PICKLIST'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_head()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := picklist.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := picklist.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := picklist.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_head() OWNER TO postgres;

--
-- TOC entry 943 (class 1255 OID 88403)
-- Name: __picklist__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'PICKLIST-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'PICKLIST'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_head_batch()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := picklist.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_head_batch() OWNER TO postgres;

--
-- TOC entry 944 (class 1255 OID 88404)
-- Name: __picklist__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'PICKLIST-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'PICKLIST'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_head_batch_proposed()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := picklist.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 945 (class 1255 OID 88405)
-- Name: __picklist__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_id_by_gid()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := picklist.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 946 (class 1255 OID 88406)
-- Name: __picklist__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','PICKLIST-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__init()';
  
  _document_id := picklist.init(_test_head[1], _test_body);
  _head := picklist.get_head(_document_id);
  _body := picklist.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__picklist__init() OWNER TO postgres;

--
-- TOC entry 947 (class 1255 OID 88407)
-- Name: __picklist__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__numerator_nextval()';

  INSERT INTO picklist.numerator VALUES ('A1', 1, 100);
  INSERT INTO picklist.numerator VALUES ('A1', 2, 10);
  INSERT INTO picklist.numerator VALUES ('B1', 1, 200);

  _numerator := picklist.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := picklist.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__picklist__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 948 (class 1255 OID 88408)
-- Name: __picklist__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','PICKLIST-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__reinit()';
  
  _document_id := picklist.init(_test_head[1], _test_body_init);
  PERFORM picklist.reinit(_document_id, _test_body_reinit);
  _head := picklist.get_head(_document_id);
  _body := picklist.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__picklist__reinit() OWNER TO postgres;

--
-- TOC entry 949 (class 1255 OID 88409)
-- Name: __rebound__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__destroy()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM rebound.destroy(101); -- + add not allowed delete test
  
  _head := rebound.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := rebound.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__rebound__destroy() OWNER TO postgres;

--
-- TOC entry 950 (class 1255 OID 88410)
-- Name: __rebound__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := rebound.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GRB-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__rebound__generate_display_name() OWNER TO postgres;

--
-- TOC entry 951 (class 1255 OID 88411)
-- Name: __rebound__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_body()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO rebound.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good3', 3.0, 'm');

  _body := rebound.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_body() OWNER TO postgres;

--
-- TOC entry 952 (class 1255 OID 88412)
-- Name: __rebound__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_gid_by_id()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := rebound.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 953 (class 1255 OID 88413)
-- Name: __rebound__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'REBOUND-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'REBOUND'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_head()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := rebound.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := rebound.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := rebound.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head() OWNER TO postgres;

--
-- TOC entry 954 (class 1255 OID 88414)
-- Name: __rebound__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'REBOUND-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'REBOUND'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_head_batch()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := rebound.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head_batch() OWNER TO postgres;

--
-- TOC entry 955 (class 1255 OID 88415)
-- Name: __rebound__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'REBOUND-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'REBOUND'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_head_batch_proposed()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := rebound.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 956 (class 1255 OID 88416)
-- Name: __rebound__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_id_by_gid()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := rebound.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 957 (class 1255 OID 88417)
-- Name: __rebound__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','REBOUND-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__init()';
  
  _document_id := rebound.init(_test_head[1], _test_body);
  _head := rebound.get_head(_document_id);
  _body := rebound.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__rebound__init() OWNER TO postgres;

--
-- TOC entry 958 (class 1255 OID 88418)
-- Name: __rebound__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__numerator_nextval()';

  INSERT INTO rebound.numerator VALUES ('A1', 1, 100);
  INSERT INTO rebound.numerator VALUES ('A1', 2, 10);
  INSERT INTO rebound.numerator VALUES ('B1', 1, 200);

  _numerator := rebound.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := rebound.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__rebound__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 959 (class 1255 OID 88419)
-- Name: __rebound__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','REBOUND-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__reinit()';
  
  _document_id := rebound.init(_test_head[1], _test_body_init);
  PERFORM rebound.reinit(_document_id, _test_body_reinit);
  _head := rebound.get_head(_document_id);
  _body := rebound.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__rebound__reinit() OWNER TO postgres;

--
-- TOC entry 960 (class 1255 OID 88420)
-- Name: __receipt__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__destroy()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM receipt.destroy(101); -- + add not allowed delete test
  
  _head := receipt.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := receipt.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__receipt__destroy() OWNER TO postgres;

--
-- TOC entry 961 (class 1255 OID 88421)
-- Name: __receipt__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := receipt.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GRN-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__receipt__generate_display_name() OWNER TO postgres;

--
-- TOC entry 963 (class 1255 OID 88422)
-- Name: __receipt__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_body()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO receipt.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good3', 3.0, 'm');

  _body := receipt.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_body() OWNER TO postgres;

--
-- TOC entry 964 (class 1255 OID 88423)
-- Name: __receipt__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_gid_by_id()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := receipt.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 965 (class 1255 OID 88424)
-- Name: __receipt__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RECEIPT-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'RECEIPT'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_head()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := receipt.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := receipt.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := receipt.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head() OWNER TO postgres;

--
-- TOC entry 966 (class 1255 OID 88425)
-- Name: __receipt__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RECEIPT-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'RECEIPT'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_head_batch()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := receipt.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head_batch() OWNER TO postgres;

--
-- TOC entry 967 (class 1255 OID 88426)
-- Name: __receipt__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RECEIPT-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'RECEIPT'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_head_batch_proposed()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := receipt.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 968 (class 1255 OID 88427)
-- Name: __receipt__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_id_by_gid()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := receipt.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 969 (class 1255 OID 88428)
-- Name: __receipt__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RECEIPT-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__init()';
  
  _document_id := receipt.init(_test_head[1], _test_body);
  _head := receipt.get_head(_document_id);
  _body := receipt.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__receipt__init() OWNER TO postgres;

--
-- TOC entry 970 (class 1255 OID 88429)
-- Name: __receipt__make_adjustment(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__make_adjustment() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _adjustment_id bigint;
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__make_adjustment()';

  INSERT INTO schedule.calendar VALUES (now()::date, 8, 7, 6, 5);

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO receipt.body VALUES (101, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (101, 'good3', 3.0, 'm');

  UPDATE receipt.head SET curr_transition = 'COMMITTED' WHERE id = 101;

  PERFORM receipt.make_adjustment(101);
  _adjustment_id := binding.get_adjustmentdebit_binded_to_receipt(101);
  _body := adjustmentdebit.get_body(_adjustment_id);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__receipt__make_adjustment() OWNER TO postgres;

--
-- TOC entry 971 (class 1255 OID 88430)
-- Name: __receipt__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__numerator_nextval()';

  INSERT INTO receipt.numerator VALUES ('A1', 1, 100);
  INSERT INTO receipt.numerator VALUES ('A1', 2, 10);
  INSERT INTO receipt.numerator VALUES ('B1', 1, 200);

  _numerator := receipt.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := receipt.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__receipt__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 972 (class 1255 OID 88431)
-- Name: __receipt__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RECEIPT-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__reinit()';
  
  _document_id := receipt.init(_test_head[1], _test_body_init);
  PERFORM receipt.reinit(_document_id, _test_body_reinit);
  _head := receipt.get_head(_document_id);
  _body := receipt.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__receipt__reinit() OWNER TO postgres;

--
-- TOC entry 973 (class 1255 OID 88432)
-- Name: __reserve__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__destroy()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM reserve.destroy(101); -- + add not allowed delete test
  
  _head := reserve.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := reserve.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__reserve__destroy() OWNER TO postgres;

--
-- TOC entry 974 (class 1255 OID 88433)
-- Name: __reserve__do_commit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__do_commit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id_01 bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__do_comit()';

  INSERT INTO balance.balance VALUES ('A1', 'good1', 'm', 100, 0, 0, 0, 0);
  INSERT INTO balance.balance VALUES ('A1', 'good2', 'm', 100, 0, 0, 0, 0);

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO reserve.body VALUES (101, 'good1', 50.0, 'm');
  INSERT INTO reserve.body VALUES (101, 'good2', 50.0, 'm');

  -- reserve commited in standalone mode
  PERFORM reserve.do_commit(101, true);

  _demand_id_01 := binding.get_demand_binded_to_reserve(101);
  PERFORM pgunit.assert_null(_demand_id_01, 'Incorrect _demand_id_01 value');

END;
$$;


ALTER FUNCTION tests.__reserve__do_commit() OWNER TO postgres;

--
-- TOC entry 975 (class 1255 OID 88434)
-- Name: __reserve__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := reserve.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GRV-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__reserve__generate_display_name() OWNER TO postgres;

--
-- TOC entry 976 (class 1255 OID 88435)
-- Name: __reserve__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_body()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO reserve.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO reserve.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO reserve.body VALUES (103, 'good3', 3.0, 'm');

  _body := reserve.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_body() OWNER TO postgres;

--
-- TOC entry 977 (class 1255 OID 88436)
-- Name: __reserve__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_gid_by_id()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := reserve.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 978 (class 1255 OID 88437)
-- Name: __reserve__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RESERVE-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'RESERVE'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_head()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := reserve.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := reserve.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := reserve.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_head() OWNER TO postgres;

--
-- TOC entry 979 (class 1255 OID 88438)
-- Name: __reserve__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RESERVE-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'RESERVE'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_head_batch()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := reserve.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_head_batch() OWNER TO postgres;

--
-- TOC entry 980 (class 1255 OID 88439)
-- Name: __reserve__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RESERVE-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'RESERVE'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_head_batch_proposed()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := reserve.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 981 (class 1255 OID 88440)
-- Name: __reserve__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_id_by_gid()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := reserve.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 982 (class 1255 OID 88441)
-- Name: __reserve__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RESERVE-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__init()';
  
  _document_id := reserve.init(_test_head[1], _test_body);
  _head := reserve.get_head(_document_id);
  _body := reserve.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__reserve__init() OWNER TO postgres;

--
-- TOC entry 983 (class 1255 OID 88442)
-- Name: __reserve__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__numerator_nextval()';

  INSERT INTO reserve.numerator VALUES ('A1', 1, 100);
  INSERT INTO reserve.numerator VALUES ('A1', 2, 10);
  INSERT INTO reserve.numerator VALUES ('B1', 1, 200);

  _numerator := reserve.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := reserve.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__reserve__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 984 (class 1255 OID 88443)
-- Name: __reserve__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RESERVE-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__reinit()';
  
  _document_id := reserve.init(_test_head[1], _test_body_init);
  PERFORM reserve.reinit(_document_id, _test_body_reinit);
  _head := reserve.get_head(_document_id);
  _body := reserve.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__reserve__reinit() OWNER TO postgres;

--
-- TOC entry 985 (class 1255 OID 88444)
-- Name: __schedule__get_date_of_julianized_day(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __schedule__get_date_of_julianized_day() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _date_of_julianized_day date;
  _test_date_of_julianized_day CONSTANT date := '2017-01-01'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __schedule__get_date_of_julianized_day()';

  TRUNCATE TABLE schedule.calendar;

  INSERT INTO schedule.calendar VALUES ('2017-01-01', 4, 3, 2, 1);

  _date_of_julianized_day := schedule.get_date_of_julianized_day(2);

  PERFORM pgunit.assert_equals(_test_date_of_julianized_day, _date_of_julianized_day, 'Incorrect _date_of_julianized_day value');

END;
$$;


ALTER FUNCTION tests.__schedule__get_date_of_julianized_day() OWNER TO postgres;

--
-- TOC entry 986 (class 1255 OID 88445)
-- Name: __schedule__get_julianized_day(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __schedule__get_julianized_day() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _julianized_day integer;
  _test_julianized_day CONSTANT integer := 2;
BEGIN
  
  RAISE DEBUG '#trace Check __schedule__get_julianized_day()';

  TRUNCATE TABLE schedule.calendar;

  INSERT INTO schedule.calendar VALUES ('2017-01-01', 4, 3, 2, 1);

  _julianized_day := schedule.get_julianized_day('2017-01-01');

  PERFORM pgunit.assert_equals(_test_julianized_day, _julianized_day, 'Incorrect _julianized_day value');

END;
$$;


ALTER FUNCTION tests.__schedule__get_julianized_day() OWNER TO postgres;

--
-- TOC entry 987 (class 1255 OID 88446)
-- Name: __schedule__get_julianized_week(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __schedule__get_julianized_week() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _julianized_week integer;
  _test_julianized_week CONSTANT integer := 1;
BEGIN
  
  RAISE DEBUG '#trace Check __schedule__get_julianized_week()';

  TRUNCATE TABLE schedule.calendar;

  INSERT INTO schedule.calendar VALUES ('2017-01-01', 4, 3, 2, 1);

  _julianized_week := schedule.get_julianized_week('2017-01-01');

  PERFORM pgunit.assert_equals(_test_julianized_week, _julianized_week, 'Incorrect _julianized_week value');

END;
$$;


ALTER FUNCTION tests.__schedule__get_julianized_week() OWNER TO postgres;

--
-- TOC entry 988 (class 1255 OID 88447)
-- Name: __stockcard__assign_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__assign_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issued_qty_1 common.quantity;
  _issued_qty_2 common.quantity;
  _test_issued_qty_1 CONSTANT common.quantity := 2.0::common.quantity;
  _test_issued_qty_2 CONSTANT common.quantity := 3.0::common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__assign_issue()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO issue.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO issue.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO issue.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_issue(issue.get_head(103), issue.get_body(103));

  SELECT issued_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _issued_qty_1;
  SELECT issued_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _issued_qty_2;

  PERFORM pgunit.assert_equals(_test_issued_qty_1, _issued_qty_1, 'Incorrect _issued_qty_1 value');
  PERFORM pgunit.assert_equals(_test_issued_qty_2, _issued_qty_2, 'Incorrect _issued_qty_2 value');

  TRUNCATE TABLE stockcard.registry;

  PERFORM stockcard.assign_issue(103);

  SELECT issued_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _issued_qty_1;
  SELECT issued_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _issued_qty_2;

  PERFORM pgunit.assert_equals(_test_issued_qty_1, _issued_qty_1, 'Incorrect _issued_qty_1 value');
  PERFORM pgunit.assert_equals(_test_issued_qty_2, _issued_qty_2, 'Incorrect _issued_qty_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__assign_issue() OWNER TO postgres;

--
-- TOC entry 989 (class 1255 OID 88448)
-- Name: __stockcard__assign_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__assign_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _rebounded_qty_1 common.quantity;
  _rebounded_qty_2 common.quantity;
  _test_rebounded_qty_1 CONSTANT common.quantity := 2.0::common.quantity;
  _test_rebounded_qty_2 CONSTANT common.quantity := 3.0::common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__assign_rebound()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO rebound.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_rebound(rebound.get_head(103), rebound.get_body(103));

  SELECT rebounded_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _rebounded_qty_1;
  SELECT rebounded_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _rebounded_qty_2;

  PERFORM pgunit.assert_equals(_test_rebounded_qty_1, _rebounded_qty_1, 'Incorrect _rebounded_qty_1 value');
  PERFORM pgunit.assert_equals(_test_rebounded_qty_2, _rebounded_qty_2, 'Incorrect _rebounded_qty_2 value');

  TRUNCATE TABLE stockcard.registry;

  PERFORM stockcard.assign_rebound(103);

  SELECT rebounded_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _rebounded_qty_1;
  SELECT rebounded_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _rebounded_qty_2;

  PERFORM pgunit.assert_equals(_test_rebounded_qty_1, _rebounded_qty_1, 'Incorrect _rebounded_qty_1 value');
  PERFORM pgunit.assert_equals(_test_rebounded_qty_2, _rebounded_qty_2, 'Incorrect _rebounded_qty_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__assign_rebound() OWNER TO postgres;

--
-- TOC entry 990 (class 1255 OID 88449)
-- Name: __stockcard__assign_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__assign_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_qty_1 common.quantity;
  _receipt_qty_2 common.quantity;
  _test_receipt_qty_1 CONSTANT common.quantity := 2.0::common.quantity;
  _test_receipt_qty_2 CONSTANT common.quantity := 3.0::common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__assign_receipt()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO receipt.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_receipt(receipt.get_head(103), receipt.get_body(103));

  SELECT receipt_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _receipt_qty_1;
  SELECT receipt_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _receipt_qty_2;

  PERFORM pgunit.assert_equals(_test_receipt_qty_1, _receipt_qty_1, 'Incorrect _receipt_qty_1 value');
  PERFORM pgunit.assert_equals(_test_receipt_qty_2, _receipt_qty_2, 'Incorrect _receipt_qty_2 value');

  TRUNCATE TABLE stockcard.registry;

  PERFORM stockcard.assign_receipt(103);

  SELECT receipt_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _receipt_qty_1;
  SELECT receipt_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _receipt_qty_2;

  PERFORM pgunit.assert_equals(_test_receipt_qty_1, _receipt_qty_1, 'Incorrect _receipt_qty_1 value');
  PERFORM pgunit.assert_equals(_test_receipt_qty_2, _receipt_qty_2, 'Incorrect _receipt_qty_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__assign_receipt() OWNER TO postgres;

--
-- TOC entry 991 (class 1255 OID 88450)
-- Name: __stockcard__assign_stocktake(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__assign_stocktake() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _stocktake_qty_1 common.quantity;
  _stocktake_qty_2 common.quantity;
  _test_stocktake_qty_1 CONSTANT common.quantity := 2.0::common.quantity;
  _test_stocktake_qty_2 CONSTANT common.quantity := 3.0::common.quantity;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__assign_stocktake()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO stocktake.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_stocktake(stocktake.get_head(103), stocktake.get_body(103));

  SELECT stocktake_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _stocktake_qty_1;
  SELECT stocktake_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _stocktake_qty_2;

  PERFORM pgunit.assert_equals(_test_stocktake_qty_1, _stocktake_qty_1, 'Incorrect _stocktake_qty_1 value');
  PERFORM pgunit.assert_equals(_test_stocktake_qty_2, _stocktake_qty_2, 'Incorrect _stocktake_qty_2 value');

  TRUNCATE TABLE stockcard.registry;

  PERFORM stockcard.assign_stocktake(103);

  SELECT stocktake_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _stocktake_qty_1;
  SELECT stocktake_qty FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _stocktake_qty_2;

  PERFORM pgunit.assert_equals(_test_stocktake_qty_1, _stocktake_qty_1, 'Incorrect _stocktake_qty_1 value');
  PERFORM pgunit.assert_equals(_test_stocktake_qty_2, _stocktake_qty_2, 'Incorrect _stocktake_qty_2 value');



END;
$$;


ALTER FUNCTION tests.__stockcard__assign_stocktake() OWNER TO postgres;

--
-- TOC entry 992 (class 1255 OID 88451)
-- Name: __stockcard__deassign_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__deassign_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _records_cnt_1 integer;
  _records_cnt_2 integer;
  _test_records_cnt_1 CONSTANT integer := 0;
  _test_records_cnt_2 CONSTANT integer := 1;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__deassign_issue()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO issue.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO issue.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO issue.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE', 'ISSUE-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE', 'ISSUE-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE', 'ISSUE-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 

  PERFORM stockcard.deassign_issue(101);

  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_issue() OWNER TO postgres;

--
-- TOC entry 993 (class 1255 OID 88452)
-- Name: __stockcard__deassign_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__deassign_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _records_cnt_1 integer;
  _records_cnt_2 integer;
  _test_records_cnt_1 CONSTANT integer := 0;
  _test_records_cnt_2 CONSTANT integer := 1;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__deassign_rebound()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO rebound.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND', 'REBOUND-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND', 'REBOUND-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND', 'REBOUND-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 
  
  PERFORM stockcard.deassign_rebound(101);

  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_rebound() OWNER TO postgres;

--
-- TOC entry 994 (class 1255 OID 88453)
-- Name: __stockcard__deassign_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__deassign_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _records_cnt_1 integer;
  _records_cnt_2 integer;
  _test_records_cnt_1 CONSTANT integer := 0;
  _test_records_cnt_2 CONSTANT integer := 1;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__deassign_receipt()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO receipt.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT', 'RECEIPT-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT', 'RECEIPT-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT', 'RECEIPT-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 
  
  PERFORM stockcard.deassign_receipt(101);

  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_receipt() OWNER TO postgres;

--
-- TOC entry 995 (class 1255 OID 88454)
-- Name: __stockcard__deassign_stocktake(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stockcard__deassign_stocktake() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _records_cnt_1 integer;
  _records_cnt_2 integer;
  _test_records_cnt_1 CONSTANT integer := 0;
  _test_records_cnt_2 CONSTANT integer := 1;
BEGIN
  
  RAISE DEBUG '#trace Check __stockcard__deassign_stocktake()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO stocktake.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE', 'STOCKTAKE-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE', 'STOCKTAKE-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.registry (document_gid, document_type, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE', 'STOCKTAKE-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 
  
  
  PERFORM stockcard.deassign_stocktake(101);

  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.registry WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_stocktake() OWNER TO postgres;

--
-- TOC entry 996 (class 1255 OID 88455)
-- Name: __stocktake__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__destroy()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM stocktake.destroy(101); -- + add not allowed delete test
  
  _head := stocktake.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := stocktake.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__stocktake__destroy() OWNER TO postgres;

--
-- TOC entry 997 (class 1255 OID 88456)
-- Name: __stocktake__generate_display_name(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__generate_display_name() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _display_name character varying;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__generate_display_name()';
  
  INSERT INTO schedule.calendar VALUES ('2017-01-01', 1, 1, 1, 1);
  
  _display_name := stocktake.generate_display_name('2017-01-01', 'A1');
  PERFORM pgunit.assert_equals('GST-A1-AB1AA0', _display_name, 'Incorrect _abbrevation value');

END;
$$;


ALTER FUNCTION tests.__stocktake__generate_display_name() OWNER TO postgres;

--
-- TOC entry 998 (class 1255 OID 88457)
-- Name: __stocktake__get_body(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_body() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good2', 2.0, 'm'), ('good3', 3.0, 'm')]::common.document_body[];
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_body()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO stocktake.body VALUES (101, 'good1', 1.0, 'm', 0);
  INSERT INTO stocktake.body VALUES (103, 'good2', 2.0, 'm', 0);
  INSERT INTO stocktake.body VALUES (103, 'good3', 3.0, 'm', 0);

  _body := stocktake.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_body() OWNER TO postgres;

--
-- TOC entry 999 (class 1255 OID 88458)
-- Name: __stocktake__get_gid_by_id(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_gid_by_id() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _gid uuid;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_gid_by_id()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := stocktake.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 962 (class 1255 OID 88459)
-- Name: __stocktake__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'STOCKTAKE-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'STOCKTAKE'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_head()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := stocktake.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

  _head := stocktake.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := stocktake.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_head() OWNER TO postgres;

--
-- TOC entry 1000 (class 1255 OID 88460)
-- Name: __stocktake__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'STOCKTAKE-02';
  _test_create_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'COMMITTED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'STOCKTAKE'::common.document_type;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_head_batch()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := stocktake.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_head_batch() OWNER TO postgres;

--
-- TOC entry 1001 (class 1255 OID 88461)
-- Name: __stocktake__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
  _head common.document_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'STOCKTAKE-03';
  _test_create_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_transition CONSTANT common.document_transition := 'PROPOSED'::common.document_transition;
  _test_doctype CONSTANT common.document_type := 'STOCKTAKE'::common.document_type;
  _test_due_date CONSTANT date := '2017-03-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_head_batch_proposed()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := stocktake.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_create_date, _head.create_date, 'Incorrect create_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.ship_to, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.ship_from, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_transition, _head.curr_transition, 'Incorrect curr_transition value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 1002 (class 1255 OID 88462)
-- Name: __stocktake__get_id_by_gid(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_id_by_gid() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_id CONSTANT bigint := 102;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_id_by_gid()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := stocktake.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 1003 (class 1255 OID 88463)
-- Name: __stocktake__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','STOCKTAKE-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01')]::common.document_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__init()';
  
  _document_id := stocktake.init(_test_head[1], _test_body);
  _head := stocktake.get_head(_document_id);
  _body := stocktake.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__stocktake__init() OWNER TO postgres;

--
-- TOC entry 1004 (class 1255 OID 88464)
-- Name: __stocktake__numerator_nextval(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__numerator_nextval() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _numerator integer;
  _test_numerator_a1 CONSTANT integer := 11;
  _test_numerator_g1 CONSTANT integer := 1;
  _test_week_a1 CONSTANT integer := 2;
  _test_week_g1 CONSTANT integer := 10;
  _test_facility_code_a1 CONSTANT character varying := 'A1';
  _test_facility_code_g1 character varying := 'G1';
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__numerator_nextval()';

  INSERT INTO stocktake.numerator VALUES ('A1', 1, 100);
  INSERT INTO stocktake.numerator VALUES ('A1', 2, 10);
  INSERT INTO stocktake.numerator VALUES ('B1', 1, 200);

  _numerator := stocktake.numerator_nextval(_test_facility_code_a1, _test_week_a1);
  PERFORM pgunit.assert_equals(_test_numerator_a1, _numerator, 'Incorrect _numerator value');

  _numerator := stocktake.numerator_nextval(_test_facility_code_g1, _test_week_g1);
  PERFORM pgunit.assert_equals(_test_numerator_g1, _numerator, 'Incorrect _numerator value');

END;
$$;


ALTER FUNCTION tests.__stocktake__numerator_nextval() OWNER TO postgres;

--
-- TOC entry 1005 (class 1255 OID 88465)
-- Name: __stocktake__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[((1,'8c1581c0-04c0-11e7-a843-08626627b4d6','STOCKTAKE-01','2017-01-01','B1','A1','PROPOSED','CUTOFF','2017-02-01'))]::common.document_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.document_head;
  _body common.document_body[];
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__reinit()';
  
  _document_id := stocktake.init(_test_head[1], _test_body_init);
  PERFORM stocktake.reinit(_document_id, _test_body_reinit);
  _head := stocktake.get_head(_document_id);
  _body := stocktake.get_body(_document_id);
  --PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  PERFORM pgunit.assert_array_equals(_test_body_reinit, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__stocktake__reinit() OWNER TO postgres;

--
-- TOC entry 1006 (class 1255 OID 88466)
-- Name: _reset_data(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION _reset_data() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  /*
  SELECT 'TRUNCATE TABLE ' || table_schema || '.' ||table_name || ' CASCADE;'
  FROM information_schema.tables
  WHERE table_schema NOT IN ('pg_catalog', 'information_schema', 'public', 'tests', 'common')
  ORDER BY table_schema,table_name;
  */
  TRUNCATE TABLE adjustmentcredit.body CASCADE;
  TRUNCATE TABLE adjustmentcredit.head CASCADE;
  TRUNCATE TABLE adjustmentcredit.numerator CASCADE;
  TRUNCATE TABLE adjustmentdebit.body CASCADE;
  TRUNCATE TABLE adjustmentdebit.head CASCADE;
  TRUNCATE TABLE adjustmentdebit.numerator CASCADE;
  TRUNCATE TABLE balance.balance CASCADE;
  TRUNCATE TABLE binding.cutoff_to_adjustmentcredit CASCADE;
  TRUNCATE TABLE binding.cutoff_to_adjustmentdebit CASCADE;
  TRUNCATE TABLE binding.cutoff_to_delivery CASCADE;
  TRUNCATE TABLE binding.cutoff_to_demand CASCADE;
  TRUNCATE TABLE binding.cutoff_to_despatch CASCADE;
  TRUNCATE TABLE binding.cutoff_to_goal CASCADE;
  TRUNCATE TABLE binding.cutoff_to_issue CASCADE;
  TRUNCATE TABLE binding.cutoff_to_picklist CASCADE;
  TRUNCATE TABLE binding.cutoff_to_rebound CASCADE;
  TRUNCATE TABLE binding.cutoff_to_receipt CASCADE;
  TRUNCATE TABLE binding.cutoff_to_reserve CASCADE;
  TRUNCATE TABLE binding.cutoff_to_stocktake CASCADE;
  TRUNCATE TABLE binding.delivery_to_receipt CASCADE;
  TRUNCATE TABLE binding.demand_to_picklist CASCADE;
  TRUNCATE TABLE binding.demand_to_reserve CASCADE;
  TRUNCATE TABLE binding.goal_to_demand CASCADE;
  TRUNCATE TABLE binding.goal_to_despatch CASCADE;
  TRUNCATE TABLE binding.goal_to_issue CASCADE;
  TRUNCATE TABLE binding.goal_to_picklist CASCADE;
  TRUNCATE TABLE binding.goal_to_reserve CASCADE;
  TRUNCATE TABLE binding.issue_to_adjustmentcredit CASCADE;
  TRUNCATE TABLE binding.issue_to_despatch CASCADE;
  TRUNCATE TABLE binding.issue_to_rebound CASCADE;
  TRUNCATE TABLE binding.picklist_to_issue CASCADE;
  TRUNCATE TABLE binding.receipt_to_adjustmentdebit CASCADE;
  TRUNCATE TABLE binding.receipt_to_rebound CASCADE;
  TRUNCATE TABLE cutoff.blocker CASCADE;
  TRUNCATE TABLE cutoff.numerator CASCADE;
  TRUNCATE TABLE cutoff.registry CASCADE;
  TRUNCATE TABLE delivery.body CASCADE;
  TRUNCATE TABLE delivery.head CASCADE;
  TRUNCATE TABLE delivery.numerator CASCADE;
  TRUNCATE TABLE demand.body CASCADE;
  TRUNCATE TABLE demand.head CASCADE;
  TRUNCATE TABLE demand.numerator CASCADE;
  TRUNCATE TABLE despatch.body CASCADE;
  TRUNCATE TABLE despatch.head CASCADE;
  TRUNCATE TABLE despatch.numerator CASCADE;
  TRUNCATE TABLE goal.numerator CASCADE;
  TRUNCATE TABLE goal.registry CASCADE;
  TRUNCATE TABLE issue.body CASCADE;
  TRUNCATE TABLE issue.head CASCADE;
  TRUNCATE TABLE issue.numerator CASCADE;
  TRUNCATE TABLE lot.registry CASCADE;
  TRUNCATE TABLE picklist.body CASCADE;
  TRUNCATE TABLE picklist.head CASCADE;
  TRUNCATE TABLE picklist.numerator CASCADE;
  TRUNCATE TABLE rebound.body CASCADE;
  TRUNCATE TABLE rebound.head CASCADE;
  TRUNCATE TABLE rebound.numerator CASCADE;
  TRUNCATE TABLE receipt.body CASCADE;
  TRUNCATE TABLE receipt.head CASCADE;
  TRUNCATE TABLE receipt.numerator CASCADE;
  TRUNCATE TABLE reserve.body CASCADE;
  TRUNCATE TABLE reserve.head CASCADE;
  TRUNCATE TABLE reserve.numerator CASCADE;
  TRUNCATE TABLE schedule.calendar CASCADE;
  TRUNCATE TABLE stockcard.registry CASCADE;
  TRUNCATE TABLE stocktake.body CASCADE;
  TRUNCATE TABLE stocktake.head CASCADE;
  TRUNCATE TABLE stocktake.numerator CASCADE;
  /*SELECT 'ALTER SEQUENCE ' || sequence_schema || '.' || sequence_name || ' RESTART WITH 1;' 
  FROM information_schema.sequences
  WHERE sequence_catalog = 'wms' AND sequence_schema != 'common'
  ORDER by sequence_schema, sequence_name;*/
  ALTER SEQUENCE adjustmentcredit.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE adjustmentdebit.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE cutoff.registry_id_seq RESTART WITH 1;
  ALTER SEQUENCE delivery.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE demand.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE despatch.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE goal.registry_id_seq RESTART WITH 1;
  ALTER SEQUENCE issue.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE lot.registry_ib_seq RESTART WITH 1;
  ALTER SEQUENCE picklist.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE rebound.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE receipt.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE reserve.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE stocktake.head_id_seq RESTART WITH 1;
END;
$$;


ALTER FUNCTION tests._reset_data() OWNER TO postgres;

--
-- TOC entry 1012 (class 1255 OID 88467)
-- Name: _run_all(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION _run_all() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _result text;
  _routines record;
  _function_to_run text;
  _ok_count int DEFAULT 0;
  _error_count int DEFAULT 0;
  _failed_tests text[];
BEGIN
  SET search_path = tests, pg_catalog;
  SET client_min_messages = 'debug';
  FOR _routines IN
    SELECT
      routines.routine_name || '()' AS _function_to_run
    FROM
      information_schema.routines
    WHERE
      routines.specific_schema = 'tests' AND routines.routine_name like '\_\_%'
    ORDER BY
      routines.specific_schema, routines.routine_name
  LOOP
    _result := pgunit.run_test(_routines._function_to_run);
    RAISE NOTICE 'PERFORMING: % , RESULT: %', _routines._function_to_run, _result;
    IF (_result = '#OK') THEN
      _ok_count := _ok_count + 1;
    ELSE
      _error_count := _error_count + 1;
      _failed_tests := array_append(_failed_tests, _routines._function_to_run);
    END IF;
  END LOOP;
  RAISE NOTICE 'OK - %; ERROR - %;', _ok_count, _error_count;
  IF (_error_count > 0) THEN
  RAISE NOTICE 'FAILED: %;', _failed_tests;
  END IF;
END;
$$;


ALTER FUNCTION tests._run_all() OWNER TO postgres;

SET search_path = pg_catalog;

--
-- TOC entry 3177 (class 2605 OID 88468)
-- Name: CAST (goal.goal_transition AS common.document_transition); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (goal.goal_transition AS common.document_transition) WITH FUNCTION common.convert_goal_to_document_transition(goal.goal_transition) AS IMPLICIT;


SET search_path = adjustmentcredit, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 222 (class 1259 OID 88469)
-- Name: body; Type: TABLE; Schema: adjustmentcredit; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 88475)
-- Name: head; Type: TABLE; Schema: adjustmentcredit; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 88487)
-- Name: head_id_seq; Type: SEQUENCE; Schema: adjustmentcredit; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 224
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: adjustmentcredit; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 225 (class 1259 OID 88489)
-- Name: numerator; Type: TABLE; Schema: adjustmentcredit; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 226 (class 1259 OID 88496)
-- Name: body; Type: TABLE; Schema: adjustmentdebit; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 88502)
-- Name: head; Type: TABLE; Schema: adjustmentdebit; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 88514)
-- Name: head_id_seq; Type: SEQUENCE; Schema: adjustmentdebit; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 228
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: adjustmentdebit; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 229 (class 1259 OID 88516)
-- Name: numerator; Type: TABLE; Schema: adjustmentdebit; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = balance, pg_catalog;

--
-- TOC entry 230 (class 1259 OID 88523)
-- Name: balance; Type: TABLE; Schema: balance; Owner: postgres
--

CREATE TABLE balance (
    facility_code character varying NOT NULL,
    good_code character varying NOT NULL,
    uom_code character varying NOT NULL,
    on_hand_qty common.quantity NOT NULL,
    reserved_qty common.quantity NOT NULL,
    available_qty common.quantity NOT NULL,
    en_route_qty common.quantity NOT NULL,
    on_order_qty common.quantity NOT NULL
);


ALTER TABLE balance OWNER TO postgres;

--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE balance; Type: COMMENT; Schema: balance; Owner: postgres
--

COMMENT ON TABLE balance IS 'goods balance';


SET search_path = binding, pg_catalog;

--
-- TOC entry 231 (class 1259 OID 88529)
-- Name: cutoff_to_adjustmentcredit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_adjustmentcredit (
    cutoff_id bigint NOT NULL,
    adjustmentcredit_id bigint NOT NULL
);


ALTER TABLE cutoff_to_adjustmentcredit OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 88532)
-- Name: cutoff_to_adjustmentdebit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_adjustmentdebit (
    cutoff_id bigint NOT NULL,
    adjustmentdebit_id bigint NOT NULL
);


ALTER TABLE cutoff_to_adjustmentdebit OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 88535)
-- Name: cutoff_to_delivery; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_delivery (
    cutoff_id bigint NOT NULL,
    delivery_id bigint NOT NULL
);


ALTER TABLE cutoff_to_delivery OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 88538)
-- Name: cutoff_to_demand; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_demand (
    cutoff_id bigint NOT NULL,
    demand_id bigint NOT NULL
);


ALTER TABLE cutoff_to_demand OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 88541)
-- Name: cutoff_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_despatch (
    cutoff_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE cutoff_to_despatch OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 88544)
-- Name: cutoff_to_goal; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_goal (
    cutoff_id bigint NOT NULL,
    goal_id bigint NOT NULL
);


ALTER TABLE cutoff_to_goal OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 88547)
-- Name: cutoff_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_issue (
    cutoff_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE cutoff_to_issue OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 88550)
-- Name: cutoff_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_picklist (
    cutoff_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE cutoff_to_picklist OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 88553)
-- Name: cutoff_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_rebound (
    cutoff_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE cutoff_to_rebound OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 88556)
-- Name: cutoff_to_receipt; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_receipt (
    cutoff_id bigint NOT NULL,
    receipt_id bigint NOT NULL
);


ALTER TABLE cutoff_to_receipt OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 88559)
-- Name: cutoff_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_reserve (
    cutoff_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE cutoff_to_reserve OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 88562)
-- Name: cutoff_to_stocktake; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_stocktake (
    cutoff_id bigint NOT NULL,
    stocktake_id bigint NOT NULL
);


ALTER TABLE cutoff_to_stocktake OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 88565)
-- Name: delivery_to_receipt; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE delivery_to_receipt (
    delivery_id bigint NOT NULL,
    receipt_id bigint NOT NULL
);


ALTER TABLE delivery_to_receipt OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 88568)
-- Name: demand_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE demand_to_picklist (
    demand_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE demand_to_picklist OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 88571)
-- Name: demand_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE demand_to_reserve (
    demand_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE demand_to_reserve OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 88574)
-- Name: goal_to_demand; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_demand (
    goal_id bigint NOT NULL,
    demand_id bigint NOT NULL
);


ALTER TABLE goal_to_demand OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 88577)
-- Name: goal_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_despatch (
    goal_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE goal_to_despatch OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 88580)
-- Name: goal_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_issue (
    goal_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE goal_to_issue OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 88583)
-- Name: goal_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_picklist (
    goal_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE goal_to_picklist OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 88586)
-- Name: goal_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_reserve (
    goal_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE goal_to_reserve OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 88589)
-- Name: issue_to_adjustmentcredit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_adjustmentcredit (
    issue_id bigint NOT NULL,
    adjustmentcredit_id bigint NOT NULL
);


ALTER TABLE issue_to_adjustmentcredit OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 88592)
-- Name: issue_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_despatch (
    issue_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE issue_to_despatch OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 88595)
-- Name: issue_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_rebound (
    issue_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE issue_to_rebound OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 88598)
-- Name: picklist_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE picklist_to_issue (
    picklist_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE picklist_to_issue OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 88601)
-- Name: receipt_to_adjustmentdebit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE receipt_to_adjustmentdebit (
    receipt_id bigint NOT NULL,
    adjustmentdebit_id bigint NOT NULL
);


ALTER TABLE receipt_to_adjustmentdebit OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 88604)
-- Name: receipt_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE receipt_to_rebound (
    receipt_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE receipt_to_rebound OWNER TO postgres;

SET search_path = common, pg_catalog;

--
-- TOC entry 257 (class 1259 OID 88607)
-- Name: cutoff_policy; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE cutoff_policy (
    document_type_name document_type NOT NULL,
    cutoff_mode_applied cutoff_mode DEFAULT 'DISABLED'::cutoff_mode NOT NULL
);


ALTER TABLE cutoff_policy OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 88611)
-- Name: document_abbrevation; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE document_abbrevation (
    doctype document_type NOT NULL,
    abbrevation character varying DEFAULT '[ABBREVATION]'::character varying NOT NULL
);


ALTER TABLE document_abbrevation OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 88618)
-- Name: exception_code; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE exception_code (
    id integer NOT NULL,
    message text,
    detail text,
    hint text,
    errcode character varying(5),
    condition_name character varying(100)
);


ALTER TABLE exception_code OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 88624)
-- Name: exception_code_id_seq; Type: SEQUENCE; Schema: common; Owner: postgres
--

CREATE SEQUENCE exception_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exception_code_id_seq OWNER TO postgres;

--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 260
-- Name: exception_code_id_seq; Type: SEQUENCE OWNED BY; Schema: common; Owner: postgres
--

ALTER SEQUENCE exception_code_id_seq OWNED BY exception_code.id;


--
-- TOC entry 261 (class 1259 OID 88626)
-- Name: stocktake_policy; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE stocktake_policy (
    document_type_name document_type NOT NULL,
    stocktake_mode_applied cutoff_mode DEFAULT 'DISABLED'::cutoff_mode NOT NULL
);


ALTER TABLE stocktake_policy OWNER TO postgres;

SET search_path = cutoff, pg_catalog;

--
-- TOC entry 262 (class 1259 OID 88630)
-- Name: blocker; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE blocker (
    registry_id bigint NOT NULL,
    blocker_document common.document_head NOT NULL
);


ALTER TABLE blocker OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 88636)
-- Name: numerator; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 88643)
-- Name: registry; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE registry (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT now() NOT NULL,
    author character varying,
    due_date date NOT NULL,
    facility_code character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT registry_check1 CHECK ((create_date <= due_date))
);


ALTER TABLE registry OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 88654)
-- Name: registry_id_seq; Type: SEQUENCE; Schema: cutoff; Owner: postgres
--

CREATE SEQUENCE registry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry_id_seq OWNER TO postgres;

--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 265
-- Name: registry_id_seq; Type: SEQUENCE OWNED BY; Schema: cutoff; Owner: postgres
--

ALTER SEQUENCE registry_id_seq OWNED BY registry.id;


SET search_path = delivery, pg_catalog;

--
-- TOC entry 266 (class 1259 OID 88656)
-- Name: body; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 88662)
-- Name: head; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 88674)
-- Name: head_id_seq; Type: SEQUENCE; Schema: delivery; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 268
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 269 (class 1259 OID 88676)
-- Name: numerator; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = demand, pg_catalog;

--
-- TOC entry 270 (class 1259 OID 88683)
-- Name: body; Type: TABLE; Schema: demand; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 88689)
-- Name: head; Type: TABLE; Schema: demand; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 88701)
-- Name: head_id_seq; Type: SEQUENCE; Schema: demand; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 272
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: demand; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 273 (class 1259 OID 88703)
-- Name: numerator; Type: TABLE; Schema: demand; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = despatch, pg_catalog;

--
-- TOC entry 274 (class 1259 OID 88710)
-- Name: body; Type: TABLE; Schema: despatch; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 88716)
-- Name: head; Type: TABLE; Schema: despatch; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 88728)
-- Name: head_id_seq; Type: SEQUENCE; Schema: despatch; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 276
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: despatch; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 277 (class 1259 OID 88730)
-- Name: numerator; Type: TABLE; Schema: despatch; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = goal, pg_catalog;

--
-- TOC entry 278 (class 1259 OID 88737)
-- Name: numerator; Type: TABLE; Schema: goal; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 88744)
-- Name: registry; Type: TABLE; Schema: goal; Owner: postgres
--

CREATE TABLE registry (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition goal_transition,
    prev_transition_date timestamp with time zone,
    curr_transition goal_transition DEFAULT 'PROPOSED'::goal_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT registry_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT registry_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE registry OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 88756)
-- Name: registry_id_seq; Type: SEQUENCE; Schema: goal; Owner: postgres
--

CREATE SEQUENCE registry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry_id_seq OWNER TO postgres;

--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 280
-- Name: registry_id_seq; Type: SEQUENCE OWNED BY; Schema: goal; Owner: postgres
--

ALTER SEQUENCE registry_id_seq OWNED BY registry.id;


SET search_path = issue, pg_catalog;

--
-- TOC entry 281 (class 1259 OID 88758)
-- Name: body; Type: TABLE; Schema: issue; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 88764)
-- Name: head; Type: TABLE; Schema: issue; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 88776)
-- Name: head_id_seq; Type: SEQUENCE; Schema: issue; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 283
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: issue; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 284 (class 1259 OID 88778)
-- Name: numerator; Type: TABLE; Schema: issue; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = lot, pg_catalog;

--
-- TOC entry 285 (class 1259 OID 88785)
-- Name: registry; Type: TABLE; Schema: lot; Owner: postgres
--

CREATE TABLE registry (
    ib bigint NOT NULL
);


ALTER TABLE registry OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 88788)
-- Name: registry_ib_seq; Type: SEQUENCE; Schema: lot; Owner: postgres
--

CREATE SEQUENCE registry_ib_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registry_ib_seq OWNER TO postgres;

--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 286
-- Name: registry_ib_seq; Type: SEQUENCE OWNED BY; Schema: lot; Owner: postgres
--

ALTER SEQUENCE registry_ib_seq OWNED BY registry.ib;


SET search_path = picklist, pg_catalog;

--
-- TOC entry 287 (class 1259 OID 88790)
-- Name: body; Type: TABLE; Schema: picklist; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 88796)
-- Name: head; Type: TABLE; Schema: picklist; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 88808)
-- Name: head_id_seq; Type: SEQUENCE; Schema: picklist; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 289
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: picklist; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 290 (class 1259 OID 88810)
-- Name: numerator; Type: TABLE; Schema: picklist; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 291 (class 1259 OID 88817)
-- Name: myroutines; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW myroutines AS
 SELECT routines.specific_schema,
    routines.routine_name
   FROM information_schema.routines
  WHERE (((routines.specific_schema)::text <> 'pg_catalog'::text) AND ((routines.specific_schema)::text <> 'invormation_schema'::text))
  ORDER BY routines.specific_schema, routines.routine_name;


ALTER TABLE myroutines OWNER TO postgres;

SET search_path = rebound, pg_catalog;

--
-- TOC entry 292 (class 1259 OID 88822)
-- Name: body; Type: TABLE; Schema: rebound; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 88828)
-- Name: head; Type: TABLE; Schema: rebound; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 88840)
-- Name: head_id_seq; Type: SEQUENCE; Schema: rebound; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 294
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: rebound; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 295 (class 1259 OID 88842)
-- Name: numerator; Type: TABLE; Schema: rebound; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = receipt, pg_catalog;

--
-- TOC entry 296 (class 1259 OID 88849)
-- Name: body; Type: TABLE; Schema: receipt; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 88855)
-- Name: head; Type: TABLE; Schema: receipt; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 88867)
-- Name: head_id_seq; Type: SEQUENCE; Schema: receipt; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 298
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: receipt; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 299 (class 1259 OID 88869)
-- Name: numerator; Type: TABLE; Schema: receipt; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = reserve, pg_catalog;

--
-- TOC entry 300 (class 1259 OID 88876)
-- Name: body; Type: TABLE; Schema: reserve; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 88882)
-- Name: head; Type: TABLE; Schema: reserve; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 88894)
-- Name: head_id_seq; Type: SEQUENCE; Schema: reserve; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 302
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: reserve; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 303 (class 1259 OID 88896)
-- Name: numerator; Type: TABLE; Schema: reserve; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = schedule, pg_catalog;

--
-- TOC entry 304 (class 1259 OID 88903)
-- Name: calendar; Type: TABLE; Schema: schedule; Owner: postgres
--

CREATE TABLE calendar (
    calendar_date date NOT NULL,
    day_number integer,
    week_number integer,
    julianized_day integer,
    julianized_week integer
);


ALTER TABLE calendar OWNER TO postgres;

SET search_path = stockcard, pg_catalog;

--
-- TOC entry 305 (class 1259 OID 88906)
-- Name: registry; Type: TABLE; Schema: stockcard; Owner: postgres
--

CREATE TABLE registry (
    document_gid uuid NOT NULL,
    document_type common.document_type,
    document_name character varying,
    document_date date,
    facility_code character varying,
    counterparty_code character varying,
    good_code character varying NOT NULL,
    cutoff_date date,
    cutoff_uom character varying,
    cutoff_qty common.quantity,
    receipt_uom character varying,
    receipt_qty common.quantity,
    issued_uom character varying,
    issued_qty common.quantity,
    adjusted_uom character varying,
    adjusted_qty common.quantity,
    rebounded_uom character varying,
    rebounded_qty common.quantity,
    stocktake_uom character varying,
    stocktake_qty common.quantity,
    log_datetime timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE registry OWNER TO postgres;

SET search_path = stocktake, pg_catalog;

--
-- TOC entry 306 (class 1259 OID 88913)
-- Name: body; Type: TABLE; Schema: stocktake; Owner: postgres
--

CREATE TABLE body (
    head_id bigint NOT NULL,
    good_code character varying NOT NULL,
    quantity common.quantity NOT NULL,
    uom_code character varying,
    diff_qty common.quantity_signed
);


ALTER TABLE body OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 88919)
-- Name: head; Type: TABLE; Schema: stocktake; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_transition common.document_transition,
    prev_transition_date timestamp with time zone,
    curr_transition common.document_transition DEFAULT 'PROPOSED'::common.document_transition NOT NULL,
    curr_transition_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((create_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 88931)
-- Name: head_id_seq; Type: SEQUENCE; Schema: stocktake; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 308
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: stocktake; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 309 (class 1259 OID 88933)
-- Name: numerator; Type: TABLE; Schema: stocktake; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = tests, pg_catalog;

--
-- TOC entry 310 (class 1259 OID 88940)
-- Name: pgunit_covarage; Type: VIEW; Schema: tests; Owner: postgres
--

CREATE VIEW pgunit_covarage AS
 SELECT ((('__'::text || (routines.specific_schema)::text) || '__'::text) || (routines.routine_name)::text) AS _function_to_run
   FROM information_schema.routines
  WHERE (((routines.specific_schema)::text <> ALL (ARRAY[('tests'::character varying)::text, ('pgunit'::character varying)::text, ('public'::character varying)::text, ('pg_catalog'::character varying)::text, ('information_schema'::character varying)::text])) AND ((routines.routine_name)::text !~~ 'disall%'::text))
EXCEPT
 SELECT routines.routine_name AS _function_to_run
   FROM information_schema.routines
  WHERE (((routines.specific_schema)::text = 'tests'::text) AND ((routines.routine_name)::text ~~ '\_\_%'::text))
  ORDER BY 1;


ALTER TABLE pgunit_covarage OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 88945)
-- Name: plpgsql_check_all; Type: VIEW; Schema: tests; Owner: postgres
--

CREATE VIEW plpgsql_check_all AS
 SELECT ((ss.pcf).functionid)::regprocedure AS functionid,
    (ss.pcf).lineno AS lineno,
    (ss.pcf).statement AS statement,
    (ss.pcf).sqlstate AS sqlstate,
    (ss.pcf).message AS message,
    (ss.pcf).detail AS detail,
    (ss.pcf).hint AS hint,
    (ss.pcf).level AS level,
    (ss.pcf)."position" AS "position",
    (ss.pcf).query AS query,
    (ss.pcf).context AS context
   FROM ( SELECT public.plpgsql_check_function_tb((pg_proc.oid)::regprocedure, (COALESCE(pg_trigger.tgrelid, (0)::oid))::regclass) AS pcf
           FROM (pg_proc
             LEFT JOIN pg_trigger ON ((pg_trigger.tgfoid = pg_proc.oid)))
          WHERE ((pg_proc.prolang = ( SELECT lang.oid
                   FROM pg_language lang
                  WHERE (lang.lanname = 'plpgsql'::name))) AND (pg_proc.pronamespace <> ( SELECT nsp.oid
                   FROM pg_namespace nsp
                  WHERE (nsp.nspname = 'pg_catalog'::name))) AND ((pg_proc.prorettype <> ( SELECT typ.oid
                   FROM pg_type typ
                  WHERE (typ.typname = 'trigger'::name))) OR (pg_trigger.tgfoid IS NOT NULL)))
         OFFSET 0) ss
  ORDER BY (((ss.pcf).functionid)::regprocedure)::text, (ss.pcf).lineno;


ALTER TABLE plpgsql_check_all OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 88950)
-- Name: plpgsql_check_nontriggered; Type: VIEW; Schema: tests; Owner: postgres
--

CREATE VIEW plpgsql_check_nontriggered AS
 SELECT p.oid,
    p.proname,
    public.plpgsql_check_function((p.oid)::regprocedure) AS plpgsql_check_function
   FROM ((pg_namespace n
     JOIN pg_proc p ON ((p.pronamespace = n.oid)))
     JOIN pg_language l ON ((p.prolang = l.oid)))
  WHERE ((l.lanname = 'plpgsql'::name) AND (p.prorettype <> (2279)::oid));


ALTER TABLE plpgsql_check_nontriggered OWNER TO postgres;

SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3182 (class 2604 OID 88955)
-- Name: id; Type: DEFAULT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3190 (class 2604 OID 88956)
-- Name: id; Type: DEFAULT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = common, pg_catalog;

--
-- TOC entry 3196 (class 2604 OID 88957)
-- Name: id; Type: DEFAULT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code ALTER COLUMN id SET DEFAULT nextval('exception_code_id_seq'::regclass);


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3203 (class 2604 OID 88958)
-- Name: id; Type: DEFAULT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY registry ALTER COLUMN id SET DEFAULT nextval('registry_id_seq'::regclass);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3209 (class 2604 OID 88959)
-- Name: id; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = demand, pg_catalog;

--
-- TOC entry 3217 (class 2604 OID 88960)
-- Name: id; Type: DEFAULT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3225 (class 2604 OID 88961)
-- Name: id; Type: DEFAULT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = goal, pg_catalog;

--
-- TOC entry 3234 (class 2604 OID 88962)
-- Name: id; Type: DEFAULT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY registry ALTER COLUMN id SET DEFAULT nextval('registry_id_seq'::regclass);


SET search_path = issue, pg_catalog;

--
-- TOC entry 3241 (class 2604 OID 88963)
-- Name: id; Type: DEFAULT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = lot, pg_catalog;

--
-- TOC entry 3245 (class 2604 OID 88964)
-- Name: ib; Type: DEFAULT; Schema: lot; Owner: postgres
--

ALTER TABLE ONLY registry ALTER COLUMN ib SET DEFAULT nextval('registry_ib_seq'::regclass);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3250 (class 2604 OID 88965)
-- Name: id; Type: DEFAULT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3258 (class 2604 OID 88966)
-- Name: id; Type: DEFAULT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3266 (class 2604 OID 88967)
-- Name: id; Type: DEFAULT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3274 (class 2604 OID 88968)
-- Name: id; Type: DEFAULT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3283 (class 2604 OID 88969)
-- Name: id; Type: DEFAULT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3759 (class 0 OID 88469)
-- Dependencies: 222
-- Data for Name: body; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



--
-- TOC entry 3760 (class 0 OID 88475)
-- Dependencies: 223
-- Data for Name: head; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 224
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: adjustmentcredit; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 9, true);


--
-- TOC entry 3762 (class 0 OID 88489)
-- Dependencies: 225
-- Data for Name: numerator; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3763 (class 0 OID 88496)
-- Dependencies: 226
-- Data for Name: body; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



--
-- TOC entry 3764 (class 0 OID 88502)
-- Dependencies: 227
-- Data for Name: head; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 228
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: adjustmentdebit; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 9, true);


--
-- TOC entry 3766 (class 0 OID 88516)
-- Dependencies: 229
-- Data for Name: numerator; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



SET search_path = balance, pg_catalog;

--
-- TOC entry 3767 (class 0 OID 88523)
-- Dependencies: 230
-- Data for Name: balance; Type: TABLE DATA; Schema: balance; Owner: postgres
--



SET search_path = binding, pg_catalog;

--
-- TOC entry 3768 (class 0 OID 88529)
-- Dependencies: 231
-- Data for Name: cutoff_to_adjustmentcredit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3769 (class 0 OID 88532)
-- Dependencies: 232
-- Data for Name: cutoff_to_adjustmentdebit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3770 (class 0 OID 88535)
-- Dependencies: 233
-- Data for Name: cutoff_to_delivery; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3771 (class 0 OID 88538)
-- Dependencies: 234
-- Data for Name: cutoff_to_demand; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3772 (class 0 OID 88541)
-- Dependencies: 235
-- Data for Name: cutoff_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3773 (class 0 OID 88544)
-- Dependencies: 236
-- Data for Name: cutoff_to_goal; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3774 (class 0 OID 88547)
-- Dependencies: 237
-- Data for Name: cutoff_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3775 (class 0 OID 88550)
-- Dependencies: 238
-- Data for Name: cutoff_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3776 (class 0 OID 88553)
-- Dependencies: 239
-- Data for Name: cutoff_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3777 (class 0 OID 88556)
-- Dependencies: 240
-- Data for Name: cutoff_to_receipt; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3778 (class 0 OID 88559)
-- Dependencies: 241
-- Data for Name: cutoff_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3779 (class 0 OID 88562)
-- Dependencies: 242
-- Data for Name: cutoff_to_stocktake; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3780 (class 0 OID 88565)
-- Dependencies: 243
-- Data for Name: delivery_to_receipt; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3781 (class 0 OID 88568)
-- Dependencies: 244
-- Data for Name: demand_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3782 (class 0 OID 88571)
-- Dependencies: 245
-- Data for Name: demand_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3783 (class 0 OID 88574)
-- Dependencies: 246
-- Data for Name: goal_to_demand; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3784 (class 0 OID 88577)
-- Dependencies: 247
-- Data for Name: goal_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3785 (class 0 OID 88580)
-- Dependencies: 248
-- Data for Name: goal_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3786 (class 0 OID 88583)
-- Dependencies: 249
-- Data for Name: goal_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3787 (class 0 OID 88586)
-- Dependencies: 250
-- Data for Name: goal_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3788 (class 0 OID 88589)
-- Dependencies: 251
-- Data for Name: issue_to_adjustmentcredit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3789 (class 0 OID 88592)
-- Dependencies: 252
-- Data for Name: issue_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3790 (class 0 OID 88595)
-- Dependencies: 253
-- Data for Name: issue_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3791 (class 0 OID 88598)
-- Dependencies: 254
-- Data for Name: picklist_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3792 (class 0 OID 88601)
-- Dependencies: 255
-- Data for Name: receipt_to_adjustmentdebit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3793 (class 0 OID 88604)
-- Dependencies: 256
-- Data for Name: receipt_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



SET search_path = common, pg_catalog;

--
-- TOC entry 3794 (class 0 OID 88607)
-- Dependencies: 257
-- Data for Name: cutoff_policy; Type: TABLE DATA; Schema: common; Owner: postgres
--

INSERT INTO cutoff_policy VALUES ('ISSUE', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('RECEIPT', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('STOCKTAKE', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('DESPATCH', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('DELIVERY', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('REBOUND', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('ADJUSTMENTCREDIT', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('ADJUSTMENTDEBIT', 'ENFORCING');
INSERT INTO cutoff_policy VALUES ('GOAL', 'PERMISSIVE');
INSERT INTO cutoff_policy VALUES ('PICKLIST', 'PERMISSIVE');
INSERT INTO cutoff_policy VALUES ('LOT', 'DISABLED');
INSERT INTO cutoff_policy VALUES ('RESERVE', 'PERMISSIVE');
INSERT INTO cutoff_policy VALUES ('DEMAND', 'PERMISSIVE');
INSERT INTO cutoff_policy VALUES ('CUTOFF', 'DISABLED');


--
-- TOC entry 3795 (class 0 OID 88611)
-- Dependencies: 258
-- Data for Name: document_abbrevation; Type: TABLE DATA; Schema: common; Owner: postgres
--

INSERT INTO document_abbrevation VALUES ('ISSUE', 'GIN');
INSERT INTO document_abbrevation VALUES ('RECEIPT', 'GRN');
INSERT INTO document_abbrevation VALUES ('STOCKTAKE', 'GST');
INSERT INTO document_abbrevation VALUES ('DESPATCH', 'GDN');
INSERT INTO document_abbrevation VALUES ('DELIVERY', 'GDL');
INSERT INTO document_abbrevation VALUES ('REBOUND', 'GRB');
INSERT INTO document_abbrevation VALUES ('ADJUSTMENTCREDIT', 'AJC');
INSERT INTO document_abbrevation VALUES ('ADJUSTMENTDEBIT', 'AJD');
INSERT INTO document_abbrevation VALUES ('DEMAND', 'GDD');
INSERT INTO document_abbrevation VALUES ('GOAL', 'GOL');
INSERT INTO document_abbrevation VALUES ('PICKLIST', 'GPL');
INSERT INTO document_abbrevation VALUES ('LOT', 'LOT');
INSERT INTO document_abbrevation VALUES ('RESERVE', 'GRV');
INSERT INTO document_abbrevation VALUES ('CUTOFF', 'CUT');


--
-- TOC entry 3796 (class 0 OID 88618)
-- Dependencies: 259
-- Data for Name: exception_code; Type: TABLE DATA; Schema: common; Owner: postgres
--

INSERT INTO exception_code VALUES (2, 'WMS ERROR 2 message', 'WMS ERROR 2 details', 'WMS ERROR 2 hint', 'W1002', 'boilerplate_01');
INSERT INTO exception_code VALUES (3, 'WMS ERROR 3 message', 'WMS ERROR 3 details', 'WMS ERROR 3 hint', 'W1003', 'boilerplate_02');
INSERT INTO exception_code VALUES (4, 'WMS ERROR 4 message', 'WMS ERROR 4 details', 'WMS ERROR 4 hint', 'W1004', 'boilerplate_03');
INSERT INTO exception_code VALUES (5, 'WMS ERROR 5 message', 'WMS ERROR 5 details', 'WMS ERROR 5 hint', 'W1005', 'boilerplate_04');
INSERT INTO exception_code VALUES (6, 'WMS ERROR 6 message', 'WMS ERROR 6 details', 'WMS ERROR 6 hint', 'W1006', 'boilerplate_05');
INSERT INTO exception_code VALUES (7, 'WMS ERROR 7 message', 'WMS ERROR 7 details', 'WMS ERROR 7 hint', 'W1007', 'boilerplate_06');
INSERT INTO exception_code VALUES (8, 'WMS ERROR 8 message', 'WMS ERROR 8 details', 'WMS ERROR 8 hint', 'W1008', 'boilerplate_07');
INSERT INTO exception_code VALUES (1, 'WMS EXCEPTION 1 message', 'WMS ERROR 1 details', 'WMS ERROR 1 hint', 'W1001', 'invalid_test_data');
INSERT INTO exception_code VALUES (9, 'Unknown exception', 'Unknown exception', 'Unknown exception', 'W9999', 'unknown_exception');
INSERT INTO exception_code VALUES (10, 'WMS WARNING 1 message', 'WMS NOTICE 1 details', 'WMS NOOTICE 1 hint', 'Z1010', 'incorrect_test_data');


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 260
-- Name: exception_code_id_seq; Type: SEQUENCE SET; Schema: common; Owner: postgres
--

SELECT pg_catalog.setval('exception_code_id_seq', 1, false);


--
-- TOC entry 3798 (class 0 OID 88626)
-- Dependencies: 261
-- Data for Name: stocktake_policy; Type: TABLE DATA; Schema: common; Owner: postgres
--

INSERT INTO stocktake_policy VALUES ('ADJUSTMENTCREDIT', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('ADJUSTMENTDEBIT', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('DEMAND', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('DELIVERY', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('DESPATCH', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('GOAL', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('ISSUE', 'ENFORCING');
INSERT INTO stocktake_policy VALUES ('LOT', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('PICKLIST', 'ENFORCING');
INSERT INTO stocktake_policy VALUES ('REBOUND', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('RECEIPT', 'ENFORCING');
INSERT INTO stocktake_policy VALUES ('RESERVE', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('STOCKTAKE', 'DISABLED');
INSERT INTO stocktake_policy VALUES ('CUTOFF', 'DISABLED');


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3799 (class 0 OID 88630)
-- Dependencies: 262
-- Data for Name: blocker; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 3800 (class 0 OID 88636)
-- Dependencies: 263
-- Data for Name: numerator; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 3801 (class 0 OID 88643)
-- Dependencies: 264
-- Data for Name: registry; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 265
-- Name: registry_id_seq; Type: SEQUENCE SET; Schema: cutoff; Owner: postgres
--

SELECT pg_catalog.setval('registry_id_seq', 1, false);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3803 (class 0 OID 88656)
-- Dependencies: 266
-- Data for Name: body; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



--
-- TOC entry 3804 (class 0 OID 88662)
-- Dependencies: 267
-- Data for Name: head; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 268
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 6, true);


--
-- TOC entry 3806 (class 0 OID 88676)
-- Dependencies: 269
-- Data for Name: numerator; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



SET search_path = demand, pg_catalog;

--
-- TOC entry 3807 (class 0 OID 88683)
-- Dependencies: 270
-- Data for Name: body; Type: TABLE DATA; Schema: demand; Owner: postgres
--



--
-- TOC entry 3808 (class 0 OID 88689)
-- Dependencies: 271
-- Data for Name: head; Type: TABLE DATA; Schema: demand; Owner: postgres
--



--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 272
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: demand; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 6, true);


--
-- TOC entry 3810 (class 0 OID 88703)
-- Dependencies: 273
-- Data for Name: numerator; Type: TABLE DATA; Schema: demand; Owner: postgres
--



SET search_path = despatch, pg_catalog;

--
-- TOC entry 3811 (class 0 OID 88710)
-- Dependencies: 274
-- Data for Name: body; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



--
-- TOC entry 3812 (class 0 OID 88716)
-- Dependencies: 275
-- Data for Name: head; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 276
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: despatch; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 12, true);


--
-- TOC entry 3814 (class 0 OID 88730)
-- Dependencies: 277
-- Data for Name: numerator; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



SET search_path = goal, pg_catalog;

--
-- TOC entry 3815 (class 0 OID 88737)
-- Dependencies: 278
-- Data for Name: numerator; Type: TABLE DATA; Schema: goal; Owner: postgres
--



--
-- TOC entry 3816 (class 0 OID 88744)
-- Dependencies: 279
-- Data for Name: registry; Type: TABLE DATA; Schema: goal; Owner: postgres
--



--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 280
-- Name: registry_id_seq; Type: SEQUENCE SET; Schema: goal; Owner: postgres
--

SELECT pg_catalog.setval('registry_id_seq', 14, true);


SET search_path = issue, pg_catalog;

--
-- TOC entry 3818 (class 0 OID 88758)
-- Dependencies: 281
-- Data for Name: body; Type: TABLE DATA; Schema: issue; Owner: postgres
--



--
-- TOC entry 3819 (class 0 OID 88764)
-- Dependencies: 282
-- Data for Name: head; Type: TABLE DATA; Schema: issue; Owner: postgres
--



--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 283
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: issue; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 9, true);


--
-- TOC entry 3821 (class 0 OID 88778)
-- Dependencies: 284
-- Data for Name: numerator; Type: TABLE DATA; Schema: issue; Owner: postgres
--



SET search_path = lot, pg_catalog;

--
-- TOC entry 3822 (class 0 OID 88785)
-- Dependencies: 285
-- Data for Name: registry; Type: TABLE DATA; Schema: lot; Owner: postgres
--



--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 286
-- Name: registry_ib_seq; Type: SEQUENCE SET; Schema: lot; Owner: postgres
--

SELECT pg_catalog.setval('registry_ib_seq', 1, false);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3824 (class 0 OID 88790)
-- Dependencies: 287
-- Data for Name: body; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



--
-- TOC entry 3825 (class 0 OID 88796)
-- Dependencies: 288
-- Data for Name: head; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 289
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: picklist; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 8, true);


--
-- TOC entry 3827 (class 0 OID 88810)
-- Dependencies: 290
-- Data for Name: numerator; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



SET search_path = rebound, pg_catalog;

--
-- TOC entry 3828 (class 0 OID 88822)
-- Dependencies: 292
-- Data for Name: body; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



--
-- TOC entry 3829 (class 0 OID 88828)
-- Dependencies: 293
-- Data for Name: head; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 294
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: rebound; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 6, true);


--
-- TOC entry 3831 (class 0 OID 88842)
-- Dependencies: 295
-- Data for Name: numerator; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



SET search_path = receipt, pg_catalog;

--
-- TOC entry 3832 (class 0 OID 88849)
-- Dependencies: 296
-- Data for Name: body; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



--
-- TOC entry 3833 (class 0 OID 88855)
-- Dependencies: 297
-- Data for Name: head; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 298
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: receipt; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 6, true);


--
-- TOC entry 3835 (class 0 OID 88869)
-- Dependencies: 299
-- Data for Name: numerator; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



SET search_path = reserve, pg_catalog;

--
-- TOC entry 3836 (class 0 OID 88876)
-- Dependencies: 300
-- Data for Name: body; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



--
-- TOC entry 3837 (class 0 OID 88882)
-- Dependencies: 301
-- Data for Name: head; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 302
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: reserve; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 8, true);


--
-- TOC entry 3839 (class 0 OID 88896)
-- Dependencies: 303
-- Data for Name: numerator; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



SET search_path = schedule, pg_catalog;

--
-- TOC entry 3840 (class 0 OID 88903)
-- Dependencies: 304
-- Data for Name: calendar; Type: TABLE DATA; Schema: schedule; Owner: postgres
--



SET search_path = stockcard, pg_catalog;

--
-- TOC entry 3841 (class 0 OID 88906)
-- Dependencies: 305
-- Data for Name: registry; Type: TABLE DATA; Schema: stockcard; Owner: postgres
--



SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3842 (class 0 OID 88913)
-- Dependencies: 306
-- Data for Name: body; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



--
-- TOC entry 3843 (class 0 OID 88919)
-- Dependencies: 307
-- Data for Name: head; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 308
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: stocktake; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 6, true);


--
-- TOC entry 3845 (class 0 OID 88933)
-- Dependencies: 309
-- Data for Name: numerator; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3288 (class 2606 OID 88971)
-- Name: body_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3290 (class 2606 OID 88973)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3292 (class 2606 OID 88975)
-- Name: head_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 88977)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3296 (class 2606 OID 88979)
-- Name: body_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3298 (class 2606 OID 88981)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3300 (class 2606 OID 88983)
-- Name: head_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 88985)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = balance, pg_catalog;

--
-- TOC entry 3304 (class 2606 OID 88987)
-- Name: balance_pkey; Type: CONSTRAINT; Schema: balance; Owner: postgres
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (facility_code, good_code);


SET search_path = binding, pg_catalog;

--
-- TOC entry 3306 (class 2606 OID 88989)
-- Name: cutoff_to_adjustmentcredit_adjustmentcredit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_adjustmentcredit_id_key UNIQUE (adjustmentcredit_id);


--
-- TOC entry 3308 (class 2606 OID 88991)
-- Name: cutoff_to_adjustmentcredit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_pkey PRIMARY KEY (cutoff_id, adjustmentcredit_id);


--
-- TOC entry 3310 (class 2606 OID 88993)
-- Name: cutoff_to_adjustmentdebit_adjustmentdebit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_adjustmentdebit_id_key UNIQUE (adjustmentdebit_id);


--
-- TOC entry 3312 (class 2606 OID 88995)
-- Name: cutoff_to_adjustmentdebit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_pkey PRIMARY KEY (cutoff_id, adjustmentdebit_id);


--
-- TOC entry 3314 (class 2606 OID 88997)
-- Name: cutoff_to_delivery_delivery_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_delivery_id_key UNIQUE (delivery_id);


--
-- TOC entry 3316 (class 2606 OID 88999)
-- Name: cutoff_to_delivery_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_pkey PRIMARY KEY (cutoff_id, delivery_id);


--
-- TOC entry 3318 (class 2606 OID 89001)
-- Name: cutoff_to_demand_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3320 (class 2606 OID 89003)
-- Name: cutoff_to_demand_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_pkey PRIMARY KEY (cutoff_id, demand_id);


--
-- TOC entry 3322 (class 2606 OID 89005)
-- Name: cutoff_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 3324 (class 2606 OID 89007)
-- Name: cutoff_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_pkey PRIMARY KEY (cutoff_id, despatch_id);


--
-- TOC entry 3326 (class 2606 OID 89009)
-- Name: cutoff_to_goal_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3328 (class 2606 OID 89011)
-- Name: cutoff_to_goal_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_pkey PRIMARY KEY (cutoff_id, goal_id);


--
-- TOC entry 3330 (class 2606 OID 89013)
-- Name: cutoff_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3332 (class 2606 OID 89015)
-- Name: cutoff_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_pkey PRIMARY KEY (cutoff_id, issue_id);


--
-- TOC entry 3334 (class 2606 OID 89017)
-- Name: cutoff_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3336 (class 2606 OID 89019)
-- Name: cutoff_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_pkey PRIMARY KEY (cutoff_id, picklist_id);


--
-- TOC entry 3338 (class 2606 OID 89021)
-- Name: cutoff_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_pkey PRIMARY KEY (cutoff_id, rebound_id);


--
-- TOC entry 3340 (class 2606 OID 89023)
-- Name: cutoff_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 3342 (class 2606 OID 89025)
-- Name: cutoff_to_receipt_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_pkey PRIMARY KEY (cutoff_id, receipt_id);


--
-- TOC entry 3344 (class 2606 OID 89027)
-- Name: cutoff_to_receipt_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 3346 (class 2606 OID 89029)
-- Name: cutoff_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_pkey PRIMARY KEY (cutoff_id, reserve_id);


--
-- TOC entry 3348 (class 2606 OID 89031)
-- Name: cutoff_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 3350 (class 2606 OID 89033)
-- Name: cutoff_to_stocktake_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_pkey PRIMARY KEY (cutoff_id, stocktake_id);


--
-- TOC entry 3352 (class 2606 OID 89035)
-- Name: cutoff_to_stocktake_stocktake_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_stocktake_id_key UNIQUE (stocktake_id);


--
-- TOC entry 3354 (class 2606 OID 89037)
-- Name: delivery_to_receipt_delivery_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_delivery_id_key UNIQUE (delivery_id);


--
-- TOC entry 3356 (class 2606 OID 89039)
-- Name: delivery_to_receipt_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_pkey PRIMARY KEY (delivery_id, receipt_id);


--
-- TOC entry 3358 (class 2606 OID 89041)
-- Name: delivery_to_receipt_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 3360 (class 2606 OID 89043)
-- Name: demand_to_picklist_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3362 (class 2606 OID 89045)
-- Name: demand_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3364 (class 2606 OID 89047)
-- Name: demand_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_pkey PRIMARY KEY (demand_id, picklist_id);


--
-- TOC entry 3366 (class 2606 OID 89049)
-- Name: demand_to_reserve_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3368 (class 2606 OID 89051)
-- Name: demand_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_pkey PRIMARY KEY (demand_id, reserve_id);


--
-- TOC entry 3370 (class 2606 OID 89053)
-- Name: demand_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 3372 (class 2606 OID 89055)
-- Name: goal_to_demand_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3374 (class 2606 OID 89057)
-- Name: goal_to_demand_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3376 (class 2606 OID 89059)
-- Name: goal_to_demand_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_pkey PRIMARY KEY (goal_id, demand_id);


--
-- TOC entry 3378 (class 2606 OID 89061)
-- Name: goal_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 3380 (class 2606 OID 89063)
-- Name: goal_to_despatch_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3382 (class 2606 OID 89065)
-- Name: goal_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_pkey PRIMARY KEY (goal_id, despatch_id);


--
-- TOC entry 3384 (class 2606 OID 89067)
-- Name: goal_to_issue_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3386 (class 2606 OID 89069)
-- Name: goal_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3388 (class 2606 OID 89071)
-- Name: goal_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_pkey PRIMARY KEY (goal_id, issue_id);


--
-- TOC entry 3390 (class 2606 OID 89073)
-- Name: goal_to_picklist_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3392 (class 2606 OID 89075)
-- Name: goal_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3394 (class 2606 OID 89077)
-- Name: goal_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_pkey PRIMARY KEY (goal_id, picklist_id);


--
-- TOC entry 3396 (class 2606 OID 89079)
-- Name: goal_to_reserve_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3398 (class 2606 OID 89081)
-- Name: goal_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_pkey PRIMARY KEY (goal_id, reserve_id);


--
-- TOC entry 3400 (class 2606 OID 89083)
-- Name: goal_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 3402 (class 2606 OID 89085)
-- Name: issue_to_adjustmentcredit_adjustmentcredit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_adjustmentcredit_id_key UNIQUE (adjustmentcredit_id);


--
-- TOC entry 3404 (class 2606 OID 89087)
-- Name: issue_to_adjustmentcredit_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3406 (class 2606 OID 89089)
-- Name: issue_to_adjustmentcredit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_pkey PRIMARY KEY (adjustmentcredit_id, issue_id);


--
-- TOC entry 3408 (class 2606 OID 89091)
-- Name: issue_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 3410 (class 2606 OID 89093)
-- Name: issue_to_despatch_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3412 (class 2606 OID 89095)
-- Name: issue_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_pkey PRIMARY KEY (issue_id, despatch_id);


--
-- TOC entry 3414 (class 2606 OID 89097)
-- Name: issue_to_rebound_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3416 (class 2606 OID 89099)
-- Name: issue_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_pkey PRIMARY KEY (rebound_id, issue_id);


--
-- TOC entry 3418 (class 2606 OID 89101)
-- Name: issue_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 3420 (class 2606 OID 89103)
-- Name: picklist_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3422 (class 2606 OID 89105)
-- Name: picklist_to_issue_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3424 (class 2606 OID 89107)
-- Name: picklist_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_pkey PRIMARY KEY (picklist_id, issue_id);


--
-- TOC entry 3426 (class 2606 OID 89109)
-- Name: receipt_to_adjustmentdebit_adjustmentdebit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_adjustmentdebit_id_key UNIQUE (adjustmentdebit_id);


--
-- TOC entry 3428 (class 2606 OID 89111)
-- Name: receipt_to_adjustmentdebit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_pkey PRIMARY KEY (adjustmentdebit_id, receipt_id);


--
-- TOC entry 3430 (class 2606 OID 89113)
-- Name: receipt_to_adjustmentdebit_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 3432 (class 2606 OID 89115)
-- Name: receipt_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_pkey PRIMARY KEY (rebound_id, receipt_id);


--
-- TOC entry 3434 (class 2606 OID 89117)
-- Name: receipt_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 3436 (class 2606 OID 89119)
-- Name: receipt_to_rebound_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_receipt_id_key UNIQUE (receipt_id);


SET search_path = common, pg_catalog;

--
-- TOC entry 3438 (class 2606 OID 89121)
-- Name: cutoff_policy_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY cutoff_policy
    ADD CONSTRAINT cutoff_policy_pkey PRIMARY KEY (document_type_name);


--
-- TOC entry 3440 (class 2606 OID 89123)
-- Name: document_abbrevation_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY document_abbrevation
    ADD CONSTRAINT document_abbrevation_pkey PRIMARY KEY (doctype);


--
-- TOC entry 3442 (class 2606 OID 89125)
-- Name: exception_code_condition_name_key; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_condition_name_key UNIQUE (condition_name);


--
-- TOC entry 3444 (class 2606 OID 89127)
-- Name: exception_code_errcode_key; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_errcode_key UNIQUE (errcode);


--
-- TOC entry 3446 (class 2606 OID 89129)
-- Name: exception_code_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3448 (class 2606 OID 89131)
-- Name: stocktake_policy_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY stocktake_policy
    ADD CONSTRAINT stocktake_policy_pkey PRIMARY KEY (document_type_name);


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3450 (class 2606 OID 89133)
-- Name: blocker_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY blocker
    ADD CONSTRAINT blocker_pkey PRIMARY KEY (registry_id, blocker_document);


--
-- TOC entry 3452 (class 2606 OID 89135)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


--
-- TOC entry 3454 (class 2606 OID 89137)
-- Name: registry_gid_key; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_gid_key UNIQUE (gid);


--
-- TOC entry 3456 (class 2606 OID 89139)
-- Name: registry_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_pkey PRIMARY KEY (id);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3458 (class 2606 OID 89141)
-- Name: body_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3460 (class 2606 OID 89143)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3462 (class 2606 OID 89145)
-- Name: head_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3464 (class 2606 OID 89147)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = demand, pg_catalog;

--
-- TOC entry 3466 (class 2606 OID 89149)
-- Name: body_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3468 (class 2606 OID 89151)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3470 (class 2606 OID 89153)
-- Name: head_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 89155)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3474 (class 2606 OID 89157)
-- Name: body_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3476 (class 2606 OID 89159)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3478 (class 2606 OID 89161)
-- Name: head_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 89163)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = goal, pg_catalog;

--
-- TOC entry 3482 (class 2606 OID 89165)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


--
-- TOC entry 3484 (class 2606 OID 89167)
-- Name: registry_gid_key; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_gid_key UNIQUE (gid);


--
-- TOC entry 3486 (class 2606 OID 89169)
-- Name: registry_pkey; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_pkey PRIMARY KEY (id);


SET search_path = issue, pg_catalog;

--
-- TOC entry 3488 (class 2606 OID 89171)
-- Name: body_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3490 (class 2606 OID 89173)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3492 (class 2606 OID 89175)
-- Name: head_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3494 (class 2606 OID 89177)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = lot, pg_catalog;

--
-- TOC entry 3496 (class 2606 OID 89179)
-- Name: registry_pkey; Type: CONSTRAINT; Schema: lot; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_pkey PRIMARY KEY (ib);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3498 (class 2606 OID 89181)
-- Name: body_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3500 (class 2606 OID 89183)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3502 (class 2606 OID 89185)
-- Name: head_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 89187)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3506 (class 2606 OID 89189)
-- Name: body_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3508 (class 2606 OID 89191)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3510 (class 2606 OID 89193)
-- Name: head_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3512 (class 2606 OID 89195)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3514 (class 2606 OID 89197)
-- Name: body_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3516 (class 2606 OID 89199)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3518 (class 2606 OID 89201)
-- Name: head_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3520 (class 2606 OID 89203)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3522 (class 2606 OID 89205)
-- Name: body_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3524 (class 2606 OID 89207)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3526 (class 2606 OID 89209)
-- Name: head_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3528 (class 2606 OID 89211)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = schedule, pg_catalog;

--
-- TOC entry 3530 (class 2606 OID 89213)
-- Name: calendar_pkey; Type: CONSTRAINT; Schema: schedule; Owner: postgres
--

ALTER TABLE ONLY calendar
    ADD CONSTRAINT calendar_pkey PRIMARY KEY (calendar_date);


SET search_path = stockcard, pg_catalog;

--
-- TOC entry 3533 (class 2606 OID 89215)
-- Name: registry_pkey; Type: CONSTRAINT; Schema: stockcard; Owner: postgres
--

ALTER TABLE ONLY registry
    ADD CONSTRAINT registry_pkey PRIMARY KEY (document_gid, good_code);


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3535 (class 2606 OID 89217)
-- Name: body_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3537 (class 2606 OID 89219)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3539 (class 2606 OID 89221)
-- Name: head_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3541 (class 2606 OID 89223)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = stockcard, pg_catalog;

--
-- TOC entry 3531 (class 1259 OID 89224)
-- Name: registry_document_type_facility_code_good_code_idx; Type: INDEX; Schema: stockcard; Owner: postgres
--

CREATE INDEX registry_document_type_facility_code_good_code_idx ON registry USING btree (document_type, facility_code, good_code);


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3606 (class 2620 OID 89225)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3607 (class 2620 OID 89226)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3608 (class 2620 OID 89227)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3609 (class 2620 OID 89228)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3610 (class 2620 OID 89229)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3611 (class 2620 OID 89230)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3612 (class 2620 OID 89231)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: cutoff; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON registry FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3613 (class 2620 OID 89232)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3614 (class 2620 OID 89233)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3615 (class 2620 OID 89234)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = demand, pg_catalog;

--
-- TOC entry 3616 (class 2620 OID 89235)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3617 (class 2620 OID 89236)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3618 (class 2620 OID 89237)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3619 (class 2620 OID 89238)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3620 (class 2620 OID 89239)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3621 (class 2620 OID 89240)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = goal, pg_catalog;

--
-- TOC entry 3622 (class 2620 OID 89241)
-- Name: set_prev_goal_transition; Type: TRIGGER; Schema: goal; Owner: postgres
--

CREATE TRIGGER set_prev_goal_transition BEFORE UPDATE ON registry FOR EACH ROW EXECUTE PROCEDURE set_prev_goal_transition();


SET search_path = issue, pg_catalog;

--
-- TOC entry 3623 (class 2620 OID 89242)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3624 (class 2620 OID 89243)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3625 (class 2620 OID 89244)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3626 (class 2620 OID 89245)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3627 (class 2620 OID 89246)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3628 (class 2620 OID 89247)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3629 (class 2620 OID 89248)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3630 (class 2620 OID 89249)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3631 (class 2620 OID 89250)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3632 (class 2620 OID 89251)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3633 (class 2620 OID 89252)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3634 (class 2620 OID 89253)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3635 (class 2620 OID 89254)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3636 (class 2620 OID 89255)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3637 (class 2620 OID 89256)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3638 (class 2620 OID 89257)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3639 (class 2620 OID 89258)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3640 (class 2620 OID 89259)
-- Name: set_prev_doc_transition; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER set_prev_doc_transition BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_transition();


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3542 (class 2606 OID 89260)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3543 (class 2606 OID 89265)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = binding, pg_catalog;

--
-- TOC entry 3544 (class 2606 OID 89270)
-- Name: cutoff_to_adjustmentcredit_adjustmentcredit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_adjustmentcredit_id_fkey FOREIGN KEY (adjustmentcredit_id) REFERENCES adjustmentcredit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3545 (class 2606 OID 89275)
-- Name: cutoff_to_adjustmentcredit_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3546 (class 2606 OID 89280)
-- Name: cutoff_to_adjustmentdebit_adjustmentdebit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_adjustmentdebit_id_fkey FOREIGN KEY (adjustmentdebit_id) REFERENCES adjustmentdebit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3547 (class 2606 OID 89285)
-- Name: cutoff_to_adjustmentdebit_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3548 (class 2606 OID 89290)
-- Name: cutoff_to_delivery_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3549 (class 2606 OID 89295)
-- Name: cutoff_to_delivery_delivery_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES delivery.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3550 (class 2606 OID 89300)
-- Name: cutoff_to_demand_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3551 (class 2606 OID 89305)
-- Name: cutoff_to_demand_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3552 (class 2606 OID 89310)
-- Name: cutoff_to_despatch_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3553 (class 2606 OID 89315)
-- Name: cutoff_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3554 (class 2606 OID 89320)
-- Name: cutoff_to_goal_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3555 (class 2606 OID 89325)
-- Name: cutoff_to_goal_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3556 (class 2606 OID 89330)
-- Name: cutoff_to_issue_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3557 (class 2606 OID 89335)
-- Name: cutoff_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3558 (class 2606 OID 89340)
-- Name: cutoff_to_picklist_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3559 (class 2606 OID 89345)
-- Name: cutoff_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3560 (class 2606 OID 89350)
-- Name: cutoff_to_rebound_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3561 (class 2606 OID 89355)
-- Name: cutoff_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3562 (class 2606 OID 89360)
-- Name: cutoff_to_receipt_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3563 (class 2606 OID 89365)
-- Name: cutoff_to_receipt_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3564 (class 2606 OID 89370)
-- Name: cutoff_to_reserve_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3565 (class 2606 OID 89375)
-- Name: cutoff_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3566 (class 2606 OID 89380)
-- Name: cutoff_to_stocktake_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3567 (class 2606 OID 89385)
-- Name: cutoff_to_stocktake_stocktake_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_stocktake_id_fkey FOREIGN KEY (stocktake_id) REFERENCES stocktake.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3568 (class 2606 OID 89390)
-- Name: delivery_to_receipt_delivery_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES delivery.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3569 (class 2606 OID 89395)
-- Name: delivery_to_receipt_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3570 (class 2606 OID 89400)
-- Name: demand_to_picklist_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3571 (class 2606 OID 89405)
-- Name: demand_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3572 (class 2606 OID 89410)
-- Name: demand_to_reserve_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3573 (class 2606 OID 89415)
-- Name: demand_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3574 (class 2606 OID 89420)
-- Name: goal_to_demand_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3575 (class 2606 OID 89425)
-- Name: goal_to_demand_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3576 (class 2606 OID 89430)
-- Name: goal_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3577 (class 2606 OID 89435)
-- Name: goal_to_despatch_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3578 (class 2606 OID 89440)
-- Name: goal_to_issue_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3579 (class 2606 OID 89445)
-- Name: goal_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3580 (class 2606 OID 89450)
-- Name: goal_to_picklist_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3581 (class 2606 OID 89455)
-- Name: goal_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3582 (class 2606 OID 89460)
-- Name: goal_to_reserve_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3583 (class 2606 OID 89465)
-- Name: goal_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3584 (class 2606 OID 89470)
-- Name: issue_to_adjustmentcredit_adjustmentcredit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_adjustmentcredit_id_fkey FOREIGN KEY (adjustmentcredit_id) REFERENCES adjustmentcredit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3585 (class 2606 OID 89475)
-- Name: issue_to_adjustmentcredit_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3586 (class 2606 OID 89480)
-- Name: issue_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3587 (class 2606 OID 89485)
-- Name: issue_to_despatch_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3588 (class 2606 OID 89490)
-- Name: issue_to_rebound_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3589 (class 2606 OID 89495)
-- Name: issue_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3590 (class 2606 OID 89500)
-- Name: picklist_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3591 (class 2606 OID 89505)
-- Name: picklist_to_issue_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3592 (class 2606 OID 89510)
-- Name: receipt_to_adjustmentdebit_adjustmentdebit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_adjustmentdebit_id_fkey FOREIGN KEY (adjustmentdebit_id) REFERENCES adjustmentdebit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3593 (class 2606 OID 89515)
-- Name: receipt_to_adjustmentdebit_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3594 (class 2606 OID 89520)
-- Name: receipt_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3595 (class 2606 OID 89525)
-- Name: receipt_to_rebound_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3596 (class 2606 OID 89530)
-- Name: blocker_registry_id_fkey; Type: FK CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY blocker
    ADD CONSTRAINT blocker_registry_id_fkey FOREIGN KEY (registry_id) REFERENCES registry(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3597 (class 2606 OID 89535)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = demand, pg_catalog;

--
-- TOC entry 3598 (class 2606 OID 89540)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3599 (class 2606 OID 89545)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = issue, pg_catalog;

--
-- TOC entry 3600 (class 2606 OID 89550)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3601 (class 2606 OID 89555)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3602 (class 2606 OID 89560)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3603 (class 2606 OID 89565)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3604 (class 2606 OID 89570)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3605 (class 2606 OID 89575)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 34
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-15 14:09:24 EET

--
-- PostgreSQL database dump complete
--

