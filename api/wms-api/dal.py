import psycopg2.extras
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

        print

        document = {"head": head[0], "body": self.__make_body_dictlist(body)}

        return document


if __name__ == '__main__':
    dal = DataAccessLayer()
    print(dal.get_document('demand', 81))