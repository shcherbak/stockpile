#!/usr/bin/env python

import re
import psycopg2
import psycopg2.extensions
from config import config


#CREATE TYPE public.c_txt AS
#   (a character varying,
#    b character varying);
#ALTER TYPE public.c_txt
#  OWNER TO postgres;

class CTxt(object):

    def __init__(self, s=None, curs=None):

        self.a = ''
        self.b = ''

        if s:
            self.from_string(s)


    def __conform__(self, proto):
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_string(self, s):
        if s is None:
            return None
        m = re.match(r"\(([^)]+),([^)]+)\)", s)
        print (m)
        print (m.group(1))
        print (m.group(2))
        if m:
            return (m.group(1), m.group(2))
        else:
            raise psycopg2.extensions.InterfaceError("bad point representation: %r" % s)

    def getquoted(self):
        """Format self as a string usable by the db to represent a box."""
        s = "'(%s,%s)'" % (self.a, self.b)
        return s

    def show(self):
        """Format a description of the box."""
        s = "A: %s\tB: %s" % (self.a, self.b)
        return s


params = config()
conn = psycopg2.connect(**params)
curs = conn.cursor()
curs.execute("select ('a','b')::public.c_txt as foo")
ctxt_oid = curs.description[0][1]
print (("Oid for the box datatype is"), ctxt_oid)
C_TXT = psycopg2.extensions.new_type((ctxt_oid,), "C_TXT", CTxt)
psycopg2.extensions.register_type(C_TXT)

curs.execute("select ('a','b')::public.c_txt as foo1")
curs.execute("select ('c','d')::public.c_txt as foo2")
boxes = curs.fetchall()
print ("Found %d boxes with at least a point inside:" % len(boxes))
for box in boxes:
    print (" ", box[0].show())





def print_type_oid():
    conn = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute("SELECT NULL::common.quantity;")
        print(cur.description)
        cur.execute("SELECT NULL::common.document_body;")
        print(cur.description)
        cur.execute("SELECT NULL::common.document_body[];")
        print(cur.description)
        cur.execute("SELECT NULL::common.document_head;")
        print(cur.description)
        cur.execute("SELECT NULL::common.document_head[];")
        print(cur.description)
        cur.execute("SELECT NULL::common.outbound_head;")
        print(cur.description)
        cur.execute("SELECT NULL::common.outbound_head[];")
        print(cur.description)
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()


if __name__ == '__main__':
    #print_type_oid()
    c_txt = CTxt()
    print(c_txt.from_string("(abc,dfg)"))
    print ("A", c_txt.a)
    pass