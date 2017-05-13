#!/usr/bin/env python

import re
import psycopg2
import psycopg2.extensions
import psycopg2.extras
from config import config

params = config()
conn = psycopg2.connect(**params)
#curs = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
curs = conn.cursor(cursor_factory=psycopg2.extras.NamedTupleCursor)
psycopg2.extras.register_composite('common.document_body', curs, True)
psycopg2.extras.register_composite('common.document_head', curs, True)
psycopg2.extras.register_composite('common.document_type', curs, True)
psycopg2.extras.register_composite('common.goal_head', curs, True)
psycopg2.extras.register_composite('common.inbound_head', curs, True)
psycopg2.extras.register_composite('common.outbound_head', curs, True)
psycopg2.extras.register_composite('common.stoktake_body', curs, True)

r = ('hello', 1, 'world')
curs.execute("select %s::common.document_body;", (r,))


print ("------")
box0 = curs.fetchone()
print (type(box0[0]))
print ("------")
print (box0[0])
print (type(box0[0][1]))


r = ('hello', 1, 'world', 100)
curs.execute("select %s::common.stoktake_body;", (r,))
print ("------")
box0 = curs.fetchone()
print (type(box0[0]))
print ("------")
print (box0[0])
print (type(box0[0][1]))


curs.callproc("demand.get_body", (81,))
print ("------")
box0 = curs.fetchone()
print (type(box0))
print (type(box0[0]))
print (type(box0[0][0]))
print (box0[0][0])
print (box0[0][1])
print ("------")
#print (box0[0])
#print (type(box0[0][1]))


if __name__ == '__main__':
    pass