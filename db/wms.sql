--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-03-19 00:51:18 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 33 (class 2615 OID 52097)
-- Name: tests; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tests;


ALTER SCHEMA tests OWNER TO postgres;

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

-- Completed on 2017-03-19 00:51:18 EET

--
-- PostgreSQL database dump complete
--

