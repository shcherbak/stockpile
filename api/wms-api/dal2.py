import re
import psycopg2
import psycopg2.extensions
import psycopg2.extras
from decimal import Decimal
from connection import connection


#from config import config

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
        s = "(%s, %s, %s, %s, %s, %s, %s)" % (i, g, n, d, f, c, t)
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

    DOCUMENT_HEAD = psycopg2.extensions.new_type((oid1,), "DOCUMENT_HEAD", DocumentHead)
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
        s = "(%s, %s, %s, %s, %s, %s, %s)" % (i, g, n, d, f, c, t)
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


def register_common_goal_head(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'goal_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'goal_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    GOAL_HEAD = psycopg2.extensions.new_type((oid1,), "DOCUMENT_HEAD", GoalHead)
    GOAL_HEAD_ARRAY = psycopg2.extensions.new_array_type((oid2,), "DOCUMENT_HEAD_ARRAY", GOAL_HEAD)

    psycopg2.extensions.register_type(GOAL_HEAD, conn_or_curs)
    psycopg2.extensions.register_type(GOAL_HEAD_ARRAY, conn_or_curs)

    return GOAL_HEAD


class OutboundHead(object):

    #psycopg2.extensions.DECIMAL
    #psycopg2.extensions.INTEGER
    #psycopg2.extensions.LONGINTEGER
    psycopg2.extensions.DATE

    def __init__(self, s=None, curs=None):
        self.document_id = 0
        self.gid = ''
        self.display_name = ''
        self.document_date = ''
        self.facility_code = ''
        self.curr_fsmt = ''
        self.doctype = ''
        self.addressee = ''
        self.due_date = ''
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        self.document_id = str(t[0])
        self.gid = str(t[1])
        self.display_name = str(t[2])
        self.document_date = str(t[3])
        self.facility_code = str(t[4])
        self.curr_fsmt = str(t[5])
        self.doctype = str(t[6])
        self.addressee = str(t[7])
        self.due_date = str(t[8])

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3), m.group(4), m.group(5), m.group(6), m.group(7), m.group(8), m.group(9)))
        else:
            raise psycopg2.InterfaceError("bad outbound_head representation: %r" % s)

    def getquoted(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        a = psycopg2.extensions.adapt(self.addressee)
        u = psycopg2.extensions.adapt(self.due_date)
        s = "(%s, %s, %s, %s, %s, %s, %s, %s, %s)" % (i, g, n, d, f, c, t, a, u)
        return s

    def show(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        a = psycopg2.extensions.adapt(self.addressee)
        u = psycopg2.extensions.adapt(self.due_date)
        s = "ID: %s\tGID: %s\tNAME: %s\tDATE: %s\tFCL: %s\tFSMT: %s\tDT: %s\tA: %s\tDDATE: %s" % (i, g, n, d, f, c, t, a, u)
        return s


def register_common_outbound_head(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'outbound_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'outbound_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    OUTBOUND_HEAD = psycopg2.extensions.new_type((oid1,), "OUTBOUND_HEAD", OutboundHead)
    OUTBOUND_HEAD_ARRAY = psycopg2.extensions.new_array_type((oid2,), "OUTBOUND_HEAD_ARRAY", OUTBOUND_HEAD)

    psycopg2.extensions.register_type(OUTBOUND_HEAD, conn_or_curs)
    psycopg2.extensions.register_type(OUTBOUND_HEAD_ARRAY, conn_or_curs)

    return OUTBOUND_HEAD


class InboundHead(object):

    def __init__(self, s=None, curs=None):
        self.document_id = 0
        self.gid = ''
        self.display_name = ''
        self.document_date = ''
        self.facility_code = ''
        self.curr_fsmt = ''
        self.doctype = ''
        self.addresser = ''
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
        self.addresser = str(t[7])


    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3), m.group(4), m.group(5), m.group(6), m.group(7), m.group(8)))
        else:
            raise psycopg2.InterfaceError("bad outbound_head representation: %r" % s)

    def getquoted(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        a = psycopg2.extensions.adapt(self.addresser)
        s = "(%s, %s, %s, %s, %s, %s, %s, %s)" % (i, g, n, d, f, c, t, a)
        return s

    def show(self):
        i = psycopg2.extensions.adapt(self.document_id)
        g = psycopg2.extensions.adapt(self.gid)
        n = psycopg2.extensions.adapt(self.display_name)
        d = psycopg2.extensions.adapt(self.document_date)
        f = psycopg2.extensions.adapt(self.facility_code)
        c = psycopg2.extensions.adapt(self.curr_fsmt)
        t = psycopg2.extensions.adapt(self.doctype)
        a = psycopg2.extensions.adapt(self.addresser)
        s = "ID: %s\tGID: %s\tNAME: %s\tDATE: %s\tFCL: %s\tFSMT: %s\tDT: %s\tDDATE: %s" % (i, g, n, d, f, c, t, a)
        return s


def register_common_inbound_head(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = _get_pg_typname_oid(conn_or_curs, 'common', 'inbound_head')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'common', 'inbound_head')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    INBOUND_HEAD = psycopg2.extensions.new_type((oid1,), "OUTBOUND_HEAD", InboundHead)
    INBOUND_HEAD_ARRAY = psycopg2.extensions.new_array_type((oid2,), "OUTBOUND_HEAD_ARRAY", INBOUND_HEAD)

    psycopg2.extensions.register_type(INBOUND_HEAD, conn_or_curs)
    psycopg2.extensions.register_type(INBOUND_HEAD_ARRAY, conn_or_curs)

    return INBOUND_HEAD


class DataAccessLayer():
    def __init__(self):
        self._conn = connection()
        #udt(self._conn)
        register_common_document_body(conn_or_curs=self._conn)
        register_common_stoktake_body(conn_or_curs=self._conn)
        register_common_document_head(conn_or_curs=self._conn)
        register_common_goal_head(conn_or_curs=self._conn)
        register_common_outbound_head(conn_or_curs=self._conn)
        register_common_inbound_head(conn_or_curs=self._conn)
        psycopg2.extensions.register_type(psycopg2.extensions.UNICODE, self._conn)
        psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY, self._conn)


    def __make_body_dictlist(self, body):
        # line <class 'psycopg2.extras.document_body'>
        dictlist_of_records = []
        for line in body[0]['get_body']:
            add_line = {"good_code": line[0], "quanity": line[1], "uom_code": line[2]}
            dictlist_of_records.append(add_line)

        return dictlist_of_records


    def get_demand(self, id):
        curs = self._conn.cursor()
        curs.execute("SELECT demand.get_body(__document_id := %s)", (id,))
        body = curs.fetchone()
        curs.execute("SELECT demand.get_head(__document_id := %s)", (id,))
        head = curs.fetchone()
        curs.close()

        print (body, "\n" ,head)
        exit(0)

        dictlist_of_records = []
        for line in body['get_body']:
            #print('LINE TYPE IS ', type(line))
            #print(line.getquoted())
            dictlist_of_records.append(line.getquoted())

        dictlist_of_records = []
        #for line in body[0]['get_body']:
            #add_line = {"good_code": line[0], "quanity": line[1], "uom_code": line[2]}
            #dictlist_of_records.append(add_line)
            #print (line.getquoted())
            #print (type(line.getquoted()))


        document = {"head": head['get_head'].getquoted(), "body": body['get_body'][0].getquoted()}
        #document = head
        #document = body[0]

        return document


    def crt_document(self, schema, head, body):
        #_test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','A1','PROPOSED','DEMAND','B1','2017-02-01')]::common.outbound_head[];
        #_test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];

        body = [('good1', 10, 'm'), ('good2', 100, 'kg')]
        head = (1, '8c1581c0-04c0-11e7-a843-08626627b4d6', 'DEMAND-01', '2017-01-01', 'A1', 'PROPOSED',
                            'DEMAND', 'B1',
                            '2017-02-01')
        curs = self._conn.cursor()
        curs.execute("SELECT demand.init(%s::common.outbound_head, %s::common.document_body[])", (head, body,))
        id = curs.fetchone()
        self._conn.commit()
        curs.close()

        return id


    def upt_document(self, schema, id):
        pass


    def del_document(self, schema, id):
        curs = self._conn.cursor()
        curs.execute("SELECT demand.destroy(__document_id := %s)", (id,))
        self._conn.commit()
        curs.close()

class GenericDocument:
    #GET_HEAD_SQL = "SELECT demand.get_head(__document_id := %s)"
    #GET_BODY_SQL = "SELECT demand.get_body(__document_id := %s)"
    #UPDATE_BODY_SQL = "SELECT demand.reinit(__document_id := %s, __body := %s)"
    #DELETE_DOCUMENT_SQL = "SELECT demand.destroy(__document_id := %s)"
    #CREATE_DOCUMENT_SQL = "SELECT demand.init()"

    def __init__(self):
        self._conn = connection()

    def get_head(self, id):
        curs = self._conn.cursor()
        curs.execute(self.GET_HEAD_SQL, (id,))
        self._conn.commit()
        curs.close()

    def get_body(self, id):
        curs = self._conn.cursor()
        curs.execute(self.GET_BODY_SQL, (id,))
        body = curs.fetchone()
        self._conn.commit()
        curs.close()
        return body

    def upt_body(self, id, body):
        curs = self._conn.cursor()
        curs.execute(self.UPDATE_BODY_SQL, (id, body, ))
        self._conn.commit()
        curs.close()

    def del_document(self, id):
        curs = self._conn.cursor()
        curs.execute(self.DELETE_DOCUMENT_SQL, (id,))
        self._conn.commit()
        curs.close()

    def get_document(self, id):
        curs = self._conn.cursor()
        curs.execute(self.GET_HEAD_SQL, (id,))
        self._conn.commit()
        curs.close()

    def create_document(self, id):
        pass

class Demand(GenericDocument):
    GET_HEAD_SQL = "SELECT demand.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT demand.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT demand.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT demand.destroy(__document_id := %s)"
    # CREATE_DOCUMENT_SQL = "SELECT demand.init()"


class Reserve(GenericDocument):
    GET_HEAD_SQL = "SELECT reserve.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT reserve.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT reserve.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT reserve.destroy(__document_id := %s)"
    # CREATE_DOCUMENT_SQL = "SELECT demand.init()"


if __name__ == '__main__':
    #dal = DataAccessLayer()
    #print(dal.get_demand(85))

    d = Demand()
    r = Reserve()
    print (d.get_body(85))
    print (r.get_body(85))
    #print(dal.del_document('demand', 81))

    #body = DoumentBody[('good1', 10, 'm'), ('good2', 10, 'm')]
    #head = OutboundHead(1, '8c1581c0-04c0-11e7-a843-08626627b4d6', 'DEMAND-01', '2017-01-01', 'A1', 'PROPOSED', 'DEMAND', 'B1',
    #        '2017-02-01')

    #id = dal.crt_document('demand', None, None)
    #print(id)