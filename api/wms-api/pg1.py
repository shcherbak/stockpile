import psycopg2
import psycopg2.extensions
import psycopg2.extras
import logging

class LoggingCursor(psycopg2.extensions.cursor):
    def execute(self, sql, args=None):
        logger = logging.getLogger('sql_debug')
        logger.info(self.mogrify(sql, args))
        try:
            psycopg2.extensions.cursor.execute(self, sql, args)
        except Exception as exc:
            logger.error("%s: %s" % (exc.__class__.__name__, exc))
            raise


# Connect to an existing database
conn = psycopg2.connect(dbname="wmsdb", user="postgres", password="", host="localhost", port="5432")

# Open a cursor to perform database operations
cur = conn.cursor(cursor_factory=LoggingCursor)
dict_cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

try:
    cur.execute("SELECT * FROM wms.demand;")
    dict_cur.execute("SELECT * FROM wms.demand;")
except psycopg2.Error as e:
    print (e.pgcode)
    print (e.pgerror)
    print (e.diag.severity)
    print (e.diag.message_primary)


# Query the database and obtain data as Python objects
#cur.fetchone()

for record in cur:     # or cur2.fetchone, fetchmany...
    # do something with record
    print (record)
    pass

rec = dict_cur.fetchone()
print(rec['gid'], rec['display_name'])

# Make the changes to the database persistent
#conn.commit()

# Close communication with the database
cur.close()
conn.close()
