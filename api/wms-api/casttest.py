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

try:
    curs.execute("CREATE TYPE document_body AS (good_code character varying, quantity numeric(16,4), uom_code character varying)")
except:
    conn.rollback()
    curs.execute("DROP TYPE document_body CASCADE")
    curs.execute("CREATE TYPE document_body AS (good_code character varying, quantity numeric(16,4), uom_code character varying)")
conn.commit()

try:
    curs.execute("CREATE TABLE test_cast (id integer, bdy document_body, PRIMARY KEY(id))")
except:
    conn.rollback()
    curs.execute("DROP TABLE test_cast")
    curs.execute("CREATE TABLE test_cast (id integer, bdy document_body)")
conn.commit()

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
        oid1 = _get_pg_typname_oid(conn_or_curs, 'public', 'document_body')
        oid2 = _get_pg_typarray_oid(conn_or_curs, 'public', 'document_body')
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        print ('error')

    DOCUMENT_BODY = psycopg2.extensions.new_type((oid1,), "DOCUMENT_BODY", DocumentBody)
    DOCUMENT_BODY_ARRAY = psycopg2.extensions.new_array_type((oid2,), "DOCUMENT_BODY_ARRAY", DOCUMENT_BODY)

    psycopg2.extensions.register_type(DOCUMENT_BODY, conn_or_curs)
    psycopg2.extensions.register_type(DOCUMENT_BODY_ARRAY, conn_or_curs)

    return DOCUMENT_BODY

register_common_document_body(conn_or_curs=conn)

#curs.execute("SELECT bdy FROM test_cast WHERE 0=1")
#boxoid = curs.description[0][1]
#print (curs.description)
#print ("Oid for the document_body datatype is", boxoid)
#
#DOCUMENT_BODY = psycopg2.extensions.new_type((boxoid,), "DOCUMENT_BODY", DocumentBody)
#psycopg2.extensions.register_type(DOCUMENT_BODY)


p1 = ("goo,d1", 1110.05049, "kg")
p2 = ("good2", '1122.0198901', "m")
p3 = ("good3", Decimal(1110.05049), "kg")
#b = DocumentBody()
#
#b.from_tuple(p1)
#print (b.show())
#b.from_tuple(p2)
#print (b.show())
#b.from_tuple(p3)
#print (b.show())

curs.execute("INSERT INTO test_cast VALUES (1, %s)", (p1, ))
curs.execute("INSERT INTO test_cast VALUES (2, %s)", (p2, ))
curs.execute("INSERT INTO test_cast VALUES (3, %s)", (p3, ))

print ("Added 1 row to the database")
conn.commit()
# select and print all boxes with at least one point inside
curs.execute("SELECT bdy FROM test_cast")

boxes = curs.fetchall()
print ("Found %d boxes with at least a point inside:" % len(boxes))
for box in boxes:
    print (" ", box[0].show())
    print (" ", box[0].getquoted())
    print ("TYPE ", type(box[0].quantity))
    print (type(box[0]))


curs.close()
conn.close()