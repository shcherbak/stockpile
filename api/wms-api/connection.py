import psycopg2
from config import config


def connection():
    try:
        params = config()
        conn = psycopg2.connect(**params)
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
    return conn
