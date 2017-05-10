#!/usr/bin/env python

#import psycopg2
#import psycopg2.extensions
import psycopg2.extras
from config import config


params = config()
conn = psycopg2.connect(**params)
cur = conn.cursor(cursor_factory=psycopg2.extras.NamedTupleCursor)
psycopg2.extras.register_composite('wms.doc_metadata', conn)
cur.callproc('wms.document_get_metadata', (1, 'DEMAND',))
rec = cur.fetchone()
print (type(rec))
print (rec)
print (rec.gid)