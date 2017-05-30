#!/usr/bin/env python

import psycopg2.extras


def udt(conn):
    psycopg2.extras.register_composite('common.document_body', conn, True)
    psycopg2.extras.register_composite('common.document_head', conn, True)
    psycopg2.extras.register_composite('common.document_type', conn, True)
    psycopg2.extras.register_composite('common.goal_head', conn, True)
    psycopg2.extras.register_composite('common.inbound_head', conn, True)
    psycopg2.extras.register_composite('common.outbound_head', conn, True)
    psycopg2.extras.register_composite('common.stocktake_body', conn, True)
