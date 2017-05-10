#!/usr/bin/env python

import psycopg2
from config import config


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
    print_type_oid()
