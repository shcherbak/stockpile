import psycopg2.extras
import psycopg2.extensions


curs.execute("SELECT b FROM test_cast WHERE 0=1")
boxoid = curs.description[0][1]
print "Oid for the box datatype is", boxoid

# and build the user cast object
BOX = psycopg2.extensions.new_type((boxoid,), "BOX", Rect)
psycopg2.extensions.register_type(BOX)


def caster(s, cur):
    if s is None:
        return "nada"
    return int(s) * 2


base = psycopg2.extensions.new_type((23,), "INT4", caster)
array = psycopg2.extensions.new_array_type((1007,), "INT4ARRAY", base)

psycopg2.extensions.register_type(array, self.conn)



######
def test_none_fast_path(self):
    # the None adapter is not actually invoked in regular adaptation

    class WonkyAdapter(object):
        def __init__(self, obj):
            pass

        def getquoted(self):
            return "NOPE!"

    curs = self.conn.cursor()

    orig_adapter = ext.adapters[type(None), ext.ISQLQuote]
    try:
        ext.register_adapter(type(None), WonkyAdapter)
        self.assertEqual(ext.adapt(None).getquoted(), "NOPE!")

        s = curs.mogrify("SELECT %s;", (None,))
        self.assertEqual(b"SELECT NULL;", s)

    finally:
        ext.register_adapter(type(None), orig_adapter)
######

def test_register_on_dict(self):
    from psycopg2.extras import Json
    psycopg2.extensions.register_adapter(dict, Json)

    try:
        curs = self.conn.cursor()
        obj = {'a': 123}
        self.assertEqual(curs.mogrify("%s", (obj,)), b"""'{"a": 123}'""")
    finally:
        del psycopg2.extensions.adapters[dict, ext.ISQLQuote]

