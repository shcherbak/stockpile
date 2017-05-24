#!/usr/bin/env python

import datetime
import re
import uuid
import json
from decimal import Decimal

import psycopg2
import psycopg2.extensions as _ext
import psycopg2.extras

from connection import connection


# psycopg2.extensions.register_type(psycopg2.extensions.UNICODE)
# psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY)
# psycopg2.extras.register_uuid()

# DEC2FLOAT = _ext.new_type(
#    _ext.DECIMAL.values,
#    'DEC2FLOAT',
#    lambda value, curs: float(value) if value is not None else None)
# _ext.register_type(DEC2FLOAT)
# from config import config

# self._conn.set_client_encoding('UTF8')
# _ext.register_type(_ext.UNICODE, self._conn)
# _ext.register_type(_ext.UNICODEARRAY, self._conn)
# _ext.register_type(_ext.DATE, self._conn)
# _ext.register_type(_ext.DECIMAL, self._conn)
# _ext.register_type(_ext.LONGINTEGER, self._conn)

tst_json = """
{
  "body": [
    {
      "good_code": "good1", 
      "quantity": 10.0, 
      "uom_code": "kg"
    }, 
    {
      "good_code": "good2", 
      "quantity": 10.0, 
      "uom_code": "kg"
    }
  ], 
  "head": {
    "addressee": "B1", 
    "curr_fsmt": "PROPOSED", 
    "display_name": "DM-01", 
    "doctype": "DEMAND", 
    "document_date": "2017-02-01", 
    "document_id": null, 
    "due_date": "2017-02-02", 
    "facility_code": "A1", 
    "gid": "b3dbaf2c-3f1c-11e7-b691-d4bed939923a"
  }
}
"""

#loaded_o = json.loads(tst_json)
#print (loaded_o['head'])
#print (loaded_o['body'])

def _get_pg_nspname_oid(conn, nspname):
    _sql = 'SELECT oid FROM pg_namespace WHERE nspname = %s'
    _connection = conn
    _curs = _connection.cursor()
    _curs.execute(_sql, (nspname,))
    _oid = _curs.fetchone()[0]
    _curs.close()
    return _oid


def _get_pg_typname_oid(conn, nspname, typname):
    _sql = 'SELECT oid FROM pg_type WHERE typname = %s AND typnamespace = %s;'
    _connection = conn
    _nspoid = _get_pg_nspname_oid(_connection, nspname)
    _curs = _connection.cursor()
    _curs.execute(_sql, (typname, _nspoid,))
    _oid = _curs.fetchone()[0]
    _curs.close()
    return _oid


def _get_pg_typarray_oid(conn, nspname, typname):
    _sql = 'SELECT typarray FROM pg_type WHERE typname = %s AND typnamespace = %s'
    _connection = conn
    _nspoid = _get_pg_nspname_oid(_connection, nspname)
    _curs = _connection.cursor()
    _curs.execute(_sql, (typname, _nspoid,))
    _oid = _curs.fetchone()[0]
    _curs.close()
    return _oid


def _adapt(o):
    if o is None:
        return 'NULL'
    else:
        if isinstance(o, str):
            return "'{0}'".format(o)
        else:
            # return _ext.adapt(obj=o, alternate=None, protocol=None)
            return _ext.adapt(o)


class DocumentBody(object):
    def __init__(self, s=None, curs=None):
        self.good_code = ''
        self.quantity = Decimal(0)
        self.uom_code = ''
        if s:
            self.from_string(s)

    def __repr__(self):
        return "{0}(good_code={1}, quantity={2}, uom_code={3})" \
            .format(type(self).__name__,
                    self.good_code,
                    str(self.quantity),
                    self.uom_code)

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

    def to_dict(self):
        return {"good_code": self.good_code,
                "quantity": float(self.quantity),
                "uom_code": self.uom_code}

    def from_dict(self, d):
        self.good_code = d['good_code']
        self.quantity = Decimal(d['quantity'])
        self.uom_code = d['uom_code']

    def from_tuple(self, t):
        self.good_code = t[0]
        self.quantity = Decimal(t[1])
        self.uom_code = t[2]

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?\)", s)
        if m:
            self.from_tuple((m.group(1),
                             m.group(2),
                             m.group(3)))
        else:
            raise psycopg2.InterfaceError("bad document_body representation: %r" % s)

    def getquoted(self):
        return "({0}, {1}, {2})::common.document_body"\
            .format(_adapt(self.good_code),
                    _adapt(self.quantity),
                    _adapt(self.uom_code))


def register_common_document_body(oid=None, conn_or_curs=None):
    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'document_body')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'document_body')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print('error')
        exit(1)

    DOCUMENT_BODY = _ext.new_type((oid1,), "DOCUMENT_BODY", DocumentBody)
    DOCUMENT_BODY_ARRAY = _ext.new_array_type((oid2,), "DOCUMENT_BODY_ARRAY", DOCUMENT_BODY)

    _ext.register_type(DOCUMENT_BODY, conn_or_curs)
    _ext.register_type(DOCUMENT_BODY_ARRAY, conn_or_curs)

    return DOCUMENT_BODY


class StocktakeBody(object):
    def __init__(self, s=None, curs=None):
        self.good_code = ''
        self.quantity = Decimal(0)
        self.uom_code = ''
        self.quantity_diff = Decimal(0)
        if s:
            self.from_string(s)

    def __repr__(self):
        return "stocktake_body(good_code={0}, quantity={1}, uom_code={2}, quantity_diff={3})" \
            .format(self.good_code,
                    self.quantity,
                    self.uom_code,
                    self.quantity_diff)

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

    def to_dict(self):
        return {"good_code": self.good_code,
                "quantity": float(self.quantity),
                "uom_code": self.uom_code,
                "quantity_diff": float(self.quantity_diff)}

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

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?\)", s)
        if m:
            self.from_tuple((m.group(1),
                             m.group(2),
                             m.group(3),
                             m.group(4)))
        else:
            raise psycopg2.InterfaceError("bad stocktake_body representation: %r" % s)

    def getquoted(self):
        return "({0}, {1}, {2}, {3})::common.stocktake_body"\
            .format(_adapt(self.good_code),
                    _adapt(self.quantity),
                    _adapt(self.uom_code),
                    _adapt(self.quantity_diff))


def register_common_stoktake_body(oid=None, conn_or_curs=None):
    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'stoktake_body')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'stoktake_body')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print('error')

    STOKTAKE_BODY = _ext.new_type((oid1,), "STOCKTAKE_BODY", StocktakeBody)
    STOKTAKE_BODY_ARRAY = _ext.new_array_type((oid2,), "STOCKTAKE_BODY_ARRAY", STOKTAKE_BODY)

    _ext.register_type(STOKTAKE_BODY, conn_or_curs)
    _ext.register_type(STOKTAKE_BODY_ARRAY, conn_or_curs)

    return STOKTAKE_BODY


class DocumentHead(object):
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

    def __repr__(self):
        return "document_head(document_id={0}, gid={1}, display_name={2}, document_date={3}, facility_code={4}, curr_fsmt={5}, doctype={6})". \
            format(self.document_id,
                   self.gid,
                   self.display_name,
                   self.document_date,
                   self.facility_code,
                   self.curr_fsmt,
                   self.doctype)

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

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
            self.document_date = datetime.datetime.strptime(t[3], "%Y-%m-%d")
        else:
            self.document_date = None
        self.facility_code = t[4]
        self.curr_fsmt = t[5]
        self.doctype = t[6]

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?\)", s)
        if m:
            self.from_tuple((m.group(1),
                             m.group(2),
                             m.group(3),
                             m.group(4),
                             m.group(5),
                             m.group(6),
                             m.group(7)))
        else:
            raise psycopg2.InterfaceError("bad document_head representation: %r" % s)

    def getquoted(self):
        return "({0}, {1}, {2}, {3}, {4}, {5}, {6})" \
            .format(_adapt(self.document_id),
                    _adapt(self.gid),
                    _adapt(self.display_name),
                    _adapt(self.document_date),
                    _adapt(self.facility_code),
                    _adapt(self.curr_fsmt),
                    _adapt(self.doctype))


def register_common_document_head(oid=None, conn_or_curs=None):
    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'document_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'document_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print('error')

    DOCUMENT_HEAD = _ext.new_type((oid1,), "DOCUMENT_HEAD", DocumentHead)
    DOCUMENT_HEAD_ARRAY = _ext.new_array_type((oid2,), "DOCUMENT_HEAD_ARRAY", DOCUMENT_HEAD)

    _ext.register_type(DOCUMENT_HEAD, conn_or_curs)
    _ext.register_type(DOCUMENT_HEAD_ARRAY, conn_or_curs)

    return DOCUMENT_HEAD


class GoalHead(object):
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

    def __repr__(self):
        return "goal_head(document_id={0}, gid={1}, display_name={2}, document_date={3}, facility_code={4}, curr_fsmt={5}, doctype={6})". \
            format(self.document_id,
                   self.gid,
                   self.display_name,
                   self.document_date,
                   self.facility_code,
                   self.curr_fsmt,
                   self.doctype)

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

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

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?\)", s)
        if m:
            self.from_tuple((m.group(1),
                             m.group(2),
                             m.group(3),
                             m.group(4),
                             m.group(5),
                             m.group(6),
                             m.group(7)))
        else:
            raise psycopg2.InterfaceError("bad goal_head representation: %r" % s)

    def getquoted(self):
        return "({0}, {1}, {2}, {3}, {4}, {5}, {6})" \
            .format(_adapt(self.document_id),
                    _adapt(self.gid),
                    _adapt(self.display_name),
                    _adapt(self.document_date),
                    _adapt(self.facility_code),
                    _adapt(self.curr_fsmt),
                    _adapt(self.doctype))


def register_common_goal_head(oid=None, conn_or_curs=None):
    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'goal_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'goal_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print('error')

    GOAL_HEAD = _ext.new_type((oid1,), "DOCUMENT_HEAD", GoalHead)
    GOAL_HEAD_ARRAY = _ext.new_array_type((oid2,), "DOCUMENT_HEAD_ARRAY", GOAL_HEAD)

    _ext.register_type(GOAL_HEAD, conn_or_curs)
    _ext.register_type(GOAL_HEAD_ARRAY, conn_or_curs)

    return GOAL_HEAD


class OutboundHead(object):
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

    def __repr__(self):
        return "outbound_head(document_id={0}, gid={1}, display_name={2}, document_date={3}, facility_code={4}, curr_fsmt={5}, doctype={6}, addressee={7}, due_date={8})" \
            .format(self.document_id,
                    self.gid,
                    self.display_name,
                    self.document_date,
                    self.facility_code,
                    self.curr_fsmt,
                    self.doctype,
                    self.addressee,
                    self.due_date)

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

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

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

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?\)", s)
        if m:
            self.from_tuple((m.group(1),
                             m.group(2),
                             m.group(3),
                             m.group(4),
                             m.group(5),
                             m.group(6),
                             m.group(7),
                             m.group(8),
                             m.group(9)))
        else:
            raise psycopg2.InterfaceError("bad outbound_head representation: %r" % s)

    def getquoted(self):
        return "({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8})::common.outbound_head" \
            .format(_adapt(self.document_id),
                    _adapt(self.gid),
                    _adapt(self.display_name),
                    _adapt(self.document_date),
                    _adapt(self.facility_code),
                    _adapt(self.curr_fsmt),
                    _adapt(self.doctype),
                    _adapt(self.addressee),
                    _adapt(self.due_date))


def register_common_outbound_head(oid=None, conn_or_curs=None):
    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'outbound_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'outbound_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print('error')

    OUTBOUND_HEAD = _ext.new_type((oid1,), "OUTBOUND_HEAD", OutboundHead)
    OUTBOUND_HEAD_ARRAY = _ext.new_array_type((oid2,), "OUTBOUND_HEAD_ARRAY", OUTBOUND_HEAD)

    _ext.register_type(OUTBOUND_HEAD, conn_or_curs)
    _ext.register_type(OUTBOUND_HEAD_ARRAY, conn_or_curs)

    return OUTBOUND_HEAD


class InboundHead(object):
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

    def __repr__(self):
        return "inbound_head(document_id={0}, gid={1}, display_name={2}, document_date={3}, facility_code={4}, curr_fsmt={5}, doctype={6}, addresser={7})" \
            .format(self.document_id,
                    self.gid,
                    self.display_name,
                    self.document_date,
                    self.facility_code,
                    self.curr_fsmt,
                    self.doctype,
                    self.addresser)

    def __conform__(self, proto):
        if proto == _ext.ISQLQuote:
            return self

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

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?,(\"[^\"]*\"|[^,]+)?\)", s)
        if m:
            self.from_tuple((m.group(1),
                             m.group(2),
                             m.group(3),
                             m.group(4),
                             m.group(5),
                             m.group(6),
                             m.group(7),
                             m.group(8)))
        else:
            raise psycopg2.InterfaceError("bad inbound_head representation: %r" % s)

    def getquoted(self):
        return "({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})" \
            .format(_adapt(self.document_id),
                    _adapt(self.gid),
                    _adapt(self.display_name),
                    _adapt(self.document_date),
                    _adapt(self.facility_code),
                    _adapt(self.curr_fsmt),
                    _adapt(self.doctype),
                    _adapt(self.addresser))


def register_common_inbound_head(oid=None, conn_or_curs=None):
    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'inbound_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'inbound_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print('error')

    INBOUND_HEAD = _ext.new_type((oid1,), "OUTBOUND_HEAD", InboundHead)
    INBOUND_HEAD_ARRAY = _ext.new_array_type((oid2,), "OUTBOUND_HEAD_ARRAY", INBOUND_HEAD)

    _ext.register_type(INBOUND_HEAD, conn_or_curs)
    _ext.register_type(INBOUND_HEAD_ARRAY, conn_or_curs)

    return INBOUND_HEAD


class GenericDocument:
    GET_HEAD_SQL = ""
    GET_BODY_SQL = ""
    UPDATE_BODY_SQL = ""
    DELETE_DOCUMENT_SQL = ""
    CREATE_DOCUMENT_SQL = ""
    COMMIT_DOCUMENT_SQL = ""
    DECOMMIT_DOCUMENT_SQL = ""

    def __init__(self, document_id=None):
        self._conn = connection()
        psycopg2.extras.register_uuid()
        register_common_document_body(conn_or_curs=self._conn)
        register_common_stoktake_body(conn_or_curs=self._conn)
        register_common_document_head(conn_or_curs=self._conn)
        register_common_goal_head(conn_or_curs=self._conn)
        register_common_outbound_head(conn_or_curs=self._conn)
        register_common_inbound_head(conn_or_curs=self._conn)
        if document_id:
            self.head = self.get_head(document_id)
            self.body = self.get_body(document_id)
        else:
            self.head = DocumentHead()
            self.body = [DocumentBody]

    def get_head(self, document_id):
        curs = self._conn.cursor()
        curs.execute(self.GET_HEAD_SQL, (document_id,))
        head = curs.fetchone()[0]
        print(curs.query)
        self._conn.commit()
        curs.close()
        return head

    def get_body(self, document_id):
        curs = self._conn.cursor()
        curs.execute(self.GET_BODY_SQL, (document_id,))
        body = curs.fetchone()[0]
        print(curs.query)
        self._conn.commit()
        curs.close()
        return body

    def update_body(self, document_id, body):
        curs = self._conn.cursor()
        curs.execute(self.UPDATE_BODY_SQL, (document_id, body,))
        print(curs.query)
        self._conn.commit()
        curs.close()

    def delete_document(self, document_id):
        curs = self._conn.cursor()
        curs.execute(self.DELETE_DOCUMENT_SQL, (document_id,))
        print(curs.query)
        self._conn.commit()
        curs.close()

    def get_document(self, document_id):
        head = self.get_head(document_id)
        body = self.get_body(document_id)
        return head, body

    def create_document(self, head, body):
        curs = self._conn.cursor()
        curs.execute(self.CREATE_DOCUMENT_SQL, (head, body,))
        print(curs.query)
        document_id = curs.fetchone()[0]
        self._conn.commit()
        curs.close()
        return document_id

    def to_dict(self):
        _body = []
        for row in self.body:
            _body.append(row.to_dict())
        return {"head": self.head.to_dict(), "body": _body}

    def from_dict(self, d):
        self.head = DocumentHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = DocumentBody()
            b.from_dict(row)
            self.body.append(b)
        return self.create_document(self.head, self.body)

    def do_commit(self, document_id, apprise=True):
        curs = self._conn.cursor()
        curs.execute(self.COMMIT_DOCUMENT_SQL, (document_id, apprise,))
        print(curs.query)
        self._conn.commit()
        curs.close()

    def do_decommit(self, document_id, apprise=True):
        curs = self._conn.cursor()
        curs.execute(self.DECOMMIT_DOCUMENT_SQL, (document_id, apprise,))
        print(curs.query)
        self._conn.commit()
        curs.close()


class OutboundDocument(GenericDocument):
    def from_dict(self, d):
        self.head = OutboundHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = DocumentBody()
            b.from_dict(row)
            self.body.append(b)
        return self.create_document(self.head, self.body)


class InboundDocument(GenericDocument):
    def from_dict(self, d):
        self.head = InboundHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = DocumentBody()
            b.from_dict(row)
            self.body.append(b)
        return self.create_document(self.head, self.body)



class Delivery(InboundDocument):
    GET_HEAD_SQL = "SELECT delivery.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT delivery.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT delivery.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT delivery.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT delivery.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT delivery.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT delivery.do_decommit(__document_id := %s, __apprise := %s)"


class Demand(OutboundDocument):
    GET_HEAD_SQL = "SELECT demand.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT demand.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT demand.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT demand.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT demand.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT demand.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT demand.do_decommit(__document_id := %s, __apprise := %s)"


class Despatch(OutboundDocument):
    GET_HEAD_SQL = "SELECT despatch.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT despatch.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT despatch.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT despatch.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT despatch.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT despatch.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT despatch.do_decommit(__document_id := %s, __apprise := %s)"


class Issue(OutboundDocument):
    GET_HEAD_SQL = "SELECT issue.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT issue.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT issue.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT issue.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT issue.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT issue.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT issue.do_decommit(__document_id := %s, __apprise := %s)"


class Picklist(OutboundDocument):
    GET_HEAD_SQL = "SELECT picklist.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT picklist.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT picklist.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT picklist.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT picklist.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT picklist.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT picklist.do_decommit(__document_id := %s, __apprise := %s)"


class Rebound(InboundDocument):
    GET_HEAD_SQL = "SELECT rebound.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT rebound.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT rebound.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT rebound.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT rebound.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT rebound.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT rebound.do_decommit(__document_id := %s, __apprise := %s)"


class Receipt(InboundDocument):
    GET_HEAD_SQL = "SELECT receipt.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT receipt.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT receipt.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT receipt.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT receipt.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT receipt.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT receipt.do_decommit(__document_id := %s, __apprise := %s)"


class Reserve(OutboundDocument):
    GET_HEAD_SQL = "SELECT reserve.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT reserve.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT reserve.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT reserve.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT reserve.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT reserve.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT reserve.do_decommit(__document_id := %s, __apprise := %s)"


class Stocktake(GenericDocument):
    GET_HEAD_SQL = "SELECT stocktake.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT stocktake.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT stocktake.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT stocktake.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT stocktake.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT stocktake.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT stocktake.do_decommit(__document_id := %s, __apprise := %s)"


class GenericDocumentList:
    GET_LSIT_SQL = ""

    def __init__(self, facility=None, sdate=None, edate=None):
        self.facility_code = None
        if facility:
            self.facility_code = facility
        self.date_start = None
        if sdate:
            self.date_start = sdate
        self.date_end = None
        if edate:
            self.date_end = edate
        self._conn = connection()
        psycopg2.extras.register_uuid()
        register_common_document_body(conn_or_curs=self._conn)
        register_common_stoktake_body(conn_or_curs=self._conn)
        register_common_document_head(conn_or_curs=self._conn)
        register_common_goal_head(conn_or_curs=self._conn)
        register_common_outbound_head(conn_or_curs=self._conn)
        register_common_inbound_head(conn_or_curs=self._conn)

    def get_document_list(self):
        curs = self._conn.cursor()
        curs.execute(self.GET_LSIT_SQL, (self.facility_code, self.date_start, self.date_end,))
        document_list = curs.fetchone()[0]
        self._conn.commit()
        curs.close()
        return document_list

    def to_dict(self):
        result_list = []
        list_in = self.get_document_list()
        for row in list_in:
            result_list.append(row.to_dict())
        return result_list


class DeliveryList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT delivery.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class DemandList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT demand.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class DespatchList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT despatch.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class IssueList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT issue.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class PicklistList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT picklist.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class ReboundList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT rebound.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class ReceiptList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT receipt.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class ReserveList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT reserve.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class StocktakeList(GenericDocumentList):
    GET_LSIT_SQL = "SELECT stocktake.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


if __name__ == '__main__':
    # dal = DataAccessLayer()
    # print(dal.get_demand(85))
    # d1 = Delivery(85)
    # d2 = Despatch(85)
    # d3 = Demand(85)
    # dl3 = DemandList()

    #h = OutboundHead()
    #h.due_date = datetime.datetime.now().date() + datetime.timedelta(days=1)
    #h.document_date = datetime.datetime.now().date()
    #h.facility_code = 'A1'
    #h.addressee = 'B1'
    #h.gid = uuid.uuid4()

    #b = DocumentBody()
    #b.quantity = 10.0093
    #b.uom_code = 'kg'
    #b.good_code = 'goo d1'

    #b1 = DocumentBody()
    #b1.quantity = 10.0
    #b1.uom_code = 'kg'
    #b1.good_code = 'товар №1'

    #d = Demand()
    # d.head = h
    # d.body = [b]

    #d_id = d.create_document(h, [b, b1])
    #print("doc id is ", d_id)

    #print(psycopg2.extensions.DateFromPy(h.due_date))

    #dl = DemandList().to_dict()
    #print (dl)
    #print (type(dl))
    #for l in dl:
    #    print (l)

    #print(dl)
    # d4 = Issue(85)
    # d5 = Picklist(85)
    # d6 = Rebound(85)
    # d7 = Receipt(85)
    # d8 = Reserve(85)
    # d9 = Stocktake(85)
    # print (d.head)
    # print (d.body)
    # print(d1.to_dict())
    # print(d2.to_dict())
    # print(d3.to_dict())
    # print(d4.to_dict())
    # print(d5.to_dict())
    # print(d6.to_dict())
    # print(d7.to_dict())
    # print(d8.to_dict())
    # print(d9.to_dict())
    #print (json.loads(tst_json))
    demand = Demand()
    demand.from_dict(json.loads(tst_json))
    print (demand.head, demand.body)