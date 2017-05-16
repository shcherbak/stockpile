import psycopg2
import psycopg2.extensions
import re
from decimal import Decimal
from config import config

# importing psycopg.extras will give us a nice tuple adapter: this is wrong
# because the adapter is meant to be used in SQL IN clauses while we use
# tuples to represent points but it works and the example is about Rect, not
# "Point"
import psycopg2.extras

params = config()
conn = psycopg2.connect(**params)
curs = conn.cursor()


def _get_pg_nspname_oid(conn, nspname):
    _sql = 'select oid from pg_namespace where nspname = %s'
    _connection = conn
    _curs = _connection.cursor()
    _curs.execute(_sql, (nspname,))
    _oid = _curs.fetchone()[0]
    _curs.close()
    return _oid


def _get_pg_typname_oid(conn, nspname, typname):
    _sql = 'select oid from pg_type where typname = %s and typnamespace = %s;'
    _connection = conn
    _nspoid = _get_pg_nspname_oid(_connection, nspname)
    _curs = _connection.cursor()
    _curs.execute(_sql, (typname, _nspoid,))
    _oid = _curs.fetchone()[0]
    _curs.close()
    return _oid


def _get_pg_typarray_oid(conn, nspname, typname):
    _sql = 'select typarray from pg_type where typname = %s and typnamespace = %s'
    _connection = conn
    _nspoid = _get_pg_nspname_oid(_connection, nspname)
    _curs = _connection.cursor()
    _curs.execute(_sql, (typname, _nspoid,))
    _oid = _curs.fetchone()[0]
    _curs.close()
    return _oid


#DEC2FLOAT = psycopg2.extensions.new_type(
#    psycopg2.extensions.DECIMAL.values,
#    'DEC2FLOAT',
#    lambda value, curs: float(value) if value is not None else None)
#psycopg2.extensions.register_type(DEC2FLOAT)


class DocumentBody(object):

    def __init__(self, s=None, curs=None):
        self.good_code = ''
        self.quantity = Decimal(0)
        self.uom_code = ''
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        self.good_code = str(t[0])
        self.quantity = Decimal(t[1])
        self.uom_code = str(t[2])

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3)))
        else:
            raise psycopg2.InterfaceError("bad document_body representation: %r" % s)

    def getquoted(self):
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        s = "(%s, %s, %s)" % (g, q, u)
        return s

    def show(self):
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        s = "GOOD: %s\tQTY: %s\tUOM: %s" % (g, q, u)
        return s


def register_common_document_body(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'document_body')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'document_body')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    DOCUMENT_BODY = psycopg2.extensions.new_type((oid1,), "DOCUMENT_BODY", DocumentBody)
    DOCUMENT_BODY_ARRAY = psycopg2.extensions.new_array_type((oid2,), "DOCUMENT_BODY_ARRAY", DOCUMENT_BODY)

    psycopg2.extensions.register_type(DOCUMENT_BODY, conn_or_curs)
    psycopg2.extensions.register_type(DOCUMENT_BODY_ARRAY, conn_or_curs)

    return DOCUMENT_BODY


class StocktakeBody(object):

    def __init__(self, s=None, curs=None):
        self.good_code = ''
        self.quantity = Decimal(0)
        self.uom_code = ''
        self.quantity_diff = Decimal(0)
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        self.good_code = str(t[0])
        self.quantity = Decimal(t[1])
        self.uom_code = str(t[2])
        self.quantity_diff = Decimal(t[3])

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3), m.group(4)))
        else:
            raise psycopg2.InterfaceError("bad stocktake_body representation: %r" % s)

    def getquoted(self):
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        d = psycopg2.extensions.adapt(self.quantity_diff)
        s = "(%s, %s, %s, %s)" % (g, q, u, d)
        return s

    def show(self):
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        d = psycopg2.extensions.adapt(self.quantity_diff)
        s = "GOOD: %s\tQTY: %s\tUOM: %s\tQTYD: %s" % (g, q, u, d)
        return s


def register_common_stoktake_body(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'stoktake_body')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'stoktake_body')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    STOKTAKE_BODY = psycopg2.extensions.new_type((oid1,), "STOCKTAKE_BODY", StocktakeBody)
    STOKTAKE_BODY_ARRAY = psycopg2.extensions.new_array_type((oid2,), "STOCKTAKE_BODY_ARRAY", STOKTAKE_BODY)

    psycopg2.extensions.register_type(STOKTAKE_BODY, conn_or_curs)
    psycopg2.extensions.register_type(STOKTAKE_BODY_ARRAY, conn_or_curs)

    return STOKTAKE_BODY


class DocumentHead(object):

    def __init__(self, s=None, curs=None):
        self.document_id = 0
        self.gid = ''
        self.display_name = ''
        self.document_date = ''
        self.facility_code = ''
        self.curr_fsmt = ''
        self.doctype = ''
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        self.document_id = t[0]
        self.gid = str(t[1])
        self.display_name = str(t[2])
        self.document_date = str(t[3])
        self.facility_code = str(t[4])
        self.curr_fsmt = str(t[5])
        self.doctype = str(t[6])

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+),(.+),(.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3), m.group(4), m.group(5), m.group(6), m.group(7)))
        else:
            raise psycopg2.InterfaceError("bad document_head representation: %r" % s)

    def getquoted(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        s = "ID: %s\tGID: %s\tNAME: %s\tDATE: %s\tFCL: %s\tFSMT: %s\tDT: %s" % (i, g, n, d, f, c, t)
        return s

    def show(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        s = "ID: %s\tGID: %s\tNAME: %s\tDATE: %s\tFCL: %s\tFSMT: %s\tDT: %s" % (i, g, n, d, f, c, t)
        return s


def register_common_document_head(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'document_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'document_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    DOCUMENT_HEAD = psycopg2.extensions.new_type((oid1,), "DOCUMENT_HEAD", DocumentBody)
    DOCUMENT_HEAD_ARRAY = psycopg2.extensions.new_array_type((oid2,), "DOCUMENT_HEAD_ARRAY", DOCUMENT_HEAD)

    psycopg2.extensions.register_type(DOCUMENT_HEAD, conn_or_curs)
    psycopg2.extensions.register_type(DOCUMENT_HEAD_ARRAY, conn_or_curs)

    return DOCUMENT_HEAD


class GoalHead(object):

    def __init__(self, s=None, curs=None):
        self.document_id = 0
        self.gid = ''
        self.display_name = ''
        self.document_date = ''
        self.facility_code = ''
        self.curr_fsmt = ''
        self.doctype = ''
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        self.document_id = t[0]
        self.gid = str(t[1])
        self.display_name = str(t[2])
        self.document_date = str(t[3])
        self.facility_code = str(t[4])
        self.curr_fsmt = str(t[5])
        self.doctype = str(t[6])

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+),(.+),(.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3), m.group(4), m.group(5), m.group(6), m.group(7)))
        else:
            raise psycopg2.InterfaceError("bad goal_head representation: %r" % s)

    def getquoted(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        s = "ID: %s\tGID: %s\tNAME: %s\tDATE: %s\tFCL: %s\tFSMT: %s\tDT: %s" % (i, g, n, d, f, c, t)
        return s

    def show(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        s = "ID: %s\tGID: %s\tNAME: %s\tDATE: %s\tFCL: %s\tFSMT: %s\tDT: %s" % (i, g, n, d, f, c, t)
        return s


register_common_document_body(conn_or_curs=conn)
register_common_stoktake_body(conn_or_curs=conn)
register_common_document_head(conn_or_curs=conn)

curs.callproc('demand.get_body', (81,))

boxes = curs.fetchall()
print ("Found %d boxes with at least a point inside:" % len(boxes))
for box in boxes:
    print (" ", box[0][0].show())
    print (" ", box[0][0].getquoted())
    print ("TYPE ", type(box))
    print ("TYPE[0] ", type(box[0]))
    print ("TYPE[0][0] ", type(box[0][0]))
