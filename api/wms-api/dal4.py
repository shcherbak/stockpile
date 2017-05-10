DSN = "dbname=typetestdb user=postgres host=localhost"

class SimpleQuoter(object):
    def sqlquote(x=None):
        return "'bar'"

import sys
import psycopg2
import psycopg2.extensions

if len(sys.argv) > 1:
    DSN = sys.argv[1]

print ("Opening connection using dsn:", DSN)
conn = psycopg2.connect(DSN)
print ("Encoding for this connection is", conn.encoding)

curs = conn.cursor()
curs.execute("SELECT 'text'::text AS foo")
textoid = curs.description[0][1]
print ("Oid for the text datatype is", textoid)

curs.execute("select (1,1)::mytype AS foo;")
myoid = curs.description[0][1]
print ("Oid for the mytype datatype is", myoid)


def castMytype(s, curs):
    if s is not None: return "mytype (%s) " + s
TYPEMYTYPE = psycopg2.extensions.new_type((myoid,), "TYPEMYTYPE", castMytype)


def castA(s, curs):
    if s is not None: return "(A) " + s
TYPEA = psycopg2.extensions.new_type((textoid,), "TYPEA", castA)

def castB(s, curs):
    if s is not None: return "(B) " + s
TYPEB = psycopg2.extensions.new_type((textoid,), "TYPEB", castB)

curs = conn.cursor()
curs.execute("SELECT 'some text.'::text AS foo")
print ("Some text from plain connection:", curs.fetchone()[0])

psycopg2.extensions.register_type(TYPEA, conn)
curs = conn.cursor()
curs.execute("SELECT 'some text.'::text AS foo")
print ("Some text from connection with typecaster:", curs.fetchone()[0])

curs = conn.cursor()
psycopg2.extensions.register_type(TYPEB, curs)
curs.execute("SELECT 'some text.'::text AS foo")
print ("Some text from cursor with typecaster:", curs.fetchone()[0])

curs = conn.cursor()
curs.execute("SELECT 'some text.'::text AS foo")
print ("Some text from connection with typecaster again:", curs.fetchone()[0])

curs = conn.cursor()
curs.execute("select (1,1)::mytype AS foo;")
print ("Some text from connection with typecaster again:", curs.fetchone()[0])

curs = conn.cursor()
curs.callproc('myfnc')
print ("Some text from connection with typecaster again:", curs.fetchone())