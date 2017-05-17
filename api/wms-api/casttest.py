import psycopg2
import psycopg2.extensions
import re
from decimal import Decimal
from config import config

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

#try:
#    curs.execute("CREATE TYPE document_body AS (good_code character varying, quantity numeric(16,4), uom_code character varying, due_date date)")
#except:
#    conn.rollback()
#    curs.execute("DROP TYPE document_body CASCADE")
#    curs.execute("CREATE TYPE document_body AS (good_code character varying, quantity numeric(16,4), uom_code character varying, due_date date)")
#conn.commit()

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
        self.due_date = ''
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        self.good_code = str(t[0])
        self.quantity = Decimal(t[1])
        self.uom_code = str(t[2])
        self.due_date = str(t[3])

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\((.+),(.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3), m.group(4)))
        else:
            raise psycopg2.InterfaceError("bad document_body representation: %r" % s)

    def getquoted(self):
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        d = psycopg2.extensions.adapt(self.due_date)
        s = "(%s, %s, %s, %s)" % (g, q, u, d)
        return s

    def show(self):
        g = str(psycopg2.extensions.adapt(self.good_code))
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        d = psycopg2.extensions.adapt(self.due_date)

        s = "GOOD: %s\tQTY: %s\tUOM: %s %s" % (g, q, u, d)
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
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE, curs)
psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY, curs)


p1 = ("goo,d1", 1110.05049, "kg", "2017-01-01")
p2 = ("g", '1122.0198901', "m", "2017-01-01")
p3 = ("good3", Decimal(1110.05049), "kg", "2017-01-01")
#b = DocumentBody()
#
#b.from_tuple(p1)
#print (b.show())
#b.from_tuple(p2)
#print (b.show())
#b.from_tuple(p3)
#print (b.show())

print (conn.encoding)

curs.execute("INSERT INTO test_cast VALUES (1, %s)", (p1, ))
curs.execute("INSERT INTO test_cast VALUES (2, %s)", (p2, ))
curs.execute("INSERT INTO test_cast VALUES (3, %s)", (p3, ))

print ("Added Ї row to the database")
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


print ("/////////////////////////////")
curs.callproc('public.f001')
print (curs.query)
boxes = curs.fetchall()
print ("Found %d boxes with at least a point inside:" % len(boxes))
for box in boxes:
    #print (" ", box[0].show())
    #print (" ", box[0].getquoted())
    #print ("TYPE ", type(box[0].quantity))
    print (type(box))
    print(box)
    print (type(box[0]))
    print(box[0])


print ("/////////////////////////////")
curs.execute('select public.f001()')
print (curs.query)
boxes = curs.fetchall()
print ("Found %d boxes with at least a point inside:" % len(boxes))
for box in boxes:
    #print (" ", box[0].show())
    #print (" ", box[0].getquoted())
    #print ("TYPE ", type(box[0].quantity))
    print (type(box))
    print(box)
    print (type(box[0]))
    print(box[0])

#curs.execute("select to_json('a'::text)")
#boxes = curs.fetchall()
#print (type(boxes))

#curs.execute(
#    sql.SQL("insert into %s values (%%s)") % [sql.Identifier("my_table")],
#    [42])

#>>> cur.execute(
#...     """INSERT INTO some_table (an_int, a_date, a_string)
#...         VALUES (%s, %s, %s);""",
#...     (10, datetime.date(2005, 11, 18), "O'Reilly"))


#>>> dt = datetime.datetime.now()
#>>> dt
#datetime.datetime(2010, 2, 8, 1, 40, 27, 425337)
#
#>>> cur.mogrify("SELECT %s, %s, %s;", (dt, dt.date(), dt.time()))
#"SELECT '2010-02-08T01:40:27.425337', '2010-02-08', '01:40:27.425337';"
#
#>>> cur.mogrify("SELECT %s;", (dt - datetime.datetime(2010,1,1),))
#"SELECT '38 days 6027.425337 seconds';"


#conn = psycopg2.connect(DSN)
#
#with conn:
#    with conn.cursor() as curs:
#        curs.execute(SQL1)
#
#with conn:
#    with conn.cursor() as curs:
#        curs.execute(SQL2)


#>>> cur.execute(
#...     """INSERT INTO some_table (an_int, a_date, another_date, a_string)
#...         VALUES (%(int)s, %(date)s, %(date)s, %(str)s);""",
#...     {'int': 10, 'str': "O'Reilly", 'date': datetime.date(2005, 11, 18)})

conn.close()

curs.close()
conn.close()