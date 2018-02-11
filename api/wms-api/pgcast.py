#!/usr/bin/env python

import datetime
import uuid
from decimal import Decimal

import psycopg2
import psycopg2.extensions as _ext
import psycopg2.extras
import re


def pg_typ_caster(connection, nspname, typname, mapclass):
    def _get_pg_nspname_oid():
        _sql = 'SELECT oid FROM pg_namespace WHERE nspname = %s'
        try:
            _curs = connection.cursor()
            _curs.execute(_sql, (nspname,))
            _oid = _curs.fetchone()[0]
            _curs.close()
            return _oid
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def _get_pg_typname_oid():
        _sql = 'SELECT oid FROM pg_type WHERE typname = %s AND typnamespace = %s;'
        try:
            _nspoid = _get_pg_nspname_oid()
            _curs = connection.cursor()
            _curs.execute(_sql, (typname, _nspoid,))
            _oid = _curs.fetchone()[0]
            _curs.close()
            return _oid
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def _get_pg_typarray_oid():
        _sql = 'SELECT typarray FROM pg_type WHERE typname = %s AND typnamespace = %s'
        try:
            _nspoid = _get_pg_nspname_oid()
            _curs = connection.cursor()
            _curs.execute(_sql, (typname, _nspoid,))
            _oid = _curs.fetchone()[0]
            _curs.close()
            return _oid
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    oid1 = _get_pg_typname_oid()
    oid2 = _get_pg_typarray_oid()

    pg_udf_type = _ext.new_type((oid1,), typname.upper(), mapclass)
    pg_udf_type_array = _ext.new_array_type((oid2,), "{0}_ARRAY".format(typname.upper()), pg_udf_type)

    _ext.register_type(pg_udf_type, connection)
    _ext.register_type(pg_udf_type_array, connection)

    return pg_udf_type



def parse_string_from_dict(dict_object, dict_element):
    try:
        _result = dict_object[dict_element]
    except (Exception, KeyError):
        _result = None
    return _result


def parse_int_from_dict(dict_object, dict_element):
    try:
        if dict_object[dict_element]:
            _result = int(dict_object[dict_element])
        else:
            _result = None
    except (Exception, KeyError):
        _result = None
    return _result


def parse_decimal_from_dict(dict_object, dict_element):
    try:
        if dict_object[dict_element]:
            _result = Decimal(dict_object[dict_element])
        else:
            _result = None
    except (Exception, KeyError):
        _result = None
    return _result


def parse_date_from_dict(dict_object, dict_element):
    try:
        if len(dict_object[dict_element]) > 0:
            _result = date_from_string(dict_object[dict_element])
        else:
            _result = None
    except (Exception, KeyError):
        _result = None
    return _result


def parse_uuid_from_dict(dict_object, dict_element):
    try:
        _result = uuid.UUID(dict_object[dict_element])
    except (Exception, KeyError):
        _result = None
    return _result


def parse_string_from_tuple(tuple_object, tuple_element):
    try:
        _result = tuple_object[tuple_element]
    except (Exception, IndexError):
        _result = None
    return _result


def parse_int_from_tuple(tuple_object, tuple_element):
    try:
        if tuple_object[tuple_element]:
            _result = int(tuple_object[tuple_element])
        else:
            _result = None
    except (Exception, IndexError):
        _result = None
    return _result


def parse_decimal_from_tuple(tuple_object, tuple_element):
    try:
        if tuple_object[tuple_element]:
            _result = Decimal(tuple_object[tuple_element])
        else:
            _result = None
    except (Exception, IndexError):
        _result = None
    return _result


def parse_date_from_tuple(tuple_object, tuple_element):
    try:
        if len(tuple_object[tuple_element]) > 0:
            _result = date_from_string(tuple_object[tuple_element])
        else:
            _result = None
    except (Exception, IndexError):
        _result = None
    return _result


def parse_interval_from_tuple(tuple_object, tuple_element):
    try:
        _result = _ext.PYINTERVAL(tuple_object[tuple_element], None)
    except (Exception, IndexError):
        _result = None
    return _result


def parse_uuid_from_tuple(tuple_object, tuple_element):
    try:
        _result = uuid.UUID(tuple_object[tuple_element])
    except (Exception, IndexError):
        _result = None
    return _result


def date_from_string(str_date):
    if str_date and len(str_date) > 0:
        return datetime.datetime.strptime(str_date, "%Y-%m-%d")
    else:
        return None


def date_to_string(pydate):
    if pydate:
        return pydate.strftime('%Y-%m-%d')
    else:
        return None


def decimal_to_string(pydecimal, precision=4):
    if pydecimal:
        return float('%.4f'%(pydecimal))
    else:
        return None


def uuid_to_string(pyuuid):
    if pyuuid:
        return str(pyuuid)
    else:
        return None


class PgUserTypeMaping(object):
    pg_schm_name = ''
    pg_type_name = ''
    pg_field_list = []

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

    def date_from_py(self, pydate):
        pass

    def date_from_pg(self, sqldate):
        pass

    def decimal_from_py(self, pydecimal):
        pass

    def decimal_from_pg(self, sqlnumeric):
        pass

    def py2pg_adapt(self, o):
        if o is None:
            return 'NULL'
        else:
            if isinstance(o, str):
                return "'{0}'".format(o)
            elif isinstance(o, int):
                return o
            elif isinstance(o, Decimal):
                return o
            elif isinstance(o, datetime.date):
                return _ext.DateFromPy(o)
            elif isinstance(o, datetime.timedelta):
                return _ext.IntervalFromPy(o)
            else:
                #return _ext.adapt(obj=o, alternate=None, protocol=None)
                return _ext.adapt(o, None, None)

    _re_tokenize = re.compile(r"""
      \(? ([,)])                        # an empty token, representing NULL
    | \(? " ((?: [^"] | "")*) " [,)]    # or a quoted string
    | \(? ([^",)]+) [,)]                # or an unquoted string
        """, re.VERBOSE)

    _re_undouble = re.compile(r'(["\\])\1')

    def from_tuple(self, t):
        return self

    def to_tuple(self):
        return ()

    def from_dict(self, d):
        return self

    def to_dict(self):
        return {}

    def __repr__(self):
        return self.repr_helper(self.pg_field_list).format(t=self.pg_type_name, d=self.to_dict())

    def repr_helper(self, field_list):
        result = '{t}=('
        idx = 1
        length = len(field_list)
        for item in field_list:
            if idx < length:
                result = result + "{0}={1}{0}{2} ".format(item, '{d[', ']},')
            else:
                result = result + "{0}={1}{0}{2} ".format(item, '{d[', ']})')
            idx += 1
        return result

    def from_string(self, s):
        rv = []
        for m in self._re_tokenize.finditer(s):
            if m is None:
                raise psycopg2.InterfaceError("bad pgtype representation: %r" % s)
            if m.group(1) is not None:
                rv.append(None)
            elif m.group(2) is not None:
                rv.append(self._re_undouble.sub(r"\1", m.group(2)))
            else:
                rv.append(m.group(3))

        self.from_tuple(tuple(rv))

    def adapt_tuple(self, t):
        result = []
        for i in t:
            result.append(self.py2pg_adapt(i))
        return tuple(result)

    def repr_helper2(self, field_list):
        result = '('
        idx = 0
        length = len(field_list) - 1
        for item in field_list:
            if idx < length:
                result = result + "{1}{0}{2} ".format(idx, '{t[', ']},')
            else:
                result = result + "{1}{0}{2}::{3}.{4} ".format(idx, '{t[', ']})', '{schema}', '{pgtype}')
            idx += 1
        return result

    def getquoted(self):
        tpl = self.adapt_tuple(self.to_tuple())
        #print(self.repr_helper2(self.pg_field_list) \
        #    .format(schema=self.pg_schm_name, pgtype=self.pg_type_name, t=tpl))
        return self.repr_helper2(self.pg_field_list) \
            .format(schema=self.pg_schm_name, pgtype=self.pg_type_name, t=tpl)

    def _complex_string_to_list(self, s):
        if s == '{}':
            return ()
        s = s.replace("{\"", "")
        s = s.replace("\"}", "")
        result = s.split("\",\"")
        if len(result) > 0:
            return tuple(result)
        else:
            return ()

    def _adapt_list_to_dict(self, spec_list):
        _res = []
        for s in spec_list:
            _res.append(s.to_dict())
        return tuple(_res)


class DocumentBody(PgUserTypeMaping):
    pg_schm_name = 'common'
    pg_type_name = 'document_body'
    pg_field_list = ['good_code', 'quantity', 'uom_code']

    def __init__(self, s=None, curs=None):
        self.good_code = None
        self.quantity = None
        self.uom_code = None
        if s:
            self.from_string(s)

    def to_dict(self):
        return {"good_code": self.good_code,
                "quantity": float('%.4f'%(self.quantity)),
                "uom_code": self.uom_code}

    def from_dict(self, d):
        self.good_code = d['good_code']
        self.quantity = Decimal(d['quantity'])
        self.uom_code = d['uom_code']

    def from_tuple(self, t):
        self.good_code = t[0]
        self.quantity = Decimal(t[1])
        self.uom_code = t[2]

    def to_tuple(self):
        return (self.good_code,
                self.quantity,
                self.uom_code)


class StocktakeBody(PgUserTypeMaping):
    pg_schm_name = 'common'
    pg_type_name = 'stocktake_body'
    pg_field_list = ['good_code', 'quantity', 'uom_code', 'quantity_diff']

    def __init__(self, s=None, curs=None):
        self.good_code = None
        self.quantity = None
        self.uom_code = None
        self.quantity_diff = None
        if s:
            self.from_string(s)

    def to_dict(self):
        return {"good_code": self.good_code,
                "quantity": float('%.4f'%(self.quantity)),
                "uom_code": self.uom_code,
                "quantity_diff": float('%.4f'%(self.quantity_diff))}

    def from_dict(self, d):
        self.good_code = d['good_code']
        self.quantity = Decimal(d['quantity'])
        self.uom_code = d['uom_code']
        self.quantity_diff = Decimal(d['quantity_diff'])

    def from_tuple(self, t):
        self.good_code = t[0]
        self.quantity = Decimal(t[1])
        self.uom_code = t[2]
        self.quantity_diff = Decimal(t[3])

    def to_tuple(self):
        return (self.good_code,
                self.quantity,
                self.uom_code,
                self.quantity_diff)


class DocumentHead(PgUserTypeMaping):
    pg_schm_name = 'common'
    pg_type_name = 'document_head'
    pg_field_list = ['document_id', 'gid', 'display_name', 'document_date',
                     'facility_code', 'curr_fsmt', 'doctype']

    def __init__(self, s=None, curs=None):
        self.document_id = None
        self.gid = None
        self.display_name = None
        self.document_date = None
        self.facility_code = None
        self.curr_fsmt = None
        self.doctype = None
        if s:
            self.from_string(s)

    def to_dict(self):
        if self.document_date:
            _document_date = self.document_date.strftime('%Y-%m-%d')
        else:
            _document_date = None
        return {"document_id": self.document_id,
                "gid": self.gid,
                "display_name": self.display_name,
                "document_date": _document_date,
                "facility_code": self.facility_code,
                "curr_fsmt": self.curr_fsmt,
                "doctype": self.doctype}

    def from_dict(self, d):
        if len(d['document_date']) > 0:
            _document_date = datetime.datetime.strptime(d['document_date'], "%Y-%m-%d").date()
        else:
            _document_date = None

        self.document_id = d['document_id']
        self.gid = d['gid']
        self.display_name = d['display_name']
        self.document_date = _document_date
        self.facility_code = d['facility_code']
        self.curr_fsmt = d['curr_fsmt']
        self.doctype = d['doctype']

    def from_tuple(self, t):
        self.document_id = int(t[0])
        self.gid = uuid.UUID(t[1])
        self.display_name = t[2]
        if len(t[3]) > 0:
            self.document_date = datetime.datetime.strptime(t[3], "%Y-%m-%d").date()
        else:
            self.document_date = None
        self.facility_code = t[4]
        self.curr_fsmt = t[5]
        self.doctype = t[6]

    def to_tuple(self):
        return (self.document_id,
                self.gid,
                self.display_name,
                self.document_date,
                self.facility_code,
                self.curr_fsmt,
                self.doctype)


class GoalHead(PgUserTypeMaping):
    pg_schm_name = 'common'
    pg_type_name = 'goal_head'
    pg_field_list = ['document_id', 'gid', 'display_name', 'document_date',
                     'facility_code', 'curr_fsmt', 'doctype']

    def __init__(self, s=None, curs=None):
        self.document_id = None
        self.gid = None
        self.display_name = None
        self.document_date = None
        self.facility_code = None
        self.curr_fsmt = None
        self.doctype = None
        if s:
            self.from_string(s)

    def to_dict(self):
        if self.document_date:
            _document_date = self.document_date.strftime('%Y-%m-%d')
        else:
            _document_date = None
        return {"document_id": self.document_id,
                "gid": self.gid,
                "display_name": self.display_name,
                "document_date": _document_date,
                "facility_code": self.facility_code,
                "curr_fsmt": self.curr_fsmt,
                "doctype": self.doctype}

    def from_dict(self, d):
        if self.document_date:
            _document_date = self.document_date.strftime('%Y-%m-%d')
        else:
            _document_date = None
        self.document_id = d['document_id']
        self.gid = Decimal(d['gid'])
        self.display_name = d['display_name']
        self.document_date = _document_date
        self.facility_code = d['facility_code']
        self.curr_fsmt = d['curr_fsmt']
        self.doctype = d['doctype']

    def from_tuple(self, t):
        self.document_id = int(t[0])
        self.gid = uuid.UUID(t[1])
        self.display_name = t[2]
        if len(t[3]) > 0:
            self.document_date = datetime.datetime.strptime(t[3], "%Y-%m-%d")
        else:
            self.document_date = None
        self.facility_code = t[4]
        self.curr_fsmt = t[5]
        self.doctype = t[6]

    def to_tuple(self):
        return (self.document_id,
                self.gid,
                self.display_name,
                self.document_date,
                self.facility_code,
                self.curr_fsmt,
                self.doctype)


class OutboundHead(PgUserTypeMaping):
    pg_schm_name = 'common'
    pg_type_name = 'outbound_head'
    pg_field_list = ['document_id', 'gid', 'display_name', 'document_date',
                     'facility_code', 'curr_fsmt', 'doctype', 'addressee', 'due_date']

    def __init__(self, s=None, curs=None):
        self.document_id = None
        self.gid = None
        self.display_name = None
        self.document_date = None
        self.facility_code = None
        self.curr_fsmt = None
        self.doctype = None
        self.addressee = None
        self.due_date = None
        if s:
            self.from_string(s)

    def to_dict(self):
        if self.due_date:
            _due_date = self.due_date.strftime('%Y-%m-%d')
        else:
            _due_date = None
        if self.document_date:
            _document_date = self.document_date.strftime('%Y-%m-%d')
        else:
            _document_date = None
        return {"document_id": self.document_id,
                "gid": self.gid,
                "display_name": self.display_name,
                "document_date": _document_date,
                "facility_code": self.facility_code,
                "curr_fsmt": self.curr_fsmt,
                "doctype": self.doctype,
                "addressee": self.addressee,
                "due_date": _due_date}

    def from_dict(self, d):
        if len(d['due_date']) > 0:
            _due_date = datetime.datetime.strptime(d['due_date'], "%Y-%m-%d").date()
        else:
            _due_date = None
        if len(d['document_date']) > 0:
            _document_date = datetime.datetime.strptime(d['document_date'], "%Y-%m-%d").date()
        else:
            _document_date = None
        self.document_id = d['document_id']
        self.gid = d['gid']
        self.display_name = d['display_name']
        self.document_date = _document_date
        self.facility_code = d['facility_code']
        self.curr_fsmt = d['curr_fsmt']
        self.doctype = d['doctype']
        self.addressee = d['addressee']
        self.due_date = _due_date

    def from_tuple(self, t):
        self.document_id = int(t[0])
        self.gid = uuid.UUID(t[1])
        self.display_name = t[2]
        if len(t[3]) > 0:
            self.document_date = datetime.datetime.strptime(t[3], "%Y-%m-%d")
        else:
            self.document_date = None
        self.facility_code = t[4]
        self.curr_fsmt = t[5]
        self.doctype = t[6]
        self.addressee = t[7]
        if len(t[8]) > 0:
            self.due_date = datetime.datetime.strptime(t[8], "%Y-%m-%d")
        else:
            self.due_date = None

    def to_tuple(self):
        return (self.document_id,
                self.gid,
                self.display_name,
                self.document_date,
                self.facility_code,
                self.curr_fsmt,
                self.doctype,
                self.addressee,
                self.due_date)


class InboundHead(PgUserTypeMaping):
    pg_schm_name = 'common'
    pg_type_name = 'inbound_head'
    pg_field_list = ['document_id', 'gid', 'display_name', 'document_date',
                     'facility_code', 'curr_fsmt', 'doctype', 'addresser']

    def __init__(self, s=None, curs=None):
        self.document_id = None
        self.gid = None
        self.display_name = None
        self.document_date = None
        self.facility_code = None
        self.curr_fsmt = None
        self.doctype = None
        self.addresser = None
        if s:
            self.from_string(s)

    def to_dict(self):
        if self.document_date:
            _document_date = self.document_date.strftime('%Y-%m-%d')
        else:
            _document_date = None
        return {"document_id": self.document_id,
                "gid": self.gid,
                "display_name": self.display_name,
                "document_date": _document_date,
                "facility_code": self.facility_code,
                "curr_fsmt": self.curr_fsmt,
                "doctype": self.doctype,
                "addresser": self.addresser}

    def from_dict(self, d):
        if len(d['document_date']) > 0:
            _document_date = datetime.datetime.strptime(d['document_date'], "%Y-%m-%d").date()
        else:
            _document_date = None
        self.document_id = d['document_id']
        self.gid = d['gid']
        self.display_name = d['display_name']
        self.document_date = _document_date
        self.facility_code = d['facility_code']
        self.curr_fsmt = d['curr_fsmt']
        self.doctype = d['doctype']
        self.addresser = d['addresser']

    def from_tuple(self, t):
        self.document_id = int(t[0])
        self.gid = uuid.UUID(t[1])
        self.display_name = t[2]
        if len(t[3]) > 0:
            self.document_date = datetime.datetime.strptime(t[3], "%Y-%m-%d")
        else:
            self.document_date = None
        self.facility_code = t[4]
        self.curr_fsmt = t[5]
        self.doctype = t[6]
        self.addresser = t[7]

    def to_tuple(self):
        return (self.document_id,
                self.gid,
                self.display_name,
                self.document_date,
                self.facility_code,
                self.curr_fsmt,
                self.doctype,
                self.addresser)


def register(conn):
    psycopg2.extras.register_uuid()
    pg_typ_caster(connection=conn, nspname='common', typname='document_body', mapclass=DocumentBody)
    pg_typ_caster(connection=conn, nspname='common', typname='stocktake_body', mapclass=StocktakeBody)
    pg_typ_caster(connection=conn, nspname='common', typname='document_head', mapclass=DocumentHead)
    pg_typ_caster(connection=conn, nspname='common', typname='goal_head', mapclass=GoalHead)
    pg_typ_caster(connection=conn, nspname='common', typname='outbound_head', mapclass=OutboundHead)
    pg_typ_caster(connection=conn, nspname='common', typname='inbound_head', mapclass=InboundHead)
