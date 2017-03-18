--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-03-19 00:52:34 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 12 (class 2615 OID 52076)
-- Name: adjustmentcredit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adjustmentcredit;


ALTER SCHEMA adjustmentcredit OWNER TO postgres;

--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 12
-- Name: SCHEMA adjustmentcredit; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA adjustmentcredit IS 'issue';


--
-- TOC entry 13 (class 2615 OID 52077)
-- Name: adjustmentdebit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adjustmentdebit;


ALTER SCHEMA adjustmentdebit OWNER TO postgres;

--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA adjustmentdebit; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA adjustmentdebit IS 'receipt';


--
-- TOC entry 14 (class 2615 OID 52078)
-- Name: api; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA api;


ALTER SCHEMA api OWNER TO postgres;

--
-- TOC entry 15 (class 2615 OID 52079)
-- Name: balance; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA balance;


ALTER SCHEMA balance OWNER TO postgres;

--
-- TOC entry 16 (class 2615 OID 52080)
-- Name: binding; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA binding;


ALTER SCHEMA binding OWNER TO postgres;

--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA binding; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA binding IS 'bond';


--
-- TOC entry 17 (class 2615 OID 52081)
-- Name: common; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA common;


ALTER SCHEMA common OWNER TO postgres;

--
-- TOC entry 18 (class 2615 OID 52082)
-- Name: cutoff; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cutoff;


ALTER SCHEMA cutoff OWNER TO postgres;

--
-- TOC entry 19 (class 2615 OID 52083)
-- Name: delivery; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA delivery;


ALTER SCHEMA delivery OWNER TO postgres;

--
-- TOC entry 20 (class 2615 OID 52084)
-- Name: demand; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA demand;


ALTER SCHEMA demand OWNER TO postgres;

--
-- TOC entry 21 (class 2615 OID 52085)
-- Name: despatch; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA despatch;


ALTER SCHEMA despatch OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 52086)
-- Name: goal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA goal;


ALTER SCHEMA goal OWNER TO postgres;

--
-- TOC entry 23 (class 2615 OID 52087)
-- Name: issue; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA issue;


ALTER SCHEMA issue OWNER TO postgres;

--
-- TOC entry 24 (class 2615 OID 52088)
-- Name: lot; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA lot;


ALTER SCHEMA lot OWNER TO postgres;

--
-- TOC entry 25 (class 2615 OID 52089)
-- Name: pgunit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgunit;


ALTER SCHEMA pgunit OWNER TO postgres;

--
-- TOC entry 26 (class 2615 OID 52090)
-- Name: picklist; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA picklist;


ALTER SCHEMA picklist OWNER TO postgres;

--
-- TOC entry 27 (class 2615 OID 52091)
-- Name: rebound; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rebound;


ALTER SCHEMA rebound OWNER TO postgres;

--
-- TOC entry 28 (class 2615 OID 52092)
-- Name: receipt; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA receipt;


ALTER SCHEMA receipt OWNER TO postgres;

--
-- TOC entry 29 (class 2615 OID 52093)
-- Name: reserve; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA reserve;


ALTER SCHEMA reserve OWNER TO postgres;

--
-- TOC entry 30 (class 2615 OID 52094)
-- Name: schedule; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schedule;


ALTER SCHEMA schedule OWNER TO postgres;

--
-- TOC entry 31 (class 2615 OID 52095)
-- Name: stockcard; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stockcard;


ALTER SCHEMA stockcard OWNER TO postgres;

--
-- TOC entry 32 (class 2615 OID 52096)
-- Name: stocktake; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stocktake;


ALTER SCHEMA stocktake OWNER TO postgres;

--
-- TOC entry 33 (class 2615 OID 52097)
-- Name: tests; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tests;


ALTER SCHEMA tests OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 13311)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 52098)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 6 (class 3079 OID 52107)
-- Name: pldbgapi; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pldbgapi WITH SCHEMA public;


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pldbgapi; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pldbgapi IS 'server-side support for debugging PL/pgSQL functions';


--
-- TOC entry 5 (class 3079 OID 52144)
-- Name: plpgsql_check; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql_check WITH SCHEMA public;


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION plpgsql_check; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql_check IS 'extended check for plpgsql functions';


--
-- TOC entry 4 (class 3079 OID 52149)
-- Name: plprofiler; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plprofiler WITH SCHEMA public;


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION plprofiler; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plprofiler IS 'server-side support for profiling PL/pgSQL functions';


--
-- TOC entry 3 (class 3079 OID 52218)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = common, pg_catalog;

--
-- TOC entry 1409 (class 1247 OID 52230)
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
-- TOC entry 1412 (class 1247 OID 52260)
-- Name: result_kind; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE result_kind AS ENUM (
    'FAILED',
    'SUCCEEDED'
);


ALTER TYPE result_kind OWNER TO postgres;

--
-- TOC entry 1415 (class 1247 OID 52267)
-- Name: action_result; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE action_result AS (
	document_id bigint,
	doctype document_kind,
	result_achieved result_kind
);


ALTER TYPE action_result OWNER TO postgres;

--
-- TOC entry 1421 (class 1247 OID 52278)
-- Name: quantity; Type: DOMAIN; Schema: common; Owner: postgres
--

CREATE DOMAIN quantity AS numeric(20,4) DEFAULT 0
	CONSTRAINT quantity_is_positive CHECK ((VALUE >= (0)::numeric));


ALTER DOMAIN quantity OWNER TO postgres;

--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 1421
-- Name: DOMAIN quantity; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON DOMAIN quantity IS 'quantity domain';


--
-- TOC entry 1423 (class 1247 OID 52282)
-- Name: document_body; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_body AS (
	good_code character varying,
	quantity quantity,
	uom_code character varying
);


ALTER TYPE document_body OWNER TO postgres;

--
-- TOC entry 1418 (class 1247 OID 52269)
-- Name: document_fsmt; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_fsmt AS ENUM (
    'PROPOSED',
    'COMMITTED',
    'DECOMMITTED'
);


ALTER TYPE document_fsmt OWNER TO postgres;

--
-- TOC entry 1426 (class 1247 OID 52285)
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
-- TOC entry 1429 (class 1247 OID 52288)
-- Name: document_type; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE document_type AS (
	head document_head,
	body document_body[]
);


ALTER TYPE document_type OWNER TO postgres;

--
-- TOC entry 1432 (class 1247 OID 52290)
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
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 1432
-- Name: TYPE goal_fsmt; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON TYPE goal_fsmt IS 'fsmt type';


--
-- TOC entry 1435 (class 1247 OID 52311)
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
-- TOC entry 1438 (class 1247 OID 52314)
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
-- TOC entry 1441 (class 1247 OID 52317)
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
-- TOC entry 1444 (class 1247 OID 52319)
-- Name: policy_mode; Type: TYPE; Schema: common; Owner: postgres
--

CREATE TYPE policy_mode AS ENUM (
    'DISABLED',
    'PERMISSIVE',
    'ENFORCING'
);


ALTER TYPE policy_mode OWNER TO postgres;

--
-- TOC entry 1447 (class 1247 OID 52325)
-- Name: quantity_signed; Type: DOMAIN; Schema: common; Owner: postgres
--

CREATE DOMAIN quantity_signed AS numeric(20,4) DEFAULT 0;


ALTER DOMAIN quantity_signed OWNER TO postgres;

--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 1447
-- Name: DOMAIN quantity_signed; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON DOMAIN quantity_signed IS 'quantity signed domain';


--
-- TOC entry 1448 (class 1247 OID 52328)
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
-- TOC entry 379 (class 1255 OID 52329)
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
-- TOC entry 380 (class 1255 OID 52330)
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
-- TOC entry 886 (class 1255 OID 52331)
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
-- TOC entry 888 (class 1255 OID 52332)
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
-- TOC entry 889 (class 1255 OID 52333)
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
-- TOC entry 890 (class 1255 OID 52334)
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
-- TOC entry 891 (class 1255 OID 52335)
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
-- TOC entry 904 (class 1255 OID 54436)
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
-- TOC entry 905 (class 1255 OID 54437)
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
-- TOC entry 906 (class 1255 OID 54438)
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
-- TOC entry 892 (class 1255 OID 52339)
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
-- TOC entry 893 (class 1255 OID 52340)
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
-- TOC entry 894 (class 1255 OID 52341)
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
-- TOC entry 895 (class 1255 OID 52342)
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
-- TOC entry 382 (class 1255 OID 52343)
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
-- TOC entry 383 (class 1255 OID 52344)
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
-- TOC entry 384 (class 1255 OID 52345)
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
-- TOC entry 896 (class 1255 OID 52346)
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
-- TOC entry 897 (class 1255 OID 52347)
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
-- TOC entry 898 (class 1255 OID 52348)
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
-- TOC entry 899 (class 1255 OID 52349)
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
-- TOC entry 907 (class 1255 OID 54442)
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
-- TOC entry 908 (class 1255 OID 54443)
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
-- TOC entry 909 (class 1255 OID 54444)
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
-- TOC entry 900 (class 1255 OID 52353)
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
-- TOC entry 901 (class 1255 OID 52354)
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
-- TOC entry 902 (class 1255 OID 52355)
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
-- TOC entry 903 (class 1255 OID 52356)
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
-- TOC entry 385 (class 1255 OID 52357)
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
-- TOC entry 386 (class 1255 OID 52358)
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
-- TOC entry 387 (class 1255 OID 52359)
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
-- TOC entry 388 (class 1255 OID 52360)
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
-- TOC entry 389 (class 1255 OID 52361)
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
-- TOC entry 390 (class 1255 OID 52362)
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
-- TOC entry 391 (class 1255 OID 52363)
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
-- TOC entry 392 (class 1255 OID 52364)
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
-- TOC entry 393 (class 1255 OID 52365)
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
-- TOC entry 394 (class 1255 OID 52366)
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
-- TOC entry 395 (class 1255 OID 52367)
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
-- TOC entry 396 (class 1255 OID 52368)
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
-- TOC entry 397 (class 1255 OID 52369)
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
-- TOC entry 398 (class 1255 OID 52370)
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
-- TOC entry 399 (class 1255 OID 52371)
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
-- TOC entry 381 (class 1255 OID 52372)
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
-- TOC entry 401 (class 1255 OID 52373)
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
-- TOC entry 402 (class 1255 OID 52374)
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
-- TOC entry 403 (class 1255 OID 52375)
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
-- TOC entry 404 (class 1255 OID 52376)
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
-- TOC entry 405 (class 1255 OID 52377)
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
-- TOC entry 406 (class 1255 OID 52378)
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
-- TOC entry 407 (class 1255 OID 52379)
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
-- TOC entry 408 (class 1255 OID 52380)
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
-- TOC entry 409 (class 1255 OID 52381)
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
-- TOC entry 410 (class 1255 OID 52382)
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
-- TOC entry 411 (class 1255 OID 52383)
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
-- TOC entry 412 (class 1255 OID 52384)
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
-- TOC entry 413 (class 1255 OID 52385)
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
-- TOC entry 414 (class 1255 OID 52386)
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
-- TOC entry 415 (class 1255 OID 52387)
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
-- TOC entry 416 (class 1255 OID 52388)
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
-- TOC entry 417 (class 1255 OID 52389)
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
-- TOC entry 418 (class 1255 OID 52390)
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
-- TOC entry 419 (class 1255 OID 52391)
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
-- TOC entry 420 (class 1255 OID 52392)
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
-- TOC entry 421 (class 1255 OID 52393)
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
-- TOC entry 422 (class 1255 OID 52394)
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
-- TOC entry 423 (class 1255 OID 52395)
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
-- TOC entry 424 (class 1255 OID 52396)
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
-- TOC entry 425 (class 1255 OID 52397)
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
-- TOC entry 426 (class 1255 OID 52398)
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
-- TOC entry 427 (class 1255 OID 52399)
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
-- TOC entry 428 (class 1255 OID 52400)
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
-- TOC entry 429 (class 1255 OID 52401)
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
-- TOC entry 430 (class 1255 OID 52402)
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
-- TOC entry 431 (class 1255 OID 52403)
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
-- TOC entry 432 (class 1255 OID 52404)
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
-- TOC entry 433 (class 1255 OID 52405)
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
-- TOC entry 434 (class 1255 OID 52406)
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
-- TOC entry 435 (class 1255 OID 52407)
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
-- TOC entry 436 (class 1255 OID 52408)
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
-- TOC entry 437 (class 1255 OID 52409)
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
-- TOC entry 438 (class 1255 OID 52410)
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
-- TOC entry 439 (class 1255 OID 52411)
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
-- TOC entry 400 (class 1255 OID 52412)
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
-- TOC entry 440 (class 1255 OID 52413)
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
-- TOC entry 441 (class 1255 OID 52414)
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
-- TOC entry 442 (class 1255 OID 52415)
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
-- TOC entry 443 (class 1255 OID 52416)
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
-- TOC entry 444 (class 1255 OID 52417)
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
-- TOC entry 445 (class 1255 OID 52418)
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
-- TOC entry 446 (class 1255 OID 52419)
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
-- TOC entry 447 (class 1255 OID 52420)
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
-- TOC entry 448 (class 1255 OID 52421)
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
-- TOC entry 449 (class 1255 OID 52422)
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
-- TOC entry 450 (class 1255 OID 52423)
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
-- TOC entry 451 (class 1255 OID 52424)
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
-- TOC entry 452 (class 1255 OID 52425)
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
-- TOC entry 453 (class 1255 OID 52426)
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
-- TOC entry 454 (class 1255 OID 52427)
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
-- TOC entry 455 (class 1255 OID 52428)
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
-- TOC entry 456 (class 1255 OID 52429)
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
-- TOC entry 457 (class 1255 OID 52430)
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
-- TOC entry 458 (class 1255 OID 52431)
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
-- TOC entry 459 (class 1255 OID 52432)
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
-- TOC entry 460 (class 1255 OID 52433)
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
-- TOC entry 461 (class 1255 OID 52434)
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
-- TOC entry 462 (class 1255 OID 52435)
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
-- TOC entry 463 (class 1255 OID 52436)
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
-- TOC entry 464 (class 1255 OID 52437)
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
-- TOC entry 465 (class 1255 OID 52438)
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
-- TOC entry 466 (class 1255 OID 52439)
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
-- TOC entry 467 (class 1255 OID 52440)
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
-- TOC entry 468 (class 1255 OID 52441)
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
-- TOC entry 469 (class 1255 OID 52442)
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
-- TOC entry 470 (class 1255 OID 52443)
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
-- TOC entry 471 (class 1255 OID 52444)
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
-- TOC entry 472 (class 1255 OID 52445)
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
-- TOC entry 473 (class 1255 OID 52446)
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
-- TOC entry 474 (class 1255 OID 52447)
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
-- TOC entry 475 (class 1255 OID 52448)
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
-- TOC entry 476 (class 1255 OID 52449)
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
-- TOC entry 477 (class 1255 OID 52450)
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
-- TOC entry 478 (class 1255 OID 52451)
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
-- TOC entry 479 (class 1255 OID 52452)
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
-- TOC entry 480 (class 1255 OID 52453)
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
-- TOC entry 481 (class 1255 OID 52454)
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
-- TOC entry 482 (class 1255 OID 52455)
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
-- TOC entry 483 (class 1255 OID 52456)
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
-- TOC entry 484 (class 1255 OID 52457)
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
-- TOC entry 485 (class 1255 OID 52458)
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
-- TOC entry 486 (class 1255 OID 52459)
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
-- TOC entry 487 (class 1255 OID 52460)
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
-- TOC entry 488 (class 1255 OID 52461)
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
-- TOC entry 489 (class 1255 OID 52462)
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
-- TOC entry 490 (class 1255 OID 52463)
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
-- TOC entry 491 (class 1255 OID 52464)
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
-- TOC entry 492 (class 1255 OID 52465)
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
-- TOC entry 493 (class 1255 OID 52466)
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
-- TOC entry 494 (class 1255 OID 52467)
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
-- TOC entry 495 (class 1255 OID 52468)
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
-- TOC entry 496 (class 1255 OID 52469)
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
-- TOC entry 497 (class 1255 OID 52470)
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
-- TOC entry 498 (class 1255 OID 52471)
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
-- TOC entry 499 (class 1255 OID 52472)
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
-- TOC entry 500 (class 1255 OID 52473)
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
-- TOC entry 501 (class 1255 OID 52474)
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
-- TOC entry 502 (class 1255 OID 52475)
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
-- TOC entry 503 (class 1255 OID 52476)
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
-- TOC entry 504 (class 1255 OID 52477)
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
-- TOC entry 505 (class 1255 OID 52478)
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
-- TOC entry 506 (class 1255 OID 52479)
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
-- TOC entry 507 (class 1255 OID 52480)
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
-- TOC entry 508 (class 1255 OID 52481)
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
-- TOC entry 509 (class 1255 OID 52482)
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
-- TOC entry 510 (class 1255 OID 52483)
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
-- TOC entry 511 (class 1255 OID 52484)
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
-- TOC entry 512 (class 1255 OID 52485)
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
-- TOC entry 513 (class 1255 OID 52486)
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
-- TOC entry 514 (class 1255 OID 52487)
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
-- TOC entry 515 (class 1255 OID 52488)
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
-- TOC entry 516 (class 1255 OID 52489)
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
-- TOC entry 517 (class 1255 OID 52490)
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
-- TOC entry 518 (class 1255 OID 52491)
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
-- TOC entry 519 (class 1255 OID 52492)
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
-- TOC entry 520 (class 1255 OID 52493)
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
-- TOC entry 521 (class 1255 OID 52494)
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
-- TOC entry 524 (class 1255 OID 52495)
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
-- TOC entry 525 (class 1255 OID 52496)
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
-- TOC entry 526 (class 1255 OID 52497)
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
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 526
-- Name: FUNCTION raise_custom_exception(__condition_name text); Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON FUNCTION raise_custom_exception(__condition_name text) IS 'Raise exception using mesage text from exception_code table';


--
-- TOC entry 527 (class 1255 OID 52498)
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
-- TOC entry 528 (class 1255 OID 52499)
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
-- TOC entry 530 (class 1255 OID 52500)
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
-- TOC entry 531 (class 1255 OID 52501)
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
-- TOC entry 532 (class 1255 OID 52502)
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
-- TOC entry 800 (class 1255 OID 54098)
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
-- TOC entry 533 (class 1255 OID 52504)
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
-- TOC entry 534 (class 1255 OID 52505)
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
-- TOC entry 801 (class 1255 OID 54097)
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
-- TOC entry 786 (class 1255 OID 52507)
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
-- TOC entry 802 (class 1255 OID 52508)
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
-- TOC entry 536 (class 1255 OID 52509)
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
-- TOC entry 537 (class 1255 OID 52510)
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
-- TOC entry 538 (class 1255 OID 52511)
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
-- TOC entry 796 (class 1255 OID 54092)
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
-- TOC entry 539 (class 1255 OID 52512)
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
-- TOC entry 543 (class 1255 OID 52513)
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
-- TOC entry 540 (class 1255 OID 52515)
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
-- TOC entry 795 (class 1255 OID 54091)
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
-- TOC entry 541 (class 1255 OID 52517)
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
-- TOC entry 542 (class 1255 OID 52518)
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
-- TOC entry 522 (class 1255 OID 52519)
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
-- TOC entry 529 (class 1255 OID 52520)
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
-- TOC entry 544 (class 1255 OID 52521)
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
-- TOC entry 545 (class 1255 OID 52522)
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
-- TOC entry 546 (class 1255 OID 52523)
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
-- TOC entry 547 (class 1255 OID 52524)
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
-- TOC entry 548 (class 1255 OID 52525)
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
-- TOC entry 549 (class 1255 OID 52526)
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
-- TOC entry 550 (class 1255 OID 52527)
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
-- TOC entry 551 (class 1255 OID 52528)
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
-- TOC entry 552 (class 1255 OID 52529)
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
-- TOC entry 553 (class 1255 OID 52530)
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
-- TOC entry 535 (class 1255 OID 52531)
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
-- TOC entry 554 (class 1255 OID 52532)
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
-- TOC entry 555 (class 1255 OID 52533)
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
-- TOC entry 556 (class 1255 OID 52534)
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
-- TOC entry 557 (class 1255 OID 52535)
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
-- TOC entry 558 (class 1255 OID 52536)
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
-- TOC entry 559 (class 1255 OID 52537)
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
-- TOC entry 560 (class 1255 OID 52538)
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
-- TOC entry 561 (class 1255 OID 52539)
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
-- TOC entry 562 (class 1255 OID 52540)
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
-- TOC entry 563 (class 1255 OID 52541)
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
-- TOC entry 564 (class 1255 OID 52542)
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
-- TOC entry 523 (class 1255 OID 52543)
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
-- TOC entry 565 (class 1255 OID 52544)
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
-- TOC entry 566 (class 1255 OID 52545)
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
-- TOC entry 567 (class 1255 OID 52546)
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
-- TOC entry 568 (class 1255 OID 52547)
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
-- TOC entry 569 (class 1255 OID 52548)
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
-- TOC entry 570 (class 1255 OID 52549)
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
-- TOC entry 571 (class 1255 OID 52550)
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
-- TOC entry 572 (class 1255 OID 52551)
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
-- TOC entry 573 (class 1255 OID 52552)
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
-- TOC entry 574 (class 1255 OID 52553)
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
-- TOC entry 575 (class 1255 OID 52554)
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
-- TOC entry 576 (class 1255 OID 52555)
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
-- TOC entry 577 (class 1255 OID 52556)
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
-- TOC entry 578 (class 1255 OID 52557)
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
-- TOC entry 579 (class 1255 OID 52558)
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
-- TOC entry 580 (class 1255 OID 52559)
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
-- TOC entry 581 (class 1255 OID 52560)
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
-- TOC entry 582 (class 1255 OID 52561)
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
-- TOC entry 583 (class 1255 OID 52562)
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
-- TOC entry 584 (class 1255 OID 52563)
-- Name: apprise(bigint, common.document_kind, common.document_fsmt); Type: FUNCTION; Schema: goal; Owner: postgres
--

CREATE FUNCTION apprise(__source_id bigint, __source_type common.document_kind, __source_state common.document_fsmt) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _msg text;
  _state text;
  _head common.document_head;
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
          _head := demand.get_head(_demand_id);
          _head := common.remake_document_head(__head := _head, __document_date := now()::date);
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
          _head := picklist.get_head(_picklist_id);
          _head := common.remake_document_head(__head := _head, __document_date := now()::date);
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
          _head := issue.get_head(_issue_id);
          _head := common.remake_document_head(__head := _head, __document_date := now()::date);
          _body := issue.get_body(_issue_id);
          IF (_goal_id IS NULL) THEN
            _goal_id := goal.init(_head);
            PERFORM binding.bind_goal_and_issue(_goal_id, _issue_id);
            UPDATE goal.head SET curr_fsmt = 'ACCEPTED' where id = _goal_id;
          END IF;
          _despatch_id := despatch.init(_head, _body);
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
-- TOC entry 585 (class 1255 OID 52565)
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
-- TOC entry 587 (class 1255 OID 52566)
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
-- TOC entry 588 (class 1255 OID 52567)
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
-- TOC entry 589 (class 1255 OID 52568)
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
-- TOC entry 590 (class 1255 OID 52569)
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
-- TOC entry 591 (class 1255 OID 52570)
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
-- TOC entry 592 (class 1255 OID 52571)
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
-- TOC entry 593 (class 1255 OID 52572)
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
-- TOC entry 594 (class 1255 OID 52573)
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
-- TOC entry 595 (class 1255 OID 52574)
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
-- TOC entry 596 (class 1255 OID 52575)
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
-- TOC entry 598 (class 1255 OID 52576)
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
-- TOC entry 599 (class 1255 OID 52577)
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
-- TOC entry 600 (class 1255 OID 52578)
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
-- TOC entry 601 (class 1255 OID 52579)
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
-- TOC entry 602 (class 1255 OID 52580)
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
-- TOC entry 603 (class 1255 OID 52581)
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
-- TOC entry 604 (class 1255 OID 52582)
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
-- TOC entry 605 (class 1255 OID 52583)
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
-- TOC entry 606 (class 1255 OID 52584)
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
-- TOC entry 607 (class 1255 OID 52585)
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
-- TOC entry 597 (class 1255 OID 52586)
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
-- TOC entry 608 (class 1255 OID 52587)
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
-- TOC entry 609 (class 1255 OID 52588)
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
-- TOC entry 610 (class 1255 OID 52589)
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
-- TOC entry 611 (class 1255 OID 52590)
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
-- TOC entry 612 (class 1255 OID 52591)
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
-- TOC entry 613 (class 1255 OID 52592)
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
-- TOC entry 614 (class 1255 OID 52593)
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
-- TOC entry 615 (class 1255 OID 52594)
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
-- TOC entry 616 (class 1255 OID 52595)
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
-- TOC entry 617 (class 1255 OID 52596)
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
-- TOC entry 618 (class 1255 OID 52597)
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
-- TOC entry 619 (class 1255 OID 52598)
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
-- TOC entry 620 (class 1255 OID 52599)
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
-- TOC entry 621 (class 1255 OID 52600)
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
-- TOC entry 623 (class 1255 OID 52601)
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
-- TOC entry 624 (class 1255 OID 52602)
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
-- TOC entry 625 (class 1255 OID 52603)
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
-- TOC entry 626 (class 1255 OID 52604)
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
-- TOC entry 627 (class 1255 OID 52605)
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
-- TOC entry 628 (class 1255 OID 52606)
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
-- TOC entry 629 (class 1255 OID 52607)
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
-- TOC entry 630 (class 1255 OID 52608)
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
-- TOC entry 631 (class 1255 OID 52609)
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
-- TOC entry 632 (class 1255 OID 52610)
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
-- TOC entry 622 (class 1255 OID 52611)
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
-- TOC entry 586 (class 1255 OID 52612)
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
-- TOC entry 633 (class 1255 OID 52613)
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
-- TOC entry 634 (class 1255 OID 52614)
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
-- TOC entry 635 (class 1255 OID 52615)
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
-- TOC entry 636 (class 1255 OID 52616)
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
-- TOC entry 637 (class 1255 OID 52617)
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
-- TOC entry 638 (class 1255 OID 52618)
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
-- TOC entry 639 (class 1255 OID 52619)
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
-- TOC entry 640 (class 1255 OID 52620)
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
-- TOC entry 641 (class 1255 OID 52621)
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
-- TOC entry 643 (class 1255 OID 52622)
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
-- TOC entry 644 (class 1255 OID 52623)
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
-- TOC entry 645 (class 1255 OID 52624)
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
-- TOC entry 646 (class 1255 OID 52625)
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
-- TOC entry 647 (class 1255 OID 52626)
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
-- TOC entry 648 (class 1255 OID 52627)
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
-- TOC entry 649 (class 1255 OID 52628)
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
-- TOC entry 650 (class 1255 OID 52629)
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
-- TOC entry 651 (class 1255 OID 52630)
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
-- TOC entry 652 (class 1255 OID 52631)
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
-- TOC entry 653 (class 1255 OID 52632)
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
-- TOC entry 654 (class 1255 OID 52633)
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
-- TOC entry 655 (class 1255 OID 52634)
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
-- TOC entry 656 (class 1255 OID 52635)
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
-- TOC entry 657 (class 1255 OID 52636)
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
-- TOC entry 658 (class 1255 OID 52637)
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
-- TOC entry 659 (class 1255 OID 52638)
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
-- TOC entry 660 (class 1255 OID 52639)
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
-- TOC entry 661 (class 1255 OID 52640)
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
-- TOC entry 662 (class 1255 OID 52641)
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
-- TOC entry 663 (class 1255 OID 52642)
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
-- TOC entry 664 (class 1255 OID 52643)
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
-- TOC entry 665 (class 1255 OID 52644)
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
-- TOC entry 666 (class 1255 OID 52645)
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
-- TOC entry 667 (class 1255 OID 52646)
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
-- TOC entry 668 (class 1255 OID 52647)
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
-- TOC entry 669 (class 1255 OID 52648)
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
-- TOC entry 670 (class 1255 OID 52649)
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
-- TOC entry 671 (class 1255 OID 52650)
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
-- TOC entry 672 (class 1255 OID 52651)
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
-- TOC entry 673 (class 1255 OID 52652)
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
-- TOC entry 674 (class 1255 OID 52653)
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
-- TOC entry 675 (class 1255 OID 52654)
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
-- TOC entry 642 (class 1255 OID 52655)
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
-- TOC entry 676 (class 1255 OID 52656)
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
-- TOC entry 677 (class 1255 OID 52657)
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
-- TOC entry 678 (class 1255 OID 52658)
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
-- TOC entry 679 (class 1255 OID 52659)
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
-- TOC entry 680 (class 1255 OID 52660)
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
-- TOC entry 681 (class 1255 OID 52661)
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
-- TOC entry 682 (class 1255 OID 52662)
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
-- TOC entry 683 (class 1255 OID 52663)
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
-- TOC entry 910 (class 1255 OID 54445)
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
-- TOC entry 911 (class 1255 OID 54446)
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
-- TOC entry 912 (class 1255 OID 54447)
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
-- TOC entry 913 (class 1255 OID 54448)
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
-- TOC entry 684 (class 1255 OID 52668)
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
-- TOC entry 685 (class 1255 OID 52669)
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
-- TOC entry 686 (class 1255 OID 52670)
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
-- TOC entry 687 (class 1255 OID 52671)
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
-- TOC entry 688 (class 1255 OID 52672)
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
-- TOC entry 689 (class 1255 OID 52673)
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
-- TOC entry 690 (class 1255 OID 52674)
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
-- TOC entry 691 (class 1255 OID 52675)
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
-- TOC entry 692 (class 1255 OID 52676)
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
-- TOC entry 693 (class 1255 OID 52677)
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
-- TOC entry 694 (class 1255 OID 52678)
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
-- TOC entry 695 (class 1255 OID 52679)
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
-- TOC entry 696 (class 1255 OID 52680)
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
-- TOC entry 697 (class 1255 OID 52681)
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
-- TOC entry 698 (class 1255 OID 52682)
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
-- TOC entry 699 (class 1255 OID 52683)
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
-- TOC entry 700 (class 1255 OID 52684)
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
-- TOC entry 701 (class 1255 OID 52685)
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
-- TOC entry 702 (class 1255 OID 52686)
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
-- TOC entry 703 (class 1255 OID 52687)
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
-- TOC entry 704 (class 1255 OID 52688)
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
-- TOC entry 705 (class 1255 OID 52689)
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
-- TOC entry 706 (class 1255 OID 52690)
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
-- TOC entry 707 (class 1255 OID 52691)
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
-- TOC entry 708 (class 1255 OID 52692)
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
-- TOC entry 709 (class 1255 OID 52693)
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
-- TOC entry 710 (class 1255 OID 52694)
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
-- TOC entry 711 (class 1255 OID 52695)
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
-- TOC entry 712 (class 1255 OID 52696)
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
-- TOC entry 713 (class 1255 OID 52697)
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
-- TOC entry 714 (class 1255 OID 52698)
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
-- TOC entry 715 (class 1255 OID 52699)
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
-- TOC entry 716 (class 1255 OID 52700)
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
-- TOC entry 717 (class 1255 OID 52701)
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
-- TOC entry 925 (class 1255 OID 52702)
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
-- TOC entry 923 (class 1255 OID 52703)
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
-- TOC entry 924 (class 1255 OID 52704)
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
-- TOC entry 945 (class 1255 OID 52705)
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
-- TOC entry 946 (class 1255 OID 52706)
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
-- TOC entry 928 (class 1255 OID 52707)
-- Name: __adjustmentcredit__get_head_batch(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentcredit__get_head_batch() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _heads common.document_head[];
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
-- TOC entry 1020 (class 1255 OID 52708)
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
  _test_due_date CONSTANT date := '2017-02-02'::date;
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
-- TOC entry 728 (class 1255 OID 52709)
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
-- TOC entry 1017 (class 1255 OID 52710)
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
-- TOC entry 947 (class 1255 OID 52711)
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
-- TOC entry 1018 (class 1255 OID 52712)
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
-- TOC entry 731 (class 1255 OID 52713)
-- Name: __adjustmentdebit__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 740 (class 1255 OID 52714)
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
-- TOC entry 732 (class 1255 OID 52715)
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
-- TOC entry 733 (class 1255 OID 52716)
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
-- TOC entry 744 (class 1255 OID 52717)
-- Name: __adjustmentdebit__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __adjustmentdebit__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := adjustmentdebit.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addressee, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
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
-- TOC entry 1021 (class 1255 OID 52718)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 1022 (class 1255 OID 52719)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

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
-- TOC entry 734 (class 1255 OID 52720)
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
-- TOC entry 887 (class 1255 OID 52721)
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
-- TOC entry 735 (class 1255 OID 52722)
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
-- TOC entry 1019 (class 1255 OID 52723)
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
-- TOC entry 736 (class 1255 OID 52724)
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
-- TOC entry 948 (class 1255 OID 52725)
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
-- TOC entry 737 (class 1255 OID 52726)
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
-- TOC entry 738 (class 1255 OID 52727)
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
-- TOC entry 929 (class 1255 OID 52728)
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
-- TOC entry 739 (class 1255 OID 52729)
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
-- TOC entry 950 (class 1255 OID 52730)
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
-- TOC entry 949 (class 1255 OID 52731)
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
-- TOC entry 741 (class 1255 OID 52732)
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
-- TOC entry 742 (class 1255 OID 52733)
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
-- TOC entry 743 (class 1255 OID 52734)
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
-- TOC entry 951 (class 1255 OID 52735)
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
-- TOC entry 745 (class 1255 OID 52736)
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
-- TOC entry 746 (class 1255 OID 52737)
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
-- TOC entry 747 (class 1255 OID 52738)
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
-- TOC entry 952 (class 1255 OID 52739)
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
-- TOC entry 748 (class 1255 OID 52740)
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
-- TOC entry 749 (class 1255 OID 52741)
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
-- TOC entry 750 (class 1255 OID 52742)
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
-- TOC entry 953 (class 1255 OID 52743)
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
-- TOC entry 751 (class 1255 OID 52744)
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
-- TOC entry 752 (class 1255 OID 52745)
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
-- TOC entry 753 (class 1255 OID 52746)
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
-- TOC entry 954 (class 1255 OID 52747)
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
-- TOC entry 765 (class 1255 OID 52748)
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
-- TOC entry 755 (class 1255 OID 52749)
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
-- TOC entry 756 (class 1255 OID 52750)
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
-- TOC entry 955 (class 1255 OID 52751)
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
-- TOC entry 757 (class 1255 OID 52752)
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
-- TOC entry 779 (class 1255 OID 52753)
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
-- TOC entry 758 (class 1255 OID 52754)
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
-- TOC entry 759 (class 1255 OID 52755)
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
-- TOC entry 956 (class 1255 OID 52756)
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
-- TOC entry 957 (class 1255 OID 52757)
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
-- TOC entry 760 (class 1255 OID 52758)
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
-- TOC entry 958 (class 1255 OID 52759)
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
-- TOC entry 944 (class 1255 OID 52760)
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
-- TOC entry 1015 (class 1255 OID 52761)
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
-- TOC entry 959 (class 1255 OID 52762)
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
-- TOC entry 761 (class 1255 OID 52763)
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
  INSERT INTO goal.head VALUES (1301, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'GOAL-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO issue.head VALUES (1401, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ISSUE-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO picklist.head VALUES (1501, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'PICKLIST-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (1601, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (1701, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 960 (class 1255 OID 52764)
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
-- TOC entry 961 (class 1255 OID 52765)
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
-- TOC entry 762 (class 1255 OID 52766)
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
-- TOC entry 763 (class 1255 OID 52767)
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
-- TOC entry 764 (class 1255 OID 52768)
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
-- TOC entry 766 (class 1255 OID 52769)
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
-- TOC entry 962 (class 1255 OID 52770)
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
-- TOC entry 963 (class 1255 OID 52771)
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
-- TOC entry 767 (class 1255 OID 52772)
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
-- TOC entry 768 (class 1255 OID 52773)
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
-- TOC entry 930 (class 1255 OID 52774)
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
-- TOC entry 931 (class 1255 OID 52775)
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
-- TOC entry 769 (class 1255 OID 52776)
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
-- TOC entry 770 (class 1255 OID 52777)
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
-- TOC entry 771 (class 1255 OID 52778)
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
-- TOC entry 772 (class 1255 OID 52779)
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
-- TOC entry 967 (class 1255 OID 52780)
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
-- TOC entry 964 (class 1255 OID 52781)
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
-- TOC entry 965 (class 1255 OID 52782)
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
-- TOC entry 773 (class 1255 OID 52783)
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
-- TOC entry 966 (class 1255 OID 52784)
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
-- TOC entry 718 (class 1255 OID 52785)
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
-- TOC entry 774 (class 1255 OID 52786)
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
-- TOC entry 969 (class 1255 OID 52787)
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
-- TOC entry 775 (class 1255 OID 52788)
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
-- TOC entry 776 (class 1255 OID 52789)
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
-- TOC entry 970 (class 1255 OID 52790)
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
-- TOC entry 719 (class 1255 OID 52791)
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
-- TOC entry 720 (class 1255 OID 52792)
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
-- TOC entry 787 (class 1255 OID 52793)
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
-- TOC entry 777 (class 1255 OID 52794)
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
-- TOC entry 971 (class 1255 OID 52795)
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
-- TOC entry 972 (class 1255 OID 52796)
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
-- TOC entry 973 (class 1255 OID 52797)
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
-- TOC entry 974 (class 1255 OID 52798)
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
-- TOC entry 780 (class 1255 OID 52799)
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
-- TOC entry 975 (class 1255 OID 52800)
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
-- TOC entry 968 (class 1255 OID 52801)
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
-- TOC entry 721 (class 1255 OID 52802)
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
-- TOC entry 932 (class 1255 OID 52803)
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
-- TOC entry 1009 (class 1255 OID 52804)
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
-- TOC entry 976 (class 1255 OID 52805)
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
-- TOC entry 977 (class 1255 OID 52806)
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
-- TOC entry 978 (class 1255 OID 52807)
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
-- TOC entry 933 (class 1255 OID 52808)
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
-- TOC entry 778 (class 1255 OID 52809)
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
-- TOC entry 781 (class 1255 OID 52810)
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
-- TOC entry 934 (class 1255 OID 52811)
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
-- TOC entry 722 (class 1255 OID 52812)
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
-- TOC entry 979 (class 1255 OID 52813)
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

  INSERT INTO adjustmentdebit.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'ADJUSTMENTDEBIT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'ADJUSTMENTDEBIT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO adjustmentdebit.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'ADJUSTMENTDEBIT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 782 (class 1255 OID 52814)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 783 (class 1255 OID 52815)
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
-- TOC entry 784 (class 1255 OID 52816)
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
-- TOC entry 785 (class 1255 OID 52817)
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
-- TOC entry 788 (class 1255 OID 52818)
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
-- TOC entry 914 (class 1255 OID 52819)
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
-- TOC entry 915 (class 1255 OID 52820)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 789 (class 1255 OID 52821)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');
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
-- TOC entry 980 (class 1255 OID 52822)
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
-- TOC entry 981 (class 1255 OID 52823)
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
-- TOC entry 982 (class 1255 OID 52824)
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
-- TOC entry 790 (class 1255 OID 52825)
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
-- TOC entry 791 (class 1255 OID 52826)
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
-- TOC entry 792 (class 1255 OID 52827)
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
-- TOC entry 793 (class 1255 OID 52828)
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
-- TOC entry 798 (class 1255 OID 52829)
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
-- TOC entry 983 (class 1255 OID 52830)
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
-- TOC entry 984 (class 1255 OID 52831)
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
-- TOC entry 723 (class 1255 OID 52832)
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
-- TOC entry 814 (class 1255 OID 52833)
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
-- TOC entry 935 (class 1255 OID 52834)
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
-- TOC entry 799 (class 1255 OID 52835)
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
-- TOC entry 803 (class 1255 OID 52836)
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
-- TOC entry 804 (class 1255 OID 52837)
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
-- TOC entry 885 (class 1255 OID 52838)
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
-- TOC entry 988 (class 1255 OID 52839)
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
-- TOC entry 985 (class 1255 OID 52840)
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
-- TOC entry 986 (class 1255 OID 52841)
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
-- TOC entry 884 (class 1255 OID 52842)
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
  PERFORM pgunit.assert_equals('E1'::character varying, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals('ISSUE'::common.document_kind, _head.doctype, 'Incorrect doctype value');
  PERFORM pgunit.assert_equals('COMMITTED'::common.document_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');

END;
$$;


ALTER FUNCTION tests.__common__remake_document_head() OWNER TO postgres;

--
-- TOC entry 987 (class 1255 OID 52843)
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
-- TOC entry 724 (class 1255 OID 52844)
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
-- TOC entry 805 (class 1255 OID 52845)
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

  INSERT INTO cutoff.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'CUTOFF-01', '2017-01-01', NULL, 'B1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'CUTOFF-02', '2017-02-01', NULL, 'A1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO cutoff.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'CUTOFF-03', '2017-03-01', NULL, 'A1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _cutoff_ids := cutoff.get_all_comitted('B1');
  PERFORM pgunit.assert_array_equals(_test_cutoff_ids, _cutoff_ids, 'Incorrect _cutoff_ids value');

END;
$$;


ALTER FUNCTION tests.__cutoff__get_all_comitted() OWNER TO postgres;

--
-- TOC entry 806 (class 1255 OID 52846)
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
-- TOC entry 990 (class 1255 OID 52847)
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
-- TOC entry 991 (class 1255 OID 52848)
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
-- TOC entry 807 (class 1255 OID 52849)
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
-- TOC entry 808 (class 1255 OID 52850)
-- Name: __delivery__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 989 (class 1255 OID 52851)
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
-- TOC entry 809 (class 1255 OID 52852)
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
-- TOC entry 916 (class 1255 OID 52853)
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
-- TOC entry 992 (class 1255 OID 52854)
-- Name: __delivery__get_head(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __delivery__get_head() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.inbound_head;
  _test_gid CONSTANT uuid := '9b2952fa-01d1-11e7-b440-d4bed939923a';
  _test_display_name CONSTANT character varying := 'DELIVERY-02';
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DELIVERY'::common.document_kind;
BEGIN
  
  RAISE DEBUG '#trace Check __delivery__get_head()';

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := delivery.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
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
-- TOC entry 813 (class 1255 OID 52855)
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
  _test_document_date CONSTANT date := '2017-02-01'::date;
  _test_ship_to CONSTANT character varying := 'A1';
  _test_ship_from CONSTANT character varying := 'B1';
  _test_curr_fsmt CONSTANT common.document_fsmt := 'COMMITTED'::common.document_fsmt;
  _test_doctype CONSTANT common.document_kind := 'DELIVERY'::common.document_kind;
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
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head_batch() OWNER TO postgres;

--
-- TOC entry 879 (class 1255 OID 52856)
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

  INSERT INTO delivery.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'DELIVERY-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'DELIVERY-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO delivery.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'DELIVERY-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := delivery.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__delivery__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 810 (class 1255 OID 52857)
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
-- TOC entry 917 (class 1255 OID 52858)
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
-- TOC entry 811 (class 1255 OID 52859)
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
-- TOC entry 812 (class 1255 OID 52860)
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
-- TOC entry 993 (class 1255 OID 52861)
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
-- TOC entry 994 (class 1255 OID 52862)
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
-- TOC entry 729 (class 1255 OID 52863)
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
-- TOC entry 815 (class 1255 OID 52864)
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
-- TOC entry 816 (class 1255 OID 52865)
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
-- TOC entry 817 (class 1255 OID 52866)
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
-- TOC entry 818 (class 1255 OID 52867)
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
-- TOC entry 819 (class 1255 OID 52868)
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
-- TOC entry 995 (class 1255 OID 52869)
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
-- TOC entry 996 (class 1255 OID 52870)
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
-- TOC entry 820 (class 1255 OID 52871)
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
-- TOC entry 870 (class 1255 OID 52872)
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
-- TOC entry 821 (class 1255 OID 52873)
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
-- TOC entry 936 (class 1255 OID 52874)
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
-- TOC entry 822 (class 1255 OID 52875)
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
-- TOC entry 823 (class 1255 OID 52876)
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
-- TOC entry 997 (class 1255 OID 52877)
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
-- TOC entry 824 (class 1255 OID 52878)
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
-- TOC entry 825 (class 1255 OID 52879)
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
-- TOC entry 826 (class 1255 OID 52880)
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
-- TOC entry 725 (class 1255 OID 52881)
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
-- TOC entry 918 (class 1255 OID 52882)
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
-- TOC entry 871 (class 1255 OID 52883)
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
-- TOC entry 998 (class 1255 OID 52884)
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
-- TOC entry 999 (class 1255 OID 52885)
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
-- TOC entry 919 (class 1255 OID 52886)
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
-- TOC entry 827 (class 1255 OID 52887)
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
-- TOC entry 828 (class 1255 OID 52888)
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
-- TOC entry 829 (class 1255 OID 52889)
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
-- TOC entry 830 (class 1255 OID 52890)
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
-- TOC entry 831 (class 1255 OID 52891)
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
-- TOC entry 832 (class 1255 OID 52892)
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
-- TOC entry 1000 (class 1255 OID 52893)
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
-- TOC entry 833 (class 1255 OID 52894)
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
-- TOC entry 834 (class 1255 OID 52895)
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
-- TOC entry 835 (class 1255 OID 52896)
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
-- TOC entry 836 (class 1255 OID 52897)
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
-- TOC entry 920 (class 1255 OID 52898)
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
-- TOC entry 872 (class 1255 OID 52899)
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
-- TOC entry 837 (class 1255 OID 52900)
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
-- TOC entry 1001 (class 1255 OID 52901)
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
-- TOC entry 873 (class 1255 OID 52902)
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
-- TOC entry 1002 (class 1255 OID 52903)
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
-- TOC entry 838 (class 1255 OID 52904)
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
-- TOC entry 754 (class 1255 OID 52905)
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
-- TOC entry 839 (class 1255 OID 52906)
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
-- TOC entry 921 (class 1255 OID 52907)
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
-- TOC entry 1003 (class 1255 OID 52908)
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
-- TOC entry 937 (class 1255 OID 52909)
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
-- TOC entry 840 (class 1255 OID 52910)
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
-- TOC entry 841 (class 1255 OID 52911)
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
-- TOC entry 922 (class 1255 OID 52912)
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
-- TOC entry 842 (class 1255 OID 52913)
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
-- TOC entry 874 (class 1255 OID 52914)
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
-- TOC entry 843 (class 1255 OID 52915)
-- Name: __rebound__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __rebound__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 938 (class 1255 OID 52916)
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
-- TOC entry 844 (class 1255 OID 52917)
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
-- TOC entry 1004 (class 1255 OID 52918)
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
-- TOC entry 845 (class 1255 OID 52919)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := rebound.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
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
-- TOC entry 881 (class 1255 OID 52920)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := rebound.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head_batch() OWNER TO postgres;

--
-- TOC entry 882 (class 1255 OID 52921)
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

  INSERT INTO rebound.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'REBOUND-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'REBOUND-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO rebound.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'REBOUND-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := rebound.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__rebound__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 846 (class 1255 OID 52922)
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
-- TOC entry 1006 (class 1255 OID 52923)
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
-- TOC entry 1005 (class 1255 OID 52924)
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
-- TOC entry 876 (class 1255 OID 52925)
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
-- TOC entry 847 (class 1255 OID 52926)
-- Name: __receipt__destroy(); Type: FUNCTION; Schema: tests; Owner: postgres
--

CREATE FUNCTION __receipt__destroy() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  _head common.outbound_head;
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
-- TOC entry 926 (class 1255 OID 52927)
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
-- TOC entry 848 (class 1255 OID 52928)
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
-- TOC entry 849 (class 1255 OID 52929)
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
-- TOC entry 1016 (class 1255 OID 52930)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _head := receipt.get_head(102);
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
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
-- TOC entry 1007 (class 1255 OID 52931)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := receipt.get_head_batch(ARRAY[102,103]::bigint[]);
  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head_batch() OWNER TO postgres;

--
-- TOC entry 883 (class 1255 OID 52932)
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

  INSERT INTO receipt.head VALUES (101, '8236af18-eb1a-11e6-8a73-d4bed939923a', 'RECEIPT-01', '2017-01-01', NULL, '2017-01-02', 'B1', 'A1', 'COMMITTED', '2017-02-04 22:46:51.810833+02', 'DECOMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (102, '9b2952fa-01d1-11e7-b440-d4bed939923a', 'RECEIPT-02', '2017-02-01', NULL, '2017-02-02', 'A1', 'B1', 'PROPOSED', '2017-02-04 22:46:51.810833+02', 'COMMITTED', '2017-02-04 22:47:10.05991+02');
  INSERT INTO receipt.head VALUES (103, 'f20d7196-01d1-11e7-b441-d4bed939923a', 'RECEIPT-03', '2017-03-01', NULL, '2017-03-02', 'A1', 'B1', NULL, NULL, 'PROPOSED', '2017-02-04 22:47:10.05991+02');

  _heads := receipt.get_head_batch_proposed(_test_ship_from, _test_start_date, _test_end_date);

  _array_lengh := array_length(_heads, 1);
  _head := _heads[1];
  PERFORM pgunit.assert_equals(_test_array_lengh, _array_lengh, 'Incorrect _array_lengh value');
  PERFORM pgunit.assert_equals(_test_gid, _head.gid, 'Incorrect gid value');
  PERFORM pgunit.assert_equals(_test_display_name, _head.display_name, 'Incorrect display_name value');
  PERFORM pgunit.assert_equals(_test_document_date, _head.document_date, 'Incorrect document_date value');
  PERFORM pgunit.assert_equals(_test_ship_to, _head.addresser, 'Incorrect ship_to value');
  PERFORM pgunit.assert_equals(_test_ship_from, _head.facility_code, 'Incorrect ship_from value');
  PERFORM pgunit.assert_equals(_test_curr_fsmt, _head.curr_fsmt, 'Incorrect curr_fsmt value');
  PERFORM pgunit.assert_equals(_test_doctype, _head.doctype, 'Incorrect doctype value');

END;
$$;


ALTER FUNCTION tests.__receipt__get_head_batch_proposed() OWNER TO postgres;

--
-- TOC entry 850 (class 1255 OID 52933)
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
-- TOC entry 877 (class 1255 OID 52934)
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
-- TOC entry 851 (class 1255 OID 52935)
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

  UPDATE receipt.head SET curr_fsmt = 'COMMITTED' WHERE id = 101;

  PERFORM receipt.make_adjustment(101);
  _adjustment_id := binding.get_adjustmentdebit_binded_to_receipt(101);
  _body := adjustmentdebit.get_body(_adjustment_id);
  PERFORM pgunit.assert_array_equals(_test_body, _body, 'Incorrect _body value');

END;
$$;


ALTER FUNCTION tests.__receipt__make_adjustment() OWNER TO postgres;

--
-- TOC entry 852 (class 1255 OID 52936)
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
-- TOC entry 878 (class 1255 OID 52937)
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
-- TOC entry 1008 (class 1255 OID 52938)
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
-- TOC entry 939 (class 1255 OID 52939)
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
-- TOC entry 726 (class 1255 OID 52940)
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
-- TOC entry 853 (class 1255 OID 52941)
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
-- TOC entry 854 (class 1255 OID 52942)
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
-- TOC entry 855 (class 1255 OID 52943)
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
-- TOC entry 856 (class 1255 OID 52944)
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
-- TOC entry 857 (class 1255 OID 52945)
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
-- TOC entry 858 (class 1255 OID 52946)
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
-- TOC entry 1010 (class 1255 OID 52947)
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
-- TOC entry 859 (class 1255 OID 52948)
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
-- TOC entry 875 (class 1255 OID 52949)
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
-- TOC entry 727 (class 1255 OID 52950)
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
-- TOC entry 927 (class 1255 OID 52951)
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
-- TOC entry 860 (class 1255 OID 52952)
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
-- TOC entry 861 (class 1255 OID 52953)
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
-- TOC entry 862 (class 1255 OID 52954)
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
-- TOC entry 1011 (class 1255 OID 52955)
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
-- TOC entry 1012 (class 1255 OID 52956)
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
-- TOC entry 863 (class 1255 OID 52957)
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
-- TOC entry 864 (class 1255 OID 52958)
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
-- TOC entry 865 (class 1255 OID 52959)
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
-- TOC entry 866 (class 1255 OID 52960)
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
-- TOC entry 867 (class 1255 OID 52961)
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
-- TOC entry 940 (class 1255 OID 52962)
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
-- TOC entry 868 (class 1255 OID 52963)
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
-- TOC entry 1013 (class 1255 OID 52964)
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
-- TOC entry 1014 (class 1255 OID 52965)
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
-- TOC entry 880 (class 1255 OID 52966)
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
  _test_facility_code CONSTANT character varying := 'B1';
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
-- TOC entry 730 (class 1255 OID 52967)
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
  _test_facility_code CONSTANT character varying := 'B1';
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
-- TOC entry 869 (class 1255 OID 52968)
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
-- TOC entry 941 (class 1255 OID 52969)
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
-- TOC entry 943 (class 1255 OID 52970)
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
-- TOC entry 942 (class 1255 OID 52971)
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
-- TOC entry 794 (class 1255 OID 52972)
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
-- TOC entry 797 (class 1255 OID 52973)
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
-- TOC entry 4118 (class 2605 OID 52974)
-- Name: CAST (common.goal_fsmt AS common.document_fsmt); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.goal_fsmt AS common.document_fsmt) WITH FUNCTION common.convert_goal_to_document_fsmt(common.goal_fsmt) AS IMPLICIT;


--
-- TOC entry 4119 (class 2605 OID 52975)
-- Name: CAST (common.goal_head AS common.document_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.goal_head AS common.document_head) WITH FUNCTION common.convert_goal_to_document_head(common.goal_head) AS IMPLICIT;


--
-- TOC entry 4120 (class 2605 OID 52976)
-- Name: CAST (common.inbound_head AS common.document_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.inbound_head AS common.document_head) WITH FUNCTION common.convert_inbound_to_document_head(common.inbound_head) AS IMPLICIT;


--
-- TOC entry 4121 (class 2605 OID 52977)
-- Name: CAST (common.outbound_head AS common.document_head); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.outbound_head AS common.document_head) WITH FUNCTION common.convert_outbound_to_document_head(common.outbound_head) AS IMPLICIT;


--
-- TOC entry 4122 (class 2605 OID 52978)
-- Name: CAST (common.stoktake_body AS common.document_body); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (common.stoktake_body AS common.document_body) WITH FUNCTION common.convert_stoktake_to_document_body(common.stoktake_body) AS IMPLICIT;


SET search_path = adjustmentcredit, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 226 (class 1259 OID 52979)
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
-- TOC entry 227 (class 1259 OID 52985)
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
-- TOC entry 228 (class 1259 OID 52997)
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
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 228
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: adjustmentcredit; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 229 (class 1259 OID 52999)
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
-- TOC entry 230 (class 1259 OID 53006)
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
-- TOC entry 231 (class 1259 OID 53012)
-- Name: head; Type: TABLE; Schema: adjustmentdebit; Owner: postgres
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
-- TOC entry 232 (class 1259 OID 53024)
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
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 232
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: adjustmentdebit; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 233 (class 1259 OID 53026)
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
-- TOC entry 234 (class 1259 OID 53033)
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
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE balance; Type: COMMENT; Schema: balance; Owner: postgres
--

COMMENT ON TABLE balance IS 'goods balance';


SET search_path = binding, pg_catalog;

--
-- TOC entry 235 (class 1259 OID 53039)
-- Name: cutoff_to_adjustmentcredit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_adjustmentcredit (
    cutoff_id bigint NOT NULL,
    adjustmentcredit_id bigint NOT NULL
);


ALTER TABLE cutoff_to_adjustmentcredit OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 53042)
-- Name: cutoff_to_adjustmentdebit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_adjustmentdebit (
    cutoff_id bigint NOT NULL,
    adjustmentdebit_id bigint NOT NULL
);


ALTER TABLE cutoff_to_adjustmentdebit OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 53045)
-- Name: cutoff_to_delivery; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_delivery (
    cutoff_id bigint NOT NULL,
    delivery_id bigint NOT NULL
);


ALTER TABLE cutoff_to_delivery OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 53048)
-- Name: cutoff_to_demand; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_demand (
    cutoff_id bigint NOT NULL,
    demand_id bigint NOT NULL
);


ALTER TABLE cutoff_to_demand OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 53051)
-- Name: cutoff_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_despatch (
    cutoff_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE cutoff_to_despatch OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 53054)
-- Name: cutoff_to_goal; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_goal (
    cutoff_id bigint NOT NULL,
    goal_id bigint NOT NULL
);


ALTER TABLE cutoff_to_goal OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 53057)
-- Name: cutoff_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_issue (
    cutoff_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE cutoff_to_issue OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 53060)
-- Name: cutoff_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_picklist (
    cutoff_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE cutoff_to_picklist OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 53063)
-- Name: cutoff_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_rebound (
    cutoff_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE cutoff_to_rebound OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 53066)
-- Name: cutoff_to_receipt; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_receipt (
    cutoff_id bigint NOT NULL,
    receipt_id bigint NOT NULL
);


ALTER TABLE cutoff_to_receipt OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 53069)
-- Name: cutoff_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_reserve (
    cutoff_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE cutoff_to_reserve OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 53072)
-- Name: cutoff_to_stocktake; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE cutoff_to_stocktake (
    cutoff_id bigint NOT NULL,
    stocktake_id bigint NOT NULL
);


ALTER TABLE cutoff_to_stocktake OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 53075)
-- Name: delivery_to_receipt; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE delivery_to_receipt (
    delivery_id bigint NOT NULL,
    receipt_id bigint NOT NULL
);


ALTER TABLE delivery_to_receipt OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 53078)
-- Name: demand_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE demand_to_picklist (
    demand_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE demand_to_picklist OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 53081)
-- Name: demand_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE demand_to_reserve (
    demand_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE demand_to_reserve OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 53084)
-- Name: goal_to_demand; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_demand (
    goal_id bigint NOT NULL,
    demand_id bigint NOT NULL
);


ALTER TABLE goal_to_demand OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 53087)
-- Name: goal_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_despatch (
    goal_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE goal_to_despatch OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 53090)
-- Name: goal_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_issue (
    goal_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE goal_to_issue OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 53093)
-- Name: goal_to_picklist; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_picklist (
    goal_id bigint NOT NULL,
    picklist_id bigint NOT NULL
);


ALTER TABLE goal_to_picklist OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 53096)
-- Name: goal_to_reserve; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE goal_to_reserve (
    goal_id bigint NOT NULL,
    reserve_id bigint NOT NULL
);


ALTER TABLE goal_to_reserve OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 53099)
-- Name: issue_to_adjustmentcredit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_adjustmentcredit (
    issue_id bigint NOT NULL,
    adjustmentcredit_id bigint NOT NULL
);


ALTER TABLE issue_to_adjustmentcredit OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 53102)
-- Name: issue_to_despatch; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_despatch (
    issue_id bigint NOT NULL,
    despatch_id bigint NOT NULL
);


ALTER TABLE issue_to_despatch OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 53105)
-- Name: issue_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE issue_to_rebound (
    issue_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE issue_to_rebound OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 53108)
-- Name: picklist_to_issue; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE picklist_to_issue (
    picklist_id bigint NOT NULL,
    issue_id bigint NOT NULL
);


ALTER TABLE picklist_to_issue OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 53111)
-- Name: receipt_to_adjustmentdebit; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE receipt_to_adjustmentdebit (
    receipt_id bigint NOT NULL,
    adjustmentdebit_id bigint NOT NULL
);


ALTER TABLE receipt_to_adjustmentdebit OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 53114)
-- Name: receipt_to_rebound; Type: TABLE; Schema: binding; Owner: postgres
--

CREATE TABLE receipt_to_rebound (
    receipt_id bigint NOT NULL,
    rebound_id bigint NOT NULL
);


ALTER TABLE receipt_to_rebound OWNER TO postgres;

SET search_path = common, pg_catalog;

--
-- TOC entry 261 (class 1259 OID 53117)
-- Name: cutoff_policy; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE cutoff_policy (
    document_kind_name document_kind NOT NULL,
    policy_mode_applied policy_mode DEFAULT 'DISABLED'::policy_mode NOT NULL
);


ALTER TABLE cutoff_policy OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 53121)
-- Name: document_abbrevation; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE document_abbrevation (
    doctype document_kind NOT NULL,
    abbrevation character varying DEFAULT '[ABBREVATION]'::character varying NOT NULL
);


ALTER TABLE document_abbrevation OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 53128)
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
-- TOC entry 264 (class 1259 OID 53134)
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
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 264
-- Name: exception_code_id_seq; Type: SEQUENCE OWNED BY; Schema: common; Owner: postgres
--

ALTER SEQUENCE exception_code_id_seq OWNED BY exception_code.id;


--
-- TOC entry 265 (class 1259 OID 53136)
-- Name: stocktake_policy; Type: TABLE; Schema: common; Owner: postgres
--

CREATE TABLE stocktake_policy (
    document_kind_name document_kind NOT NULL,
    stocktake_mode_applied policy_mode DEFAULT 'DISABLED'::policy_mode NOT NULL
);


ALTER TABLE stocktake_policy OWNER TO postgres;

SET search_path = cutoff, pg_catalog;

--
-- TOC entry 266 (class 1259 OID 53140)
-- Name: blocker; Type: TABLE; Schema: cutoff; Owner: postgres
--

CREATE TABLE blocker (
    head_id bigint NOT NULL,
    blocker_document common.document_head NOT NULL
);


ALTER TABLE blocker OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 53153)
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
-- TOC entry 269 (class 1259 OID 53164)
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
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 269
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: cutoff; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 267 (class 1259 OID 53146)
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
-- TOC entry 270 (class 1259 OID 53166)
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
-- TOC entry 271 (class 1259 OID 53172)
-- Name: head; Type: TABLE; Schema: delivery; Owner: postgres
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
-- TOC entry 272 (class 1259 OID 53184)
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
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 272
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: delivery; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 273 (class 1259 OID 53186)
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
-- TOC entry 274 (class 1259 OID 53193)
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
-- TOC entry 275 (class 1259 OID 53199)
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
-- TOC entry 276 (class 1259 OID 53211)
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
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 276
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: demand; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 277 (class 1259 OID 53213)
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
-- TOC entry 278 (class 1259 OID 53220)
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
-- TOC entry 279 (class 1259 OID 53226)
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
-- TOC entry 280 (class 1259 OID 53238)
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
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 280
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: despatch; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 281 (class 1259 OID 53240)
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
-- TOC entry 283 (class 1259 OID 53254)
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
-- TOC entry 284 (class 1259 OID 53264)
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
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 284
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: goal; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 282 (class 1259 OID 53247)
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
-- TOC entry 285 (class 1259 OID 53266)
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
-- TOC entry 286 (class 1259 OID 53272)
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
-- TOC entry 287 (class 1259 OID 53284)
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
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 287
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: issue; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 288 (class 1259 OID 53286)
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
-- TOC entry 289 (class 1259 OID 53293)
-- Name: head; Type: TABLE; Schema: lot; Owner: postgres
--

CREATE TABLE head (
    ib bigint NOT NULL
);


ALTER TABLE head OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 53296)
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
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 290
-- Name: head_ib_seq; Type: SEQUENCE OWNED BY; Schema: lot; Owner: postgres
--

ALTER SEQUENCE head_ib_seq OWNED BY head.ib;


SET search_path = picklist, pg_catalog;

--
-- TOC entry 291 (class 1259 OID 53298)
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
-- TOC entry 292 (class 1259 OID 53304)
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
-- TOC entry 293 (class 1259 OID 53316)
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
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 293
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: picklist; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 294 (class 1259 OID 53318)
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
-- TOC entry 295 (class 1259 OID 53325)
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
-- TOC entry 296 (class 1259 OID 53330)
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
-- TOC entry 297 (class 1259 OID 53336)
-- Name: head; Type: TABLE; Schema: rebound; Owner: postgres
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
-- TOC entry 298 (class 1259 OID 53348)
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
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 298
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: rebound; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 299 (class 1259 OID 53350)
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
-- TOC entry 300 (class 1259 OID 53357)
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
-- TOC entry 301 (class 1259 OID 53363)
-- Name: head; Type: TABLE; Schema: receipt; Owner: postgres
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
-- TOC entry 302 (class 1259 OID 53375)
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
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 302
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: receipt; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 303 (class 1259 OID 53377)
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
-- TOC entry 304 (class 1259 OID 53384)
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
-- TOC entry 305 (class 1259 OID 53390)
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
-- TOC entry 306 (class 1259 OID 53402)
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
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 306
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: reserve; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 307 (class 1259 OID 53404)
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
-- TOC entry 308 (class 1259 OID 53411)
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
-- TOC entry 309 (class 1259 OID 53414)
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
-- TOC entry 310 (class 1259 OID 53421)
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
-- TOC entry 311 (class 1259 OID 53427)
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
-- TOC entry 312 (class 1259 OID 53437)
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
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 312
-- Name: head_id_seq; Type: SEQUENCE OWNED BY; Schema: stocktake; Owner: postgres
--

ALTER SEQUENCE head_id_seq OWNED BY head.id;


--
-- TOC entry 313 (class 1259 OID 53439)
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
-- TOC entry 314 (class 1259 OID 53446)
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
-- TOC entry 315 (class 1259 OID 53451)
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
-- TOC entry 316 (class 1259 OID 53456)
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
-- TOC entry 4127 (class 2604 OID 53461)
-- Name: id; Type: DEFAULT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 4135 (class 2604 OID 53462)
-- Name: id; Type: DEFAULT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = common, pg_catalog;

--
-- TOC entry 4141 (class 2604 OID 53463)
-- Name: id; Type: DEFAULT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code ALTER COLUMN id SET DEFAULT nextval('exception_code_id_seq'::regclass);


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 4148 (class 2604 OID 53464)
-- Name: id; Type: DEFAULT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 4153 (class 2604 OID 53465)
-- Name: id; Type: DEFAULT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = demand, pg_catalog;

--
-- TOC entry 4161 (class 2604 OID 53466)
-- Name: id; Type: DEFAULT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = despatch, pg_catalog;

--
-- TOC entry 4169 (class 2604 OID 53467)
-- Name: id; Type: DEFAULT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = goal, pg_catalog;

--
-- TOC entry 4178 (class 2604 OID 53468)
-- Name: id; Type: DEFAULT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = issue, pg_catalog;

--
-- TOC entry 4183 (class 2604 OID 53469)
-- Name: id; Type: DEFAULT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = lot, pg_catalog;

--
-- TOC entry 4187 (class 2604 OID 53470)
-- Name: ib; Type: DEFAULT; Schema: lot; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN ib SET DEFAULT nextval('head_ib_seq'::regclass);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 4192 (class 2604 OID 53471)
-- Name: id; Type: DEFAULT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = rebound, pg_catalog;

--
-- TOC entry 4200 (class 2604 OID 53472)
-- Name: id; Type: DEFAULT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = receipt, pg_catalog;

--
-- TOC entry 4208 (class 2604 OID 53473)
-- Name: id; Type: DEFAULT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = reserve, pg_catalog;

--
-- TOC entry 4216 (class 2604 OID 53474)
-- Name: id; Type: DEFAULT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 4225 (class 2604 OID 53475)
-- Name: id; Type: DEFAULT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head ALTER COLUMN id SET DEFAULT nextval('head_id_seq'::regclass);


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 4699 (class 0 OID 52979)
-- Dependencies: 226
-- Data for Name: body; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



--
-- TOC entry 4700 (class 0 OID 52985)
-- Dependencies: 227
-- Data for Name: head; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 228
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: adjustmentcredit; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 35, true);


--
-- TOC entry 4702 (class 0 OID 52999)
-- Dependencies: 229
-- Data for Name: numerator; Type: TABLE DATA; Schema: adjustmentcredit; Owner: postgres
--



SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 4703 (class 0 OID 53006)
-- Dependencies: 230
-- Data for Name: body; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



--
-- TOC entry 4704 (class 0 OID 53012)
-- Dependencies: 231
-- Data for Name: head; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 232
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: adjustmentdebit; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 35, true);


--
-- TOC entry 4706 (class 0 OID 53026)
-- Dependencies: 233
-- Data for Name: numerator; Type: TABLE DATA; Schema: adjustmentdebit; Owner: postgres
--



SET search_path = balance, pg_catalog;

--
-- TOC entry 4707 (class 0 OID 53033)
-- Dependencies: 234
-- Data for Name: balance; Type: TABLE DATA; Schema: balance; Owner: postgres
--



SET search_path = binding, pg_catalog;

--
-- TOC entry 4708 (class 0 OID 53039)
-- Dependencies: 235
-- Data for Name: cutoff_to_adjustmentcredit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4709 (class 0 OID 53042)
-- Dependencies: 236
-- Data for Name: cutoff_to_adjustmentdebit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4710 (class 0 OID 53045)
-- Dependencies: 237
-- Data for Name: cutoff_to_delivery; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4711 (class 0 OID 53048)
-- Dependencies: 238
-- Data for Name: cutoff_to_demand; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4712 (class 0 OID 53051)
-- Dependencies: 239
-- Data for Name: cutoff_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4713 (class 0 OID 53054)
-- Dependencies: 240
-- Data for Name: cutoff_to_goal; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4714 (class 0 OID 53057)
-- Dependencies: 241
-- Data for Name: cutoff_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4715 (class 0 OID 53060)
-- Dependencies: 242
-- Data for Name: cutoff_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4716 (class 0 OID 53063)
-- Dependencies: 243
-- Data for Name: cutoff_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4717 (class 0 OID 53066)
-- Dependencies: 244
-- Data for Name: cutoff_to_receipt; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4718 (class 0 OID 53069)
-- Dependencies: 245
-- Data for Name: cutoff_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4719 (class 0 OID 53072)
-- Dependencies: 246
-- Data for Name: cutoff_to_stocktake; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4720 (class 0 OID 53075)
-- Dependencies: 247
-- Data for Name: delivery_to_receipt; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4721 (class 0 OID 53078)
-- Dependencies: 248
-- Data for Name: demand_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4722 (class 0 OID 53081)
-- Dependencies: 249
-- Data for Name: demand_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4723 (class 0 OID 53084)
-- Dependencies: 250
-- Data for Name: goal_to_demand; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4724 (class 0 OID 53087)
-- Dependencies: 251
-- Data for Name: goal_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4725 (class 0 OID 53090)
-- Dependencies: 252
-- Data for Name: goal_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4726 (class 0 OID 53093)
-- Dependencies: 253
-- Data for Name: goal_to_picklist; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4727 (class 0 OID 53096)
-- Dependencies: 254
-- Data for Name: goal_to_reserve; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4728 (class 0 OID 53099)
-- Dependencies: 255
-- Data for Name: issue_to_adjustmentcredit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4729 (class 0 OID 53102)
-- Dependencies: 256
-- Data for Name: issue_to_despatch; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4730 (class 0 OID 53105)
-- Dependencies: 257
-- Data for Name: issue_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4731 (class 0 OID 53108)
-- Dependencies: 258
-- Data for Name: picklist_to_issue; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4732 (class 0 OID 53111)
-- Dependencies: 259
-- Data for Name: receipt_to_adjustmentdebit; Type: TABLE DATA; Schema: binding; Owner: postgres
--



--
-- TOC entry 4733 (class 0 OID 53114)
-- Dependencies: 260
-- Data for Name: receipt_to_rebound; Type: TABLE DATA; Schema: binding; Owner: postgres
--



SET search_path = common, pg_catalog;

--
-- TOC entry 4734 (class 0 OID 53117)
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
-- TOC entry 4735 (class 0 OID 53121)
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
-- TOC entry 4736 (class 0 OID 53128)
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
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 264
-- Name: exception_code_id_seq; Type: SEQUENCE SET; Schema: common; Owner: postgres
--

SELECT pg_catalog.setval('exception_code_id_seq', 1, false);


--
-- TOC entry 4738 (class 0 OID 53136)
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
-- TOC entry 4739 (class 0 OID 53140)
-- Dependencies: 266
-- Data for Name: blocker; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 4741 (class 0 OID 53153)
-- Dependencies: 268
-- Data for Name: head; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 269
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: cutoff; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 1, false);


--
-- TOC entry 4740 (class 0 OID 53146)
-- Dependencies: 267
-- Data for Name: numerator; Type: TABLE DATA; Schema: cutoff; Owner: postgres
--



SET search_path = delivery, pg_catalog;

--
-- TOC entry 4743 (class 0 OID 53166)
-- Dependencies: 270
-- Data for Name: body; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



--
-- TOC entry 4744 (class 0 OID 53172)
-- Dependencies: 271
-- Data for Name: head; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 272
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: delivery; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 20, true);


--
-- TOC entry 4746 (class 0 OID 53186)
-- Dependencies: 273
-- Data for Name: numerator; Type: TABLE DATA; Schema: delivery; Owner: postgres
--



SET search_path = demand, pg_catalog;

--
-- TOC entry 4747 (class 0 OID 53193)
-- Dependencies: 274
-- Data for Name: body; Type: TABLE DATA; Schema: demand; Owner: postgres
--



--
-- TOC entry 4748 (class 0 OID 53199)
-- Dependencies: 275
-- Data for Name: head; Type: TABLE DATA; Schema: demand; Owner: postgres
--



--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 276
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: demand; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 20, true);


--
-- TOC entry 4750 (class 0 OID 53213)
-- Dependencies: 277
-- Data for Name: numerator; Type: TABLE DATA; Schema: demand; Owner: postgres
--



SET search_path = despatch, pg_catalog;

--
-- TOC entry 4751 (class 0 OID 53220)
-- Dependencies: 278
-- Data for Name: body; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



--
-- TOC entry 4752 (class 0 OID 53226)
-- Dependencies: 279
-- Data for Name: head; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 280
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: despatch; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 30, true);


--
-- TOC entry 4754 (class 0 OID 53240)
-- Dependencies: 281
-- Data for Name: numerator; Type: TABLE DATA; Schema: despatch; Owner: postgres
--



SET search_path = goal, pg_catalog;

--
-- TOC entry 4756 (class 0 OID 53254)
-- Dependencies: 283
-- Data for Name: head; Type: TABLE DATA; Schema: goal; Owner: postgres
--



--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 284
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: goal; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 24, true);


--
-- TOC entry 4755 (class 0 OID 53247)
-- Dependencies: 282
-- Data for Name: numerator; Type: TABLE DATA; Schema: goal; Owner: postgres
--



SET search_path = issue, pg_catalog;

--
-- TOC entry 4758 (class 0 OID 53266)
-- Dependencies: 285
-- Data for Name: body; Type: TABLE DATA; Schema: issue; Owner: postgres
--



--
-- TOC entry 4759 (class 0 OID 53272)
-- Dependencies: 286
-- Data for Name: head; Type: TABLE DATA; Schema: issue; Owner: postgres
--



--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 287
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: issue; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 25, true);


--
-- TOC entry 4761 (class 0 OID 53286)
-- Dependencies: 288
-- Data for Name: numerator; Type: TABLE DATA; Schema: issue; Owner: postgres
--



SET search_path = lot, pg_catalog;

--
-- TOC entry 4762 (class 0 OID 53293)
-- Dependencies: 289
-- Data for Name: head; Type: TABLE DATA; Schema: lot; Owner: postgres
--



--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 290
-- Name: head_ib_seq; Type: SEQUENCE SET; Schema: lot; Owner: postgres
--

SELECT pg_catalog.setval('head_ib_seq', 1, false);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 4764 (class 0 OID 53298)
-- Dependencies: 291
-- Data for Name: body; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



--
-- TOC entry 4765 (class 0 OID 53304)
-- Dependencies: 292
-- Data for Name: head; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 293
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: picklist; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 24, true);


--
-- TOC entry 4767 (class 0 OID 53318)
-- Dependencies: 294
-- Data for Name: numerator; Type: TABLE DATA; Schema: picklist; Owner: postgres
--



SET search_path = rebound, pg_catalog;

--
-- TOC entry 4768 (class 0 OID 53330)
-- Dependencies: 296
-- Data for Name: body; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



--
-- TOC entry 4769 (class 0 OID 53336)
-- Dependencies: 297
-- Data for Name: head; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 298
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: rebound; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 20, true);


--
-- TOC entry 4771 (class 0 OID 53350)
-- Dependencies: 299
-- Data for Name: numerator; Type: TABLE DATA; Schema: rebound; Owner: postgres
--



SET search_path = receipt, pg_catalog;

--
-- TOC entry 4772 (class 0 OID 53357)
-- Dependencies: 300
-- Data for Name: body; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



--
-- TOC entry 4773 (class 0 OID 53363)
-- Dependencies: 301
-- Data for Name: head; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 302
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: receipt; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 20, true);


--
-- TOC entry 4775 (class 0 OID 53377)
-- Dependencies: 303
-- Data for Name: numerator; Type: TABLE DATA; Schema: receipt; Owner: postgres
--



SET search_path = reserve, pg_catalog;

--
-- TOC entry 4776 (class 0 OID 53384)
-- Dependencies: 304
-- Data for Name: body; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



--
-- TOC entry 4777 (class 0 OID 53390)
-- Dependencies: 305
-- Data for Name: head; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 306
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: reserve; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 24, true);


--
-- TOC entry 4779 (class 0 OID 53404)
-- Dependencies: 307
-- Data for Name: numerator; Type: TABLE DATA; Schema: reserve; Owner: postgres
--



SET search_path = schedule, pg_catalog;

--
-- TOC entry 4780 (class 0 OID 53411)
-- Dependencies: 308
-- Data for Name: calendar; Type: TABLE DATA; Schema: schedule; Owner: postgres
--



SET search_path = stockcard, pg_catalog;

--
-- TOC entry 4781 (class 0 OID 53414)
-- Dependencies: 309
-- Data for Name: head; Type: TABLE DATA; Schema: stockcard; Owner: postgres
--



SET search_path = stocktake, pg_catalog;

--
-- TOC entry 4782 (class 0 OID 53421)
-- Dependencies: 310
-- Data for Name: body; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



--
-- TOC entry 4783 (class 0 OID 53427)
-- Dependencies: 311
-- Data for Name: head; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 312
-- Name: head_id_seq; Type: SEQUENCE SET; Schema: stocktake; Owner: postgres
--

SELECT pg_catalog.setval('head_id_seq', 20, true);


--
-- TOC entry 4785 (class 0 OID 53439)
-- Dependencies: 313
-- Data for Name: numerator; Type: TABLE DATA; Schema: stocktake; Owner: postgres
--



SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 4228 (class 2606 OID 53477)
-- Name: body_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4230 (class 2606 OID 53479)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4232 (class 2606 OID 53481)
-- Name: head_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4234 (class 2606 OID 53483)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 4236 (class 2606 OID 53485)
-- Name: body_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4238 (class 2606 OID 53487)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4240 (class 2606 OID 53489)
-- Name: head_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4242 (class 2606 OID 53491)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = balance, pg_catalog;

--
-- TOC entry 4244 (class 2606 OID 53493)
-- Name: balance_pkey; Type: CONSTRAINT; Schema: balance; Owner: postgres
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pkey PRIMARY KEY (facility_code, good_code);


SET search_path = binding, pg_catalog;

--
-- TOC entry 4246 (class 2606 OID 53495)
-- Name: cutoff_to_adjustmentcredit_adjustmentcredit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_adjustmentcredit_id_key UNIQUE (adjustmentcredit_id);


--
-- TOC entry 4248 (class 2606 OID 53497)
-- Name: cutoff_to_adjustmentcredit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_pkey PRIMARY KEY (cutoff_id, adjustmentcredit_id);


--
-- TOC entry 4250 (class 2606 OID 53499)
-- Name: cutoff_to_adjustmentdebit_adjustmentdebit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_adjustmentdebit_id_key UNIQUE (adjustmentdebit_id);


--
-- TOC entry 4252 (class 2606 OID 53501)
-- Name: cutoff_to_adjustmentdebit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_pkey PRIMARY KEY (cutoff_id, adjustmentdebit_id);


--
-- TOC entry 4254 (class 2606 OID 53503)
-- Name: cutoff_to_delivery_delivery_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_delivery_id_key UNIQUE (delivery_id);


--
-- TOC entry 4256 (class 2606 OID 53505)
-- Name: cutoff_to_delivery_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_pkey PRIMARY KEY (cutoff_id, delivery_id);


--
-- TOC entry 4258 (class 2606 OID 53507)
-- Name: cutoff_to_demand_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 4260 (class 2606 OID 53509)
-- Name: cutoff_to_demand_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_pkey PRIMARY KEY (cutoff_id, demand_id);


--
-- TOC entry 4262 (class 2606 OID 53511)
-- Name: cutoff_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 4264 (class 2606 OID 53513)
-- Name: cutoff_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_pkey PRIMARY KEY (cutoff_id, despatch_id);


--
-- TOC entry 4266 (class 2606 OID 53515)
-- Name: cutoff_to_goal_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 4268 (class 2606 OID 53517)
-- Name: cutoff_to_goal_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_pkey PRIMARY KEY (cutoff_id, goal_id);


--
-- TOC entry 4270 (class 2606 OID 53519)
-- Name: cutoff_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 4272 (class 2606 OID 53521)
-- Name: cutoff_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_pkey PRIMARY KEY (cutoff_id, issue_id);


--
-- TOC entry 4274 (class 2606 OID 53523)
-- Name: cutoff_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 4276 (class 2606 OID 53525)
-- Name: cutoff_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_pkey PRIMARY KEY (cutoff_id, picklist_id);


--
-- TOC entry 4278 (class 2606 OID 53527)
-- Name: cutoff_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_pkey PRIMARY KEY (cutoff_id, rebound_id);


--
-- TOC entry 4280 (class 2606 OID 53529)
-- Name: cutoff_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 4282 (class 2606 OID 53531)
-- Name: cutoff_to_receipt_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_pkey PRIMARY KEY (cutoff_id, receipt_id);


--
-- TOC entry 4284 (class 2606 OID 53533)
-- Name: cutoff_to_receipt_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 4286 (class 2606 OID 53535)
-- Name: cutoff_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_pkey PRIMARY KEY (cutoff_id, reserve_id);


--
-- TOC entry 4288 (class 2606 OID 53537)
-- Name: cutoff_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 4290 (class 2606 OID 53539)
-- Name: cutoff_to_stocktake_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_pkey PRIMARY KEY (cutoff_id, stocktake_id);


--
-- TOC entry 4292 (class 2606 OID 53541)
-- Name: cutoff_to_stocktake_stocktake_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_stocktake_id_key UNIQUE (stocktake_id);


--
-- TOC entry 4294 (class 2606 OID 53543)
-- Name: delivery_to_receipt_delivery_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_delivery_id_key UNIQUE (delivery_id);


--
-- TOC entry 4296 (class 2606 OID 53545)
-- Name: delivery_to_receipt_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_pkey PRIMARY KEY (delivery_id, receipt_id);


--
-- TOC entry 4298 (class 2606 OID 53547)
-- Name: delivery_to_receipt_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 4300 (class 2606 OID 53549)
-- Name: demand_to_picklist_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 4302 (class 2606 OID 53551)
-- Name: demand_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 4304 (class 2606 OID 53553)
-- Name: demand_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_pkey PRIMARY KEY (demand_id, picklist_id);


--
-- TOC entry 4306 (class 2606 OID 53555)
-- Name: demand_to_reserve_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 4308 (class 2606 OID 53557)
-- Name: demand_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_pkey PRIMARY KEY (demand_id, reserve_id);


--
-- TOC entry 4310 (class 2606 OID 53559)
-- Name: demand_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 4312 (class 2606 OID 53561)
-- Name: goal_to_demand_demand_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_demand_id_key UNIQUE (demand_id);


--
-- TOC entry 4314 (class 2606 OID 53563)
-- Name: goal_to_demand_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 4316 (class 2606 OID 53565)
-- Name: goal_to_demand_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_pkey PRIMARY KEY (goal_id, demand_id);


--
-- TOC entry 4318 (class 2606 OID 53567)
-- Name: goal_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 4320 (class 2606 OID 53569)
-- Name: goal_to_despatch_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 4322 (class 2606 OID 53571)
-- Name: goal_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_pkey PRIMARY KEY (goal_id, despatch_id);


--
-- TOC entry 4324 (class 2606 OID 53573)
-- Name: goal_to_issue_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 4326 (class 2606 OID 53575)
-- Name: goal_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 4328 (class 2606 OID 53577)
-- Name: goal_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_pkey PRIMARY KEY (goal_id, issue_id);


--
-- TOC entry 4330 (class 2606 OID 53579)
-- Name: goal_to_picklist_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 4332 (class 2606 OID 53581)
-- Name: goal_to_picklist_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 4334 (class 2606 OID 53583)
-- Name: goal_to_picklist_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_pkey PRIMARY KEY (goal_id, picklist_id);


--
-- TOC entry 4336 (class 2606 OID 53585)
-- Name: goal_to_reserve_goal_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_goal_id_key UNIQUE (goal_id);


--
-- TOC entry 4338 (class 2606 OID 53587)
-- Name: goal_to_reserve_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_pkey PRIMARY KEY (goal_id, reserve_id);


--
-- TOC entry 4340 (class 2606 OID 53589)
-- Name: goal_to_reserve_reserve_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_reserve_id_key UNIQUE (reserve_id);


--
-- TOC entry 4342 (class 2606 OID 53591)
-- Name: issue_to_adjustmentcredit_adjustmentcredit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_adjustmentcredit_id_key UNIQUE (adjustmentcredit_id);


--
-- TOC entry 4344 (class 2606 OID 53593)
-- Name: issue_to_adjustmentcredit_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 4346 (class 2606 OID 53595)
-- Name: issue_to_adjustmentcredit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_pkey PRIMARY KEY (adjustmentcredit_id, issue_id);


--
-- TOC entry 4348 (class 2606 OID 53597)
-- Name: issue_to_despatch_despatch_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_despatch_id_key UNIQUE (despatch_id);


--
-- TOC entry 4350 (class 2606 OID 53599)
-- Name: issue_to_despatch_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 4352 (class 2606 OID 53601)
-- Name: issue_to_despatch_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_pkey PRIMARY KEY (issue_id, despatch_id);


--
-- TOC entry 4354 (class 2606 OID 53603)
-- Name: issue_to_rebound_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 4356 (class 2606 OID 53605)
-- Name: issue_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_pkey PRIMARY KEY (rebound_id, issue_id);


--
-- TOC entry 4358 (class 2606 OID 53607)
-- Name: issue_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 4360 (class 2606 OID 53609)
-- Name: picklist_to_issue_issue_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_issue_id_key UNIQUE (issue_id);


--
-- TOC entry 4362 (class 2606 OID 53611)
-- Name: picklist_to_issue_picklist_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_picklist_id_key UNIQUE (picklist_id);


--
-- TOC entry 4364 (class 2606 OID 53613)
-- Name: picklist_to_issue_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_pkey PRIMARY KEY (picklist_id, issue_id);


--
-- TOC entry 4366 (class 2606 OID 53615)
-- Name: receipt_to_adjustmentdebit_adjustmentdebit_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_adjustmentdebit_id_key UNIQUE (adjustmentdebit_id);


--
-- TOC entry 4368 (class 2606 OID 53617)
-- Name: receipt_to_adjustmentdebit_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_pkey PRIMARY KEY (adjustmentdebit_id, receipt_id);


--
-- TOC entry 4370 (class 2606 OID 53619)
-- Name: receipt_to_adjustmentdebit_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_receipt_id_key UNIQUE (receipt_id);


--
-- TOC entry 4372 (class 2606 OID 53621)
-- Name: receipt_to_rebound_pkey; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_pkey PRIMARY KEY (rebound_id, receipt_id);


--
-- TOC entry 4374 (class 2606 OID 53623)
-- Name: receipt_to_rebound_rebound_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_rebound_id_key UNIQUE (rebound_id);


--
-- TOC entry 4376 (class 2606 OID 53625)
-- Name: receipt_to_rebound_receipt_id_key; Type: CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_receipt_id_key UNIQUE (receipt_id);


SET search_path = common, pg_catalog;

--
-- TOC entry 4378 (class 2606 OID 53627)
-- Name: cutoff_policy_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY cutoff_policy
    ADD CONSTRAINT cutoff_policy_pkey PRIMARY KEY (document_kind_name);


--
-- TOC entry 4380 (class 2606 OID 53629)
-- Name: document_abbrevation_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY document_abbrevation
    ADD CONSTRAINT document_abbrevation_pkey PRIMARY KEY (doctype);


--
-- TOC entry 4382 (class 2606 OID 53631)
-- Name: exception_code_condition_name_key; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_condition_name_key UNIQUE (condition_name);


--
-- TOC entry 4384 (class 2606 OID 53633)
-- Name: exception_code_errcode_key; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_errcode_key UNIQUE (errcode);


--
-- TOC entry 4386 (class 2606 OID 53635)
-- Name: exception_code_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY exception_code
    ADD CONSTRAINT exception_code_pkey PRIMARY KEY (id);


--
-- TOC entry 4388 (class 2606 OID 53637)
-- Name: stocktake_policy_pkey; Type: CONSTRAINT; Schema: common; Owner: postgres
--

ALTER TABLE ONLY stocktake_policy
    ADD CONSTRAINT stocktake_policy_pkey PRIMARY KEY (document_kind_name);


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 4390 (class 2606 OID 53639)
-- Name: blocker_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY blocker
    ADD CONSTRAINT blocker_pkey PRIMARY KEY (head_id, blocker_document);


--
-- TOC entry 4394 (class 2606 OID 53643)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4396 (class 2606 OID 53645)
-- Name: head_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4392 (class 2606 OID 53641)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = delivery, pg_catalog;

--
-- TOC entry 4398 (class 2606 OID 53647)
-- Name: body_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4400 (class 2606 OID 53649)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4402 (class 2606 OID 53651)
-- Name: head_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4404 (class 2606 OID 53653)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = demand, pg_catalog;

--
-- TOC entry 4406 (class 2606 OID 53655)
-- Name: body_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4408 (class 2606 OID 53657)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4410 (class 2606 OID 53659)
-- Name: head_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4412 (class 2606 OID 53661)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = despatch, pg_catalog;

--
-- TOC entry 4414 (class 2606 OID 53663)
-- Name: body_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4416 (class 2606 OID 53665)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4418 (class 2606 OID 53667)
-- Name: head_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4420 (class 2606 OID 53669)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = goal, pg_catalog;

--
-- TOC entry 4424 (class 2606 OID 53673)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4426 (class 2606 OID 53675)
-- Name: head_pkey; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4422 (class 2606 OID 53671)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: goal; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = issue, pg_catalog;

--
-- TOC entry 4428 (class 2606 OID 53677)
-- Name: body_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4430 (class 2606 OID 53679)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4432 (class 2606 OID 53681)
-- Name: head_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4434 (class 2606 OID 53683)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = lot, pg_catalog;

--
-- TOC entry 4436 (class 2606 OID 53685)
-- Name: head_pkey; Type: CONSTRAINT; Schema: lot; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (ib);


SET search_path = picklist, pg_catalog;

--
-- TOC entry 4438 (class 2606 OID 53687)
-- Name: body_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4440 (class 2606 OID 53689)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4442 (class 2606 OID 53691)
-- Name: head_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4444 (class 2606 OID 53693)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = rebound, pg_catalog;

--
-- TOC entry 4446 (class 2606 OID 53695)
-- Name: body_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4448 (class 2606 OID 53697)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4450 (class 2606 OID 53699)
-- Name: head_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4452 (class 2606 OID 53701)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = receipt, pg_catalog;

--
-- TOC entry 4454 (class 2606 OID 53703)
-- Name: body_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4456 (class 2606 OID 53705)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4458 (class 2606 OID 53707)
-- Name: head_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4460 (class 2606 OID 53709)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = reserve, pg_catalog;

--
-- TOC entry 4462 (class 2606 OID 53711)
-- Name: body_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4464 (class 2606 OID 53713)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4466 (class 2606 OID 53715)
-- Name: head_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4468 (class 2606 OID 53717)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = schedule, pg_catalog;

--
-- TOC entry 4470 (class 2606 OID 53719)
-- Name: calendar_pkey; Type: CONSTRAINT; Schema: schedule; Owner: postgres
--

ALTER TABLE ONLY calendar
    ADD CONSTRAINT calendar_pkey PRIMARY KEY (calendar_date);


SET search_path = stockcard, pg_catalog;

--
-- TOC entry 4473 (class 2606 OID 53721)
-- Name: head_pkey; Type: CONSTRAINT; Schema: stockcard; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (document_gid, good_code);


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 4475 (class 2606 OID 53723)
-- Name: body_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_pkey PRIMARY KEY (head_id, good_code);


--
-- TOC entry 4477 (class 2606 OID 53725)
-- Name: head_gid_key; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_gid_key UNIQUE (gid);


--
-- TOC entry 4479 (class 2606 OID 53727)
-- Name: head_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY head
    ADD CONSTRAINT head_pkey PRIMARY KEY (id);


--
-- TOC entry 4481 (class 2606 OID 53729)
-- Name: numerator_pkey; Type: CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY numerator
    ADD CONSTRAINT numerator_pkey PRIMARY KEY (facility_code, julianized_week);


SET search_path = stockcard, pg_catalog;

--
-- TOC entry 4471 (class 1259 OID 53730)
-- Name: head_document_kind_facility_code_good_code_idx; Type: INDEX; Schema: stockcard; Owner: postgres
--

CREATE INDEX head_document_kind_facility_code_good_code_idx ON head USING btree (document_kind, facility_code, good_code);


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 4546 (class 2620 OID 53731)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4547 (class 2620 OID 53732)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4548 (class 2620 OID 53733)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: adjustmentcredit; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 4549 (class 2620 OID 53734)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4550 (class 2620 OID 53735)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4551 (class 2620 OID 53736)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: adjustmentdebit; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 4552 (class 2620 OID 53737)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: cutoff; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = delivery, pg_catalog;

--
-- TOC entry 4553 (class 2620 OID 53738)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4554 (class 2620 OID 53739)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4555 (class 2620 OID 53740)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: delivery; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = demand, pg_catalog;

--
-- TOC entry 4556 (class 2620 OID 53741)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4557 (class 2620 OID 53742)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4558 (class 2620 OID 53743)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: demand; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = despatch, pg_catalog;

--
-- TOC entry 4559 (class 2620 OID 53744)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4560 (class 2620 OID 53745)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4561 (class 2620 OID 53746)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: despatch; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = goal, pg_catalog;

--
-- TOC entry 4562 (class 2620 OID 53747)
-- Name: set_prev_goal_fsmt; Type: TRIGGER; Schema: goal; Owner: postgres
--

CREATE TRIGGER set_prev_goal_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE set_prev_goal_fsmt();


SET search_path = issue, pg_catalog;

--
-- TOC entry 4563 (class 2620 OID 53748)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4564 (class 2620 OID 53749)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4565 (class 2620 OID 53750)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: issue; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = picklist, pg_catalog;

--
-- TOC entry 4566 (class 2620 OID 53751)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4567 (class 2620 OID 53752)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4568 (class 2620 OID 53753)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: picklist; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = rebound, pg_catalog;

--
-- TOC entry 4569 (class 2620 OID 53754)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4570 (class 2620 OID 53755)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4571 (class 2620 OID 53756)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: rebound; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = receipt, pg_catalog;

--
-- TOC entry 4572 (class 2620 OID 53757)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4573 (class 2620 OID 53758)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4574 (class 2620 OID 53759)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: receipt; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = reserve, pg_catalog;

--
-- TOC entry 4575 (class 2620 OID 53760)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4576 (class 2620 OID 53761)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4577 (class 2620 OID 53762)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: reserve; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 4578 (class 2620 OID 53763)
-- Name: disallow_editing_of_committed_document_body; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_body BEFORE INSERT OR DELETE OR UPDATE ON body FOR EACH ROW EXECUTE PROCEDURE disallow_editing_of_committed_document_body();


--
-- TOC entry 4579 (class 2620 OID 53764)
-- Name: disallow_editing_of_committed_document_head; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER disallow_editing_of_committed_document_head BEFORE DELETE OR UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.disallow_editing_of_committed_document_head();


--
-- TOC entry 4580 (class 2620 OID 53765)
-- Name: set_prev_doc_fsmt; Type: TRIGGER; Schema: stocktake; Owner: postgres
--

CREATE TRIGGER set_prev_doc_fsmt BEFORE UPDATE ON head FOR EACH ROW EXECUTE PROCEDURE common.set_prev_doc_fsmt();


SET search_path = adjustmentcredit, pg_catalog;

--
-- TOC entry 4482 (class 2606 OID 53766)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: adjustmentcredit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = adjustmentdebit, pg_catalog;

--
-- TOC entry 4483 (class 2606 OID 53771)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: adjustmentdebit; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = binding, pg_catalog;

--
-- TOC entry 4484 (class 2606 OID 53776)
-- Name: cutoff_to_adjustmentcredit_adjustmentcredit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_adjustmentcredit_id_fkey FOREIGN KEY (adjustmentcredit_id) REFERENCES adjustmentcredit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4485 (class 2606 OID 53781)
-- Name: cutoff_to_adjustmentcredit_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentcredit
    ADD CONSTRAINT cutoff_to_adjustmentcredit_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4486 (class 2606 OID 53786)
-- Name: cutoff_to_adjustmentdebit_adjustmentdebit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_adjustmentdebit_id_fkey FOREIGN KEY (adjustmentdebit_id) REFERENCES adjustmentdebit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4487 (class 2606 OID 53791)
-- Name: cutoff_to_adjustmentdebit_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_adjustmentdebit
    ADD CONSTRAINT cutoff_to_adjustmentdebit_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4488 (class 2606 OID 53796)
-- Name: cutoff_to_delivery_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4489 (class 2606 OID 53801)
-- Name: cutoff_to_delivery_delivery_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_delivery
    ADD CONSTRAINT cutoff_to_delivery_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES delivery.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4490 (class 2606 OID 53806)
-- Name: cutoff_to_demand_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4491 (class 2606 OID 53811)
-- Name: cutoff_to_demand_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_demand
    ADD CONSTRAINT cutoff_to_demand_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4492 (class 2606 OID 53816)
-- Name: cutoff_to_despatch_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4493 (class 2606 OID 53821)
-- Name: cutoff_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_despatch
    ADD CONSTRAINT cutoff_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4494 (class 2606 OID 53826)
-- Name: cutoff_to_goal_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4495 (class 2606 OID 53831)
-- Name: cutoff_to_goal_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_goal
    ADD CONSTRAINT cutoff_to_goal_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4496 (class 2606 OID 53836)
-- Name: cutoff_to_issue_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4497 (class 2606 OID 53841)
-- Name: cutoff_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_issue
    ADD CONSTRAINT cutoff_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4498 (class 2606 OID 53846)
-- Name: cutoff_to_picklist_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4499 (class 2606 OID 53851)
-- Name: cutoff_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_picklist
    ADD CONSTRAINT cutoff_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4500 (class 2606 OID 53856)
-- Name: cutoff_to_rebound_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4501 (class 2606 OID 53861)
-- Name: cutoff_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_rebound
    ADD CONSTRAINT cutoff_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4502 (class 2606 OID 53866)
-- Name: cutoff_to_receipt_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4503 (class 2606 OID 53871)
-- Name: cutoff_to_receipt_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_receipt
    ADD CONSTRAINT cutoff_to_receipt_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4504 (class 2606 OID 53876)
-- Name: cutoff_to_reserve_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4505 (class 2606 OID 53881)
-- Name: cutoff_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_reserve
    ADD CONSTRAINT cutoff_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4506 (class 2606 OID 53886)
-- Name: cutoff_to_stocktake_cutoff_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_cutoff_id_fkey FOREIGN KEY (cutoff_id) REFERENCES cutoff.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4507 (class 2606 OID 53891)
-- Name: cutoff_to_stocktake_stocktake_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY cutoff_to_stocktake
    ADD CONSTRAINT cutoff_to_stocktake_stocktake_id_fkey FOREIGN KEY (stocktake_id) REFERENCES stocktake.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4508 (class 2606 OID 53896)
-- Name: delivery_to_receipt_delivery_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES delivery.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4509 (class 2606 OID 53901)
-- Name: delivery_to_receipt_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY delivery_to_receipt
    ADD CONSTRAINT delivery_to_receipt_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4510 (class 2606 OID 53906)
-- Name: demand_to_picklist_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4511 (class 2606 OID 53911)
-- Name: demand_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_picklist
    ADD CONSTRAINT demand_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4512 (class 2606 OID 53916)
-- Name: demand_to_reserve_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4513 (class 2606 OID 53921)
-- Name: demand_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY demand_to_reserve
    ADD CONSTRAINT demand_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4514 (class 2606 OID 53926)
-- Name: goal_to_demand_demand_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_demand_id_fkey FOREIGN KEY (demand_id) REFERENCES demand.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4515 (class 2606 OID 53931)
-- Name: goal_to_demand_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_demand
    ADD CONSTRAINT goal_to_demand_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4516 (class 2606 OID 53936)
-- Name: goal_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4517 (class 2606 OID 53941)
-- Name: goal_to_despatch_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_despatch
    ADD CONSTRAINT goal_to_despatch_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4518 (class 2606 OID 53946)
-- Name: goal_to_issue_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4519 (class 2606 OID 53951)
-- Name: goal_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_issue
    ADD CONSTRAINT goal_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4520 (class 2606 OID 53956)
-- Name: goal_to_picklist_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4521 (class 2606 OID 53961)
-- Name: goal_to_picklist_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_picklist
    ADD CONSTRAINT goal_to_picklist_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4522 (class 2606 OID 53966)
-- Name: goal_to_reserve_goal_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_goal_id_fkey FOREIGN KEY (goal_id) REFERENCES goal.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4523 (class 2606 OID 53971)
-- Name: goal_to_reserve_reserve_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY goal_to_reserve
    ADD CONSTRAINT goal_to_reserve_reserve_id_fkey FOREIGN KEY (reserve_id) REFERENCES reserve.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4524 (class 2606 OID 53976)
-- Name: issue_to_adjustmentcredit_adjustmentcredit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_adjustmentcredit_id_fkey FOREIGN KEY (adjustmentcredit_id) REFERENCES adjustmentcredit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4525 (class 2606 OID 53981)
-- Name: issue_to_adjustmentcredit_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_adjustmentcredit
    ADD CONSTRAINT issue_to_adjustmentcredit_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4526 (class 2606 OID 53986)
-- Name: issue_to_despatch_despatch_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_despatch_id_fkey FOREIGN KEY (despatch_id) REFERENCES despatch.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4527 (class 2606 OID 53991)
-- Name: issue_to_despatch_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_despatch
    ADD CONSTRAINT issue_to_despatch_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4528 (class 2606 OID 53996)
-- Name: issue_to_rebound_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4529 (class 2606 OID 54001)
-- Name: issue_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY issue_to_rebound
    ADD CONSTRAINT issue_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4530 (class 2606 OID 54006)
-- Name: picklist_to_issue_issue_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES issue.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4531 (class 2606 OID 54011)
-- Name: picklist_to_issue_picklist_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY picklist_to_issue
    ADD CONSTRAINT picklist_to_issue_picklist_id_fkey FOREIGN KEY (picklist_id) REFERENCES picklist.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4532 (class 2606 OID 54016)
-- Name: receipt_to_adjustmentdebit_adjustmentdebit_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_adjustmentdebit_id_fkey FOREIGN KEY (adjustmentdebit_id) REFERENCES adjustmentdebit.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4533 (class 2606 OID 54021)
-- Name: receipt_to_adjustmentdebit_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_adjustmentdebit
    ADD CONSTRAINT receipt_to_adjustmentdebit_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4534 (class 2606 OID 54026)
-- Name: receipt_to_rebound_rebound_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_rebound_id_fkey FOREIGN KEY (rebound_id) REFERENCES rebound.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4535 (class 2606 OID 54031)
-- Name: receipt_to_rebound_receipt_id_fkey; Type: FK CONSTRAINT; Schema: binding; Owner: postgres
--

ALTER TABLE ONLY receipt_to_rebound
    ADD CONSTRAINT receipt_to_rebound_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES receipt.head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cutoff, pg_catalog;

--
-- TOC entry 4536 (class 2606 OID 54036)
-- Name: blocker_head_id_fkey; Type: FK CONSTRAINT; Schema: cutoff; Owner: postgres
--

ALTER TABLE ONLY blocker
    ADD CONSTRAINT blocker_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = delivery, pg_catalog;

--
-- TOC entry 4537 (class 2606 OID 54041)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: delivery; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = demand, pg_catalog;

--
-- TOC entry 4538 (class 2606 OID 54046)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: demand; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = despatch, pg_catalog;

--
-- TOC entry 4539 (class 2606 OID 54051)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: despatch; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = issue, pg_catalog;

--
-- TOC entry 4540 (class 2606 OID 54056)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: issue; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = picklist, pg_catalog;

--
-- TOC entry 4541 (class 2606 OID 54061)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: picklist; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = rebound, pg_catalog;

--
-- TOC entry 4542 (class 2606 OID 54066)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: rebound; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = receipt, pg_catalog;

--
-- TOC entry 4543 (class 2606 OID 54071)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: receipt; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = reserve, pg_catalog;

--
-- TOC entry 4544 (class 2606 OID 54076)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: reserve; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = stocktake, pg_catalog;

--
-- TOC entry 4545 (class 2606 OID 54081)
-- Name: body_head_id_fkey; Type: FK CONSTRAINT; Schema: stocktake; Owner: postgres
--

ALTER TABLE ONLY body
    ADD CONSTRAINT body_head_id_fkey FOREIGN KEY (head_id) REFERENCES head(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 34
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-19 00:52:34 EET

--
-- PostgreSQL database dump complete
--

