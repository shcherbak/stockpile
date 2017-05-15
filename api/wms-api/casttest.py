import psycopg2
import psycopg2.extensions
from ast import literal_eval as make_tuple
#import whrandom
import random
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

DEC2FLOAT = psycopg2.extensions.new_type(
    psycopg2.extensions.DECIMAL.values,
    'DEC2FLOAT',
    lambda value, curs: float(value) if value is not None else None)
psycopg2.extensions.register_type(DEC2FLOAT)

try:
    curs.execute("CREATE TYPE document_body AS (good_code character varying, quantity double precision, uom_code character varying)")
except:
    conn.rollback()
    curs.execute("DROP TYPE document_body CASCADE")
    curs.execute("CREATE TYPE document_body AS (good_code character varying, quantity double precision, uom_code character varying)")
conn.commit()

try:
    curs.execute("CREATE TABLE test_cast (id integer, bdy document_body, PRIMARY KEY(id))")
except:
    conn.rollback()
    curs.execute("DROP TABLE test_cast")
    curs.execute("CREATE TABLE test_cast (id integer, bdy document_body)")
conn.commit()

class DocumentBody(object):
    """Very simple rectangle. Rect

    Note that we use this type as a data holder, as an adapter of itself for
    the ISQLQuote protocol used by psycopg's adapt() (see __confrom__ below)
    and eventually as a type-caster for the data extracted from the database
    (that's why __init__ takes the curs argument.)
    """

    def __init__(self, s=None, curs=None):
        """Init the rectangle from the optional string s."""
        #self.x = self.y = self.width = self.height = 0.0
        #if s: self.from_string(s)
        self.good_code = ''
        self.quantity = Decimal(0)
        self.uom_code = ''
        if s: self.from_string(s)

    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_tuple(self, t):
        """Init the rectangle from a string."""
        #seq = eval(s)
        self.good_code = str(t[0])
        self.quantity = Decimal(t[1])
        self.uom_code = str(t[2])
        #self.uom_code = psycopg2.extensions.adapt(t[2])
        #self.good_code = psycopg2.extensions.adapt(t[0], DEC2FLOAT)
        #self.quantity = psycopg2.extensions.adapt(t[1])
        #u = psycopg2.extensions.adapt(self.uom_code)
        #s = "(%s, %s, %s)" % (g, q, u)

    def from_string(self, s):
        """Init the rectangle from a string."""
        #t = s.split(",")
        #print ("the value of s : ", s)
        #self.from_tuple((t[0], t[1], t[2]))
        if s is None:
            return None
        #m = re.match(r"\(([^)]+),([^)]+),([^)]+)\)", s)
        m = re.match(r"\((.+),(.+),(.+)\)", s)
        if m:
            self.from_tuple((m.group(1), m.group(2), m.group(3)))\
            #(float(m.group(1)), float(m.group(2)))
        else:
            raise psycopg2.InterfaceError("bad point representation: %r" % s)

    def getquoted(self):
        """Format self as a string usable by the db to represent a box."""
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        s = "(%s, %s, %s)" % (g, q, u)
        return s

    def show(self):
        """Format a description of the box."""
        g = psycopg2.extensions.adapt(self.good_code)
        q = psycopg2.extensions.adapt(self.quantity)
        u = psycopg2.extensions.adapt(self.uom_code)
        s = "GOOD: %s\tQTY: %s\tUOM: %s" % (g, q, u)
        return s


curs.execute("SELECT bdy FROM test_cast WHERE 0=1")
boxoid = curs.description[0][1]
print (curs.description)
print ("Oid for the document_body datatype is", boxoid)

DOCUMENT_BODY = psycopg2.extensions.new_type((boxoid,), "DOCUMENT_BODY", DocumentBody)
psycopg2.extensions.register_type(DOCUMENT_BODY)

p1 = ("goo,d1", 1110.0504, "kg")
p2 = ("good2", '1122.01', "m")
b = DocumentBody()

b.from_tuple(t=p1)

print (b.show())

curs.execute("INSERT INTO test_cast VALUES (1, %s)", (p1, ))
curs.execute("INSERT INTO test_cast VALUES (2, %s)", (p2, ))

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
    #print (type(box[0]))


curs.close()
conn.close()
#
#d = DocumentBody()
#d.from_tuple(('good-1',2.000010,'kg'))
#print(d.show())
#print(d.getquoted())