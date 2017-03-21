--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-03-21 13:49:52 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 12 (class 2615 OID 106125)
-- Name: adjustmentcredit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adjustmentcredit;


ALTER SCHEMA adjustmentcredit OWNER TO postgres;

--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 12
-- Name: SCHEMA adjustmentcredit; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA adjustmentcredit IS 'issue';


--
-- TOC entry 13 (class 2615 OID 106126)
-- Name: adjustmentdebit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adjustmentdebit;


ALTER SCHEMA adjustmentdebit OWNER TO postgres;

--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA adjustmentdebit; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA adjustmentdebit IS 'receipt';


--
-- TOC entry 14 (class 2615 OID 106127)
-- Name: api; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA api;


ALTER SCHEMA api OWNER TO postgres;

--
-- TOC entry 15 (class 2615 OID 106128)
-- Name: balance; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA balance;


ALTER SCHEMA balance OWNER TO postgres;

--
-- TOC entry 16 (class 2615 OID 106129)
-- Name: binding; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA binding;


ALTER SCHEMA binding OWNER TO postgres;

--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA binding; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA binding IS 'bond';


--
-- TOC entry 17 (class 2615 OID 106130)
-- Name: common; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA common;


ALTER SCHEMA common OWNER TO postgres;

--
-- TOC entry 18 (class 2615 OID 106131)
-- Name: cutoff; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cutoff;


ALTER SCHEMA cutoff OWNER TO postgres;

--
-- TOC entry 19 (class 2615 OID 106132)
-- Name: delivery; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA delivery;


ALTER SCHEMA delivery OWNER TO postgres;

--
-- TOC entry 20 (class 2615 OID 106133)
-- Name: demand; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA demand;


ALTER SCHEMA demand OWNER TO postgres;

--
-- TOC entry 21 (class 2615 OID 106134)
-- Name: despatch; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA despatch;


ALTER SCHEMA despatch OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 106135)
-- Name: goal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA goal;


ALTER SCHEMA goal OWNER TO postgres;

--
-- TOC entry 23 (class 2615 OID 106136)
-- Name: issue; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA issue;


ALTER SCHEMA issue OWNER TO postgres;

--
-- TOC entry 24 (class 2615 OID 106137)
-- Name: lot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA lot;


ALTER SCHEMA lot OWNER TO postgres;

--
-- TOC entry 25 (class 2615 OID 106138)
-- Name: pgunit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgunit;


ALTER SCHEMA pgunit OWNER TO postgres;

--
-- TOC entry 26 (class 2615 OID 106139)
-- Name: picklist; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA picklist;


ALTER SCHEMA picklist OWNER TO postgres;

--
-- TOC entry 27 (class 2615 OID 106140)
-- Name: rebound; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rebound;


ALTER SCHEMA rebound OWNER TO postgres;

--
-- TOC entry 28 (class 2615 OID 106141)
-- Name: receipt; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA receipt;


ALTER SCHEMA receipt OWNER TO postgres;

--
-- TOC entry 29 (class 2615 OID 106142)
-- Name: reserve; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA reserve;


ALTER SCHEMA reserve OWNER TO postgres;

--
-- TOC entry 30 (class 2615 OID 106143)
-- Name: schedule; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schedule;


ALTER SCHEMA schedule OWNER TO postgres;

--
-- TOC entry 31 (class 2615 OID 106144)
-- Name: stockcard; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stockcard;


ALTER SCHEMA stockcard OWNER TO postgres;

--
-- TOC entry 32 (class 2615 OID 106145)
-- Name: stocktake; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stocktake;


ALTER SCHEMA stocktake OWNER TO postgres;

--
-- TOC entry 33 (class 2615 OID 106146)
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
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 106147)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 6 (class 3079 OID 106156)
-- Name: pldbgapi; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pldbgapi WITH SCHEMA public;


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pldbgapi; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pldbgapi IS 'server-side support for debugging PL/pgSQL functions';


--
-- TOC entry 5 (class 3079 OID 106193)
-- Name: plpgsql_check; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql_check WITH SCHEMA public;


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION plpgsql_check; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql_check IS 'extended check for plpgsql functions';


--
-- TOC entry 4 (class 3079 OID 106198)
-- Name: plprofiler; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plprofiler WITH SCHEMA public;


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION plprofiler; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plprofiler IS 'server-side support for profiling PL/pgSQL functions';


--
-- TOC entry 3 (class 3079 OID 106267)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = common, pg_catalog;

--
-- TOC entry 1417 (class 1247 OID 106279)
-- Name: document_kind; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_kind AS ENUM (
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


ALTER TYPE document_kind OWNER TO postgres;

--
-- TOC entry 1420 (class 1247 OID 106308)
-- Name: result_kind; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE result_kind AS ENUM (
    'FAILED',
    'SUCCEEDED'
);


ALTER TYPE result_kind OWNER TO postgres;

--
-- TOC entry 1423 (class 1247 OID 106315)
-- Name: action_result; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE action_result AS (
	document_id bigint,
	doctype document_kind,
	result_achieved result_kind
);


ALTER TYPE action_result OWNER TO postgres;

--
-- TOC entry 1426 (class 1247 OID 106316)
-- Name: quantity; Type: DOMAIN; Schema: common; Owner: postgres
--

CREATE DOMAIN quantity AS numeric(20,4) DEFAULT 0
	CONSTRAINT quantity_is_positive CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN quantity OWNER TO postgres;

--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 1426
-- Name: DOMAIN quantity; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON DOMAIN quantity IS 'quantity domain';


--
-- TOC entry 1428 (class 1247 OID 106320)
-- Name: document_body; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_body AS (
	good_code character varying,
	quantity quantity,
	uom_code character varying
);


ALTER TYPE document_body OWNER TO postgres;

--
-- TOC entry 1431 (class 1247 OID 106322)
-- Name: document_fsmt; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_fsmt AS ENUM (
    'PROPOSED',
    'COMMITTED',
    'DECOMMITTED'
);


ALTER TYPE document_fsmt OWNER TO postgres;

--
-- TOC entry 1434 (class 1247 OID 106331)
-- Name: document_head; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_head AS (
	document_id bigint,
	gid uuid,
	display_name character varying,
	document_date date,
	facility_code character varying,
	curr_fsmt document_fsmt,
	doctype document_kind
);


ALTER TYPE document_head OWNER TO postgres;

--
-- TOC entry 1437 (class 1247 OID 106334)
-- Name: document_type; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_type AS (
	head document_head,
	body document_body[]
);


ALTER TYPE document_type OWNER TO postgres;

--
-- TOC entry 1440 (class 1247 OID 106336)
-- Name: goal_fsmt; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE goal_fsmt AS ENUM (
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


ALTER TYPE goal_fsmt OWNER TO postgres;

--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 1440
-- Name: TYPE goal_fsmt; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON TYPE goal_fsmt IS 'fsmt type';


--
-- TOC entry 1443 (class 1247 OID 106357)
-- Name: goal_head; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE goal_head AS (
	document_id bigint,
	gid uuid,
	display_name character varying,
	document_date date,
	facility_code character varying,
	curr_fsmt goal_fsmt,
	doctype document_kind
);


ALTER TYPE goal_head OWNER TO postgres;

--
-- TOC entry 1446 (class 1247 OID 106360)
-- Name: inbound_head; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE inbound_head AS (
	document_id bigint,
	gid uuid,
	display_name character varying,
	document_date date,
	facility_code character varying,
	curr_fsmt document_fsmt,
	doctype document_kind,
	addresser character varying
);


ALTER TYPE inbound_head OWNER TO postgres;

--
-- TOC entry 1449 (class 1247 OID 106363)
-- Name: outbound_head; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE outbound_head AS (
	document_id bigint,
	gid uuid,
	display_name character varying,
	document_date date,
	facility_code character varying,
	curr_fsmt document_fsmt,
	doctype document_kind,
	addressee character varying,
	due_date date
);


ALTER TYPE outbound_head OWNER TO postgres;

--
-- TOC entry 1452 (class 1247 OID 106365)
-- Name: policy_mode; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE policy_mode AS ENUM (
    'DISABLED',
    'PERMISSIVE',
    'ENFORCING'
);


ALTER TYPE policy_mode OWNER TO postgres;

--
-- TOC entry 1455 (class 1247 OID 106371)
-- Name: quantity_signed; Type: DOMAIN; Schema: common; Owner: postgres
--

CREATE DOMAIN quantity_signed AS numeric(20,4) DEFAULT 0;


ALTER DOMAIN quantity_signed OWNER TO postgres;

--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 1455
-- Name: DOMAIN quantity_signed; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON DOMAIN quantity_signed IS 'quantity signed domain';


--
-- TOC entry 1456 (class 1247 OID 106374)
-- Name: stoktake_body; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE stoktake_body AS (
	good_code character varying,
	quantity quantity,
	uom_code character varying,
	quantity_diff quantity_signed
);


ALTER TYPE stoktake_body OWNER TO postgres;

SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 379 (class 1255 OID 106375)
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
-- TOC entry 380 (class 1255 OID 106376)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      adjustmentcredit.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      adjustmentcredit.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt;
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION adjustmentcredit.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 106377)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.outbound_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentcredit.get_head(__document_id);
  _body := adjustmentcredit.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
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

  IF (_parent_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_loss);
  PERFORM stockcard.assign_adjustmentcredit(
    __document_head := _head,
    __document_body := _body);

  UPDATE
    adjustmentcredit.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentcredit.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 106378)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.outbound_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentcredit.get_head(__document_id);
  _body := adjustmentcredit.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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

  /*IF (_parent_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_loss);
  PERFORM stockcard.deassign_adjustmentcredit(_head.document_id);

  UPDATE
    adjustmentcredit.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentcredit.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 106379)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := adjustmentcredit.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('ADJUSTMENTCREDIT');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION adjustmentcredit.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 106380)
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
-- TOC entry 385 (class 1255 OID 106381)
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
-- TOC entry 386 (class 1255 OID 106382)
-- Name: get_head(bigint); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.outbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_from,
    curr_fsmt,
    'ADJUSTMENTCREDIT'::common.document_kind,
    ship_to,
    due_date)::common.outbound_head
  FROM 
    adjustmentcredit.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentcredit.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 106383)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'ADJUSTMENTCREDIT'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        adjustmentcredit.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION adjustmentcredit.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 106384)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'ADJUSTMENTCREDIT'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        adjustmentcredit.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION adjustmentcredit.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 390 (class 1255 OID 106385)
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
-- TOC entry 391 (class 1255 OID 106386)
-- Name: init(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: adjustmentcredit; Owner: postgres
--

CREATE FUNCTION init(__head common.outbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  INSERT INTO
    adjustmentcredit.head (
      id,
      document_date,
      due_date,
      ship_from,
      ship_to)
  VALUES (
    DEFAULT, 
    __head.document_date, 
    __head.due_date, 
    __head.facility_code,
    __head.addressee) 
  RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO adjustmentcredit.body VALUES (_document_id, _item.good_code, _item.quantity, _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION adjustmentcredit.init(__head common.outbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 106387)
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
-- TOC entry 393 (class 1255 OID 106388)
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
-- TOC entry 394 (class 1255 OID 106389)
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
-- TOC entry 395 (class 1255 OID 106390)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      adjustmentdebit.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      adjustmentdebit.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION adjustmentdebit.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 106391)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.inbound_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentdebit.get_head(__document_id);
  _body := adjustmentdebit.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
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

  IF (_parent_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_loss);
  PERFORM stockcard.assign_adjustmentdebit(
    __document_head := _head,
    __document_body := _body);

  UPDATE
    adjustmentdebit.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentdebit.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 106392)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
  _parent_id bigint;
  _parent_head common.inbound_head;
  _array_to_gain common.document_body[] DEFAULT '{}';
  _array_to_loss common.document_body[] DEFAULT '{}';
  _row_from_select record;
BEGIN

  _head := adjustmentdebit.get_head(__document_id);
  _body := adjustmentdebit.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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

  /*IF (_parent_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _parent_head.facility_code,
    __inventory := _array_to_loss);
  PERFORM stockcard.deassign_adjustmentdebit(__document_id);

  UPDATE
    adjustmentdebit.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION adjustmentdebit.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 398 (class 1255 OID 106393)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := adjustmentdebit.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('ADJUSTMENTDEBIT');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION adjustmentdebit.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 106394)
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
-- TOC entry 400 (class 1255 OID 106395)
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
-- TOC entry 401 (class 1255 OID 106396)
-- Name: get_head(bigint); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.inbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_to,
    curr_fsmt,
    'ADJUSTMENTDEBIT'::common.document_kind,
    ship_from)::common.inbound_head
  FROM 
    adjustmentdebit.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION adjustmentdebit.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 106397)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'ADJUSTMENTDEBIT'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        adjustmentdebit.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION adjustmentdebit.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 106398)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'ADJUSTMENTDEBIT'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        adjustmentdebit.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION adjustmentdebit.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 404 (class 1255 OID 106399)
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
-- TOC entry 405 (class 1255 OID 106400)
-- Name: init(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: adjustmentdebit; Owner: postgres
--

CREATE FUNCTION init(__head common.inbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  INSERT INTO
    adjustmentdebit.head (
      id,
      document_date,
      ship_from,
      ship_to)
  VALUES (
    DEFAULT, 
    __head.document_date, 
    __head.facility_code, 
    __head.addresser) 
    RETURNING id INTO _document_id;

  FOREACH _item IN
    ARRAY __body
  LOOP
    INSERT INTO adjustmentdebit.body VALUES (_document_id, _item.good_code, _item.quantity, _item.uom_code);
  END LOOP;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION adjustmentdebit.init(__head common.inbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 106401)
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
-- TOC entry 407 (class 1255 OID 106402)
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
-- TOC entry 408 (class 1255 OID 106403)
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
-- TOC entry 409 (class 1255 OID 106404)
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
-- TOC entry 411 (class 1255 OID 106405)
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
-- TOC entry 412 (class 1255 OID 106406)
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
-- TOC entry 413 (class 1255 OID 106407)
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
-- TOC entry 414 (class 1255 OID 106408)
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
-- TOC entry 415 (class 1255 OID 106409)
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
-- TOC entry 416 (class 1255 OID 106410)
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
-- TOC entry 417 (class 1255 OID 106411)
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
-- TOC entry 418 (class 1255 OID 106412)
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
-- TOC entry 419 (class 1255 OID 106413)
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
-- TOC entry 420 (class 1255 OID 106414)
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
-- TOC entry 421 (class 1255 OID 106415)
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
-- TOC entry 422 (class 1255 OID 106416)
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
-- TOC entry 423 (class 1255 OID 106417)
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
-- TOC entry 387 (class 1255 OID 106418)
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
-- TOC entry 425 (class 1255 OID 106419)
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
-- TOC entry 426 (class 1255 OID 106420)
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
-- TOC entry 427 (class 1255 OID 106421)
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
-- TOC entry 428 (class 1255 OID 106422)
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
-- TOC entry 429 (class 1255 OID 106423)
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
-- TOC entry 430 (class 1255 OID 106424)
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
-- TOC entry 431 (class 1255 OID 106425)
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
-- TOC entry 432 (class 1255 OID 106426)
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
-- TOC entry 433 (class 1255 OID 106427)
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
-- TOC entry 434 (class 1255 OID 106428)
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
-- TOC entry 435 (class 1255 OID 106429)
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
-- TOC entry 436 (class 1255 OID 106430)
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
-- TOC entry 437 (class 1255 OID 106431)
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
-- TOC entry 438 (class 1255 OID 106432)
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
-- TOC entry 439 (class 1255 OID 106433)
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
-- TOC entry 440 (class 1255 OID 106434)
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
-- TOC entry 441 (class 1255 OID 106435)
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
-- TOC entry 442 (class 1255 OID 106436)
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
-- TOC entry 443 (class 1255 OID 106437)
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
-- TOC entry 444 (class 1255 OID 106438)
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
-- TOC entry 445 (class 1255 OID 106439)
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
-- TOC entry 446 (class 1255 OID 106440)
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
-- TOC entry 447 (class 1255 OID 106441)
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
-- TOC entry 448 (class 1255 OID 106442)
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
-- TOC entry 449 (class 1255 OID 106443)
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
-- TOC entry 450 (class 1255 OID 106444)
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
-- TOC entry 451 (class 1255 OID 106445)
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
-- TOC entry 452 (class 1255 OID 106446)
-- Name: get_cutoff_binded_to(common.document_head); Type: FUNCTION; Schema: binding; Owner: postgres
--

CREATE FUNCTION get_cutoff_binded_to(__head common.document_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
BEGIN
  CASE __head.doctype
    WHEN 'ADJUSTMENTCREDIT'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_adjustmentcredit(__head.document_id);
    WHEN 'ADJUSTMENTDEBIT'::common.document_kind THEN
      _cutoff_id := binding.get_cutoff_binded_to_adjustmentdebit(__head.document_id);
    WHEN 'DELIVERY'::common.document_kind THEN
      _cutoff_id := binding.get_cutoff_binded_to_delivery(__head.document_id);
    WHEN 'DEMAND'::common.document_kind THEN
      _cutoff_id := binding.get_cutoff_binded_to_demand(__head.document_id);
    WHEN 'DESPATCH'::common.document_kind THEN
      _cutoff_id := binding.get_cutoff_binded_to_despatch(__head.document_id);
    WHEN 'ISSUE'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_issue(__head.document_id);
    WHEN 'PICKLIST'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_picklist(__head.document_id);
    WHEN 'REBOUND'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_rebound(__head.document_id);
    WHEN 'RESERVE'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_reserve(__head.document_id);
    WHEN 'RECEIPT'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_receipt(__head.document_id);
    WHEN 'STOCKTAKE'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_stocktake(__head.document_id);
    WHEN 'GOAL'::common.document_kind THEN 
      _cutoff_id := binding.get_cutoff_binded_to_goal(__head.document_id);
    ELSE
      RAISE EXCEPTION 'unsupported doctype %', __head.doctype;
  END CASE;

  RETURN _cutoff_id;
END;
$$;


ALTER FUNCTION binding.get_cutoff_binded_to(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 106447)
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
-- TOC entry 454 (class 1255 OID 106448)
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
-- TOC entry 455 (class 1255 OID 106449)
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
-- TOC entry 456 (class 1255 OID 106450)
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
-- TOC entry 457 (class 1255 OID 106451)
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
-- TOC entry 458 (class 1255 OID 106452)
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
-- TOC entry 459 (class 1255 OID 106453)
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
-- TOC entry 460 (class 1255 OID 106454)
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
-- TOC entry 461 (class 1255 OID 106455)
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
-- TOC entry 462 (class 1255 OID 106456)
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
-- TOC entry 463 (class 1255 OID 106457)
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
-- TOC entry 410 (class 1255 OID 106458)
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
-- TOC entry 464 (class 1255 OID 106459)
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
-- TOC entry 465 (class 1255 OID 106460)
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
-- TOC entry 466 (class 1255 OID 106461)
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
-- TOC entry 467 (class 1255 OID 106462)
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
-- TOC entry 468 (class 1255 OID 106463)
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
-- TOC entry 469 (class 1255 OID 106464)
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
-- TOC entry 470 (class 1255 OID 106465)
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
-- TOC entry 471 (class 1255 OID 106466)
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
-- TOC entry 472 (class 1255 OID 106467)
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
-- TOC entry 473 (class 1255 OID 106468)
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
-- TOC entry 474 (class 1255 OID 106469)
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
-- TOC entry 475 (class 1255 OID 106470)
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
-- TOC entry 476 (class 1255 OID 106471)
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
-- TOC entry 477 (class 1255 OID 106472)
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
-- TOC entry 478 (class 1255 OID 106473)
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
-- TOC entry 479 (class 1255 OID 106474)
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
-- TOC entry 480 (class 1255 OID 106475)
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
-- TOC entry 481 (class 1255 OID 106476)
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
-- TOC entry 482 (class 1255 OID 106477)
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
-- TOC entry 483 (class 1255 OID 106478)
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
-- TOC entry 484 (class 1255 OID 106479)
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
-- TOC entry 485 (class 1255 OID 106480)
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
-- TOC entry 486 (class 1255 OID 106481)
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
-- TOC entry 424 (class 1255 OID 106482)
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
-- TOC entry 487 (class 1255 OID 106483)
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
-- TOC entry 488 (class 1255 OID 106484)
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
-- TOC entry 489 (class 1255 OID 106485)
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
-- TOC entry 490 (class 1255 OID 106486)
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
-- TOC entry 491 (class 1255 OID 106487)
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
-- TOC entry 492 (class 1255 OID 106488)
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
-- TOC entry 493 (class 1255 OID 106489)
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
-- TOC entry 494 (class 1255 OID 106490)
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
-- TOC entry 495 (class 1255 OID 106491)
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
-- TOC entry 496 (class 1255 OID 106492)
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
-- TOC entry 497 (class 1255 OID 106493)
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
-- TOC entry 498 (class 1255 OID 106494)
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
-- TOC entry 499 (class 1255 OID 106495)
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
-- TOC entry 500 (class 1255 OID 106496)
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
-- TOC entry 501 (class 1255 OID 106497)
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
-- TOC entry 502 (class 1255 OID 106498)
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
-- TOC entry 503 (class 1255 OID 106499)
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
-- TOC entry 504 (class 1255 OID 106500)
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
-- TOC entry 505 (class 1255 OID 106501)
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
-- TOC entry 506 (class 1255 OID 106502)
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
-- TOC entry 507 (class 1255 OID 106503)
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
-- TOC entry 508 (class 1255 OID 106504)
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
-- TOC entry 509 (class 1255 OID 106505)
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
-- TOC entry 510 (class 1255 OID 106506)
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
-- TOC entry 511 (class 1255 OID 106507)
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
-- TOC entry 512 (class 1255 OID 106508)
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
-- TOC entry 513 (class 1255 OID 106509)
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
-- TOC entry 514 (class 1255 OID 106510)
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
-- TOC entry 515 (class 1255 OID 106511)
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
-- TOC entry 516 (class 1255 OID 106512)
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
-- TOC entry 517 (class 1255 OID 106513)
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
-- TOC entry 518 (class 1255 OID 106514)
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
-- TOC entry 519 (class 1255 OID 106515)
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
-- TOC entry 520 (class 1255 OID 106516)
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
-- TOC entry 521 (class 1255 OID 106517)
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
-- TOC entry 522 (class 1255 OID 106518)
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
-- TOC entry 523 (class 1255 OID 106519)
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
-- TOC entry 524 (class 1255 OID 106520)
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
-- TOC entry 525 (class 1255 OID 106521)
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
-- TOC entry 526 (class 1255 OID 106522)
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
-- TOC entry 527 (class 1255 OID 106523)
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
-- TOC entry 528 (class 1255 OID 106524)
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
-- TOC entry 529 (class 1255 OID 106525)
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
-- TOC entry 530 (class 1255 OID 106526)
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
-- TOC entry 531 (class 1255 OID 106527)
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
-- TOC entry 532 (class 1255 OID 106528)
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
-- TOC entry 533 (class 1255 OID 106529)
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
-- TOC entry 534 (class 1255 OID 106530)
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
-- TOC entry 535 (class 1255 OID 106531)
-- Name: convert_document_to_goal_fsmt(document_fsmt); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_document_to_goal_fsmt(__document_fsmt document_fsmt) RETURNS goal_fsmt
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_fsmt common.goal_fsmt;  
BEGIN

  CASE __document_fsmt
    WHEN 'PROPOSED'::common.document_fsmt THEN 
      _goal_fsmt := 'PROPOSED'::common.goal_fsmt;

    WHEN 'COMMITTED'::common.document_fsmt THEN
      _goal_fsmt := 'COMMITTED'::common.goal_fsmt;

    WHEN 'DECOMMITTED'::common.document_fsmt THEN 
      _goal_fsmt := 'DECOMMITTED'::common.goal_fsmt;

    ELSE
      RAISE EXCEPTION 'unsupported goal_fsmt %', __document_fsmt;

  END CASE;

  RETURN _goal_fsmt;

END;
$$;


ALTER FUNCTION common.convert_document_to_goal_fsmt(__document_fsmt document_fsmt) OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 106532)
-- Name: convert_goal_to_document_fsmt(goal_fsmt); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_goal_to_document_fsmt(__goal_fsmt goal_fsmt) RETURNS document_fsmt
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;  
BEGIN

  CASE __goal_fsmt
    WHEN 'PROPOSED'::common.goal_fsmt THEN 
      _document_fsmt := 'PROPOSED'::common.document_fsmt;

    WHEN 'ADVISED'::common.goal_fsmt THEN
      _document_fsmt := 'PROPOSED'::common.document_fsmt;

    WHEN 'REJECTED'::common.goal_fsmt THEN
      _document_fsmt := 'PROPOSED'::common.document_fsmt;

    WHEN 'ACCEPTED'::common.goal_fsmt THEN
      _document_fsmt := 'PROPOSED'::common.document_fsmt;

    WHEN 'CANCELED'::common.goal_fsmt THEN
      _document_fsmt := 'PROPOSED'::common.document_fsmt;

    WHEN 'COMMITTED'::common.goal_fsmt THEN
      _document_fsmt := 'COMMITTED'::common.document_fsmt;

    WHEN 'DECOMMITTED'::common.goal_fsmt THEN 
      _document_fsmt := 'DECOMMITTED'::common.document_fsmt;

    WHEN 'FAILED'::common.goal_fsmt THEN 
      _document_fsmt := 'COMMITTED'::common.document_fsmt;

    WHEN 'SATISFIED'::common.goal_fsmt THEN 
      _document_fsmt := 'COMMITTED'::common.document_fsmt;

    ELSE
      RAISE EXCEPTION 'unsupported goal_fsmt %', __goal_fsmt;

  END CASE;

  RETURN _document_fsmt;

END;
$$;


ALTER FUNCTION common.convert_goal_to_document_fsmt(__goal_fsmt goal_fsmt) OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 106533)
-- Name: convert_goal_to_document_head(goal_head); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_goal_to_document_head(__goal_head goal_head) RETURNS document_head
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN (
    __goal_head.document_id,
    __goal_head.gid,
    __goal_head.display_name,
    __goal_head.document_date,
    __goal_head.facility_code,
    __goal_head.curr_fsmt::common.document_fsmt,
    __goal_head.doctype
  )::common.document_head;

END;
$$;


ALTER FUNCTION common.convert_goal_to_document_head(__goal_head goal_head) OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 106534)
-- Name: convert_inbound_to_document_head(inbound_head); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_inbound_to_document_head(__inbound_head inbound_head) RETURNS document_head
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN (
    __inbound_head.document_id,
    __inbound_head.gid,
    __inbound_head.display_name,
    __inbound_head.document_date,
    __inbound_head.facility_code,
    __inbound_head.curr_fsmt,
    __inbound_head.doctype
  )::common.document_head;

END;
$$;


ALTER FUNCTION common.convert_inbound_to_document_head(__inbound_head inbound_head) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 106535)
-- Name: convert_outbound_to_document_head(outbound_head); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_outbound_to_document_head(__outbound_head outbound_head) RETURNS document_head
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN (
    __outbound_head.document_id,
    __outbound_head.gid,
    __outbound_head.display_name,
    __outbound_head.document_date,
    __outbound_head.facility_code,
    __outbound_head.curr_fsmt,
    __outbound_head.doctype
  )::common.document_head;

END;
$$;


ALTER FUNCTION common.convert_outbound_to_document_head(__outbound_head outbound_head) OWNER TO postgres;

--
-- TOC entry 540 (class 1255 OID 106536)
-- Name: convert_outbound_to_goal_head(outbound_head); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_outbound_to_goal_head(__outbound_head outbound_head) RETURNS goal_head
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN (
    __outbound_head.document_id,
    __outbound_head.gid,
    __outbound_head.display_name,
    __outbound_head.document_date,
    __outbound_head.facility_code,
    __outbound_head.curr_fsmt::common.goal_fsmt,
    __outbound_head.doctype
  )::common.goal_head;

END;
$$;


ALTER FUNCTION common.convert_outbound_to_goal_head(__outbound_head outbound_head) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 106537)
-- Name: convert_stoktake_to_document_body(stoktake_body); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION convert_stoktake_to_document_body(__stoktake_body stoktake_body) RETURNS document_body
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN (
    __stoktake_body.good_code,
    __stoktake_body.quantity,
    __stoktake_body.uom_code
  )::common.document_body;

END;
$$;


ALTER FUNCTION common.convert_stoktake_to_document_body(__stoktake_body stoktake_body) OWNER TO postgres;

--
-- TOC entry 542 (class 1255 OID 106538)
-- Name: disallow_editing_of_committed_document_head(); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_head() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'UPDATE') THEN

    IF (OLD.curr_fsmt = 'COMMITTED'::common.document_fsmt AND NEW.curr_fsmt <> 'DECOMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %, %', OLD.id, OLD.gid, OLD.curr_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN

    IF (OLD.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to delete document %, %', OLD.id, OLD.curr_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION common.disallow_editing_of_committed_document_head() OWNER TO postgres;

--
-- TOC entry 543 (class 1255 OID 106539)
-- Name: get_document_abbrevation(document_kind); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_document_abbrevation(__doctype document_kind) RETURNS character varying
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


ALTER FUNCTION common.get_document_abbrevation(__doctype document_kind) OWNER TO postgres;

--
-- TOC entry 544 (class 1255 OID 106540)
-- Name: get_document_head_types(policy_mode); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_document_head_types(__policy_mode policy_mode) RETURNS document_kind[]
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN
    ARRAY (
      SELECT
        document_kind_name
      FROM 
        common.cutoff_policy
      WHERE 
        policy_mode_applied = __policy_mode
    );

END;
$$;


ALTER FUNCTION common.get_document_head_types(__policy_mode policy_mode) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 106541)
-- Name: get_policy_mode(document_kind); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_policy_mode(__document_kind document_kind) RETURNS policy_mode
    LANGUAGE plpgsql
    AS $$
DECLARE
  _policy_mode common.policy_mode;
BEGIN

  SELECT
    policy_mode_applied
  FROM 
    common.cutoff_policy
  WHERE 
    document_kind_name = __document_kind
  INTO
    _policy_mode;
  IF NOT FOUND THEN
    _policy_mode := 'DISABLED'::common.policy_mode;
  END IF;

  RETURN _policy_mode;

END;
$$;


ALTER FUNCTION common.get_policy_mode(__document_kind document_kind) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 106542)
-- Name: get_stocktake_mode(document_kind); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION get_stocktake_mode(__document_kind document_kind) RETURNS policy_mode
    LANGUAGE plpgsql
    AS $$
DECLARE
  _stocktake_mode common.policy_mode;
BEGIN

  SELECT
    stocktake_mode_applied
  FROM 
    common.stocktake_policy
  WHERE 
    document_kind_name = __document_kind
  INTO
    _stocktake_mode;
  IF NOT FOUND THEN
    _stocktake_mode := 'DISABLED'::common.policy_mode;
  END IF;

  RETURN _stocktake_mode;

END;
$$;


ALTER FUNCTION common.get_stocktake_mode(__document_kind document_kind) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 106543)
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
-- TOC entry 549 (class 1255 OID 106544)
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
-- TOC entry 550 (class 1255 OID 106545)
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
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 550
-- Name: FUNCTION raise_custom_exception(__condition_name text); Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON FUNCTION raise_custom_exception(__condition_name text) IS 'Raise exception using mesage text from exception_code table';


--
-- TOC entry 551 (class 1255 OID 106546)
-- Name: remake_document_head(document_head, bigint, uuid, character varying, date, character varying, document_fsmt, document_kind); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION remake_document_head(__head document_head, __document_id bigint DEFAULT NULL::bigint, __gid uuid DEFAULT NULL::uuid, __display_name character varying DEFAULT NULL::character varying, __document_date date DEFAULT NULL::date, __facility_code character varying DEFAULT NULL::character varying, __curr_fsmt document_fsmt DEFAULT NULL::document_fsmt, __doctype document_kind DEFAULT NULL::document_kind) RETURNS document_head
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

  IF (__document_date IS NOT NULL) THEN
    __head.document_date := __document_date;
  END IF;

  IF (__facility_code IS NOT NULL) THEN
    __head.facility_code := __facility_code;
  END IF;

  IF (__curr_fsmt IS NOT NULL) THEN
    __head.curr_fsmt := __curr_fsmt;
  END IF;

  IF (__doctype IS NOT NULL) THEN
    __head.doctype := __doctype;
  END IF;

  RETURN __head;

END;
$$;


ALTER FUNCTION common.remake_document_head(__head document_head, __document_id bigint, __gid uuid, __display_name character varying, __document_date date, __facility_code character varying, __curr_fsmt document_fsmt, __doctype document_kind) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 106547)
-- Name: remake_inbound_head(inbound_head, bigint, uuid, character varying, date, character varying, document_fsmt, document_kind, character varying); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION remake_inbound_head(__head inbound_head, __document_id bigint DEFAULT NULL::bigint, __gid uuid DEFAULT NULL::uuid, __display_name character varying DEFAULT NULL::character varying, __document_date date DEFAULT NULL::date, __facility_code character varying DEFAULT NULL::character varying, __curr_fsmt document_fsmt DEFAULT NULL::document_fsmt, __doctype document_kind DEFAULT NULL::document_kind, __addresser character varying DEFAULT NULL::character varying) RETURNS inbound_head
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

  IF (__document_date IS NOT NULL) THEN
    __head.document_date := __document_date;
  END IF;

  IF (__facility_code IS NOT NULL) THEN
    __head.facility_code := __facility_code;
  END IF;

  IF (__curr_fsmt IS NOT NULL) THEN
    __head.curr_fsmt := __curr_fsmt;
  END IF;

  IF (__doctype IS NOT NULL) THEN
    __head.doctype := __doctype;
  END IF;

  IF (__addresser IS NOT NULL) THEN
    __head.addresser := __addresser;
  END IF;

  RETURN __head;

END;
$$;


ALTER FUNCTION common.remake_inbound_head(__head inbound_head, __document_id bigint, __gid uuid, __display_name character varying, __document_date date, __facility_code character varying, __curr_fsmt document_fsmt, __doctype document_kind, __addresser character varying) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 106548)
-- Name: remake_outbound_head(outbound_head, bigint, uuid, character varying, date, character varying, document_fsmt, document_kind, character varying, date); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION remake_outbound_head(__head outbound_head, __document_id bigint DEFAULT NULL::bigint, __gid uuid DEFAULT NULL::uuid, __display_name character varying DEFAULT NULL::character varying, __document_date date DEFAULT NULL::date, __facility_code character varying DEFAULT NULL::character varying, __curr_fsmt document_fsmt DEFAULT NULL::document_fsmt, __doctype document_kind DEFAULT NULL::document_kind, __addressee character varying DEFAULT NULL::character varying, __due_date date DEFAULT NULL::date) RETURNS outbound_head
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

  IF (__document_date IS NOT NULL) THEN
    __head.document_date := __document_date;
  END IF;

  IF (__facility_code IS NOT NULL) THEN
    __head.facility_code := __facility_code;
  END IF;

  IF (__curr_fsmt IS NOT NULL) THEN
    __head.curr_fsmt := __curr_fsmt;
  END IF;

  IF (__doctype IS NOT NULL) THEN
    __head.doctype := __doctype;
  END IF;

  IF (__addressee IS NOT NULL) THEN
    __head.addressee := __addressee;
  END IF;

  IF (__due_date IS NOT NULL) THEN
    __head.due_date := __due_date;
  END IF;

  IF (__head.due_date < __head.document_date) THEN
    __head.due_date := __head.document_date;
  END IF;

  RETURN __head;

END;
$$;


ALTER FUNCTION common.remake_outbound_head(__head outbound_head, __document_id bigint, __gid uuid, __display_name character varying, __document_date date, __facility_code character varying, __curr_fsmt document_fsmt, __doctype document_kind, __addressee character varying, __due_date date) OWNER TO postgres;

--
-- TOC entry 555 (class 1255 OID 106549)
-- Name: set_prev_doc_fsmt(); Type: FUNCTION; Schema: common; Owner: postgres
--

CREATE FUNCTION set_prev_doc_fsmt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'UPDATE' AND NEW.curr_fsmt != OLD.curr_fsmt) THEN
    NEW.prev_fsmt := OLD.curr_fsmt;
    NEW.prev_fsmt_date := OLD.curr_fsmt_date;
    NEW.curr_fsmt_date := now();
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION common.set_prev_doc_fsmt() OWNER TO postgres;

SET search_path = cutoff, pg_catalog;

--
-- TOC entry 556 (class 1255 OID 106550)
-- Name: destroy(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM cutoff.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 106551)
-- Name: do_blockers_check(common.document_head, common.document_kind, date, date); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_check(__head common.document_head, __document_kind common.document_kind, __date_start date, __date_end date) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_heads common.document_head[];
BEGIN
  CASE __document_kind
    WHEN 'ADJUSTMENTCREDIT'::common.document_kind THEN 
      _document_heads := adjustmentcredit.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'ADJUSTMENTDEBIT'::common.document_kind THEN
      _document_heads := adjustmentdebit.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'DELIVERY'::common.document_kind THEN
      _document_heads := delivery.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'DEMAND'::common.document_kind THEN
      _document_heads := demand.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'DESPATCH'::common.document_kind THEN
      _document_heads := despatch.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'ISSUE'::common.document_kind THEN 
      _document_heads := issue.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'PICKLIST'::common.document_kind THEN 
      _document_heads := picklist.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'REBOUND'::common.document_kind THEN 
      _document_heads := rebound.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'RESERVE'::common.document_kind THEN 
      _document_heads := reserve.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    WHEN 'STOCKTAKE'::common.document_kind THEN 
      _document_heads := stocktake.get_head_batch_proposed(
          __facility_code := __head.facility_code,
          __date_start := __date_start,
          __date_end := __date_end);
    ELSE
      -- do nothing
  END CASE;
  PERFORM cutoff.do_blockers_denote(
      __document_id := __head.document_id,
      __head := _document_heads);
END;
$$;


ALTER FUNCTION cutoff.do_blockers_check(__head common.document_head, __document_kind common.document_kind, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 106552)
-- Name: do_blockers_delete(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_delete(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM cutoff.blocker WHERE head_id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.do_blockers_delete(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 106553)
-- Name: do_blockers_denote(bigint, common.document_head[]); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_denote(__document_id bigint, __head common.document_head[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

  INSERT INTO
    cutoff.blocker (
      head_id, 
      blocker_document) 
  VALUES (
    __document_id, 
    unnest(__head)::common.document_head);

END;
$$;


ALTER FUNCTION cutoff.do_blockers_denote(__document_id bigint, __head common.document_head[]) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 106554)
-- Name: do_blockers_exclude(common.document_head, common.document_kind, date, date); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_blockers_exclude(__head common.document_head, __document_kind common.document_kind, __date_start date, __date_end date) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_heads common.document_head[];
  _document_head common.document_head;
  _past_cutof_ids bigint[];
BEGIN
  _past_cutof_ids := cutoff.get_all_comitted(__facility_code := __head.facility_code);

  CASE __document_kind
    WHEN 'ADJUSTMENTCREDIT'::common.document_kind THEN 
      _document_heads := adjustmentcredit.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_adjustmentcredit(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := adjustmentcredit.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_adjustmentcredit(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'ADJUSTMENTDEBIT'::common.document_kind THEN
      _document_heads := adjustmentdebit.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_adjustmentdebit(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := adjustmentdebit.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_adjustmentdebit(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'DELIVERY'::common.document_kind THEN
      _document_heads := delivery.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_delivery(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := delivery.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_delivery(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'DEMAND'::common.document_kind THEN
      _document_heads := demand.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_demand(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := demand.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_demand(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'DESPATCH'::common.document_kind THEN
      _document_heads := despatch.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_despatch(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := despatch.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_despatch(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'ISSUE'::common.document_kind THEN 
      _document_heads := issue.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_issue(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := issue.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_issue(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;
    WHEN 'PICKLIST'::common.document_kind THEN 
      _document_heads := picklist.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_picklist(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := picklist.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_picklist(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'REBOUND'::common.document_kind THEN 
      _document_heads := rebound.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_rebound(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := rebound.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_rebound(__head.document_id, _document_head.document_id);
      END LOOP;

    WHEN 'RESERVE'::common.document_kind THEN 
      _document_heads := reserve.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_reserve(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := reserve.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_reserve(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    WHEN 'STOCKTAKE'::common.document_kind THEN 
      _document_heads := stocktake.get_head_batch(__document_ids := _past_cutof_ids);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        IF (_document_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
          PERFORM binding.unbind_cutoff_and_stocktake(
              __parent_id := __head.document_id,
              __child_id := _document_head.document_id);
        END IF;
      END LOOP;

      _document_heads := stocktake.get_head_batch_proposed(__head.facility_code, __date_start, __date_end);
      FOREACH _document_head IN
        ARRAY _document_heads
      LOOP
        PERFORM binding.bind_cutoff_and_stocktake(
            __parent_id := __head.document_id,
            __child_id := _document_head.document_id);
      END LOOP;

    ELSE
      -- do nothing
  END CASE;
END;
$$;


ALTER FUNCTION cutoff.do_blockers_exclude(__head common.document_head, __document_kind common.document_kind, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 106555)
-- Name: do_commit(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_head_types common.document_kind[];
  _document_head_type common.document_kind;
  _head common.document_head;
  _date_start date;
  _date_end date;
  _has_blockers boolean;
BEGIN

  _head := cutoff.get_head(__document_id := __document_id);
  _date_start := cutoff.get_last_cutoff_date(_head.facility_code);
  _date_end := _head.document_date;

  -- check state
  IF (_head.curr_fsmt = 'COMMITTED') THEN
    RAISE EXCEPTION 'cutoff already committed';
  END IF;

  _has_blockers := cutoff.has_blockers(__document_id := __document_id);
  -- cleart previously blockers analyze result
  IF (_has_blockers IS TRUE) THEN
    PERFORM cutoff.do_blockers_delete(__document_id := __document_id);
  END IF;

  -- analyze blockers
  _document_head_types := common.get_document_head_types(__policy_mode := 'ENFORCING'::common.policy_mode);
  FOREACH _document_head_type IN
    ARRAY _document_head_types
  LOOP
    PERFORM cutoff.do_blockers_check(
        __head := _head, 
        __document_kind := _document_head_type, 
        __date_start := _date_start, 
        __date_end := _date_end);
  END LOOP;

  _has_blockers := cutoff.has_blockers(__document_id := __document_id);
  IF (_has_blockers IS TRUE) THEN
    RAISE WARNING 'there is bloking documents. can not perform commit of cutoff %', __document_id;
    RETURN; 
  END IF;

  _document_head_types := common.get_document_head_types(__policy_mode := 'PERMISSIVE'::common.policy_mode);
  FOREACH _document_head_type IN
    ARRAY _document_head_types
  LOOP
    PERFORM cutoff.do_blockers_exclude(
        __head := _head, 
        __document_kind := _document_head_type, 
        __date_start := _date_start, 
        __date_end := _date_end);
  END LOOP;

  UPDATE
    cutoff.head
  SET
    curr_fsmt = 'COMMITTED'
  WHERE
    id = __document_id;

END;
$$;


ALTER FUNCTION cutoff.do_commit(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 106556)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN

  _head := cutoff.get_head(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'cutoff % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    cutoff.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
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
        __source_type := 'cutoff'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION cutoff.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 106557)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := cutoff.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('CUTOFF');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION cutoff.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 106558)
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
        cutoff.head
      WHERE 
        facility_code = __facility_code AND
        curr_fsmt = 'COMMITTED'::common.document_fsmt
    );
END;
$$;


ALTER FUNCTION cutoff.get_all_comitted(__facility_code character varying) OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 106559)
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
      cutoff.head
    WHERE 
      id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.get_gid_by_id(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 106560)
-- Name: get_head(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
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
    document_date,
    facility_code,
    curr_fsmt,
    'CUTOFF'::common.document_kind)::common.document_head
  FROM 
    cutoff.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION cutoff.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 106561)
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
      cutoff.head
    WHERE 
      gid = __document_gid;
END;
$$;


ALTER FUNCTION cutoff.get_id_by_gid(__document_gid uuid) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 106562)
-- Name: get_last_cutoff_date(character varying); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION get_last_cutoff_date(__facility_code character varying) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  __cutoff_date date;
BEGIN
  SELECT
    head.document_date
  FROM 
    cutoff.head
  WHERE 
    head.curr_fsmt = 'COMMITTED'::common.document_fsmt AND 
    head.facility_code = __facility_code
  ORDER BY
    head.document_date DESC
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
-- TOC entry 570 (class 1255 OID 106563)
-- Name: has_blockers(bigint); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION has_blockers(__document_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
  PERFORM
    blocker.head_id
  FROM 
    cutoff.blocker
  WHERE 
    blocker.head_id = __document_id
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
-- TOC entry 571 (class 1255 OID 106564)
-- Name: init(common.document_head); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := cutoff.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    cutoff.head (
      id, 
      display_name,
      document_date, 
      facility_code)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.facility_code) 
  RETURNING id INTO _document_id;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION cutoff.init(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 106565)
-- Name: is_document_locked(common.document_head); Type: FUNCTION; Schema: cutoff; Owner: postgres
--

CREATE FUNCTION is_document_locked(__head common.document_head) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  _last_cutoff_date date;
  _policy_mode common.policy_mode;
  _is_locked boolean;
  _binded_cutoff bigint;
BEGIN
  _last_cutoff_date := cutoff.get_last_cutoff_date(__head.facility_code);
  _policy_mode := common.get_policy_mode(__head.doctype);

  IF (__head.document_date > _last_cutoff_date) THEN
    _is_locked := false;
  ELSE
    IF (_policy_mode = 'ENFORCING') THEN
      _is_locked := true;
    ELSIF (_policy_mode = 'PERMISSIVE') THEN
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
-- TOC entry 573 (class 1255 OID 106566)
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
-- TOC entry 574 (class 1255 OID 106567)
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
-- TOC entry 575 (class 1255 OID 106568)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      delivery.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      delivery.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION delivery.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 106569)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
  _child_id bigint;
BEGIN

  _head := delivery.get_head(__document_id);
  _body := delivery.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'delivery % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    delivery.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_order_qty(
      __facility_code := _head.facility_code,
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
        __source_type := 'delivery'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION delivery.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 106570)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
  _child_id bigint;
  _child_head common.inbound_head;
BEGIN

  _head := delivery.get_head(__document_id);
  _body := delivery.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    IF (_child_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'binded receipt % is commited. exiting', _child_head.gid;
    END IF;
  END IF;

  UPDATE
    delivery.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.loss_on_order_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'delivery'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION delivery.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 106571)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := delivery.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('DELIVERY');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION delivery.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 106572)
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
-- TOC entry 581 (class 1255 OID 106573)
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
-- TOC entry 582 (class 1255 OID 106574)
-- Name: get_head(bigint); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.inbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_to,
    curr_fsmt,
    'DELIVERY'::common.document_kind,
    ship_from)::common.inbound_head
  FROM 
    delivery.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION delivery.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 106575)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'DELIVERY'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        delivery.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION delivery.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 106576)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'DELIVERY'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        delivery.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION delivery.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 585 (class 1255 OID 106577)
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
-- TOC entry 586 (class 1255 OID 106578)
-- Name: init(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: delivery; Owner: postgres
--

CREATE FUNCTION init(__head common.inbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := delivery.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    delivery.head (
      id, 
      display_name,
      document_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date,  
    __head.addresser, 
    __head.facility_code) 
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


ALTER FUNCTION delivery.init(__head common.inbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 106579)
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
-- TOC entry 553 (class 1255 OID 106580)
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
-- TOC entry 563 (class 1255 OID 106581)
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
-- TOC entry 587 (class 1255 OID 106582)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      demand.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt;
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      demand.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION demand.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 106583)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
  _is_locked boolean;
BEGIN

  _head := demand.get_head(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
    RAISE EXCEPTION 'demand % already committed. exiting', _head.gid;
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
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'DEMAND'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION demand.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 106584)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
  _is_locked boolean;
BEGIN

  _head := demand.get_head(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'DEMAND'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION demand.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 106585)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := demand.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('DEMAND');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION demand.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 106586)
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
-- TOC entry 592 (class 1255 OID 106587)
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
-- TOC entry 593 (class 1255 OID 106588)
-- Name: get_head(bigint); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.outbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_from,
    curr_fsmt,
    'DEMAND'::common.document_kind,
    ship_to,
    due_date)::common.outbound_head
  FROM 
    demand.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION demand.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 106589)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'DEMAND'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        demand.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION demand.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 106590)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'DEMAND'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        demand.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION demand.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 596 (class 1255 OID 106591)
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
-- TOC entry 598 (class 1255 OID 106592)
-- Name: init(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: demand; Owner: postgres
--

CREATE FUNCTION init(__head common.outbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.document_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := demand.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    demand.head (
      id, 
      display_name,
      document_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.due_date, 
    __head.facility_code, 
    __head.addressee) 
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


ALTER FUNCTION demand.init(__head common.outbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 106593)
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
-- TOC entry 600 (class 1255 OID 106594)
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
-- TOC entry 601 (class 1255 OID 106595)
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
-- TOC entry 602 (class 1255 OID 106596)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      despatch.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      despatch.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION despatch.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 106597)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _reserve_id bigint;
  _reserve_head common.outbound_head;
  _reserve_body common.document_body[];
  _picklist_id bigint;
  _picklist_head common.outbound_head;
  _picklist_body common.document_body[];
BEGIN

  _head := despatch.get_head(__document_id);
  
  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
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
    curr_fsmt = 'COMMITTED'::common.document_fsmt
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
        __facility_code := _picklist_head.facility_code,
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
        __facility_code := _reserve_head.facility_code,
        __inventory := _reserve_body);
  END IF;

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'DESPATCH'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION despatch.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 106598)
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
-- TOC entry 605 (class 1255 OID 106599)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := despatch.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('DESPATCH');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION despatch.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 606 (class 1255 OID 106600)
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
-- TOC entry 607 (class 1255 OID 106601)
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
-- TOC entry 608 (class 1255 OID 106602)
-- Name: get_head(bigint); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.outbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_from,
    curr_fsmt,
    'DESPATCH'::common.document_kind,
    ship_to,
    due_date)::common.outbound_head
  FROM 
    despatch.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION despatch.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 106603)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'DESPATCH'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        despatch.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION despatch.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 609 (class 1255 OID 106604)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'DESPATCH'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        despatch.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION despatch.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 610 (class 1255 OID 106605)
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
-- TOC entry 611 (class 1255 OID 106606)
-- Name: init(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: despatch; Owner: postgres
--

CREATE FUNCTION init(__head common.outbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.document_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := despatch.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    despatch.head (
      id, 
      display_name,
      document_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.due_date, 
    __head.facility_code, 
    __head.addressee) 
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


ALTER FUNCTION despatch.init(__head common.outbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 612 (class 1255 OID 106607)
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
-- TOC entry 613 (class 1255 OID 106608)
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
-- TOC entry 614 (class 1255 OID 106609)
-- Name: analyze_ability(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION analyze_ability(__demand_id bigint) RETURNS common.goal_fsmt
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
    RETURN 'ACCEPTED'::common.goal_fsmt;
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
    RETURN 'REJECTED'::common.goal_fsmt;
  ELSE 
    RAISE NOTICE 'demand % can be advised', __demand_id;
    RETURN 'ADVISED'::common.goal_fsmt;
  END IF;

END;
$$;


ALTER FUNCTION goal.analyze_ability(__demand_id bigint) OWNER TO postgres;

--
-- TOC entry 615 (class 1255 OID 106610)
-- Name: analyze_outcome(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION analyze_outcome(__goal_id bigint) RETURNS common.goal_fsmt
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
    RETURN 'SATISFIED'::common.goal_fsmt;
  ELSE
    RAISE NOTICE 'goal % is failed', __goal_id;
    RETURN 'FAILED'::common.goal_fsmt;
  END IF;

END;
$$;


ALTER FUNCTION goal.analyze_outcome(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 616 (class 1255 OID 106611)
-- Name: apprise(bigint, common.document_kind, common.document_fsmt); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION apprise(__source_id bigint, __source_type common.document_kind, __source_state common.document_fsmt) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _msg text;
  _state text;
  _head common.document_head;
  _outbound_head common.outbound_head;
  _body common.document_body[];
  _goal_analysis_result common.goal_fsmt;
  _goal_fsmt common.goal_fsmt;
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
    WHEN 'DEMAND'::common.document_kind THEN
      _msg := 'demand';
      _demand_id := __source_id;
      _goal_id := binding.get_goal_binded_to_demand(_demand_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN
          _state := 'committed';
          _outbound_head := demand.get_head(_demand_id);
          _outbound_head := common.remake_outbound_head(__head := _outbound_head, __document_date := now()::date);
          _body := demand.get_body(_demand_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_outbound_head::common.goal_head);
            PERFORM binding.bind_goal_and_demand(_goal_id, _demand_id);
          END IF;
          _goal_analysis_result := goal.analyze_ability(_demand_id);
          CASE _goal_analysis_result
            WHEN 'ACCEPTED' THEN
              _reserve_id := reserve.init(_outbound_head, _body);
              _picklist_id := picklist.init(_outbound_head, _body);
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

          UPDATE goal.head SET curr_fsmt = _goal_analysis_result where id = _goal_id;

        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'decommiting standalone demand %', _demand_id;
            RETURN;
          END IF;
          _goal_fsmt := goal.get_curr_fsmt(_goal_id);
          IF (_goal_fsmt < 'COMMITTED' ) THEN
            _reserve_id := binding.get_reserve_binded_to_goal(_goal_id); 
            _picklist_id := binding.get_picklist_binded_to_goal(_goal_id);
            PERFORM picklist.destroy(_picklist_id);
            PERFORM reserve.do_decommit(_reserve_id, false);
            PERFORM reserve.destroy(_reserve_id);
            UPDATE goal.head SET curr_fsmt = 'CANCELED' where id = _goal_id; 
          ELSE
            RAISE EXCEPTION 'can not decommit demand %', _demand_id;
          END IF;
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'RESERVE'::common.document_kind THEN
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
          _goal_fsmt := goal.get_curr_fsmt(_goal_id);
          IF (_goal_fsmt < 'COMMITTED' ) THEN
            _demand_id := binding.get_demand_binded_to_goal(_goal_id);
            _picklist_id := binding.get_picklist_binded_to_goal(_goal_id);
            PERFORM demand.do_decommit(_demand_id, false);
            PERFORM picklist.destroy(_picklist_id);            
            PERFORM reserve.destroy(_reserve_id);
            UPDATE goal.head SET curr_fsmt = 'CANCELED' where id = _goal_id; 
          ELSE
            RAISE EXCEPTION 'can not decommit reserve %', _reserve_id;
          END IF;
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'PICKLIST'::common.document_kind THEN
      _msg := 'picklist';
      _picklist_id := __source_id;
      _goal_id := binding.get_goal_binded_to_picklist(_picklist_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN
          _state := 'committed';
          _outbound_head := picklist.get_head(_picklist_id);
          _outbound_head := common.remake_outbound_head(__head := _outbound_head, __document_date := now()::date);
          _body := picklist.get_body(_picklist_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_outbound_head::common.goal_head);
            PERFORM binding.bind_goal_and_picklist(_goal_id, _picklist_id);
          END IF;
          _issue_id := issue.init(_outbound_head, _body);
          PERFORM binding.bind_picklist_and_issue(_picklist_id, _issue_id);
          PERFORM binding.bind_goal_and_issue(_goal_id, _issue_id);
          PERFORM issue.do_commit(_issue_id, false);
          _despatch_id := despatch.init(_outbound_head, _body);
          PERFORM binding.bind_issue_and_despatch(_issue_id, _despatch_id);
          PERFORM binding.bind_goal_and_despatch(_goal_id, _despatch_id);
          -- UPDATE goal.head SET curr_fsmt = 'ACCEPTED' where id = _goal_id;
          UPDATE goal.head SET curr_fsmt = 'COMMITTED' where id = _goal_id;

        WHEN 'DECOMMITTED' THEN
          _state := 'decommitted';
          IF (_goal_id IS NULL) THEN
            RAISE WARNING 'decommiting standalone picklist %', _picklist_id;
            RETURN;
          END IF;
          _goal_fsmt := goal.get_curr_fsmt(_goal_id);
          IF (_goal_fsmt > 'COMMITTED' ) THEN
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
            UPDATE goal.head SET curr_fsmt = 'CANCELED' where id = _goal_id;
          END IF;
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'ISSUE'::common.document_kind THEN
      _msg := 'issue';
      _issue_id := __source_id;
      _goal_id := binding.get_goal_binded_to_issue(_issue_id);
      CASE __source_state
        WHEN 'COMMITTED' THEN          
          _state := 'committed';
          _outbound_head := issue.get_head(_issue_id);
          _outbound_head := common.remake_outbound_head(__head := _outbound_head, __document_date := now()::date);
          _body := issue.get_body(_issue_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_outbound_head::common.goal_head);
            PERFORM binding.bind_goal_and_issue(_goal_id, _issue_id);
            UPDATE goal.head SET curr_fsmt = 'ACCEPTED' where id = _goal_id;
          END IF;
          _despatch_id := despatch.init(_outbound_head, _body);
          PERFORM binding.bind_issue_and_despatch(_issue_id, _despatch_id);
          PERFORM binding.bind_goal_and_despatch(_goal_id, _despatch_id);
          UPDATE goal.head SET curr_fsmt = 'COMMITTED' where id = _goal_id;
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
          _goal_fsmt := goal.get_curr_fsmt(_goal_id);
          IF (_goal_fsmt > 'COMMITTED' ) THEN
            RAISE EXCEPTION 'can not decommit picklist %', _issue_id;
          END IF;
          _despatch_id := binding.get_despatch_binded_to_issue(_issue_id);
          PERFORM despatch.destroy(_despatch_id);
        ELSE
          _state := 'unknown';
      END CASE;

    WHEN 'DESPATCH'::common.document_kind THEN
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
            UPDATE goal.head SET curr_fsmt = _goal_analysis_result where id = _goal_id;
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


ALTER FUNCTION goal.apprise(__source_id bigint, __source_type common.document_kind, __source_state common.document_fsmt) OWNER TO postgres;

--
-- TOC entry 617 (class 1255 OID 106613)
-- Name: destroy(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION destroy(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  DELETE FROM goal.head WHERE id = __document_id;
END;
$$;


ALTER FUNCTION goal.destroy(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 618 (class 1255 OID 106614)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := goal.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('GOAL');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION goal.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 619 (class 1255 OID 106615)
-- Name: get_curr_fsmt(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION get_curr_fsmt(__goal_id bigint) RETURNS common.goal_fsmt
    LANGUAGE plpgsql
    AS $$
BEGIN

  RETURN curr_fsmt FROM goal.head WHERE id = __goal_id;

END;
$$;


ALTER FUNCTION goal.get_curr_fsmt(__goal_id bigint) OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 106616)
-- Name: get_head(bigint); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.goal_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    facility_code,
    curr_fsmt::common.goal_fsmt,
    'GOAL'::common.document_kind)::common.goal_head
  FROM 
    goal.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION goal.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 106617)
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
-- TOC entry 622 (class 1255 OID 106618)
-- Name: init(common.goal_head); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION init(__head common.goal_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := goal.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    goal.head (
      id, 
      display_name,
      document_date, 
      facility_code)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date,  
    __head.facility_code) 
  RETURNING id INTO _document_id;

  RETURN _document_id;

END;
$$;


ALTER FUNCTION goal.init(__head common.goal_head) OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 106619)
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
-- TOC entry 624 (class 1255 OID 106620)
-- Name: set_prev_goal_fsmt(); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION set_prev_goal_fsmt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'UPDATE' AND NEW.curr_fsmt != OLD.curr_fsmt) THEN
    NEW.prev_fsmt := OLD.curr_fsmt;
    NEW.prev_fsmt_date := OLD.curr_fsmt_date;
    NEW.curr_fsmt_date := now();
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION goal.set_prev_goal_fsmt() OWNER TO postgres;

SET search_path = issue, pg_catalog;

--
-- TOC entry 625 (class 1255 OID 106621)
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
-- TOC entry 626 (class 1255 OID 106622)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      issue.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      issue.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION issue.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 627 (class 1255 OID 106623)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
BEGIN

  _head := issue.get_head(__document_id);
  _body := issue.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'issue % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    issue.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.loss_on_hand_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  PERFORM stockcard.assign_issue(
      __document_head := _head,
      __document_body := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'ISSUE'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION issue.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 628 (class 1255 OID 106624)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
  _adjustment_id bigint;
BEGIN

  _head := issue.get_head(__document_id);
  _body := issue.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'issue % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    issue.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
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
      __facility_code := _head.facility_code,
      __inventory := _body);

  PERFORM stockcard.deassign_issue(
      __document_id := __document_id);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'ISSUE'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION issue.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 106625)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := issue.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('ISSUE');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION issue.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 106626)
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
-- TOC entry 631 (class 1255 OID 106627)
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
-- TOC entry 632 (class 1255 OID 106628)
-- Name: get_head(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.outbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_from,
    curr_fsmt,
    'ISSUE'::common.document_kind,
    ship_to,
    due_date)::common.outbound_head
  FROM 
    issue.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION issue.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 633 (class 1255 OID 106629)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'ISSUE'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        issue.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION issue.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 634 (class 1255 OID 106630)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'ISSUE'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        issue.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION issue.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 106631)
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
-- TOC entry 636 (class 1255 OID 106632)
-- Name: init(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION init(__head common.outbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.document_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := issue.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    issue.head (
      id, 
      display_name,
      document_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.due_date, 
    __head.facility_code, 
    __head.addressee) 
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


ALTER FUNCTION issue.init(__head common.outbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 106633)
-- Name: make_adjustment(bigint); Type: FUNCTION; Schema: issue; Owner: postgres
--

CREATE FUNCTION make_adjustment(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
  _child_id bigint;
BEGIN
  _head := issue.get_head(__document_id);
  _head := common.remake_outbound_head(__head := _head, __document_date := now()::date);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE EXCEPTION 'can not adjust decommitted document %', _head.gid;
  END IF; 
  
  _body := issue.get_body(__document_id);
  _child_id := adjustmentcredit.init(_head, _body);
  PERFORM binding.bind_issue_and_adjustmentcredit(__document_id, _child_id);
END;
$$;


ALTER FUNCTION issue.make_adjustment(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 106634)
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
-- TOC entry 639 (class 1255 OID 106635)
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
-- TOC entry 640 (class 1255 OID 106636)
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
-- TOC entry 641 (class 1255 OID 106637)
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
-- TOC entry 642 (class 1255 OID 106638)
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
-- TOC entry 643 (class 1255 OID 106639)
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
-- TOC entry 644 (class 1255 OID 106640)
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
-- TOC entry 645 (class 1255 OID 106641)
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
-- TOC entry 646 (class 1255 OID 106642)
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
-- TOC entry 647 (class 1255 OID 106643)
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
-- TOC entry 648 (class 1255 OID 106644)
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
-- TOC entry 649 (class 1255 OID 106645)
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
-- TOC entry 650 (class 1255 OID 106646)
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
-- TOC entry 651 (class 1255 OID 106647)
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
-- TOC entry 652 (class 1255 OID 106648)
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
-- TOC entry 653 (class 1255 OID 106649)
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
-- TOC entry 655 (class 1255 OID 106650)
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
-- TOC entry 656 (class 1255 OID 106651)
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
-- TOC entry 657 (class 1255 OID 106652)
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
-- TOC entry 658 (class 1255 OID 106653)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      picklist.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      picklist.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION picklist.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 106654)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
BEGIN

  _head := picklist.get_head(__document_id);
  _body := picklist.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'picklist % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    picklist.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.gain_en_route_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'PICKLIST'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION picklist.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 106655)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
BEGIN

  _head := picklist.get_head(__document_id);
  _body := picklist.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'picklist % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    picklist.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.loss_en_route_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'PICKLIST'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION picklist.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 661 (class 1255 OID 106656)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := picklist.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('PICKLIST');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION picklist.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 106657)
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
-- TOC entry 663 (class 1255 OID 106658)
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
-- TOC entry 664 (class 1255 OID 106659)
-- Name: get_head(bigint); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.outbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_from,
    curr_fsmt,
    'PICKLIST'::common.document_kind,
    ship_to,
    due_date)::common.outbound_head
  FROM 
    picklist.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION picklist.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 106660)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'PICKLIST'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        picklist.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION picklist.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 106661)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'PICKLIST'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        picklist.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION picklist.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 106662)
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
-- TOC entry 667 (class 1255 OID 106663)
-- Name: init(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: picklist; Owner: postgres
--

CREATE FUNCTION init(__head common.outbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.document_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := picklist.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    picklist.head (
      id, 
      display_name,
      document_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.due_date, 
    __head.facility_code, 
    __head.addressee) 
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


ALTER FUNCTION picklist.init(__head common.outbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 106664)
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
-- TOC entry 669 (class 1255 OID 106665)
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
-- TOC entry 670 (class 1255 OID 106666)
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
-- TOC entry 671 (class 1255 OID 106667)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      rebound.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      rebound.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION rebound.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 106668)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
BEGIN

  _head := rebound.get_head(__document_id);
  _body := rebound.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'rebound % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    rebound.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_order_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'rebound'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION rebound.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 106669)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
BEGIN

  _head := rebound.get_head(__document_id);
  _body := rebound.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'rebound % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    rebound.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.loss_on_order_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'rebound'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION rebound.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 106670)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := rebound.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('REBOUND');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION rebound.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 106671)
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
-- TOC entry 676 (class 1255 OID 106672)
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
-- TOC entry 677 (class 1255 OID 106673)
-- Name: get_head(bigint); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.inbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_to,
    curr_fsmt,
    'REBOUND'::common.document_kind,
    ship_from)::common.inbound_head
  FROM 
    rebound.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION rebound.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 106674)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'REBOUND'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        rebound.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION rebound.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 106675)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'REBOUND'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        rebound.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION rebound.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 106676)
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
-- TOC entry 681 (class 1255 OID 106677)
-- Name: init(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: rebound; Owner: postgres
--

CREATE FUNCTION init(__head common.inbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := rebound.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    rebound.head (
      id, 
      display_name,
      document_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date,  
    __head.addresser, 
    __head.facility_code) 
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


ALTER FUNCTION rebound.init(__head common.inbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 682 (class 1255 OID 106678)
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
-- TOC entry 683 (class 1255 OID 106679)
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
-- TOC entry 684 (class 1255 OID 106680)
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
-- TOC entry 685 (class 1255 OID 106681)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      receipt.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      receipt.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION receipt.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 686 (class 1255 OID 106682)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION do_commit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _parent_head common.inbound_head;
  _body common.document_body[];
  _parent_body common.document_body[];
  _parent_id bigint;
BEGIN

  _head := receipt.get_head(__document_id);
  _body := receipt.get_body(__document_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
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
    IF (_parent_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      _parent_body := delivery.get_body(_parent_id);
      PERFORM balance.loss_on_order_qty(
          __facility_code := _parent_head.facility_code,
          __inventory := _parent_body);
    END IF;
  END IF;

  UPDATE
    receipt.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_hand_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  PERFORM stockcard.assign_receipt(
      __document_head := _head,
      __document_body := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'receipt'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION receipt.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 687 (class 1255 OID 106683)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _parent_head common.inbound_head;
  _body common.document_body[];
  _parent_body common.document_body[];
  _parent_id bigint;
  _adjustment_id bigint;
BEGIN

  _head := receipt.get_head(__document_id);
  _body := receipt.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    IF (_parent_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      _parent_body := delivery.get_body(_parent_id);
      PERFORM balance.gain_on_order_qty(
          __facility_code := _parent_head.facility_code,
          __inventory := _parent_body);
    END IF;
  END IF;

  UPDATE
    receipt.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
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
      __facility_code := _head.facility_code,
      __inventory := _body);

  PERFORM stockcard.deassign_receipt(
      __document_id := __document_id);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'receipt'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION receipt.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 106684)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := receipt.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('RECEIPT');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION receipt.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 689 (class 1255 OID 106685)
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
-- TOC entry 690 (class 1255 OID 106686)
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
-- TOC entry 691 (class 1255 OID 106687)
-- Name: get_head(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.inbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_to,
    curr_fsmt,
    'RECEIPT'::common.document_kind,
    ship_from)::common.inbound_head
  FROM 
    receipt.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION receipt.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 106688)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'RECEIPT'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        receipt.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION receipt.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 693 (class 1255 OID 106689)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.inbound_head[]
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
        document_date,
        ship_to,
        curr_fsmt,
        'RECEIPT'::common.document_kind,
        ship_from)::common.inbound_head
      FROM 
        receipt.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION receipt.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 694 (class 1255 OID 106690)
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
-- TOC entry 695 (class 1255 OID 106691)
-- Name: init(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION init(__head common.inbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := receipt.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    receipt.head (
      id, 
      display_name,
      document_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.addresser, 
    __head.facility_code) 
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


ALTER FUNCTION receipt.init(__head common.inbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 106692)
-- Name: make_adjustment(bigint); Type: FUNCTION; Schema: receipt; Owner: postgres
--

CREATE FUNCTION make_adjustment(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _body common.document_body[];
  _child_id bigint;
BEGIN
  _head := receipt.get_head(__document_id);
  _head := common.remake_inbound_head(__head := _head, __document_date := now()::date);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE EXCEPTION 'can not adjust decommitted document %', _head.gid;
  END IF; 

  _body := receipt.get_body(__document_id);
  _child_id := adjustmentdebit.init(_head, _body);
  PERFORM binding.bind_receipt_and_adjustmentdebit(__document_id, _child_id);
END;
$$;


ALTER FUNCTION receipt.make_adjustment(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 697 (class 1255 OID 106693)
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
-- TOC entry 699 (class 1255 OID 106694)
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
-- TOC entry 700 (class 1255 OID 106695)
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
-- TOC entry 701 (class 1255 OID 106696)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      reserve.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      reserve.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION reserve.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 106697)
-- Name: do_commit(bigint, boolean); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION do_commit(__reserve_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
BEGIN

  _head := reserve.get_head(__reserve_id);
  _body := reserve.get_body(__reserve_id);

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'reserve % already committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    reserve.head
  SET
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __reserve_id;

  PERFORM balance.gain_reserved_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__reserve_id,
        __source_type := 'RESERVE'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION reserve.do_commit(__reserve_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 106698)
-- Name: do_decommit(bigint, boolean); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION do_decommit(__document_id bigint, __apprise boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _body common.document_body[];
BEGIN

  _head := reserve.get_head(__document_id);
  _body := reserve.get_body(__document_id);

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
    RAISE NOTICE 'reserve % not committed. exiting', _head.gid;
    RETURN;
  END IF;

  UPDATE
    reserve.head
  SET
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.loss_reserved_qty(
      __facility_code := _head.facility_code,
      __inventory := _body);

  IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'RESERVE'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;

END;
$$;


ALTER FUNCTION reserve.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 704 (class 1255 OID 106699)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := reserve.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('RESERVE');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION reserve.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 705 (class 1255 OID 106700)
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
-- TOC entry 706 (class 1255 OID 106701)
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
-- TOC entry 707 (class 1255 OID 106702)
-- Name: get_head(bigint); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_head(__document_id bigint) RETURNS common.outbound_head
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  RETURN 
    (id, 
    gid, 
    display_name,
    document_date,
    ship_from,
    curr_fsmt,
    'RESERVE'::common.document_kind,
    ship_to,
    due_date)::common.outbound_head
  FROM 
    reserve.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION reserve.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 708 (class 1255 OID 106703)
-- Name: get_head_batch(bigint[]); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_head_batch(__document_ids bigint[]) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'RESERVE'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        reserve.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION reserve.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 709 (class 1255 OID 106704)
-- Name: get_head_batch_proposed(character varying, date, date); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) RETURNS common.outbound_head[]
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
        document_date,
        ship_from,
        curr_fsmt,
        'RESERVE'::common.document_kind,
        ship_to,
        due_date)::common.outbound_head
      FROM 
        reserve.head
      WHERE 
        ship_from = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION reserve.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 710 (class 1255 OID 106705)
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
-- TOC entry 711 (class 1255 OID 106706)
-- Name: init(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: reserve; Owner: postgres
--

CREATE FUNCTION init(__head common.outbound_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.due_date IS NULL) THEN
    __head.due_date := __head.document_date + 1;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := reserve.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    reserve.head (
      id, 
      display_name,
      document_date, 
      due_date, 
      ship_from, 
      ship_to)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date, 
    __head.due_date, 
    __head.facility_code, 
    __head.addressee) 
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


ALTER FUNCTION reserve.init(__head common.outbound_head, __body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 106707)
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
-- TOC entry 713 (class 1255 OID 106708)
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
-- TOC entry 714 (class 1255 OID 106709)
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
-- TOC entry 715 (class 1255 OID 106710)
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
-- TOC entry 716 (class 1255 OID 106711)
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
-- TOC entry 717 (class 1255 OID 106712)
-- Name: assign_adjustmentcredit(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentcredit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 718 (class 1255 OID 106713)
-- Name: assign_adjustmentcredit(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentcredit(__document_head common.outbound_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _parent_doc_id bigint;
  _parent_doc_head common.outbound_head;
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
      stockcard.head (
        document_gid, 
        document_kind, 
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
      'ISSUE'::common.document_kind,
      _parent_doc_head.display_name,
      _parent_doc_head.document_date,
      _parent_doc_head.facility_code,
      _parent_doc_head.addressee,
      _item.good_code,
      _item.uom_code,
      0.0,
      _item.uom_code,
      _item.quantity
      )
    ON CONFLICT (document_gid, good_code) DO
    UPDATE
      --stockcard.head
    SET
      adjusted_uom = _item.uom_code, 
      adjusted_qty = _item.quantity
    /*WHERE 
      document_gid = _parent_doc_head.gid AND 
      good_code = _item.good_code*/;

  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_adjustmentcredit(__document_head common.outbound_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 719 (class 1255 OID 106714)
-- Name: assign_adjustmentdebit(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentdebit(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
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
-- TOC entry 721 (class 1255 OID 106715)
-- Name: assign_adjustmentdebit(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_adjustmentdebit(__document_head common.inbound_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _parent_doc_id bigint;
  _parent_doc_head common.inbound_head;
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
      stockcard.head (
        document_gid, 
        document_kind, 
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
      'RECEIPT'::common.document_kind,
      _parent_doc_head.display_name,
      _parent_doc_head.document_date,
      _parent_doc_head.facility_code,
      _parent_doc_head.addresser,
      _item.good_code,
      _item.uom_code,
      0.0,
      _item.uom_code,
      _item.quantity
      )
    ON CONFLICT (document_gid, good_code) DO
    UPDATE
      --stockcard.head
    SET
      adjusted_uom = _item.uom_code, 
      adjusted_qty = _item.quantity
    /*WHERE 
      document_gid = _parent_doc_head.gid AND 
      good_code = _item.good_code*/;

  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_adjustmentdebit(__document_head common.inbound_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 722 (class 1255 OID 106716)
-- Name: assign_issue(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_issue(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 723 (class 1255 OID 106717)
-- Name: assign_issue(common.outbound_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_issue(__document_head common.outbound_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.head (
        document_gid, 
        document_kind, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        issued_uom, 
        issued_qty)
    VALUES (
      __document_head.gid,
      'ISSUE'::common.document_kind,
      __document_head.display_name,
      __document_head.document_date,
      __document_head.facility_code,
      __document_head.addressee,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_issue(__document_head common.outbound_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 724 (class 1255 OID 106718)
-- Name: assign_rebound(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_rebound(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
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
-- TOC entry 725 (class 1255 OID 106719)
-- Name: assign_rebound(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_rebound(__document_head common.inbound_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.head (
        document_gid, 
        document_kind, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        rebounded_uom, 
        rebounded_qty)
    VALUES (
      __document_head.gid,
      'REBOUND'::common.document_kind,
      __document_head.display_name,
      __document_head.document_date,
      __document_head.facility_code,
      __document_head.addresser,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_rebound(__document_head common.inbound_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 726 (class 1255 OID 106720)
-- Name: assign_receipt(bigint); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_receipt(__document_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
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
-- TOC entry 727 (class 1255 OID 106721)
-- Name: assign_receipt(common.inbound_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_receipt(__document_head common.inbound_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.head (
        document_gid, 
        document_kind, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        receipt_uom, 
        receipt_qty)
    VALUES (
      __document_head.gid,
      'RECEIPT'::common.document_kind,
      __document_head.display_name,
      __document_head.document_date,
      __document_head.facility_code,
      __document_head.addresser,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_receipt(__document_head common.inbound_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 728 (class 1255 OID 106722)
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
-- TOC entry 729 (class 1255 OID 106723)
-- Name: assign_stocktake(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION assign_stocktake(__document_head common.document_head, __document_body common.document_body[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _stocktake_agent CONSTANT character varying := 'AGENT';
BEGIN

  FOREACH _item IN
    ARRAY __document_body
  LOOP
    INSERT INTO
      stockcard.head (
        document_gid, 
        document_kind, 
        document_name, 
        document_date, 
        facility_code, 
        counterparty_code,
        good_code,
        stocktake_uom, 
        stocktake_qty)
    VALUES (
      __document_head.gid,
      'STOCKTAKE'::common.document_kind,
      __document_head.display_name,
      __document_head.document_date,
      __document_head.facility_code,
      _stocktake_agent,
      _item.good_code,
      _item.uom_code,
      _item.quantity
      );
  END LOOP;

END;
$$;


ALTER FUNCTION stockcard.assign_stocktake(__document_head common.document_head, __document_body common.document_body[]) OWNER TO postgres;

--
-- TOC entry 730 (class 1255 OID 106724)
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
    stockcard.head
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
-- TOC entry 720 (class 1255 OID 106725)
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
    stockcard.head
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
-- TOC entry 546 (class 1255 OID 106726)
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
    stockcard.head
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_issue(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 698 (class 1255 OID 106727)
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
    stockcard.head
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_rebound(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 731 (class 1255 OID 106728)
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
    stockcard.head
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_receipt(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 732 (class 1255 OID 106729)
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
    stockcard.head
  WHERE
    document_gid = _document_gid;

  RETURN;

END;
$$;


ALTER FUNCTION stockcard.deassign_stocktake(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 733 (class 1255 OID 106730)
-- Name: get_stocktake_recent_date(character varying, character varying[]); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION get_stocktake_recent_date(__facility_code character varying, __good_codes character varying[]) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  _recent_stocktake_date date;
BEGIN

  SELECT 
    max(head.document_date) as recent_stocktake_date
  FROM 
    stockcard.head
  WHERE 
    head.document_kind = 'STOCKTAKE' AND 
    head.good_code = ANY(__good_codes) AND
    head.facility_code = __facility_code
  INTO _recent_stocktake_date;
  IF NOT FOUND THEN
    _recent_stocktake_date := schedule.get_date_of_julianized_day(1);
  END IF;

  RETURN _recent_stocktake_date;

END;
$$;


ALTER FUNCTION stockcard.get_stocktake_recent_date(__facility_code character varying, __good_codes character varying[]) OWNER TO postgres;

--
-- TOC entry 734 (class 1255 OID 106731)
-- Name: get_stocktake_recent_date(character varying, character varying); Type: FUNCTION; Schema: stockcard; Owner: postgres
--

CREATE FUNCTION get_stocktake_recent_date(__facility_code character varying, __good_code character varying) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
  _recent_stocktake_date date;
BEGIN

  SELECT 
    max(head.document_date) as recent_stocktake_date
  FROM 
    stockcard.head
  WHERE 
    head.document_kind = 'STOCKTAKE' AND 
    head.good_code = __good_code AND
    head.facility_code = __facility_code
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
-- TOC entry 735 (class 1255 OID 106732)
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
    head.ship_to = __head.facility_code AND 
    head.curr_fsmt = 'PROPOSED' AND 
    head.document_date <= __head.document_date
  UNION
  SELECT 
    head.gid, 
    head.display_name
  FROM 
    issue.head
  WHERE 
    head.ship_from = __head.facility_code AND 
    head.curr_fsmt = 'PROPOSED' AND 
    head.document_date <= __head.document_date;

  IF FOUND THEN
    RETURN false;
  ELSE
    RETURN true;
  END IF;

END;
$$;


ALTER FUNCTION stocktake.check_commit(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 736 (class 1255 OID 106733)
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
-- TOC entry 737 (class 1255 OID 106734)
-- Name: disallow_editing_of_committed_document_body(); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION disallow_editing_of_committed_document_body() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _document_fsmt common.document_fsmt;
BEGIN
  IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN

    SELECT 
      head.curr_fsmt
    FROM 
      stocktake.head
    WHERE 
      head.id = NEW.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', NEW.head_id, _document_fsmt; 
    END IF;
    
    RETURN NEW;

  ELSIF (TG_OP = 'DELETE') THEN
    SELECT 
      head.curr_fsmt
    FROM 
      stocktake.head
    WHERE 
      head.id = OLD.head_id
    INTO
      _document_fsmt;

    IF (_document_fsmt = 'COMMITTED'::common.document_fsmt) THEN
      RAISE EXCEPTION 'not allowed to edit document %, %', OLD.head_id, _document_fsmt; 
    END IF;
    
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;


ALTER FUNCTION stocktake.disallow_editing_of_committed_document_body() OWNER TO postgres;

--
-- TOC entry 738 (class 1255 OID 106735)
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

  IF (_head.curr_fsmt = 'COMMITTED'::common.document_fsmt) THEN
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
    _balance_item := balance.get_on_hand_qty(_head.facility_code, _stocktake_item.good_code);
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
    curr_fsmt = 'COMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_hand_qty(
    __facility_code := _head.facility_code,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _head.facility_code,
    __inventory := _array_to_loss);
  PERFORM stockcard.assign_stocktake(
    __document_head := _head,
    __document_body := _body);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'stocktake'::common.document_kind,
        __source_state := 'COMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION stocktake.do_commit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 739 (class 1255 OID 106736)
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

  IF (_head.curr_fsmt <> 'COMMITTED'::common.document_fsmt) THEN
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
    curr_fsmt = 'DECOMMITTED'::common.document_fsmt
  WHERE
    id = __document_id;

  PERFORM balance.gain_on_hand_qty(
    __facility_code := _head.facility_code,
    __inventory := _array_to_gain);
  PERFORM balance.loss_on_hand_qty(
    __facility_code := _head.facility_code,
    __inventory := _array_to_loss);
  PERFORM stockcard.deassign_stocktake(
    __document_id := _head.document_id);

  /*IF (__apprise) THEN
    PERFORM goal.apprise(
        __source_id :=__document_id,
        __source_type := 'stocktake'::common.document_kind,
        __source_state := 'DECOMMITTED'::common.document_fsmt);
  END IF;*/

END;
$$;


ALTER FUNCTION stocktake.do_decommit(__document_id bigint, __apprise boolean) OWNER TO postgres;

--
-- TOC entry 740 (class 1255 OID 106737)
-- Name: generate_display_name(date, character varying); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION generate_display_name(__document_date date, __facility_code character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
  _week_number integer;
  _sequence_number integer;
  _document_kind_code character varying;
BEGIN

  _week_number := schedule.get_julianized_week(__document_date);
  _sequence_number := stocktake.numerator_nextval(__facility_code, _week_number);
  _document_kind_code := common.get_document_abbrevation('STOCKTAKE');

  RETURN concat(_document_kind_code,
    '-', __facility_code,
    '-', common.number_encode2(_week_number, true),
    common.number_encode4(_sequence_number, true));

END;
$$;


ALTER FUNCTION stocktake.generate_display_name(__document_date date, __facility_code character varying) OWNER TO postgres;

--
-- TOC entry 741 (class 1255 OID 106738)
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
-- TOC entry 742 (class 1255 OID 106739)
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
-- TOC entry 743 (class 1255 OID 106740)
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
    document_date,
    facility_code,
    curr_fsmt,
    'STOCKTAKE'::common.document_kind)::common.document_head
  FROM 
    stocktake.head
  WHERE 
    id = __document_id;
END;
$$;


ALTER FUNCTION stocktake.get_head(__document_id bigint) OWNER TO postgres;

--
-- TOC entry 744 (class 1255 OID 106741)
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
        document_date,
        facility_code,
        curr_fsmt,
        'STOCKTAKE'::common.document_kind)::common.document_head
      FROM 
        stocktake.head
      WHERE 
        id = ANY(__document_ids)
    );
END;
$$;


ALTER FUNCTION stocktake.get_head_batch(__document_ids bigint[]) OWNER TO postgres;

--
-- TOC entry 745 (class 1255 OID 106742)
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
        document_date,
        facility_code,
        curr_fsmt,
        'STOCKTAKE'::common.document_kind)::common.document_head
      FROM 
        stocktake.head
      WHERE 
        facility_code = __facility_code AND
        curr_fsmt = 'PROPOSED' AND
        document_date BETWEEN __date_start AND __date_end
    );
END;
$$;


ALTER FUNCTION stocktake.get_head_batch_proposed(__facility_code character varying, __date_start date, __date_end date) OWNER TO postgres;

--
-- TOC entry 746 (class 1255 OID 106743)
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
-- TOC entry 747 (class 1255 OID 106744)
-- Name: init(common.document_head); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _body common.document_body[];
  _document_id bigint;
BEGIN

  _body := balance.get_on_hand_qty(__facility_code := __head.facility_code);

  _document_id := stocktake.init(
      __head := __head,
      __body := _body);

  RETURN _document_id;

END;
$$;


ALTER FUNCTION stocktake.init(__head common.document_head) OWNER TO postgres;

--
-- TOC entry 748 (class 1255 OID 106745)
-- Name: init(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION init(__head common.document_head, __body common.document_body[]) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  _item common.document_body;
  _document_id bigint;
BEGIN

  IF (__head.facility_code IS NULL) THEN
    RAISE EXCEPTION 'field facility_code is not defined';
  END IF;

  IF (__head.document_date IS NULL) THEN
    __head.document_date := now()::date;
  END IF;

  IF (__head.display_name IS NULL) THEN
    __head.display_name := stocktake.generate_display_name(
        __document_date := __head.document_date,
        __facility_code := __head.facility_code);
  END IF;

  INSERT INTO
    stocktake.head (
      id, 
      display_name,
      document_date, 
      facility_code)
  VALUES (
    DEFAULT, 
    __head.display_name,
    __head.document_date,  
    __head.facility_code) 
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
-- TOC entry 749 (class 1255 OID 106746)
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
      __facility_code := __head.facility_code,
      __good_codes := __good_codes);

  _document_id := stocktake.init(
      __head := __head,
      __body := _body);

  RETURN _document_id;

END;
$$;


ALTER FUNCTION stocktake.init(__head common.document_head, __good_codes character varying[]) OWNER TO postgres;

--
-- TOC entry 750 (class 1255 OID 106747)
-- Name: is_document_locked(common.document_head, common.document_body[]); Type: FUNCTION; Schema: stocktake; Owner: postgres
--

CREATE FUNCTION is_document_locked(__head common.document_head, __body common.document_body[]) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  _recent_stocktake_date date;
  _stocktake_mode common.policy_mode;
  _is_locked boolean;
  _good_codes character varying[];
BEGIN
  _stocktake_mode := common.get_stocktake_mode(__head.doctype);
  _good_codes := ARRAY(SELECT good_code from unnest(__body))::character varying[];
  _recent_stocktake_date := stockcard.get_stocktake_recent_date(__head.facility_code, _good_codes);

  IF (__head.document_date > _recent_stocktake_date) THEN
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
-- TOC entry 751 (class 1255 OID 106748)
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
-- TOC entry 752 (class 1255 OID 106749)
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
-- TOC entry 759 (class 1255 OID 106750)
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
-- TOC entry 753 (class 1255 OID 106751)
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
-- TOC entry 787 (class 1255 OID 106752)
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
-- TOC entry 788 (class 1255 OID 106753)
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
-- TOC entry 789 (class 1255 OID 106754)
-- Name: __adjustmentcredit__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTCREDIT-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ADJUSTMENTCREDIT'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentcredit__get_head()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := adjustmentcredit.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 790 (class 1255 OID 106755)
-- Name: __adjustmentcredit__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTCREDIT-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ADJUSTMENTCREDIT'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_head_batch() OWNER TO postgres;

--
-- TOC entry 791 (class 1255 OID 106756)
-- Name: __adjustmentcredit__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTCREDIT-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ADJUSTMENTCREDIT'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__adjustmentcredit__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 792 (class 1255 OID 106757)
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
-- TOC entry 793 (class 1255 OID 106758)
-- Name: __adjustmentcredit__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTCREDIT-01','2017-01-01','A1','PROPOSED','ADJUSTMENTCREDIT','B1','2017-01-01')]::common.outbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 760 (class 1255 OID 106759)
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
-- TOC entry 761 (class 1255 OID 106760)
-- Name: __adjustmentcredit__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTCREDIT-01','2017-01-01','A1','PROPOSED','ADJUSTMENTCREDIT','B1','2017-01-01')]::common.outbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 794 (class 1255 OID 106761)
-- Name: __adjustmentdebit__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__destroy()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM adjustmentdebit.destroy(101); -- + add not allowed delete test
  
  _head := adjustmentdebit.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := adjustmentdebit.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__destroy() OWNER TO postgres;

--
-- TOC entry 762 (class 1255 OID 106762)
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
-- TOC entry 795 (class 1255 OID 106763)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO adjustmentdebit.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO adjustmentdebit.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO adjustmentdebit.body VALUES (103, 'good3', 3.0, 'm');

  _body := adjustmentdebit.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_body() OWNER TO postgres;

--
-- TOC entry 796 (class 1255 OID 106764)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := adjustmentdebit.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 797 (class 1255 OID 106765)
-- Name: __adjustmentdebit__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTDEBIT-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ADJUSTMENTDEBIT'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_head()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := adjustmentdebit.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := adjustmentdebit.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := adjustmentdebit.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_head() OWNER TO postgres;

--
-- TOC entry 798 (class 1255 OID 106766)
-- Name: __adjustmentdebit__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTDEBIT-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ADJUSTMENTDEBIT'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_head_batch()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := adjustmentdebit.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_head_batch() OWNER TO postgres;

--
-- TOC entry 799 (class 1255 OID 106767)
-- Name: __adjustmentdebit__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ADJUSTMENTDEBIT-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ADJUSTMENTDEBIT'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __adjustmentdebit__get_head_batch_proposed()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := adjustmentdebit.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 800 (class 1255 OID 106768)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := adjustmentdebit.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__adjustmentdebit__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 763 (class 1255 OID 106769)
-- Name: __adjustmentdebit__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTDEBIT-01','2017-01-01','A1','PROPOSED','ADJUSTMENTDEBIT','B1')]::common.inbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.inbound_head;
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
-- TOC entry 764 (class 1255 OID 106770)
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
-- TOC entry 765 (class 1255 OID 106771)
-- Name: __adjustmentdebit__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ADJUSTMENTDEBIT-01','2017-01-01','A1','PROPOSED','ADJUSTMENTDEBIT','B1')]::common.inbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.inbound_head;
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
-- TOC entry 802 (class 1255 OID 106772)
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
-- TOC entry 803 (class 1255 OID 106773)
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
-- TOC entry 804 (class 1255 OID 106774)
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
-- TOC entry 805 (class 1255 OID 106775)
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
-- TOC entry 806 (class 1255 OID 106776)
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
-- TOC entry 808 (class 1255 OID 106777)
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
-- TOC entry 809 (class 1255 OID 106778)
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
-- TOC entry 810 (class 1255 OID 106779)
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
-- TOC entry 811 (class 1255 OID 106780)
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
-- TOC entry 812 (class 1255 OID 106781)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_adjustmentcredit(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_adjustmentcredit WHERE adjustmentcredit_id = _test_adjustmentcredit_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 813 (class 1255 OID 106782)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');


  PERFORM binding.bind_cutoff_and_adjustmentdebit(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_adjustmentdebit WHERE adjustmentdebit_id = _test_adjustmentdebit_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 767 (class 1255 OID 106783)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_delivery(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_delivery WHERE delivery_id = _test_delivery_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_delivery() OWNER TO postgres;

--
-- TOC entry 814 (class 1255 OID 106784)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_demand(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_demand WHERE demand_id = _test_demand_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_demand() OWNER TO postgres;

--
-- TOC entry 815 (class 1255 OID 106785)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_despatch(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_despatch WHERE despatch_id = _test_despatch_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_despatch() OWNER TO postgres;

--
-- TOC entry 816 (class 1255 OID 106786)
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

  INSERT INTO goal.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_goal(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_goal WHERE goal_id = _test_goal_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_goal() OWNER TO postgres;

--
-- TOC entry 817 (class 1255 OID 106787)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_issue(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_issue WHERE issue_id = _test_issue_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_issue() OWNER TO postgres;

--
-- TOC entry 818 (class 1255 OID 106788)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_picklist(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_picklist WHERE picklist_id = _test_picklist_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_picklist() OWNER TO postgres;

--
-- TOC entry 819 (class 1255 OID 106789)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_rebound(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_rebound WHERE rebound_id = _test_rebound_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_rebound() OWNER TO postgres;

--
-- TOC entry 820 (class 1255 OID 106790)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_receipt(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_receipt WHERE receipt_id = _test_receipt_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_receipt() OWNER TO postgres;

--
-- TOC entry 821 (class 1255 OID 106791)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_reserve(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_reserve WHERE reserve_id = _test_reserve_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_reserve() OWNER TO postgres;

--
-- TOC entry 822 (class 1255 OID 106792)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM binding.bind_cutoff_and_stocktake(202, 102);
  SELECT cutoff_id FROM binding.cutoff_to_stocktake WHERE stocktake_id = _test_stocktake_id INTO _cutoff_id;
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_cutoff_and_stocktake() OWNER TO postgres;

--
-- TOC entry 1019 (class 1255 OID 106793)
-- Name: __binding__bind_delivery_and_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_delivery_and_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _delivery_id bigint;
  _test_delivery_id CONSTANT bigint := 202;
  _test_receipt_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_delivery_and_receipt()';

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_delivery_and_receipt(202, 102);
  SELECT delivery_id FROM binding.delivery_to_receipt WHERE receipt_id = _test_receipt_id INTO _delivery_id;
  PERFORM pgunit.assert_equals(_test_delivery_id, _delivery_id, 'Incorrect _delivery_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_delivery_and_receipt() OWNER TO postgres;

--
-- TOC entry 823 (class 1255 OID 106794)
-- Name: __binding__bind_demand_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_demand_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
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
-- TOC entry 824 (class 1255 OID 106795)
-- Name: __binding__bind_demand_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_demand_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _demand_id bigint;
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
-- TOC entry 825 (class 1255 OID 106796)
-- Name: __binding__bind_goal_and_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_demand_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_demand()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 826 (class 1255 OID 106797)
-- Name: __binding__bind_goal_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_despatch_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_despatch()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 827 (class 1255 OID 106798)
-- Name: __binding__bind_goal_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_issue_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_issue()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 828 (class 1255 OID 106799)
-- Name: __binding__bind_goal_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_picklist_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_picklist()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 829 (class 1255 OID 106800)
-- Name: __binding__bind_goal_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_goal_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
  _test_goal_id CONSTANT bigint := 202;
  _test_reserve_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_goal_and_reserve()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 830 (class 1255 OID 106801)
-- Name: __binding__bind_issue_and_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_issue_and_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
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
-- TOC entry 768 (class 1255 OID 106802)
-- Name: __binding__bind_issue_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_issue_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
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
-- TOC entry 831 (class 1255 OID 106803)
-- Name: __binding__bind_issue_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_issue_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _issue_id bigint;
  _test_issue_id CONSTANT bigint := 202;
  _test_rebound_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_issue_and_rebound()';

  INSERT INTO issue.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_issue_and_rebound(202, 102);
  SELECT issue_id FROM binding.issue_to_rebound WHERE rebound_id = _test_rebound_id INTO _issue_id;
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_issue_and_rebound() OWNER TO postgres;

--
-- TOC entry 832 (class 1255 OID 106804)
-- Name: __binding__bind_picklist_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_picklist_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _picklist_id bigint;
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
-- TOC entry 833 (class 1255 OID 106805)
-- Name: __binding__bind_receipt_and_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_receipt_and_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _test_receipt_id CONSTANT bigint := 202;
  _test_adjustmentdebit_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_receipt_and_adjustmentdebit()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_receipt_and_adjustmentdebit(202, 102);
  SELECT receipt_id FROM binding.receipt_to_adjustmentdebit WHERE adjustmentdebit_id = _test_adjustmentdebit_id INTO _receipt_id;
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_receipt_and_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 769 (class 1255 OID 106806)
-- Name: __binding__bind_receipt_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__bind_receipt_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _receipt_id bigint;
  _test_receipt_id CONSTANT bigint := 202;
  _test_rebound_id CONSTANT bigint := 102;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__bind_receipt_and_rebound()';

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM binding.bind_receipt_and_rebound(202, 102);
  SELECT receipt_id FROM binding.receipt_to_rebound WHERE rebound_id = _test_rebound_id INTO _receipt_id;
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__bind_receipt_and_rebound() OWNER TO postgres;

--
-- TOC entry 834 (class 1255 OID 106807)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 835 (class 1255 OID 106808)
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
-- TOC entry 836 (class 1255 OID 106809)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 1020 (class 1255 OID 106810)
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

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (203,103);

  _adjustmentdebit_id := binding.get_adjustmentdebit_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_adjustmentdebit_id, _adjustmentdebit_id, 'Incorrect _adjustmentdebit_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_adjustmentdebit_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 837 (class 1255 OID 106811)
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

  INSERT INTO delivery.head VALUES (1001, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (1101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (1201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (1301, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (1401, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (1501, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (1601, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (1701, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (1801, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (1901, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO cutoff.head VALUES (_test_cutoff_id, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 838 (class 1255 OID 106812)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentcredit VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_adjustmentcredit(_test_adjustmentcredit_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_adjustmentcredit() OWNER TO postgres;

--
-- TOC entry 758 (class 1255 OID 106813)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.cutoff_to_adjustmentdebit VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_adjustmentdebit(_test_adjustmentdebit_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 839 (class 1255 OID 106814)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_delivery VALUES (201,101);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,102);
  INSERT INTO binding.cutoff_to_delivery VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_delivery(_test_delivery_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_delivery() OWNER TO postgres;

--
-- TOC entry 840 (class 1255 OID 106815)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_demand VALUES (201,101);
  INSERT INTO binding.cutoff_to_demand VALUES (202,102);
  INSERT INTO binding.cutoff_to_demand VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_demand(_test_demand_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_demand() OWNER TO postgres;

--
-- TOC entry 841 (class 1255 OID 106816)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_despatch VALUES (201,101);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,102);
  INSERT INTO binding.cutoff_to_despatch VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_despatch(_test_despatch_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_despatch() OWNER TO postgres;

--
-- TOC entry 842 (class 1255 OID 106817)
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

  INSERT INTO goal.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_goal VALUES (201,101);
  INSERT INTO binding.cutoff_to_goal VALUES (202,102);
  INSERT INTO binding.cutoff_to_goal VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_goal(_test_goal_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_goal() OWNER TO postgres;

--
-- TOC entry 843 (class 1255 OID 106818)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_issue VALUES (201,101);
  INSERT INTO binding.cutoff_to_issue VALUES (202,102);
  INSERT INTO binding.cutoff_to_issue VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 783 (class 1255 OID 106819)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_picklist VALUES (201,101);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,102);
  INSERT INTO binding.cutoff_to_picklist VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_picklist(_test_picklist_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_picklist() OWNER TO postgres;

--
-- TOC entry 786 (class 1255 OID 106820)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_rebound VALUES (201,101);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,102);
  INSERT INTO binding.cutoff_to_rebound VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_rebound(_test_rebound_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_rebound() OWNER TO postgres;

--
-- TOC entry 801 (class 1255 OID 106821)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_receipt VALUES (201,101);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,102);
  INSERT INTO binding.cutoff_to_receipt VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 807 (class 1255 OID 106822)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_reserve VALUES (201,101);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,102);
  INSERT INTO binding.cutoff_to_reserve VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_reserve(_test_reserve_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_reserve() OWNER TO postgres;

--
-- TOC entry 756 (class 1255 OID 106823)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  INSERT INTO binding.cutoff_to_stocktake VALUES (201,101);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,102);
  INSERT INTO binding.cutoff_to_stocktake VALUES (202,103);

  _cutoff_id := binding.get_cutoff_binded_to_stocktake(_test_stocktake_id);
  PERFORM pgunit.assert_equals(_test_cutoff_id, _cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_cutoff_binded_to_stocktake() OWNER TO postgres;

--
-- TOC entry 844 (class 1255 OID 106824)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 1021 (class 1255 OID 106825)
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

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO binding.delivery_to_receipt VALUES (201,101);
  INSERT INTO binding.delivery_to_receipt VALUES (202,102);
  INSERT INTO binding.delivery_to_receipt VALUES (203,103);

  _delivery_id := binding.get_delivery_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_delivery_id, _delivery_id, 'Incorrect _delivery_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_delivery_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 845 (class 1255 OID 106826)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 846 (class 1255 OID 106827)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 770 (class 1255 OID 106828)
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
-- TOC entry 847 (class 1255 OID 106829)
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
-- TOC entry 848 (class 1255 OID 106830)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 849 (class 1255 OID 106831)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 850 (class 1255 OID 106832)
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
-- TOC entry 851 (class 1255 OID 106833)
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

  INSERT INTO goal.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 852 (class 1255 OID 106834)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 853 (class 1255 OID 106835)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 854 (class 1255 OID 106836)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 855 (class 1255 OID 106837)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 856 (class 1255 OID 106838)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 757 (class 1255 OID 106839)
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
-- TOC entry 857 (class 1255 OID 106840)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 755 (class 1255 OID 106841)
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
-- TOC entry 859 (class 1255 OID 106842)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 771 (class 1255 OID 106843)
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
-- TOC entry 860 (class 1255 OID 106844)
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
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO binding.issue_to_rebound VALUES (201,101);
  INSERT INTO binding.issue_to_rebound VALUES (202,102);
  INSERT INTO binding.issue_to_rebound VALUES (203,103);

  _issue_id := binding.get_issue_binded_to_rebound(_test_rebound_id);
  PERFORM pgunit.assert_equals(_test_issue_id, _issue_id, 'Incorrect _issue_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_issue_binded_to_rebound() OWNER TO postgres;

--
-- TOC entry 861 (class 1255 OID 106845)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 862 (class 1255 OID 106846)
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
-- TOC entry 863 (class 1255 OID 106847)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 858 (class 1255 OID 106848)
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
-- TOC entry 864 (class 1255 OID 106849)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 865 (class 1255 OID 106850)
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
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO binding.issue_to_rebound VALUES (201,101);
  INSERT INTO binding.issue_to_rebound VALUES (202,102);
  INSERT INTO binding.issue_to_rebound VALUES (203,103);

  _rebound_id := binding.get_rebound_binded_to_issue(_test_issue_id);
  PERFORM pgunit.assert_equals(_test_rebound_id, _rebound_id, 'Incorrect _rebound_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_rebound_binded_to_issue() OWNER TO postgres;

--
-- TOC entry 866 (class 1255 OID 106851)
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

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO binding.receipt_to_rebound VALUES (201,101);
  INSERT INTO binding.receipt_to_rebound VALUES (202,102);
  INSERT INTO binding.receipt_to_rebound VALUES (203,103);

  _rebound_id := binding.get_rebound_binded_to_receipt(_test_receipt_id);
  PERFORM pgunit.assert_equals(_test_rebound_id, _rebound_id, 'Incorrect _rebound_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_rebound_binded_to_receipt() OWNER TO postgres;

--
-- TOC entry 867 (class 1255 OID 106852)
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

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (201,101);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (202,102);
  INSERT INTO binding.receipt_to_adjustmentdebit VALUES (203,103);

  _receipt_id := binding.get_receipt_binded_to_adjustmentdebit(_test_adjustmentdebit_id);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_adjustmentdebit() OWNER TO postgres;

--
-- TOC entry 868 (class 1255 OID 106853)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 1022 (class 1255 OID 106854)
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

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO binding.delivery_to_receipt VALUES (201,101);
  INSERT INTO binding.delivery_to_receipt VALUES (202,102);
  INSERT INTO binding.delivery_to_receipt VALUES (203,103);

  _receipt_id := binding.get_receipt_binded_to_delivery(_test_delivery_id);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_ids value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_delivery() OWNER TO postgres;

--
-- TOC entry 870 (class 1255 OID 106855)
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

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO binding.receipt_to_rebound VALUES (201,101);
  INSERT INTO binding.receipt_to_rebound VALUES (202,102);
  INSERT INTO binding.receipt_to_rebound VALUES (203,103);

  _receipt_id := binding.get_receipt_binded_to_rebound(_test_rebound_id);
  PERFORM pgunit.assert_equals(_test_receipt_id, _receipt_id, 'Incorrect _receipt_id value');

END;
$$;


ALTER FUNCTION tests.__binding__get_receipt_binded_to_rebound() OWNER TO postgres;

--
-- TOC entry 871 (class 1255 OID 106856)
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
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 872 (class 1255 OID 106857)
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
-- TOC entry 873 (class 1255 OID 106858)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 772 (class 1255 OID 106859)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 869 (class 1255 OID 106860)
-- Name: __binding__unbind_cutoff_and_adjustmentcredit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_adjustmentcredit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_adjustmentcredit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_adjustmentcredit()';

  INSERT INTO adjustmentcredit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTCREDIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTCREDIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentcredit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTCREDIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 766 (class 1255 OID 106861)
-- Name: __binding__unbind_cutoff_and_adjustmentdebit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_adjustmentdebit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_adjustmentdebit_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_adjustmentdebit()';

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 874 (class 1255 OID 106862)
-- Name: __binding__unbind_cutoff_and_delivery(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_delivery() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_delivery_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_delivery()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 875 (class 1255 OID 106863)
-- Name: __binding__unbind_cutoff_and_demand(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_demand() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_demand_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_demand()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 876 (class 1255 OID 106864)
-- Name: __binding__unbind_cutoff_and_despatch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_despatch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_despatch_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_despatch()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 877 (class 1255 OID 106865)
-- Name: __binding__unbind_cutoff_and_goal(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_goal() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_goal_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_goal()';

  INSERT INTO goal.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 878 (class 1255 OID 106866)
-- Name: __binding__unbind_cutoff_and_issue(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_issue() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_issue_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_issue()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 781 (class 1255 OID 106867)
-- Name: __binding__unbind_cutoff_and_picklist(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_picklist() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_picklist_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_picklist()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 879 (class 1255 OID 106868)
-- Name: __binding__unbind_cutoff_and_rebound(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_rebound() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_rebound_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_rebound()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 880 (class 1255 OID 106869)
-- Name: __binding__unbind_cutoff_and_receipt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_receipt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_receipt_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_receipt()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 773 (class 1255 OID 106870)
-- Name: __binding__unbind_cutoff_and_reserve(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __binding__unbind_cutoff_and_reserve() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
  _test_cutoff_id CONSTANT bigint := 201;
  _test_reserve_id CONSTANT bigint := 101;
BEGIN
  
  RAISE DEBUG '#trace Check __binding__unbind_cutoff_and_reserve()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 881 (class 1255 OID 106871)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 1023 (class 1255 OID 106872)
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

  INSERT INTO delivery.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
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
-- TOC entry 882 (class 1255 OID 106873)
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
-- TOC entry 883 (class 1255 OID 106874)
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
-- TOC entry 884 (class 1255 OID 106875)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 885 (class 1255 OID 106876)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 886 (class 1255 OID 106877)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 887 (class 1255 OID 106878)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 888 (class 1255 OID 106879)
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

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 889 (class 1255 OID 106880)
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
-- TOC entry 782 (class 1255 OID 106881)
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
-- TOC entry 890 (class 1255 OID 106882)
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
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
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
-- TOC entry 891 (class 1255 OID 106883)
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
-- TOC entry 892 (class 1255 OID 106884)
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

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
 
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
-- TOC entry 893 (class 1255 OID 106885)
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

  INSERT INTO receipt.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
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
-- TOC entry 894 (class 1255 OID 106886)
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
-- TOC entry 895 (class 1255 OID 106887)
-- Name: __common__get_document_head_types(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_document_head_types() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_document_head_types CONSTANT common.document_kind[] := ARRAY['ISSUE', 'RECEIPT']::common.document_kind[];
  _document_head_types common.document_kind[];
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
-- TOC entry 896 (class 1255 OID 106888)
-- Name: __common__get_policy_mode(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_policy_mode() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_policy common.policy_mode;
  _test_cutoff_policy CONSTANT common.policy_mode := 'ENFORCING'::common.policy_mode;
BEGIN
  
  RAISE DEBUG '#trace Check __common__get_policy_mode()';

  TRUNCATE TABLE common.cutoff_policy;

  INSERT INTO common.cutoff_policy VALUES ('ISSUE', 'ENFORCING');

  _cutoff_policy := common.get_policy_mode('ISSUE');

  PERFORM pgunit.assert_equals(_test_cutoff_policy, _cutoff_policy, 'Incorrect _cutoff_policy value');

END;
$$;


ALTER FUNCTION tests.__common__get_policy_mode() OWNER TO postgres;

--
-- TOC entry 897 (class 1255 OID 106889)
-- Name: __common__get_stocktake_mode(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__get_stocktake_mode() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_policy common.policy_mode;
  _test_cutoff_policy CONSTANT common.policy_mode := 'ENFORCING'::common.policy_mode;
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
-- TOC entry 898 (class 1255 OID 106890)
-- Name: __common__remake_document_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__remake_document_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head_in CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','B1','PROPOSED','DEMAND')]::common.document_head[];
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __common__remake_document_head()';
  
  _head := common.remake_document_head(
      __head := _test_head_in[1],
      __document_id := 100::bigint,
      __gid := 'e2a05252-0503-11e7-aec1-d4bed939923a'::uuid,
      __display_name := 'NEWNAME'::character varying,
      __document_date := '2017-03-01'::date,
      __facility_code := 'D1'::character varying,
      __curr_fsmt := 'COMMITTED'::common.document_fsmt,
      __doctype := 'ISSUE'::common.document_kind);
  PERFORM pgunit.assert_equals(100::bigint, _head.document_id, 'Incorrect document_id value');
  PERFORM pgunit.assert_equals('e2a05252-0503-11e7-aec1-d4bed939923a'::uuid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals('NEWNAME'::character varying, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals('2017-03-01'::date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals('D1'::character varying, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals('ISSUE'::common.document_kind, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals('COMMITTED'::common.document_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');

END;
$$;


ALTER FUNCTION tests.__common__remake_document_head() OWNER TO postgres;

--
-- TOC entry 1026 (class 1255 OID 110810)
-- Name: __common__remake_inbound_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__remake_inbound_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head_in CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RECEIPT-01','2017-01-01','B1', 'PROPOSED','RECEIPT', 'A1')]::common.inbound_head[];
  _head common.inbound_head;
BEGIN
  
  RAISE DEBUG '#trace Check __common__remake_inbound_head()';
  
  _head := common.remake_inbound_head(
      __head := _test_head_in[1],
      __document_id := 100::bigint,
      __gid := 'e2a05252-0503-11e7-aec1-d4bed939923a'::uuid,
      __display_name := 'NEWNAME'::character varying,
      __document_date := '2017-03-01'::date,
      __facility_code := 'D1'::character varying,
      __addresser := 'F1'::character varying,
      __curr_fsmt := 'COMMITTED'::common.document_fsmt,
      __doctype := 'ISSUE'::common.document_kind);
  PERFORM pgunit.assert_equals(100::bigint, _head.document_id, 'Incorrect document_id value');
  PERFORM pgunit.assert_equals('e2a05252-0503-11e7-aec1-d4bed939923a'::uuid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals('NEWNAME'::character varying, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals('2017-03-01'::date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals('D1'::character varying, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals('F1'::character varying, _head.addresser, 'Incorrect addresser value');
  PERFORM pgunit.assert_equals('ISSUE'::common.document_kind, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals('COMMITTED'::common.document_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');

END;
$$;


ALTER FUNCTION tests.__common__remake_inbound_head() OWNER TO postgres;

--
-- TOC entry 1027 (class 1255 OID 110843)
-- Name: __common__remake_outbound_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __common__remake_outbound_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head_in CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RECEIPT-01','2017-01-01','B1', 'PROPOSED','RECEIPT', 'A1', '2017-01-01')]::common.outbound_head[];
  _head common.outbound_head;
BEGIN
  
  RAISE DEBUG '#trace Check __common__remake_outbound_head()';
  
  _head := common.remake_outbound_head(
      __head := _test_head_in[1],
      __document_id := 100::bigint,
      __gid := 'e2a05252-0503-11e7-aec1-d4bed939923a'::uuid,
      __display_name := 'NEWNAME'::character varying,
      __document_date := '2017-03-01'::date,
      __due_date := '2017-03-02'::date,
      __facility_code := 'D1'::character varying,
      __addressee := 'F1'::character varying,
      __curr_fsmt := 'COMMITTED'::common.document_fsmt,
      __doctype := 'ISSUE'::common.document_kind);
  PERFORM pgunit.assert_equals(100::bigint, _head.document_id, 'Incorrect document_id value');
  PERFORM pgunit.assert_equals('e2a05252-0503-11e7-aec1-d4bed939923a'::uuid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals('NEWNAME'::character varying, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals('2017-03-01'::date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals('2017-03-02'::date, _head.due_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals('D1'::character varying, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals('F1'::character varying, _head.addressee, 'Incorrect addressee value');
  PERFORM pgunit.assert_equals('ISSUE'::common.document_kind, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals('COMMITTED'::common.document_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');

END;
$$;


ALTER FUNCTION tests.__common__remake_outbound_head() OWNER TO postgres;

--
-- TOC entry 899 (class 1255 OID 106891)
-- Name: __cutoff__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _cutoff_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__destroy()';

  INSERT INTO cutoff.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM cutoff.destroy(101); -- + add not allowed delete test
  
  SELECT id FROM cutoff.head WHERE id = 101 INTO _cutoff_id;

  PERFORM pgunit.assert_null(_cutoff_id, 'Incorrect _cutoff_id value');

END;
$$;


ALTER FUNCTION tests.__cutoff__destroy() OWNER TO postgres;

--
-- TOC entry 774 (class 1255 OID 106892)
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
-- TOC entry 1024 (class 1255 OID 106893)
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

  INSERT INTO cutoff.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'A1', 'DECOMMITTED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _cutoff_ids := cutoff.get_all_comitted('A1');
  PERFORM pgunit.assert_array_equals(_test_cutoff_ids, _cutoff_ids, 'Incorrect _cutoff_ids value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_all_comitted() OWNER TO postgres;

--
-- TOC entry 900 (class 1255 OID 106894)
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

  INSERT INTO cutoff.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _gid := cutoff.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 1025 (class 1255 OID 110777)
-- Name: __cutoff__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'CUTOFF-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_facility_code CONSTANT character varying := 'A1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'CUTOFF'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__get_head()';

  INSERT INTO cutoff.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _head := cutoff.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_facility_code, _head.facility_code, 'Incorrect facility_code value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := cutoff.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := cutoff.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_head() OWNER TO postgres;

--
-- TOC entry 901 (class 1255 OID 106895)
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

  INSERT INTO cutoff.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _id := cutoff.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 902 (class 1255 OID 106896)
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
  INSERT INTO cutoff.head VALUES (101, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-02-02', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');

  _date_a1 := cutoff.get_last_cutoff_date('A1');
  _date_b1 := cutoff.get_last_cutoff_date('B1');
  PERFORM pgunit.assert_equals(_test_date_a1, _date_a1, 'Incorrect _date_a1 value');
  PERFORM pgunit.assert_equals(_test_date_b1, _date_b1, 'Incorrect _date_b1 value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_last_cutoff_date() OWNER TO postgres;

--
-- TOC entry 1029 (class 1255 OID 111038)
-- Name: __cutoff__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __cutoff__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','CUTOFF-01','2017-01-01','A1','PROPOSED','CUTOFF')]::common.document_head[];
  _head common.document_head;
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __cutoff__init()';
  
  _document_id := cutoff.init(_test_head[1]);
  _head := cutoff.get_head(_document_id);
  PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  --PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__cutoff__init() OWNER TO postgres;

--
-- TOC entry 903 (class 1255 OID 106897)
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
-- TOC entry 904 (class 1255 OID 106898)
-- Name: __delivery__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__destroy()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM delivery.destroy(101); -- + add not allowed delete test
  
  _head := delivery.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := delivery.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__delivery__destroy() OWNER TO postgres;

--
-- TOC entry 775 (class 1255 OID 106899)
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
-- TOC entry 905 (class 1255 OID 106900)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO delivery.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO delivery.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO delivery.body VALUES (103, 'good3', 3.0, 'm');

  _body := delivery.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_body() OWNER TO postgres;

--
-- TOC entry 906 (class 1255 OID 106901)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _gid := delivery.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 1018 (class 1255 OID 106902)
-- Name: __delivery__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-02';
  _test_document_date CONSTANT date := '2017-02-02'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DELIVERY'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _head := delivery.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := delivery.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := delivery.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head() OWNER TO postgres;

--
-- TOC entry 909 (class 1255 OID 106903)
-- Name: __delivery__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-02';
  _test_document_date CONSTANT date := '2017-02-02'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DELIVERY'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head_batch()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := delivery.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head_batch() OWNER TO postgres;

--
-- TOC entry 910 (class 1255 OID 106904)
-- Name: __delivery__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DELIVERY'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head_batch_proposed()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := delivery.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 907 (class 1255 OID 106905)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-02', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-02', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-02', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _id := delivery.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 908 (class 1255 OID 106906)
-- Name: __delivery__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DELIVERY-01','2017-01-01','A1','PROPOSED','CUTOFF','B1')]::common.inbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 911 (class 1255 OID 106907)
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
-- TOC entry 912 (class 1255 OID 106908)
-- Name: __delivery__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DELIVERY-01','2017-01-01','A1','PROPOSED','CUTOFF','B1')]::common.inbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 913 (class 1255 OID 106909)
-- Name: __demand__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 914 (class 1255 OID 106910)
-- Name: __demand__do_commit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__do_commit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _fsmt_01 common.goal_fsmt;
  _fsmt_02 common.goal_fsmt;
  _fsmt_03 common.goal_fsmt;
  _goal_id_01 bigint;
  _goal_id_02 bigint;
  _goal_id_03 bigint;
  _reserve_id_01 bigint;
  _reserve_id_02 bigint;
  _reserve_id_03 bigint;
  _test_fsmt_01 CONSTANT common.goal_fsmt := 'ACCEPTED'::common.goal_fsmt;
  _test_fsmt_02 CONSTANT common.goal_fsmt := 'ADVISED'::common.goal_fsmt;
  _test_fsmt_03 CONSTANT common.goal_fsmt := 'REJECTED'::common.goal_fsmt;
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
  _fsmt_01 := goal.get_curr_fsmt(_goal_id_01);
  _fsmt_02 := goal.get_curr_fsmt(_goal_id_02);
  _fsmt_03 := goal.get_curr_fsmt(_goal_id_03);
  _reserve_id_01 := binding.get_reserve_binded_to_demand(101);
  _reserve_id_02 := binding.get_reserve_binded_to_demand(102);
  _reserve_id_03 := binding.get_reserve_binded_to_demand(103);
  PERFORM pgunit.assert_equals(_test_fsmt_01, _fsmt_01, 'Incorrect _fsmt_01 value');
  PERFORM pgunit.assert_equals(_test_fsmt_02, _fsmt_02, 'Incorrect _fsmt_02 value');
  PERFORM pgunit.assert_equals(_test_fsmt_03, _fsmt_03, 'Incorrect _fsmt_03 value');
  PERFORM pgunit.assert_not_null(_reserve_id_01, 'Incorrect _reserve_id_01 value');
  PERFORM pgunit.assert_null(_reserve_id_02, 'Incorrect _reserve_id_02 value');
  PERFORM pgunit.assert_null(_reserve_id_03, 'Incorrect _reserve_id_03 value');

END;
$$;


ALTER FUNCTION tests.__demand__do_commit() OWNER TO postgres;

--
-- TOC entry 776 (class 1255 OID 106911)
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
-- TOC entry 915 (class 1255 OID 106912)
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
-- TOC entry 916 (class 1255 OID 106913)
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
-- TOC entry 917 (class 1255 OID 106914)
-- Name: __demand__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DEMAND-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DEMAND'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __demand__get_head()';

  INSERT INTO demand.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DEMAND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DEMAND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO demand.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DEMAND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := demand.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 918 (class 1255 OID 106915)
-- Name: __demand__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DEMAND-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DEMAND'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__demand__get_head_batch() OWNER TO postgres;

--
-- TOC entry 919 (class 1255 OID 106916)
-- Name: __demand__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DEMAND-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DEMAND'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__demand__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 920 (class 1255 OID 106917)
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
-- TOC entry 921 (class 1255 OID 106918)
-- Name: __demand__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','A1','PROPOSED','DEMAND','B1','2017-02-01')]::common.outbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 922 (class 1255 OID 106919)
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
-- TOC entry 923 (class 1255 OID 106920)
-- Name: __demand__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __demand__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','A1','PROPOSED','DEMAND','B1','2017-02-01')]::common.outbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 924 (class 1255 OID 106921)
-- Name: __despatch__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 754 (class 1255 OID 106922)
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
-- TOC entry 925 (class 1255 OID 106923)
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
-- TOC entry 926 (class 1255 OID 106924)
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
-- TOC entry 927 (class 1255 OID 106925)
-- Name: __despatch__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DESPATCH-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DESPATCH'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __despatch__get_head()';

  INSERT INTO despatch.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DESPATCH-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DESPATCH-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO despatch.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DESPATCH-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := despatch.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 928 (class 1255 OID 106926)
-- Name: __despatch__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DESPATCH-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DESPATCH'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_head_batch() OWNER TO postgres;

--
-- TOC entry 929 (class 1255 OID 106927)
-- Name: __despatch__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DESPATCH-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DESPATCH'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__despatch__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 930 (class 1255 OID 106928)
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
-- TOC entry 931 (class 1255 OID 106929)
-- Name: __despatch__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DESPATCH-01','2017-01-01','A1','PROPOSED','DESPATCH','B1','2017-02-01')]::common.outbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 932 (class 1255 OID 106930)
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
-- TOC entry 933 (class 1255 OID 106931)
-- Name: __despatch__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __despatch__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DESPATCH-01','2017-01-01','A1','PROPOSED','DESPATCH','B1','2017-02-01')]::common.outbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 934 (class 1255 OID 106932)
-- Name: __goal__analyze_ability(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__analyze_ability() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _fsmt_01 common.goal_fsmt;
  _fsmt_02 common.goal_fsmt;
  _fsmt_03 common.goal_fsmt;
  _test_fsmt_01 CONSTANT common.goal_fsmt := 'ACCEPTED'::common.goal_fsmt;
  _test_fsmt_02 CONSTANT common.goal_fsmt := 'ADVISED'::common.goal_fsmt;
  _test_fsmt_03 CONSTANT common.goal_fsmt := 'REJECTED'::common.goal_fsmt;
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

  _fsmt_01 := goal.analyze_ability(101);
  _fsmt_02 := goal.analyze_ability(102);
  _fsmt_03 := goal.analyze_ability(103);
  PERFORM pgunit.assert_equals(_test_fsmt_01, _fsmt_01, 'Incorrect _fsmt_01 value');
  PERFORM pgunit.assert_equals(_test_fsmt_02, _fsmt_02, 'Incorrect _fsmt_02 value');
  PERFORM pgunit.assert_equals(_test_fsmt_03, _fsmt_03, 'Incorrect _fsmt_03 value');

END;
$$;


ALTER FUNCTION tests.__goal__analyze_ability() OWNER TO postgres;

--
-- TOC entry 935 (class 1255 OID 106933)
-- Name: __goal__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__destroy()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM goal.destroy(201); -- + add not allowed delete test
  
  SELECT id FROM goal.head WHERE id = 201 INTO _goal_id;

  PERFORM pgunit.assert_null(_goal_id, 'Incorrect _goal_id value');

END;
$$;


ALTER FUNCTION tests.__goal__destroy() OWNER TO postgres;

--
-- TOC entry 777 (class 1255 OID 106934)
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
-- TOC entry 936 (class 1255 OID 106935)
-- Name: __goal__get_curr_fsmt(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__get_curr_fsmt() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _goal_trasition common.goal_fsmt;
  _test_goal_trasition CONSTANT common.goal_fsmt := 'COMMITTED'::common.goal_fsmt;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__get_curr_fsmt()';

  INSERT INTO goal.head VALUES (201, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (202, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (203, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _goal_trasition :=  goal.get_curr_fsmt(202);

  PERFORM pgunit.assert_equals(_test_goal_trasition, _goal_trasition, 'Incorrect _goal_trasition value');

END;
$$;


ALTER FUNCTION tests.__goal__get_curr_fsmt() OWNER TO postgres;

--
-- TOC entry 1028 (class 1255 OID 110972)
-- Name: __goal__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'GOAL-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_facility_code CONSTANT character varying := 'A1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'GOAL'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__get_head()';

  INSERT INTO goal.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'GOAL-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO goal.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'GOAL-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _head := goal.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_facility_code, _head.facility_code, 'Incorrect facility_code value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := goal.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := goal.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__goal__get_head() OWNER TO postgres;

--
-- TOC entry 937 (class 1255 OID 106936)
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
-- TOC entry 1030 (class 1255 OID 111005)
-- Name: __goal__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __goal__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.goal_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','GOAL-01','2017-01-01','A1','PROPOSED','GOAL')]::common.goal_head[];
  _head common.goal_head;
  _document_id bigint;
BEGIN
  
  RAISE DEBUG '#trace Check __goal__init()';
  
  _document_id := goal.init(_test_head[1]);
  _head := goal.get_head(_document_id);
  PERFORM pgunit.assert_equals(_test_head[1], _head, 'Incorrect _head value');
  --PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');


END;
$$;


ALTER FUNCTION tests.__goal__init() OWNER TO postgres;

--
-- TOC entry 938 (class 1255 OID 106937)
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
-- TOC entry 939 (class 1255 OID 106938)
-- Name: __issue__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 940 (class 1255 OID 106939)
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
-- TOC entry 778 (class 1255 OID 106940)
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
-- TOC entry 941 (class 1255 OID 106941)
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
-- TOC entry 942 (class 1255 OID 106942)
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
-- TOC entry 943 (class 1255 OID 106943)
-- Name: __issue__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ISSUE-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ISSUE'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __issue__get_head()';

  INSERT INTO issue.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ISSUE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := issue.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 944 (class 1255 OID 106944)
-- Name: __issue__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ISSUE-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ISSUE'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__issue__get_head_batch() OWNER TO postgres;

--
-- TOC entry 945 (class 1255 OID 106945)
-- Name: __issue__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'ISSUE-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'ISSUE'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__issue__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 946 (class 1255 OID 106946)
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
-- TOC entry 947 (class 1255 OID 106947)
-- Name: __issue__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ISSUE-01','2017-01-01','A1','PROPOSED','ISSUE','B1','2017-02-01')]::common.outbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 948 (class 1255 OID 106948)
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

  UPDATE issue.head SET curr_fsmt = 'COMMITTED' WHERE id = 101;

  PERFORM issue.make_adjustment(101);
  _adjustment_id := binding.get_adjustmentcredit_binded_to_issue(101);
  _body := adjustmentcredit.get_body(_adjustment_id);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__issue__make_adjustment() OWNER TO postgres;

--
-- TOC entry 949 (class 1255 OID 106949)
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
-- TOC entry 950 (class 1255 OID 106950)
-- Name: __issue__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __issue__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','ISSUE-01','2017-01-01','A1','PROPOSED','ISSUE','B1','2017-02-01')]::common.outbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 951 (class 1255 OID 106951)
-- Name: __picklist__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 952 (class 1255 OID 106952)
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
-- TOC entry 779 (class 1255 OID 106953)
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
-- TOC entry 953 (class 1255 OID 106954)
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
-- TOC entry 954 (class 1255 OID 106955)
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
-- TOC entry 955 (class 1255 OID 106956)
-- Name: __picklist__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'PICKLIST-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'PICKLIST'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __picklist__get_head()';

  INSERT INTO picklist.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'PICKLIST-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'PICKLIST-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := picklist.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 956 (class 1255 OID 106957)
-- Name: __picklist__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'PICKLIST-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'PICKLIST'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_head_batch() OWNER TO postgres;

--
-- TOC entry 957 (class 1255 OID 106958)
-- Name: __picklist__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'PICKLIST-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'PICKLIST'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__picklist__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 958 (class 1255 OID 106959)
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
-- TOC entry 959 (class 1255 OID 106960)
-- Name: __picklist__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','PICKLIST-01','2017-01-01','A1','PROPOSED','PICKLIST','B1','2017-02-01')]::common.outbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 960 (class 1255 OID 106961)
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
-- TOC entry 961 (class 1255 OID 106962)
-- Name: __picklist__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __picklist__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','PICKLIST-01','2017-01-01','A1','PROPOSED','PICKLIST','B1','2017-02-01')]::common.outbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 962 (class 1255 OID 106963)
-- Name: __rebound__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__destroy()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM rebound.destroy(101); -- + add not allowed delete test
  
  _head := rebound.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := rebound.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__rebound__destroy() OWNER TO postgres;

--
-- TOC entry 780 (class 1255 OID 106964)
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
-- TOC entry 963 (class 1255 OID 106965)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO rebound.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good3', 3.0, 'm');

  _body := rebound.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_body() OWNER TO postgres;

--
-- TOC entry 964 (class 1255 OID 106966)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _gid := rebound.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 965 (class 1255 OID 106967)
-- Name: __rebound__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'REBOUND-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'REBOUND'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_head()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _head := rebound.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := rebound.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := rebound.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head() OWNER TO postgres;

--
-- TOC entry 966 (class 1255 OID 106968)
-- Name: __rebound__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'REBOUND-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'REBOUND'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_head_batch()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := rebound.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head_batch() OWNER TO postgres;

--
-- TOC entry 967 (class 1255 OID 106969)
-- Name: __rebound__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'REBOUND-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'REBOUND'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __rebound__get_head_batch_proposed()';

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := rebound.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 968 (class 1255 OID 106970)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _id := rebound.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 969 (class 1255 OID 106971)
-- Name: __rebound__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','REBOUND-01','2017-01-01','A1','PROPOSED','CUTOFF','B1')]::common.inbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 970 (class 1255 OID 106972)
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
-- TOC entry 971 (class 1255 OID 106973)
-- Name: __rebound__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','REBOUND-01','2017-01-01','A1','PROPOSED','CUTOFF','B1')]::common.inbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 972 (class 1255 OID 106974)
-- Name: __receipt__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__destroy()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  PERFORM receipt.destroy(101); -- + add not allowed delete test
  
  _head := receipt.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := receipt.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__receipt__destroy() OWNER TO postgres;

--
-- TOC entry 973 (class 1255 OID 106975)
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
-- TOC entry 975 (class 1255 OID 106976)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO receipt.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good3', 3.0, 'm');

  _body := receipt.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_body() OWNER TO postgres;

--
-- TOC entry 976 (class 1255 OID 106977)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _gid := receipt.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 977 (class 1255 OID 106978)
-- Name: __receipt__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RECEIPT-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'RECEIPT'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_head()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _head := receipt.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := receipt.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := receipt.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head() OWNER TO postgres;

--
-- TOC entry 978 (class 1255 OID 106979)
-- Name: __receipt__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RECEIPT-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'RECEIPT'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_head_batch()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := receipt.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head_batch() OWNER TO postgres;

--
-- TOC entry 979 (class 1255 OID 106980)
-- Name: __receipt__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.inbound_head[];
  _head common.inbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RECEIPT-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'RECEIPT'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __receipt__get_head_batch_proposed()';

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := receipt.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.facility_code, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.addresser, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 980 (class 1255 OID 106981)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _id := receipt.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 981 (class 1255 OID 106982)
-- Name: __receipt__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RECEIPT-01','2017-01-01','A1','PROPOSED','CUTOFF','B1')]::common.inbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 982 (class 1255 OID 106983)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO receipt.body VALUES (101, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (101, 'good3', 3.0, 'm');

  UPDATE receipt.head SET curr_fsmt = 'COMMITTED' WHERE id = 101;

  PERFORM receipt.make_adjustment(101);
  _adjustment_id := binding.get_adjustmentdebit_binded_to_receipt(101);
  _body := adjustmentdebit.get_body(_adjustment_id);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__receipt__make_adjustment() OWNER TO postgres;

--
-- TOC entry 983 (class 1255 OID 106984)
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
-- TOC entry 984 (class 1255 OID 106985)
-- Name: __receipt__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.inbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RECEIPT-01','2017-01-01','A1','PROPOSED','CUTOFF','B1')]::common.inbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 985 (class 1255 OID 106986)
-- Name: __reserve__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 986 (class 1255 OID 106987)
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
-- TOC entry 987 (class 1255 OID 106988)
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
-- TOC entry 988 (class 1255 OID 106989)
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
-- TOC entry 989 (class 1255 OID 106990)
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
-- TOC entry 990 (class 1255 OID 106991)
-- Name: __reserve__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RESERVE-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'RESERVE'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __reserve__get_head()';

  INSERT INTO reserve.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RESERVE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RESERVE-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO reserve.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RESERVE-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := reserve.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 991 (class 1255 OID 106992)
-- Name: __reserve__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 2;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RESERVE-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'RESERVE'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_head_batch() OWNER TO postgres;

--
-- TOC entry 992 (class 1255 OID 106993)
-- Name: __reserve__get_head_batch_proposed(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__get_head_batch_proposed() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.outbound_head[];
  _head common.outbound_head;
  _array_lengh integer;
  _test_array_lengh CONSTANT integer := 1;
  _test_start_date CONSTANT date := '2017-03-01';
  _test_end_date CONSTANT date := '2017-03-01';
  _test_gid CONSTANT uuid := 'f20d7196-01d1-11e7-b441-d4bed939923a';
  _test_display_name CONSTANT character varying := 'RESERVE-03';
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'RESERVE'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals(_test_due_date, _head.due_date, 'Incorrect due_date value');

END;
$$;


ALTER FUNCTION tests.__reserve__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 993 (class 1255 OID 106994)
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
-- TOC entry 994 (class 1255 OID 106995)
-- Name: __reserve__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RESERVE-01','2017-01-01','A1','PROPOSED','RESERVE','B1','2017-02-01')]::common.outbound_head[];
  _test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 995 (class 1255 OID 106996)
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
-- TOC entry 996 (class 1255 OID 106997)
-- Name: __reserve__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __reserve__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','RESERVE-01','2017-01-01','A1','PROPOSED','RESERVE','B1','2017-02-01')]::common.outbound_head[];
  _test_body_init CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];
  _test_body_reinit CONSTANT common.document_body[] := ARRAY[('good3',10,'m'), ('good4',20,'m')]::common.document_body[];
  _head common.outbound_head;
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
-- TOC entry 997 (class 1255 OID 106998)
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
-- TOC entry 998 (class 1255 OID 106999)
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
-- TOC entry 999 (class 1255 OID 107000)
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
-- TOC entry 1000 (class 1255 OID 107001)
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

  SELECT issued_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _issued_qty_1;
  SELECT issued_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _issued_qty_2;

  PERFORM pgunit.assert_equals(_test_issued_qty_1, _issued_qty_1, 'Incorrect _issued_qty_1 value');
  PERFORM pgunit.assert_equals(_test_issued_qty_2, _issued_qty_2, 'Incorrect _issued_qty_2 value');

  TRUNCATE TABLE stockcard.head;

  PERFORM stockcard.assign_issue(103);

  SELECT issued_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _issued_qty_1;
  SELECT issued_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _issued_qty_2;

  PERFORM pgunit.assert_equals(_test_issued_qty_1, _issued_qty_1, 'Incorrect _issued_qty_1 value');
  PERFORM pgunit.assert_equals(_test_issued_qty_2, _issued_qty_2, 'Incorrect _issued_qty_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__assign_issue() OWNER TO postgres;

--
-- TOC entry 1001 (class 1255 OID 107002)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO rebound.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_rebound(rebound.get_head(103), rebound.get_body(103));

  SELECT rebounded_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _rebounded_qty_1;
  SELECT rebounded_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _rebounded_qty_2;

  PERFORM pgunit.assert_equals(_test_rebounded_qty_1, _rebounded_qty_1, 'Incorrect _rebounded_qty_1 value');
  PERFORM pgunit.assert_equals(_test_rebounded_qty_2, _rebounded_qty_2, 'Incorrect _rebounded_qty_2 value');

  TRUNCATE TABLE stockcard.head;

  PERFORM stockcard.assign_rebound(103);

  SELECT rebounded_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _rebounded_qty_1;
  SELECT rebounded_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _rebounded_qty_2;

  PERFORM pgunit.assert_equals(_test_rebounded_qty_1, _rebounded_qty_1, 'Incorrect _rebounded_qty_1 value');
  PERFORM pgunit.assert_equals(_test_rebounded_qty_2, _rebounded_qty_2, 'Incorrect _rebounded_qty_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__assign_rebound() OWNER TO postgres;

--
-- TOC entry 1002 (class 1255 OID 107003)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO receipt.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_receipt(receipt.get_head(103), receipt.get_body(103));

  SELECT receipt_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _receipt_qty_1;
  SELECT receipt_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _receipt_qty_2;

  PERFORM pgunit.assert_equals(_test_receipt_qty_1, _receipt_qty_1, 'Incorrect _receipt_qty_1 value');
  PERFORM pgunit.assert_equals(_test_receipt_qty_2, _receipt_qty_2, 'Incorrect _receipt_qty_2 value');

  TRUNCATE TABLE stockcard.head;

  PERFORM stockcard.assign_receipt(103);

  SELECT receipt_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _receipt_qty_1;
  SELECT receipt_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _receipt_qty_2;

  PERFORM pgunit.assert_equals(_test_receipt_qty_1, _receipt_qty_1, 'Incorrect _receipt_qty_1 value');
  PERFORM pgunit.assert_equals(_test_receipt_qty_2, _receipt_qty_2, 'Incorrect _receipt_qty_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__assign_receipt() OWNER TO postgres;

--
-- TOC entry 1003 (class 1255 OID 107004)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO stocktake.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good3', 3.0, 'm');

  PERFORM stockcard.assign_stocktake(stocktake.get_head(103), stocktake.get_body(103));

  SELECT stocktake_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _stocktake_qty_1;
  SELECT stocktake_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _stocktake_qty_2;

  PERFORM pgunit.assert_equals(_test_stocktake_qty_1, _stocktake_qty_1, 'Incorrect _stocktake_qty_1 value');
  PERFORM pgunit.assert_equals(_test_stocktake_qty_2, _stocktake_qty_2, 'Incorrect _stocktake_qty_2 value');

  TRUNCATE TABLE stockcard.head;

  PERFORM stockcard.assign_stocktake(103);

  SELECT stocktake_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good2' INTO _stocktake_qty_1;
  SELECT stocktake_qty FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' AND good_code = 'good3' INTO _stocktake_qty_2;

  PERFORM pgunit.assert_equals(_test_stocktake_qty_1, _stocktake_qty_1, 'Incorrect _stocktake_qty_1 value');
  PERFORM pgunit.assert_equals(_test_stocktake_qty_2, _stocktake_qty_2, 'Incorrect _stocktake_qty_2 value');



END;
$$;


ALTER FUNCTION tests.__stockcard__assign_stocktake() OWNER TO postgres;

--
-- TOC entry 1004 (class 1255 OID 107005)
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

  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE', 'ISSUE-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE', 'ISSUE-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'ISSUE', 'ISSUE-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 

  PERFORM stockcard.deassign_issue(101);

  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_issue() OWNER TO postgres;

--
-- TOC entry 1005 (class 1255 OID 107006)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO rebound.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO rebound.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND', 'REBOUND-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND', 'REBOUND-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND', 'REBOUND-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 
  
  PERFORM stockcard.deassign_rebound(101);

  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_rebound() OWNER TO postgres;

--
-- TOC entry 1006 (class 1255 OID 107007)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO receipt.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO receipt.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT', 'RECEIPT-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT', 'RECEIPT-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT', 'RECEIPT-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 
  
  PERFORM stockcard.deassign_receipt(101);

  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_receipt() OWNER TO postgres;

--
-- TOC entry 1007 (class 1255 OID 107008)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO stocktake.body VALUES (101, 'good1', 1.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good2', 2.0, 'm');
  INSERT INTO stocktake.body VALUES (103, 'good3', 3.0, 'm');

  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE', 'STOCKTAKE-01', '2017-02-01', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 1.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 01:59:35.278566+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE', 'STOCKTAKE-01', '2017-02-01', 'A1', 'B1', 'good2', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 2.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:00:22.679027+02');
  INSERT INTO stockcard.head (document_gid, document_kind, document_name, document_date, facility_code, counterparty_code, good_code, cutoff_date, cutoff_uom, cutoff_qty, receipt_uom, receipt_qty, issued_uom, issued_qty, adjusted_uom, adjusted_qty, rebounded_uom, rebounded_qty, stocktake_uom, stocktake_qty, log_datetime) VALUES ('f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE', 'STOCKTAKE-03', '2017-02-02', 'A1', 'B1', 'good1', NULL, NULL, 0.0000, NULL, 0.0000, NULL, 3.0000, 'm', 0.0000, NULL, 0.0000, NULL, 0.0000, '2017-03-12 02:01:27.955482+02'); 
  
  
  PERFORM stockcard.deassign_stocktake(101);

  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = '8236af18-eb1a-11e6-8a73-d4bed939923a' INTO _records_cnt_1;
  SELECT COUNT(*) FROM stockcard.head WHERE document_gid = 'f20d7196-01d1-11e7-b441-d4bed939923a' INTO _records_cnt_2;

  PERFORM pgunit.assert_equals(_test_records_cnt_1, _records_cnt_1, 'Incorrect _records_cnt_1 value');
  PERFORM pgunit.assert_equals(_test_records_cnt_2, _records_cnt_2, 'Incorrect _records_cnt_2 value');

END;
$$;


ALTER FUNCTION tests.__stockcard__deassign_stocktake() OWNER TO postgres;

--
-- TOC entry 1008 (class 1255 OID 107009)
-- Name: __stocktake__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__destroy()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  PERFORM stocktake.destroy(101); -- + add not allowed delete test
  
  _head := stocktake.get_head(101);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

  _head := stocktake.get_head(103);
  PERFORM pgunit.assert_not_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__stocktake__destroy() OWNER TO postgres;

--
-- TOC entry 1009 (class 1255 OID 107010)
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
-- TOC entry 1010 (class 1255 OID 107011)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  INSERT INTO stocktake.body VALUES (101, 'good1', 1.0, 'm', 0);
  INSERT INTO stocktake.body VALUES (103, 'good2', 2.0, 'm', 0);
  INSERT INTO stocktake.body VALUES (103, 'good3', 3.0, 'm', 0);

  _body := stocktake.get_body(103);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_body() OWNER TO postgres;

--
-- TOC entry 1011 (class 1255 OID 107012)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _gid := stocktake.get_gid_by_id(_test_id);
  PERFORM pgunit.assert_equals(_test_gid, _gid, 'Incorrect _gid value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_gid_by_id() OWNER TO postgres;

--
-- TOC entry 974 (class 1255 OID 107013)
-- Name: __stocktake__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.document_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'STOCKTAKE-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_facility_code CONSTANT character varying := 'A1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'STOCKTAKE'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_head()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _head := stocktake.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_facility_code, _head.facility_code, 'Incorrect facility_code value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

  _head := stocktake.get_head(103);
  PERFORM pgunit.assert_not_equals(_test_gid, _head.gid, 'Incorrect gid value');
  
  _head := stocktake.get_head(104);
  PERFORM pgunit.assert_null(_head, 'Incorrect _head value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_head() OWNER TO postgres;

--
-- TOC entry 1012 (class 1255 OID 107014)
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
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_facility_code CONSTANT character varying := 'A1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'STOCKTAKE'::common.document_kind;
  _test_due_date CONSTANT date := '2017-02-02'::date;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_head_batch()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := stocktake.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_facility_code, _head.facility_code, 'Incorrect facility_code value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_head_batch() OWNER TO postgres;

--
-- TOC entry 1013 (class 1255 OID 107015)
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
  _test_document_date CONSTANT date := '2017-03-01'::date;
  _test_facility_code CONSTANT character varying := 'A1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'PROPOSED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'STOCKTAKE'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __stocktake__get_head_batch_proposed()';

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _heads := stocktake.get_head_batch_proposed(_test_facility_code, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_facility_code, _head.facility_code, 'Incorrect facility_code value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 1014 (class 1255 OID 107016)
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

  INSERT INTO stocktake.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'STOCKTAKE-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'STOCKTAKE-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO stocktake.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'STOCKTAKE-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
  
  _id := stocktake.get_id_by_gid(_test_gid);
  PERFORM pgunit.assert_equals(_test_id, _id, 'Incorrect _id value');

END;
$$;


ALTER FUNCTION tests.__stocktake__get_id_by_gid() OWNER TO postgres;

--
-- TOC entry 1015 (class 1255 OID 107017)
-- Name: __stocktake__init(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__init() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','STOCKTAKE-01','2017-01-01','A1','PROPOSED','STOCKTAKE')]::common.document_head[];
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
-- TOC entry 1016 (class 1255 OID 107018)
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
-- TOC entry 1017 (class 1255 OID 107019)
-- Name: __stocktake__reinit(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __stocktake__reinit() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _test_head CONSTANT common.document_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','STOCKTAKE-01','2017-01-01','A1','PROPOSED','STOCKTAKE')]::common.document_head[];
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
-- TOC entry 784 (class 1255 OID 107020)
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
  TRUNCATE TABLE cutoff.head CASCADE;
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
  TRUNCATE TABLE goal.head CASCADE;
  TRUNCATE TABLE issue.body CASCADE;
  TRUNCATE TABLE issue.head CASCADE;
  TRUNCATE TABLE issue.numerator CASCADE;
  TRUNCATE TABLE lot.head CASCADE;
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
  TRUNCATE TABLE stockcard.head CASCADE;
  TRUNCATE TABLE stocktake.body CASCADE;
  TRUNCATE TABLE stocktake.head CASCADE;
  TRUNCATE TABLE stocktake.numerator CASCADE;
  /*SELECT 'ALTER SEQUENCE ' || sequence_schema || '.' || sequence_name || ' RESTART WITH 1;' 
  FROM information_schema.sequences
  WHERE sequence_catalog = 'wms' AND sequence_schema != 'common'
  ORDER by sequence_schema, sequence_name;*/
  ALTER SEQUENCE adjustmentcredit.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE adjustmentdebit.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE cutoff.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE delivery.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE demand.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE despatch.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE goal.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE issue.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE lot.head_ib_seq RESTART WITH 1;
  ALTER SEQUENCE picklist.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE rebound.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE receipt.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE reserve.head_id_seq RESTART WITH 1;
  ALTER SEQUENCE stocktake.head_id_seq RESTART WITH 1;
END;
$$;


ALTER FUNCTION tests._reset_data() OWNER TO postgres;

--
-- TOC entry 785 (class 1255 OID 107021)
-- Name: _run_all(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION _run_all() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _result text;
  _routines record;
  --_function_to_run text;
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
-- TOC entry 3210 (class 2605 OID 107022)
-- Name: CAST (common.document_fsmt AS common.goal_fsmt); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.document_fsmt AS common.goal_fsmt) WITH FUNCTION common.convert_document_to_goal_fsmt(common.document_fsmt) AS IMPLICIT;


--
-- TOC entry 3211 (class 2605 OID 107023)
-- Name: CAST (common.goal_fsmt AS common.document_fsmt); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.goal_fsmt AS common.document_fsmt) WITH FUNCTION common.convert_goal_to_document_fsmt(common.goal_fsmt) AS IMPLICIT;


--
-- TOC entry 3212 (class 2605 OID 107024)
-- Name: CAST (common.goal_head AS common.document_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.goal_head AS common.document_head) WITH FUNCTION common.convert_goal_to_document_head(common.goal_head) AS IMPLICIT;


--
-- TOC entry 3213 (class 2605 OID 107025)
-- Name: CAST (common.inbound_head AS common.document_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.inbound_head AS common.document_head) WITH FUNCTION common.convert_inbound_to_document_head(common.inbound_head) AS IMPLICIT;


--
-- TOC entry 3214 (class 2605 OID 107026)
-- Name: CAST (common.outbound_head AS common.document_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.outbound_head AS common.document_head) WITH FUNCTION common.convert_outbound_to_document_head(common.outbound_head) AS IMPLICIT;


--
-- TOC entry 3215 (class 2605 OID 107027)
-- Name: CAST (common.outbound_head AS common.goal_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.outbound_head AS common.goal_head) WITH FUNCTION common.convert_outbound_to_goal_head(common.outbound_head) AS IMPLICIT;


--
-- TOC entry 3216 (class 2605 OID 107028)
-- Name: CAST (common.stoktake_body AS common.document_body); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.stoktake_body AS common.document_body) WITH FUNCTION common.convert_stoktake_to_document_body(common.stoktake_body) AS IMPLICIT;


SET search_path = adjustmentcredit, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 226 (class 1259 OID 107029)
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
-- TOC entry 227 (class 1259 OID 107035)
-- Name: head; Type: TABLE; Schema: adjustmentcredit; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((document_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 107047)
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
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 228
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: adjustmentcredit; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 229 (class 1259 OID 107049)
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
-- TOC entry 230 (class 1259 OID 107056)
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
-- TOC entry 231 (class 1259 OID 107062)
-- Name: head; Type: TABLE; Schema: adjustmentdebit; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 107074)
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
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 232
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: adjustmentdebit; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 233 (class 1259 OID 107076)
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
-- TOC entry 234 (class 1259 OID 107083)
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
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE balance; Type: COMMENT; Schema: balance; Owner: postgres
--

COMMENT ON TABLE balance IS 'goods balance';


SET search_path = binding, pg_catalog;

--
-- TOC entry 235 (class 1259 OID 107089)
-- Name: cutoff_to_adjustmentcredit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_adjustmentcredit (
    cutoff_id bigint NOT NULL,
    adjustmentcredit_id bigint NOT NULL
);


ALTER TABLE cutoff_to_adjustmentcredit OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 107092)
-- Name: cutoff_to_adjustmentdebit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_adjustmentdebit (
    cutoff_id bigint NOT NULL,
    adjustmentdebit_id bigint NOT NULL
);


ALTER TABLE cutoff_to_adjustmentdebit OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 107095)
-- Name: cutoff_to_delivery; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_delivery (
    cutoff_id bigint NOT NULL,
    delivery_id bigint NOT NULL
);


ALTER TABLE cutoff_to_delivery OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 107098)
-- Name: cutoff_to_demand; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_demand (
    cutoff_id bigint NOT NULL,
    demand_id bigint NOT NULL
);


ALTER TABLE cutoff_to_demand OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 107101)
-- Name: cutoff_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_despatch (
    cutoff_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE cutoff_to_despatch OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 107104)
-- Name: cutoff_to_goal; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_goal (
    cutoff_id bigint NOT NULL,
    goal_id bigint NOT NULL
);


ALTER TABLE cutoff_to_goal OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 107107)
-- Name: cutoff_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_issue (
    cutoff_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE cutoff_to_issue OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 107110)
-- Name: cutoff_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_picklist (
    cutoff_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE cutoff_to_picklist OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 107113)
-- Name: cutoff_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_rebound (
    cutoff_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE cutoff_to_rebound OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 107116)
-- Name: cutoff_to_receipt; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_receipt (
    cutoff_id bigint NOT NULL,
    receipt_id bigint NOT NULL
);


ALTER TABLE cutoff_to_receipt OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 107119)
-- Name: cutoff_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_reserve (
    cutoff_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE cutoff_to_reserve OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 107122)
-- Name: cutoff_to_stocktake; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_stocktake (
    cutoff_id bigint NOT NULL,
    stocktake_id bigint NOT NULL
);


ALTER TABLE cutoff_to_stocktake OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 107125)
-- Name: delivery_to_receipt; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE delivery_to_receipt (
    delivery_id bigint NOT NULL,
    receipt_id bigint NOT NULL
);


ALTER TABLE delivery_to_receipt OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 107128)
-- Name: demand_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE demand_to_picklist (
    demand_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE demand_to_picklist OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 107131)
-- Name: demand_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE demand_to_reserve (
    demand_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE demand_to_reserve OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 107134)
-- Name: goal_to_demand; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_demand (
    goal_id bigint NOT NULL,
    demand_id bigint NOT NULL
);


ALTER TABLE goal_to_demand OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 107137)
-- Name: goal_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_despatch (
    goal_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE goal_to_despatch OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 107140)
-- Name: goal_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_issue (
    goal_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE goal_to_issue OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 107143)
-- Name: goal_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_picklist (
    goal_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE goal_to_picklist OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 107146)
-- Name: goal_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_reserve (
    goal_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE goal_to_reserve OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 107149)
-- Name: issue_to_adjustmentcredit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_adjustmentcredit (
    issue_id bigint NOT NULL,
    adjustmentcredit_id bigint NOT NULL
);


ALTER TABLE issue_to_adjustmentcredit OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 107152)
-- Name: issue_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_despatch (
    issue_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE issue_to_despatch OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 107155)
-- Name: issue_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_rebound (
    issue_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE issue_to_rebound OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 107158)
-- Name: picklist_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE picklist_to_issue (
    picklist_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE picklist_to_issue OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 107161)
-- Name: receipt_to_adjustmentdebit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE receipt_to_adjustmentdebit (
    receipt_id bigint NOT NULL,
    adjustmentdebit_id bigint NOT NULL
);


ALTER TABLE receipt_to_adjustmentdebit OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 107164)
-- Name: receipt_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE receipt_to_rebound (
    receipt_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE receipt_to_rebound OWNER TO postgres;

SET search_path = common, pg_catalog;

--
-- TOC entry 261 (class 1259 OID 107167)
-- Name: cutoff_policy; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE cutoff_policy (
    document_kind_name document_kind NOT NULL,
    policy_mode_applied policy_mode DEFAULT 'DISABLED'::policy_mode NOT NULL
);


ALTER TABLE cutoff_policy OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 107171)
-- Name: document_abbrevation; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE document_abbrevation (
    doctype document_kind NOT NULL,
    abbrevation character varying DEFAULT '[ABBREVATION]'::character varying NOT NULL
);


ALTER TABLE document_abbrevation OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 107178)
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
-- TOC entry 264 (class 1259 OID 107184)
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
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 264
-- Name: exception_code_id_seq; Type: SEQUENCE OWNED BY; Schema: common; Owner: postgres
--

ALTER SEQUENCE exception_code_id_seq OWNED BY exception_code.id;


--
-- TOC entry 265 (class 1259 OID 107186)
-- Name: stocktake_policy; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE stocktake_policy (
    document_kind_name document_kind NOT NULL,
    stocktake_mode_applied policy_mode DEFAULT 'DISABLED'::policy_mode NOT NULL
);


ALTER TABLE stocktake_policy OWNER TO postgres;

SET search_path = cutoff, pg_catalog;

--
-- TOC entry 266 (class 1259 OID 107190)
-- Name: blocker; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE blocker (
    head_id bigint NOT NULL,
    blocker_document common.document_head NOT NULL
);


ALTER TABLE blocker OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 107196)
-- Name: head; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT now() NOT NULL,
    author character varying,
    facility_code character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 107206)
-- Name: head_id_seq; Type: SEQUENCE; Schema: cutoff; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 268
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: cutoff; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 269 (class 1259 OID 107208)
-- Name: numerator; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = delivery, pg_catalog;

--
-- TOC entry 270 (class 1259 OID 107215)
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
-- TOC entry 271 (class 1259 OID 107221)
-- Name: head; Type: TABLE; Schema: delivery; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 107232)
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
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 272
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 273 (class 1259 OID 107234)
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
-- TOC entry 274 (class 1259 OID 107241)
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
-- TOC entry 275 (class 1259 OID 107247)
-- Name: head; Type: TABLE; Schema: demand; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((document_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 107259)
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
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 276
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: demand; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 277 (class 1259 OID 107261)
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
-- TOC entry 278 (class 1259 OID 107268)
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
-- TOC entry 279 (class 1259 OID 107274)
-- Name: head; Type: TABLE; Schema: despatch; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((document_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 107286)
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
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 280
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: despatch; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 281 (class 1259 OID 107288)
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
-- TOC entry 282 (class 1259 OID 107295)
-- Name: head; Type: TABLE; Schema: goal; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    facility_code character varying,
    prev_fsmt common.goal_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.goal_fsmt DEFAULT 'PROPOSED'::common.goal_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 107305)
-- Name: head_id_seq; Type: SEQUENCE; Schema: goal; Owner: postgres
--

CREATE SEQUENCE head_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_id_seq OWNER TO postgres;

--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 283
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: goal; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 284 (class 1259 OID 107307)
-- Name: numerator; Type: TABLE; Schema: goal; Owner: postgres
--

CREATE TABLE numerator (
    facility_code character varying NOT NULL,
    julianized_week integer NOT NULL,
    current_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE numerator OWNER TO postgres;

SET search_path = issue, pg_catalog;

--
-- TOC entry 285 (class 1259 OID 107314)
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
-- TOC entry 286 (class 1259 OID 107320)
-- Name: head; Type: TABLE; Schema: issue; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((document_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 107332)
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
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 287
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: issue; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 288 (class 1259 OID 107334)
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
-- TOC entry 289 (class 1259 OID 107341)
-- Name: head; Type: TABLE; Schema: lot; Owner: postgres
--

CREATE TABLE head (
    ib bigint NOT NULL
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 107344)
-- Name: head_ib_seq; Type: SEQUENCE; Schema: lot; Owner: postgres
--

CREATE SEQUENCE head_ib_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE head_ib_seq OWNER TO postgres;

--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 290
-- Name: head_ib_seq; Type: SEQUENCE OWNED BY; Schema: lot; Owner: postgres
--

ALTER SEQUENCE head_ib_seq OWNED BY head.ib;


SET search_path = picklist, pg_catalog;

--
-- TOC entry 291 (class 1259 OID 107346)
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
-- TOC entry 292 (class 1259 OID 107352)
-- Name: head; Type: TABLE; Schema: picklist; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((document_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 107364)
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
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 293
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: picklist; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 294 (class 1259 OID 107366)
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
-- TOC entry 295 (class 1259 OID 107373)
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
-- TOC entry 296 (class 1259 OID 107378)
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
-- TOC entry 297 (class 1259 OID 107384)
-- Name: head; Type: TABLE; Schema: rebound; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 107395)
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
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 298
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: rebound; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 299 (class 1259 OID 107397)
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
-- TOC entry 300 (class 1259 OID 107404)
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
-- TOC entry 301 (class 1259 OID 107410)
-- Name: head; Type: TABLE; Schema: receipt; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 107421)
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
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 302
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: receipt; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 303 (class 1259 OID 107423)
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
-- TOC entry 304 (class 1259 OID 107430)
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
-- TOC entry 305 (class 1259 OID 107436)
-- Name: head; Type: TABLE; Schema: reserve; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    due_date date NOT NULL,
    ship_to character varying,
    ship_from character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT head_check1 CHECK ((document_date <= due_date)),
    CONSTRAINT head_check2 CHECK (((ship_to)::text <> (ship_from)::text))
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 107448)
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
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 306
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: reserve; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 307 (class 1259 OID 107450)
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
-- TOC entry 308 (class 1259 OID 107457)
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
-- TOC entry 309 (class 1259 OID 107460)
-- Name: head; Type: TABLE; Schema: stockcard; Owner: postgres
--

CREATE TABLE head (
    document_gid uuid NOT NULL,
    document_kind common.document_kind,
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


ALTER TABLE head OWNER TO postgres;

SET search_path = stocktake, pg_catalog;

--
-- TOC entry 310 (class 1259 OID 107467)
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
-- TOC entry 311 (class 1259 OID 107473)
-- Name: head; Type: TABLE; Schema: stocktake; Owner: postgres
--

CREATE TABLE head (
    id bigint NOT NULL,
    gid uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    display_name character varying,
    document_date date DEFAULT ('now'::text)::date NOT NULL,
    author character varying,
    facility_code character varying,
    prev_fsmt common.document_fsmt,
    prev_fsmt_date timestamp with time zone,
    curr_fsmt common.document_fsmt DEFAULT 'PROPOSED'::common.document_fsmt NOT NULL,
    curr_fsmt_date timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 107483)
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
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 312
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: stocktake; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 313 (class 1259 OID 107485)
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
-- TOC entry 314 (class 1259 OID 107492)
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
-- TOC entry 315 (class 1259 OID 107497)
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
-- TOC entry 316 (class 1259 OID 107502)
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
-- TOC entry 3221 (class 2604 OID 107507)
-- Name: id; Type: DEFAULT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3229 (class 2604 OID 107508)
-- Name: id; Type: DEFAULT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = common, pg_catalog;

--
-- TOC entry 3234 (class 2604 OID 107509)
-- Name: id; Type: DEFAULT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code ALTER COLUMN id SET DEFAULT nextval('exception_code_id_seq'::regclass);


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3240 (class 2604 OID 107510)
-- Name: id; Type: DEFAULT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3246 (class 2604 OID 107511)
-- Name: id; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = demand, pg_catalog;

--
-- TOC entry 3253 (class 2604 OID 107512)
-- Name: id; Type: DEFAULT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3261 (class 2604 OID 107513)
-- Name: id; Type: DEFAULT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = goal, pg_catalog;

--
-- TOC entry 3269 (class 2604 OID 107514)
-- Name: id; Type: DEFAULT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = issue, pg_catalog;

--
-- TOC entry 3275 (class 2604 OID 107515)
-- Name: id; Type: DEFAULT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = lot, pg_catalog;

--
-- TOC entry 3279 (class 2604 OID 107516)
-- Name: ib; Type: DEFAULT; Schema: lot; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN ib SET DEFAULT nextval('head_ib_seq'::regclass);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3284 (class 2604 OID 107517)
-- Name: id; Type: DEFAULT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3292 (class 2604 OID 107518)
-- Name: id; Type: DEFAULT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3299 (class 2604 OID 107519)
-- Name: id; Type: DEFAULT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3306 (class 2604 OID 107520)
-- Name: id; Type: DEFAULT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3315 (class 2604 OID 107521)
-- Name: id; Type: DEFAULT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3789 (class 0 OID 107029)
-- Dependencies: 226
-- Data for Name: body; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



--
-- TOC entry 3790 (class 0 OID 107035)
-- Dependencies: 227
-- Data for Name: head; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 228
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: adjustmentcredit; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 63, true);


--
-- TOC entry 3792 (class 0 OID 107049)
-- Dependencies: 229
-- Data for Name: numerator; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3793 (class 0 OID 107056)
-- Dependencies: 230
-- Data for Name: body; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



--
-- TOC entry 3794 (class 0 OID 107062)
-- Dependencies: 231
-- Data for Name: head; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 232
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: adjustmentdebit; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 63, true);


--
-- TOC entry 3796 (class 0 OID 107076)
-- Dependencies: 233
-- Data for Name: numerator; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



SET search_path = balance, pg_catalog;

--
-- TOC entry 3797 (class 0 OID 107083)
-- Dependencies: 234
-- Data for Name: balance; Type: TABLE DATA; Schema: balance; Owner: postgres
--



SET search_path = binding, pg_catalog;

--
-- TOC entry 3798 (class 0 OID 107089)
-- Dependencies: 235
-- Data for Name: cutoff_to_adjustmentcredit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3799 (class 0 OID 107092)
-- Dependencies: 236
-- Data for Name: cutoff_to_adjustmentdebit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3800 (class 0 OID 107095)
-- Dependencies: 237
-- Data for Name: cutoff_to_delivery; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3801 (class 0 OID 107098)
-- Dependencies: 238
-- Data for Name: cutoff_to_demand; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3802 (class 0 OID 107101)
-- Dependencies: 239
-- Data for Name: cutoff_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3803 (class 0 OID 107104)
-- Dependencies: 240
-- Data for Name: cutoff_to_goal; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3804 (class 0 OID 107107)
-- Dependencies: 241
-- Data for Name: cutoff_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3805 (class 0 OID 107110)
-- Dependencies: 242
-- Data for Name: cutoff_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3806 (class 0 OID 107113)
-- Dependencies: 243
-- Data for Name: cutoff_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3807 (class 0 OID 107116)
-- Dependencies: 244
-- Data for Name: cutoff_to_receipt; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3808 (class 0 OID 107119)
-- Dependencies: 245
-- Data for Name: cutoff_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3809 (class 0 OID 107122)
-- Dependencies: 246
-- Data for Name: cutoff_to_stocktake; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3810 (class 0 OID 107125)
-- Dependencies: 247
-- Data for Name: delivery_to_receipt; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3811 (class 0 OID 107128)
-- Dependencies: 248
-- Data for Name: demand_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3812 (class 0 OID 107131)
-- Dependencies: 249
-- Data for Name: demand_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3813 (class 0 OID 107134)
-- Dependencies: 250
-- Data for Name: goal_to_demand; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3814 (class 0 OID 107137)
-- Dependencies: 251
-- Data for Name: goal_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3815 (class 0 OID 107140)
-- Dependencies: 252
-- Data for Name: goal_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3816 (class 0 OID 107143)
-- Dependencies: 253
-- Data for Name: goal_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3817 (class 0 OID 107146)
-- Dependencies: 254
-- Data for Name: goal_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3818 (class 0 OID 107149)
-- Dependencies: 255
-- Data for Name: issue_to_adjustmentcredit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3819 (class 0 OID 107152)
-- Dependencies: 256
-- Data for Name: issue_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3820 (class 0 OID 107155)
-- Dependencies: 257
-- Data for Name: issue_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3821 (class 0 OID 107158)
-- Dependencies: 258
-- Data for Name: picklist_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3822 (class 0 OID 107161)
-- Dependencies: 259
-- Data for Name: receipt_to_adjustmentdebit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 3823 (class 0 OID 107164)
-- Dependencies: 260
-- Data for Name: receipt_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



SET search_path = common, pg_catalog;

--
-- TOC entry 3824 (class 0 OID 107167)
-- Dependencies: 261
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
-- TOC entry 3825 (class 0 OID 107171)
-- Dependencies: 262
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
-- TOC entry 3826 (class 0 OID 107178)
-- Dependencies: 263
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
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 264
-- Name: exception_code_id_seq; Type: SEQUENCE SET; Schema: common; Owner: postgres
--

SELECT pg_catalog.setval('exception_code_id_seq', 1, false);


--
-- TOC entry 3828 (class 0 OID 107186)
-- Dependencies: 265
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
-- TOC entry 3829 (class 0 OID 107190)
-- Dependencies: 266
-- Data for Name: blocker; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 3830 (class 0 OID 107196)
-- Dependencies: 267
-- Data for Name: head; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 268
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: cutoff; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 3, true);


--
-- TOC entry 3832 (class 0 OID 107208)
-- Dependencies: 269
-- Data for Name: numerator; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



SET search_path = delivery, pg_catalog;

--
-- TOC entry 3833 (class 0 OID 107215)
-- Dependencies: 270
-- Data for Name: body; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



--
-- TOC entry 3834 (class 0 OID 107221)
-- Dependencies: 271
-- Data for Name: head; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 272
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 42, true);


--
-- TOC entry 3836 (class 0 OID 107234)
-- Dependencies: 273
-- Data for Name: numerator; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



SET search_path = demand, pg_catalog;

--
-- TOC entry 3837 (class 0 OID 107241)
-- Dependencies: 274
-- Data for Name: body; Type: TABLE DATA; Schema: demand; Owner: postgres
--



--
-- TOC entry 3838 (class 0 OID 107247)
-- Dependencies: 275
-- Data for Name: head; Type: TABLE DATA; Schema: demand; Owner: postgres
--



--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 276
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: demand; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 42, true);


--
-- TOC entry 3840 (class 0 OID 107261)
-- Dependencies: 277
-- Data for Name: numerator; Type: TABLE DATA; Schema: demand; Owner: postgres
--



SET search_path = despatch, pg_catalog;

--
-- TOC entry 3841 (class 0 OID 107268)
-- Dependencies: 278
-- Data for Name: body; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



--
-- TOC entry 3842 (class 0 OID 107274)
-- Dependencies: 279
-- Data for Name: head; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 280
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: despatch; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 84, true);


--
-- TOC entry 3844 (class 0 OID 107288)
-- Dependencies: 281
-- Data for Name: numerator; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



SET search_path = goal, pg_catalog;

--
-- TOC entry 3845 (class 0 OID 107295)
-- Dependencies: 282
-- Data for Name: head; Type: TABLE DATA; Schema: goal; Owner: postgres
--



--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 283
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: goal; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 106, true);


--
-- TOC entry 3847 (class 0 OID 107307)
-- Dependencies: 284
-- Data for Name: numerator; Type: TABLE DATA; Schema: goal; Owner: postgres
--



SET search_path = issue, pg_catalog;

--
-- TOC entry 3848 (class 0 OID 107314)
-- Dependencies: 285
-- Data for Name: body; Type: TABLE DATA; Schema: issue; Owner: postgres
--



--
-- TOC entry 3849 (class 0 OID 107320)
-- Dependencies: 286
-- Data for Name: head; Type: TABLE DATA; Schema: issue; Owner: postgres
--



--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 287
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: issue; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 63, true);


--
-- TOC entry 3851 (class 0 OID 107334)
-- Dependencies: 288
-- Data for Name: numerator; Type: TABLE DATA; Schema: issue; Owner: postgres
--



SET search_path = lot, pg_catalog;

--
-- TOC entry 3852 (class 0 OID 107341)
-- Dependencies: 289
-- Data for Name: head; Type: TABLE DATA; Schema: lot; Owner: postgres
--



--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 290
-- Name: head_ib_seq; Type: SEQUENCE SET; Schema: lot; Owner: postgres
--

SELECT pg_catalog.setval('head_ib_seq', 1, false);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3854 (class 0 OID 107346)
-- Dependencies: 291
-- Data for Name: body; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



--
-- TOC entry 3855 (class 0 OID 107352)
-- Dependencies: 292
-- Data for Name: head; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 293
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: picklist; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 63, true);


--
-- TOC entry 3857 (class 0 OID 107366)
-- Dependencies: 294
-- Data for Name: numerator; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



SET search_path = rebound, pg_catalog;

--
-- TOC entry 3858 (class 0 OID 107378)
-- Dependencies: 296
-- Data for Name: body; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



--
-- TOC entry 3859 (class 0 OID 107384)
-- Dependencies: 297
-- Data for Name: head; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 298
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: rebound; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 42, true);


--
-- TOC entry 3861 (class 0 OID 107397)
-- Dependencies: 299
-- Data for Name: numerator; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



SET search_path = receipt, pg_catalog;

--
-- TOC entry 3862 (class 0 OID 107404)
-- Dependencies: 300
-- Data for Name: body; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



--
-- TOC entry 3863 (class 0 OID 107410)
-- Dependencies: 301
-- Data for Name: head; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 302
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: receipt; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 42, true);


--
-- TOC entry 3865 (class 0 OID 107423)
-- Dependencies: 303
-- Data for Name: numerator; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



SET search_path = reserve, pg_catalog;

--
-- TOC entry 3866 (class 0 OID 107430)
-- Dependencies: 304
-- Data for Name: body; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



--
-- TOC entry 3867 (class 0 OID 107436)
-- Dependencies: 305
-- Data for Name: head; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 306
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: reserve; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 63, true);


--
-- TOC entry 3869 (class 0 OID 107450)
-- Dependencies: 307
-- Data for Name: numerator; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



SET search_path = schedule, pg_catalog;

--
-- TOC entry 3870 (class 0 OID 107457)
-- Dependencies: 308
-- Data for Name: calendar; Type: TABLE DATA; Schema: schedule; Owner: postgres
--



SET search_path = stockcard, pg_catalog;

--
-- TOC entry 3871 (class 0 OID 107460)
-- Dependencies: 309
-- Data for Name: head; Type: TABLE DATA; Schema: stockcard; Owner: postgres
--



SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3872 (class 0 OID 107467)
-- Dependencies: 310
-- Data for Name: body; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



--
-- TOC entry 3873 (class 0 OID 107473)
-- Dependencies: 311
-- Data for Name: head; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 312
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: stocktake; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 42, true);


--
-- TOC entry 3875 (class 0 OID 107485)
-- Dependencies: 313
-- Data for Name: numerator; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3318 (class 2606 OID 107523)
-- Name: body_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3320 (class 2606 OID 107525)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3322 (class 2606 OID 107527)
-- Name: head_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 107529)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3326 (class 2606 OID 107531)
-- Name: body_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3328 (class 2606 OID 107533)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3330 (class 2606 OID 107535)
-- Name: head_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 107537)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = balance, pg_catalog;

--
-- TOC entry 3334 (class 2606 OID 107539)
-- Name: balance_pkey; Type: CONSTRAINT; Schema: balance; Owner: postgres
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (facility_code, good_code);


SET search_path = binding, pg_catalog;

--
-- TOC entry 3336 (class 2606 OID 107541)
-- Name: cutoff_to_adjustmentcredit_adjustmentcredit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_adjustmentcredit_id_key UNIQUE (adjustmentcredit_id);


--
-- TOC entry 3338 (class 2606 OID 107543)
-- Name: cutoff_to_adjustmentcredit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_pkey PRIMARY KEY (cutoff_id, adjustmentcredit_id);


--
-- TOC entry 3340 (class 2606 OID 107545)
-- Name: cutoff_to_adjustmentdebit_adjustmentdebit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_adjustmentdebit_id_key UNIQUE (adjustmentdebit_id);


--
-- TOC entry 3342 (class 2606 OID 107547)
-- Name: cutoff_to_adjustmentdebit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_pkey PRIMARY KEY (cutoff_id, adjustmentdebit_id);


--
-- TOC entry 3344 (class 2606 OID 107549)
-- Name: cutoff_to_delivery_delivery_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_delivery_id_key UNIQUE (delivery_id);


--
-- TOC entry 3346 (class 2606 OID 107551)
-- Name: cutoff_to_delivery_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_pkey PRIMARY KEY (cutoff_id, delivery_id);


--
-- TOC entry 3348 (class 2606 OID 107553)
-- Name: cutoff_to_demand_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3350 (class 2606 OID 107555)
-- Name: cutoff_to_demand_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_pkey PRIMARY KEY (cutoff_id, demand_id);


--
-- TOC entry 3352 (class 2606 OID 107557)
-- Name: cutoff_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 3354 (class 2606 OID 107559)
-- Name: cutoff_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_pkey PRIMARY KEY (cutoff_id, despatch_id);


--
-- TOC entry 3356 (class 2606 OID 107561)
-- Name: cutoff_to_goal_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3358 (class 2606 OID 107563)
-- Name: cutoff_to_goal_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_pkey PRIMARY KEY (cutoff_id, goal_id);


--
-- TOC entry 3360 (class 2606 OID 107565)
-- Name: cutoff_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3362 (class 2606 OID 107567)
-- Name: cutoff_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_pkey PRIMARY KEY (cutoff_id, issue_id);


--
-- TOC entry 3364 (class 2606 OID 107569)
-- Name: cutoff_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3366 (class 2606 OID 107571)
-- Name: cutoff_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_pkey PRIMARY KEY (cutoff_id, picklist_id);


--
-- TOC entry 3368 (class 2606 OID 107573)
-- Name: cutoff_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_pkey PRIMARY KEY (cutoff_id, rebound_id);


--
-- TOC entry 3370 (class 2606 OID 107575)
-- Name: cutoff_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 3372 (class 2606 OID 107577)
-- Name: cutoff_to_receipt_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_pkey PRIMARY KEY (cutoff_id, receipt_id);


--
-- TOC entry 3374 (class 2606 OID 107579)
-- Name: cutoff_to_receipt_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 3376 (class 2606 OID 107581)
-- Name: cutoff_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_pkey PRIMARY KEY (cutoff_id, reserve_id);


--
-- TOC entry 3378 (class 2606 OID 107583)
-- Name: cutoff_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 3380 (class 2606 OID 107585)
-- Name: cutoff_to_stocktake_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_pkey PRIMARY KEY (cutoff_id, stocktake_id);


--
-- TOC entry 3382 (class 2606 OID 107587)
-- Name: cutoff_to_stocktake_stocktake_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_stocktake_id_key UNIQUE (stocktake_id);


--
-- TOC entry 3384 (class 2606 OID 107589)
-- Name: delivery_to_receipt_delivery_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_delivery_id_key UNIQUE (delivery_id);


--
-- TOC entry 3386 (class 2606 OID 107591)
-- Name: delivery_to_receipt_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_pkey PRIMARY KEY (delivery_id, receipt_id);


--
-- TOC entry 3388 (class 2606 OID 107593)
-- Name: delivery_to_receipt_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 3390 (class 2606 OID 107595)
-- Name: demand_to_picklist_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3392 (class 2606 OID 107597)
-- Name: demand_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3394 (class 2606 OID 107599)
-- Name: demand_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_pkey PRIMARY KEY (demand_id, picklist_id);


--
-- TOC entry 3396 (class 2606 OID 107601)
-- Name: demand_to_reserve_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3398 (class 2606 OID 107603)
-- Name: demand_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_pkey PRIMARY KEY (demand_id, reserve_id);


--
-- TOC entry 3400 (class 2606 OID 107605)
-- Name: demand_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 3402 (class 2606 OID 107607)
-- Name: goal_to_demand_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 3404 (class 2606 OID 107609)
-- Name: goal_to_demand_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3406 (class 2606 OID 107611)
-- Name: goal_to_demand_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_pkey PRIMARY KEY (goal_id, demand_id);


--
-- TOC entry 3408 (class 2606 OID 107613)
-- Name: goal_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 3410 (class 2606 OID 107615)
-- Name: goal_to_despatch_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3412 (class 2606 OID 107617)
-- Name: goal_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_pkey PRIMARY KEY (goal_id, despatch_id);


--
-- TOC entry 3414 (class 2606 OID 107619)
-- Name: goal_to_issue_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3416 (class 2606 OID 107621)
-- Name: goal_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3418 (class 2606 OID 107623)
-- Name: goal_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_pkey PRIMARY KEY (goal_id, issue_id);


--
-- TOC entry 3420 (class 2606 OID 107625)
-- Name: goal_to_picklist_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3422 (class 2606 OID 107627)
-- Name: goal_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3424 (class 2606 OID 107629)
-- Name: goal_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_pkey PRIMARY KEY (goal_id, picklist_id);


--
-- TOC entry 3426 (class 2606 OID 107631)
-- Name: goal_to_reserve_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 3428 (class 2606 OID 107633)
-- Name: goal_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_pkey PRIMARY KEY (goal_id, reserve_id);


--
-- TOC entry 3430 (class 2606 OID 107635)
-- Name: goal_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 3432 (class 2606 OID 107637)
-- Name: issue_to_adjustmentcredit_adjustmentcredit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_adjustmentcredit_id_key UNIQUE (adjustmentcredit_id);


--
-- TOC entry 3434 (class 2606 OID 107639)
-- Name: issue_to_adjustmentcredit_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3436 (class 2606 OID 107641)
-- Name: issue_to_adjustmentcredit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_pkey PRIMARY KEY (adjustmentcredit_id, issue_id);


--
-- TOC entry 3438 (class 2606 OID 107643)
-- Name: issue_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 3440 (class 2606 OID 107645)
-- Name: issue_to_despatch_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3442 (class 2606 OID 107647)
-- Name: issue_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_pkey PRIMARY KEY (issue_id, despatch_id);


--
-- TOC entry 3444 (class 2606 OID 107649)
-- Name: issue_to_rebound_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3446 (class 2606 OID 107651)
-- Name: issue_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_pkey PRIMARY KEY (rebound_id, issue_id);


--
-- TOC entry 3448 (class 2606 OID 107653)
-- Name: issue_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 3450 (class 2606 OID 107655)
-- Name: picklist_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 3452 (class 2606 OID 107657)
-- Name: picklist_to_issue_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 3454 (class 2606 OID 107659)
-- Name: picklist_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_pkey PRIMARY KEY (picklist_id, issue_id);


--
-- TOC entry 3456 (class 2606 OID 107661)
-- Name: receipt_to_adjustmentdebit_adjustmentdebit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_adjustmentdebit_id_key UNIQUE (adjustmentdebit_id);


--
-- TOC entry 3458 (class 2606 OID 107663)
-- Name: receipt_to_adjustmentdebit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_pkey PRIMARY KEY (adjustmentdebit_id, receipt_id);


--
-- TOC entry 3460 (class 2606 OID 107665)
-- Name: receipt_to_adjustmentdebit_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 3462 (class 2606 OID 107667)
-- Name: receipt_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_pkey PRIMARY KEY (rebound_id, receipt_id);


--
-- TOC entry 3464 (class 2606 OID 107669)
-- Name: receipt_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 3466 (class 2606 OID 107671)
-- Name: receipt_to_rebound_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_receipt_id_key UNIQUE (receipt_id);


SET search_path = common, pg_catalog;

--
-- TOC entry 3468 (class 2606 OID 107673)
-- Name: cutoff_policy_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY cutoff_policy
    ADD CONSTRAINT cutoff_policy_pkey PRIMARY KEY (document_kind_name);


--
-- TOC entry 3470 (class 2606 OID 107675)
-- Name: document_abbrevation_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY document_abbrevation
    ADD CONSTRAINT document_abbrevation_pkey PRIMARY KEY (doctype);


--
-- TOC entry 3472 (class 2606 OID 107677)
-- Name: exception_code_condition_name_key; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_condition_name_key UNIQUE (condition_name);


--
-- TOC entry 3474 (class 2606 OID 107679)
-- Name: exception_code_errcode_key; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_errcode_key UNIQUE (errcode);


--
-- TOC entry 3476 (class 2606 OID 107681)
-- Name: exception_code_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3478 (class 2606 OID 107683)
-- Name: stocktake_policy_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY stocktake_policy
    ADD CONSTRAINT stocktake_policy_pkey PRIMARY KEY (document_kind_name);


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3480 (class 2606 OID 107685)
-- Name: blocker_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY blocker
    ADD CONSTRAINT blocker_pkey PRIMARY KEY (head_id, blocker_document);


--
-- TOC entry 3482 (class 2606 OID 107687)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3484 (class 2606 OID 107689)
-- Name: head_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3486 (class 2606 OID 107691)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3488 (class 2606 OID 107693)
-- Name: body_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3490 (class 2606 OID 107695)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3492 (class 2606 OID 107697)
-- Name: head_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3494 (class 2606 OID 107699)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = demand, pg_catalog;

--
-- TOC entry 3496 (class 2606 OID 107701)
-- Name: body_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3498 (class 2606 OID 107703)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3500 (class 2606 OID 107705)
-- Name: head_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 107707)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3504 (class 2606 OID 107709)
-- Name: body_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3506 (class 2606 OID 107711)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3508 (class 2606 OID 107713)
-- Name: head_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3510 (class 2606 OID 107715)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = goal, pg_catalog;

--
-- TOC entry 3512 (class 2606 OID 107717)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3514 (class 2606 OID 107719)
-- Name: head_pkey; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3516 (class 2606 OID 107721)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = issue, pg_catalog;

--
-- TOC entry 3518 (class 2606 OID 107723)
-- Name: body_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3520 (class 2606 OID 107725)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3522 (class 2606 OID 107727)
-- Name: head_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3524 (class 2606 OID 107729)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = lot, pg_catalog;

--
-- TOC entry 3526 (class 2606 OID 107731)
-- Name: head_pkey; Type: CONSTRAINT; Schema: lot; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (ib);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3528 (class 2606 OID 107733)
-- Name: body_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3530 (class 2606 OID 107735)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3532 (class 2606 OID 107737)
-- Name: head_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3534 (class 2606 OID 107739)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3536 (class 2606 OID 107741)
-- Name: body_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3538 (class 2606 OID 107743)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3540 (class 2606 OID 107745)
-- Name: head_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3542 (class 2606 OID 107747)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3544 (class 2606 OID 107749)
-- Name: body_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3546 (class 2606 OID 107751)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3548 (class 2606 OID 107753)
-- Name: head_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3550 (class 2606 OID 107755)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3552 (class 2606 OID 107757)
-- Name: body_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3554 (class 2606 OID 107759)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3556 (class 2606 OID 107761)
-- Name: head_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3558 (class 2606 OID 107763)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = schedule, pg_catalog;

--
-- TOC entry 3560 (class 2606 OID 107765)
-- Name: calendar_pkey; Type: CONSTRAINT; Schema: schedule; Owner: postgres
--

ALTER TABLE ONLY calendar
    ADD CONSTRAINT calendar_pkey PRIMARY KEY (calendar_date);


SET search_path = stockcard, pg_catalog;

--
-- TOC entry 3563 (class 2606 OID 107767)
-- Name: head_pkey; Type: CONSTRAINT; Schema: stockcard; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (document_gid, good_code);


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3565 (class 2606 OID 107769)
-- Name: body_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 3567 (class 2606 OID 107771)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 3569 (class 2606 OID 107773)
-- Name: head_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 107775)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = stockcard, pg_catalog;

--
-- TOC entry 3561 (class 1259 OID 107776)
-- Name: head_document_kind_facility_code_good_code_idx; Type: INDEX; Schema: stockcard; Owner: postgres
--

CREATE INDEX head_document_kind_facility_code_good_code_idx ON head USING btree (document_kind, facility_code, good_code);


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3636 (class 2620 OID 107777)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3637 (class 2620 OID 107778)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3638 (class 2620 OID 107779)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3639 (class 2620 OID 107780)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3640 (class 2620 OID 107781)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3641 (class 2620 OID 107782)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3642 (class 2620 OID 107783)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: cutoff; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3643 (class 2620 OID 107784)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3644 (class 2620 OID 107785)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3645 (class 2620 OID 107786)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = demand, pg_catalog;

--
-- TOC entry 3646 (class 2620 OID 107787)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3647 (class 2620 OID 107788)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3648 (class 2620 OID 107789)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3649 (class 2620 OID 107790)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3650 (class 2620 OID 107791)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3651 (class 2620 OID 107792)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = goal, pg_catalog;

--
-- TOC entry 3652 (class 2620 OID 107793)
-- Name: set_prev_goal_fsmt; Type: TRIGGER; Schema: goal; Owner: postgres
--

CREATE TRIGGER set_prev_goal_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE set_prev_goal_fsmt();


SET search_path = issue, pg_catalog;

--
-- TOC entry 3653 (class 2620 OID 107794)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3654 (class 2620 OID 107795)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3655 (class 2620 OID 107796)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3656 (class 2620 OID 107797)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3657 (class 2620 OID 107798)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3658 (class 2620 OID 107799)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3659 (class 2620 OID 107800)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3660 (class 2620 OID 107801)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3661 (class 2620 OID 107802)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3662 (class 2620 OID 107803)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3663 (class 2620 OID 107804)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3664 (class 2620 OID 107805)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3665 (class 2620 OID 107806)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3666 (class 2620 OID 107807)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3667 (class 2620 OID 107808)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3668 (class 2620 OID 107809)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 3669 (class 2620 OID 107810)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 3670 (class 2620 OID 107811)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 3572 (class 2606 OID 107812)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 3573 (class 2606 OID 107817)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = binding, pg_catalog;

--
-- TOC entry 3574 (class 2606 OID 107822)
-- Name: cutoff_to_adjustmentcredit_adjustmentcredit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_adjustmentcredit_id_fkey FOREIGN KEY (adjustmentcredit_id) REFERENCES adjustmentcredit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3575 (class 2606 OID 107827)
-- Name: cutoff_to_adjustmentcredit_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3576 (class 2606 OID 107832)
-- Name: cutoff_to_adjustmentdebit_adjustmentdebit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_adjustmentdebit_id_fkey FOREIGN KEY (adjustmentdebit_id) REFERENCES adjustmentdebit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3577 (class 2606 OID 107837)
-- Name: cutoff_to_adjustmentdebit_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3578 (class 2606 OID 107842)
-- Name: cutoff_to_delivery_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3579 (class 2606 OID 107847)
-- Name: cutoff_to_delivery_delivery_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES delivery.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3580 (class 2606 OID 107852)
-- Name: cutoff_to_demand_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3581 (class 2606 OID 107857)
-- Name: cutoff_to_demand_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3582 (class 2606 OID 107862)
-- Name: cutoff_to_despatch_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3583 (class 2606 OID 107867)
-- Name: cutoff_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3584 (class 2606 OID 107872)
-- Name: cutoff_to_goal_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3585 (class 2606 OID 107877)
-- Name: cutoff_to_goal_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3586 (class 2606 OID 107882)
-- Name: cutoff_to_issue_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3587 (class 2606 OID 107887)
-- Name: cutoff_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3588 (class 2606 OID 107892)
-- Name: cutoff_to_picklist_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3589 (class 2606 OID 107897)
-- Name: cutoff_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3590 (class 2606 OID 107902)
-- Name: cutoff_to_rebound_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3591 (class 2606 OID 107907)
-- Name: cutoff_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3592 (class 2606 OID 107912)
-- Name: cutoff_to_receipt_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3593 (class 2606 OID 107917)
-- Name: cutoff_to_receipt_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3594 (class 2606 OID 107922)
-- Name: cutoff_to_reserve_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3595 (class 2606 OID 107927)
-- Name: cutoff_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3596 (class 2606 OID 107932)
-- Name: cutoff_to_stocktake_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3597 (class 2606 OID 107937)
-- Name: cutoff_to_stocktake_stocktake_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_stocktake_id_fkey FOREIGN KEY (stocktake_id) REFERENCES stocktake.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3598 (class 2606 OID 107942)
-- Name: delivery_to_receipt_delivery_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES delivery.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3599 (class 2606 OID 107947)
-- Name: delivery_to_receipt_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3600 (class 2606 OID 107952)
-- Name: demand_to_picklist_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3601 (class 2606 OID 107957)
-- Name: demand_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3602 (class 2606 OID 107962)
-- Name: demand_to_reserve_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3603 (class 2606 OID 107967)
-- Name: demand_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3604 (class 2606 OID 107972)
-- Name: goal_to_demand_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3605 (class 2606 OID 107977)
-- Name: goal_to_demand_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3606 (class 2606 OID 107982)
-- Name: goal_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3607 (class 2606 OID 107987)
-- Name: goal_to_despatch_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3608 (class 2606 OID 107992)
-- Name: goal_to_issue_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3609 (class 2606 OID 107997)
-- Name: goal_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3610 (class 2606 OID 108002)
-- Name: goal_to_picklist_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3611 (class 2606 OID 108007)
-- Name: goal_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3612 (class 2606 OID 108012)
-- Name: goal_to_reserve_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3613 (class 2606 OID 108017)
-- Name: goal_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3614 (class 2606 OID 108022)
-- Name: issue_to_adjustmentcredit_adjustmentcredit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_adjustmentcredit_id_fkey FOREIGN KEY (adjustmentcredit_id) REFERENCES adjustmentcredit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3615 (class 2606 OID 108027)
-- Name: issue_to_adjustmentcredit_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3616 (class 2606 OID 108032)
-- Name: issue_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3617 (class 2606 OID 108037)
-- Name: issue_to_despatch_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3618 (class 2606 OID 108042)
-- Name: issue_to_rebound_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3619 (class 2606 OID 108047)
-- Name: issue_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3620 (class 2606 OID 108052)
-- Name: picklist_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3621 (class 2606 OID 108057)
-- Name: picklist_to_issue_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3622 (class 2606 OID 108062)
-- Name: receipt_to_adjustmentdebit_adjustmentdebit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_adjustmentdebit_id_fkey FOREIGN KEY (adjustmentdebit_id) REFERENCES adjustmentdebit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3623 (class 2606 OID 108067)
-- Name: receipt_to_adjustmentdebit_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3624 (class 2606 OID 108072)
-- Name: receipt_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3625 (class 2606 OID 108077)
-- Name: receipt_to_rebound_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 3626 (class 2606 OID 108082)
-- Name: blocker_head_id_fkey; Type: FK CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY blocker
    ADD CONSTRAINT blocker_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = delivery, pg_catalog;

--
-- TOC entry 3627 (class 2606 OID 108087)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = demand, pg_catalog;

--
-- TOC entry 3628 (class 2606 OID 108092)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = despatch, pg_catalog;

--
-- TOC entry 3629 (class 2606 OID 108097)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = issue, pg_catalog;

--
-- TOC entry 3630 (class 2606 OID 108102)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = picklist, pg_catalog;

--
-- TOC entry 3631 (class 2606 OID 108107)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = rebound, pg_catalog;

--
-- TOC entry 3632 (class 2606 OID 108112)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = receipt, pg_catalog;

--
-- TOC entry 3633 (class 2606 OID 108117)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = reserve, pg_catalog;

--
-- TOC entry 3634 (class 2606 OID 108122)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 3635 (class 2606 OID 108127)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 34
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-21 13:49:53 EET

--
-- PostgreSQL database dump complete
--

