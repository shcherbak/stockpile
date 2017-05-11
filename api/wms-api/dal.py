#!/usr/bin/env python
import psycopg2
import psycopg2.extensions
import psycopg2.extras
from config import config


class CommonDocumentHead_adapter(object):

    def __init__(self, document_id, gid, display_name, document_date, facility_code, curr_fsmt, doctype):
        self._document_id = document_id
        self._gid = gid
        self._display_name = display_name
        self._document_date = document_date
        self._facility_code = facility_code
        self._curr_fsmt = curr_fsmt
        self._doctype = doctype

    def __conform__(self, proto):
        if proto is psycopg2.extensions.ISQLQuote:
            return self

    def getquoted(self):
        return ("'%s'::common.document_head" % self._document_id).encode('utf8')

    def __str__(self):
        return "'%s'::common.document_head" % self._document_id



def register_document_head(oids=None, conn_or_curs=None):
    import uuid

    if not oids:
        oid1 = 2950
        oid2 = 2951
    elif isinstance(oids, (list, tuple)):
        oid1, oid2 = oids
    else:
        oid1 = oids
        oid2 = 2951

    DOCUMENT_HEAD = psycopg2.extras.new_type((oid1, ), "DOCUMENT_HEAD",
            lambda data, cursor: data and uuid.UUID(data) or None)
    DOCUMENT_HEAD_ARRAY = psycopg2.extras.new_array_type((oid2,), "DOCUMENT_HEAD[]", DOCUMENT_HEAD)

    psycopg2.extras.register_type(DOCUMENT_HEAD, conn_or_curs)
    psycopg2.extras.register_type(DOCUMENT_HEAD_ARRAY, conn_or_curs)
    psycopg2.extras.register_adapter(DOCUMENT_HEAD, CommonDocumentHead_adapter)

    return DOCUMENT_HEAD


def castDocumentHead(s, curs):
    if s is not None: return "(DocumentHead) " + s

def get_demand_body(__document_id):
    """ get parts provided by a vendor specified by the vendor_id """
    conn = None
    body = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        #cur = conn.cursor(cursor_factory=psycopg2.extras.NamedTupleCursor)
        cur = conn.cursor()
        cur.callproc('demand.get_body', (__document_id, ))
        #body = cur.fetchall()
        row = cur.fetchone()
        print(type(row))

        while row is not None:
            print(row)
            row = cur.fetchone()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
    return body



def get_demand_head(__document_id):
    """ get parts provided by a vendor specified by the vendor_id """
    conn = None
    body = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor(cursor_factory=psycopg2.extras.NamedTupleCursor)
        #cur = conn.cursor()
        psycopg2.extras.register_composite('common.document_head', cur)
        cur.callproc('demand.get_head', (__document_id, ))
        #body = cur.fetchall()
        row = cur.fetchone()
        print(type(row))

        while row is not None:
            print(row)
            row = cur.fetchone()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
    return body



def get_demand(f):
    return f;

if __name__ == '__main__':
    get_demand_body(81)
    get_demand_head(81)
