#!/usr/bin/env python

import psycopg2
from config import config


def connection():
    try:
        params = config()
        conn = psycopg2.connect(**params)
        #conn.set_client_encoding('UTF8')
        #print(conn.encoding)
        #print(conn.protocol_version)
        #print(conn.server_version)
        return conn
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
