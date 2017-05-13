from udt import udt
from connection import connection

if __name__ == '__main__':
    conn = connection()
    udt(conn)
    curs = conn.cursor()
    r = ('hello', 1, 'world')
    curs.execute("select %s::common.document_body;", (r,))

    print("------")
    box0 = curs.fetchone()
    print(type(box0[0]))
    print("------")
    print(box0[0])
    print(type(box0[0][1]))