#!/usr/bin/env python

import psycopg2
import psycopg2.extensions
import psycopg2.extras
from config import config


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
        cur.callproc('demand.get_head', (__document_id, ))
        #body = cur.fetchall()
        row = cur.fetchone()

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
    get_demand_body(1)
    get_demand_body(2)
    get_demand_body(81)
    get_demand_head(81)
