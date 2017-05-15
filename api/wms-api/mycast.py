import psycopg2.extras
import psycopg2.extensions
from udt import udt
from connection import connection

class DocumentBodyAdapter:
    def __init__(self, elem):
        self.elem = elem

    def getquoted(self):
        return "%s::common.document_body" % psycopg2.extensions.adapt(self.elem)

class DataAccessLayer():
    def __init__(self):
        self._conn = connection()
        udt(self._conn)

    def fnc1(self):
        curs = self._conn.cursor()
        curs.execute("Select NULL::common.document_body")
        # SELECT oid FROM pg_type where typname = 'document_body'
        head = curs.fetchall()
        textoid = curs.description[0][1]
        print ("document_body oid: ", textoid)
        print (head)

    def fnc2(self):
        curs = self._conn.cursor()
        elem = DocumentBodyAdapter(('good', 1, 'kg'))
        print (psycopg2.extensions.adapt(elem).getquoted())
        curs.execute("Select %s", (elem,))
        head = curs.fetchall()
        curs.close()
        print (head)

psycopg2.extensions.register_adapter(DocumentBodyAdapter, DocumentBodyAdapter)

#def caster(s, cur):
#    if s is None:
#        return "nada"
#    return int(s) * 2


#base = psycopg2.extensions.new_type((23,), "INT4", caster)
#array = psycopg2.extensions.new_array_type((1007,), "INT4ARRAY", base)
#
#psycopg2.extensions.register_type(array, self.conn)


class Rect(object):
    """Very simple rectangle.
    Note that we use this type as a data holder, as an adapter of itself for
    the ISQLQuote protocol used by psycopg's adapt() (see __confrom__ below)
    and eventually as a type-caster for the data extracted from the database
    (that's why __init__ takes the curs argument.)
    """

    def __init__(self, s=None, curs=None):
        """Init the rectangle from the optional string s."""
        self.x = self.y = self.width = self.height = 0.0
        if s: self.from_string(s)

    def __conform__(self, proto):
        """This is a terrible hack, just ignore proto and return self."""
        if proto == psycopg2.extensions.ISQLQuote:
            return self

    def from_points(self, x0, y0, x1, y1):
        """Init the rectangle from points."""
        if x0 > x1: (x0, x1) = (x1, x0)
        if y0 > y1: (y0, y1) = (y1, y0)
        self.x = x0
        self.y = y0
        self.width = x1 - x0
        self.height = y1 - y0

    def from_string(self, s):
        """Init the rectangle from a string."""
        seq = eval(s)
        self.from_points(seq[0][0], seq[0][1], seq[1][0], seq[1][1])

    def getquoted(self):
        """Format self as a string usable by the db to represent a box."""
        s = "'((%d,%d),(%d,%d))'" % (
            self.x, self.y, self.x + self.width, self.y + self.height)
        return s

    def show(self):
        """Format a description of the box."""
        s = "X: %d\tY: %d\tWidth: %d\tHeight: %d" % (
            self.x, self.y, self.width, self.height)


        return s





################
#################

# a type, dbtype and adapter for PostgreSQL inet type

class Inet(object):

    def __init__(self, addr):
        self.addr = addr

    def __repr__(self):
        return "%s(%r)" % (self.__class__.__name__, self.addr)

    def prepare(self, conn):
        self._conn = conn

    def getquoted(self):
        obj = psycopg2.extensions.adapt(self.addr)
        if hasattr(obj, 'prepare'):
            obj.prepare(self._conn)
        return obj.getquoted() + b"::inet"

    def __conform__(self, proto):
        if proto is psycopg2.ISQLQuote:
            return self

    def __str__(self):
        return str(self.addr)


def register_inet1(oid=None, conn_or_curs=None):

    if not oid:
        oid1 = 869
        oid2 = 1041
    elif isinstance(oid, (list, tuple)):
        oid1, oid2 = oid
    else:
        oid1 = oid
        oid2 = 1041

    INET1 = psycopg2.extensions.new_type((oid1, ), "INET1",
            lambda data, cursor: data and Inet(data) or None)
    INET1ARRAY = psycopg2.extensions.new_array_type((oid2, ), "INET1ARRAY", INET1)

    psycopg2.extensions.register_type(INET1, conn_or_curs)
    psycopg2.extensions.register_type(INET1ARRAY, conn_or_curs)

    return INET1



#  select typarray from pg_type where typname = 'document_body' and typnamespace = 16412; --16601 oid of array
# select oid from pg_type where typname = 'document_body' and typnamespace = 16412; 16602 oid of basetype
# select oid from pg_namespace where nspname = 'common'; -- 16412

dal = DataAccessLayer()
register_inet1()
dal.fnc1()
#dal.fnc2()