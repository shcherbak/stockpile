import psycopg2

from old.api import app

try:
    conn = psycopg2.connect("dbname='template1' user='dbuser' host='localhost' password='dbpass'")
except:
    print ("I am unable to connect to the database")


@app.route('/examples/<int:example_id>', methods=['GET'])
def get_example(example_id):
    """Get one example's details"""
    return "Get 1"