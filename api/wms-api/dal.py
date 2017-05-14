import psycopg2.extras
import psycopg2.extensions
from udt import udt
from connection import connection

class DataAccessLayer():
    def __init__(self):
        self._conn = connection()
        udt(self._conn)


    def __make_body_dictlist(self, body):
        # line <class 'psycopg2.extras.document_body'>
        dictlist_of_records = []
        for line in body[0]['get_body']:
            add_line = {"good_code": line[0], "quanity": line[1], "uom_code": line[2]}
            dictlist_of_records.append(add_line)

        return dictlist_of_records


    def get_document(self, schema, id):
        curs = self._conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)

        curs.callproc((schema + '.get_body'), (id,))
        body = curs.fetchall()

        curs.callproc((schema + '.get_head'), (id,))
        head = curs.fetchall()

        curs.close()

        document = {"head": head[0], "body": self.__make_body_dictlist(body)}

        return document


    def crt_document(self, schema, head, body):
        #_test_head CONSTANT common.outbound_head[] := ARRAY[(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','A1','PROPOSED','DEMAND','B1','2017-02-01')]::common.outbound_head[];
        #_test_body CONSTANT common.document_body[] := ARRAY[('good1',10,'m'), ('good2',20,'m')]::common.document_body[];

        body = [('good1', 10, 'm'), ('good2', 100, 'kg')]
        head = (1, '8c1581c0-04c0-11e7-a843-08626627b4d6', 'DEMAND-01', '2017-01-01', 'A1', 'PROPOSED',
                            'DEMAND', 'B1',
                            '2017-02-01')
        curs = self._conn.cursor()
        curs.execute("SELECT demand.init(%s::common.outbound_head, %s::common.document_body[])", (head, body,))
        id = curs.fetchone()
        self._conn.commit()
        curs.close()

        return id


    def upt_document(self, schema, id):
        pass


    def del_document(self, schema, id):
        curs = self._conn.cursor()
        curs.callproc((schema + '.destroy'), (id,))
        self._conn.commit()
        curs.close()


class DoumentBody(object):
    def __init__(self, good_code, quantity, uom_code):
        self.good_code = good_code
        self.quantity = quantity
        self.uom_code = uom_code

def adapt_body(body):
    g = psycopg2.extensions.adapt(body.good_code).getquoted()
    q = psycopg2.extensions.adapt(body.quantity).getquoted()
    u = psycopg2.extensions.adapt(body.uom_code).getquoted()
    return psycopg2.extensions.AsIs("'(%s, %s, %s)'" % (g, q, u))


class OutboundHead(object):
    #(1,'8c1581c0-04c0-11e7-a843-08626627b4d6','DEMAND-01','2017-01-01','A1','PROPOSED','DEMAND','B1','2017-02-01')
    def __init__(self, document_id, gid, display_name,
                 document_date, facility_code, curr_fsmt,
                 doctype, addressee, due_date):
        self.document_id = document_id
        self.gid = gid
        self.display_name = display_name
        self.document_date = document_date
        self.facility_code = facility_code
        self.curr_fsmt = curr_fsmt
        self.doctype = doctype
        self.addressee = addressee
        self.due_date = due_date

def adapt_head(head):
    a = psycopg2.extensions.adapt(head.document_id).getquoted()
    b = psycopg2.extensions.adapt(head.gid).getquoted()
    c = psycopg2.extensions.adapt(head.display_name).getquoted()
    d = psycopg2.extensions.adapt(head.document_date).getquoted()
    e = psycopg2.extensions.adapt(head.facility_code).getquoted()
    f = psycopg2.extensions.adapt(head.doctype).getquoted()
    g = psycopg2.extensions.adapt(head.addressee).getquoted()
    h = psycopg2.extensions.adapt(head.due_date).getquoted()
    return psycopg2.extensions.AsIs("'(%s, %s, %s, %s, %s, %s, %s, %s)'" % (a, b, c, d, e, f, g, h))


if __name__ == '__main__':
    dal = DataAccessLayer()
    #print(dal.get_document('demand', 81))
    #print(dal.del_document('demand', 81))
    psycopg2.extensions.register_adapter(DoumentBody, adapt_body)
    psycopg2.extensions.register_adapter(OutboundHead, adapt_head)
    #body = DoumentBody[('good1', 10, 'm'), ('good2', 10, 'm')]
    #head = OutboundHead(1, '8c1581c0-04c0-11e7-a843-08626627b4d6', 'DEMAND-01', '2017-01-01', 'A1', 'PROPOSED', 'DEMAND', 'B1',
    #        '2017-02-01')

    id = dal.crt_document('demand', None, None)
    print(id)
