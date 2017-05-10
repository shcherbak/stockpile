#!/usr/bin/env python

import psycopg2
from psycopg2.extensions import adapt, register_adapter, AsIs
from config import config

#CREATE TYPE common.document_body AS
#   (good_code character varying,
#    quantity common.quantity,
#    uom_code character varying);
#ALTER TYPE common.document_body
#  OWNER TO postgres;


class DocumentBody(object):
    def __init__(self, good_code, quantity, uom_code):
        self.good_code = good_code
        self.quantity = quantity
        self.uom_code = uom_code

    def show(self):
        s = "good_code: %d\tquantity: %d\tuom_code: %d" % (
            self.good_code, self.quantity, self.uom_code)
        return s


def adapt_point(doc):
    good_code = adapt(doc.good_code).getquoted()
    quantity = adapt(doc.quantity).getquoted()
    uom_code = adapt(doc.uom_code).getquoted()
    return AsIs("'(%s, %s, %s)'" % (good_code, quantity, uom_code))

#register_adapter(DocumentBody, adapt_point)


def cast_point(value, re):
    if value is None:
        return None

    m = re.match(r"\(([^)]+),([^)]+),([^)]+)\)", value)
    if m:
        return DocumentBody(m.group(1), m.group(2), m.group(3))
    #else:
    #   raise InterfaceError("bad point representation: %r" % value)


#POINT = psycopg2.extensions.new_type((point_oid,), "POINT", cast_point)
#psycopg2.extensions.register_type(POINT)
DOCUMENT_BODY = psycopg2.extensions.new_type((16602,), "document_body", cast_point)
psycopg2.extensions.register_type(DOCUMENT_BODY)


def get_demand1(__document_id):
    """ get parts provided by a vendor specified by the vendor_id """
    conn = None
    try:
        # read database configuration
        params = config()
        # connect to the PostgreSQL database
        conn = psycopg2.connect(**params)
        # create a cursor object for execution
        cur = conn.cursor()

        # another way to call a stored procedure
        # cur.execute("SELECT * FROM get_parts_by_vendor( %s); ",(vendor_id,))
        cur.callproc('demand.get_body', (__document_id, ))
        # process the result set

        boxes = cur.fetchall()
        print("Found %d boxes with at least a point inside:" % len(boxes))
        for box in boxes:
            print(" ", box[0].show())

        #row = cur.fetchone()
        #while row is not None:
        #    print(row[0].show())
        #    row = cur.fetchone()

        #response = cur.fetchall()
        # close the communication with the PostgreSQL database server

        cur.execute("SELECT quantity FROM demand.body WHERE 0=1")
        print(cur.description)
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
    #return response

if __name__ == '__main__':
    get_demand1(1)
    get_demand1(2)
    get_demand1(81)
