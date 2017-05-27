#!/usr/bin/env python

import pgcast
import psycopg2.extras
from connection import connection


def _register_cast(conn):
    psycopg2.extras.register_uuid()
    pgcast.register_common_document_body(conn_or_curs=conn)
    pgcast.register_common_stoktake_body(conn_or_curs=conn)
    pgcast.register_common_document_head(conn_or_curs=conn)
    pgcast.register_common_goal_head(conn_or_curs=conn)
    pgcast.register_common_outbound_head(conn_or_curs=conn)
    pgcast.register_common_inbound_head(conn_or_curs=conn)


class BaseDocument:
    GET_HEAD_SQL = None
    GET_BODY_SQL = None
    UPDATE_BODY_SQL = None
    DELETE_DOCUMENT_SQL = None
    CREATE_DOCUMENT_SQL = None
    COMMIT_DOCUMENT_SQL = None
    DECOMMIT_DOCUMENT_SQL = None

    def __init__(self, document_id=None):
        self._conn = connection()
        _register_cast(self._conn)
        if document_id:
            self.load(document_id)
        else:
            self.head = None
            self.body = None

    def init(self):
        try:
            curs = self._conn.cursor()
            curs.execute(self.CREATE_DOCUMENT_SQL, (self.head, self.body,))
            print(curs.query)
            document_id = curs.fetchone()[0]
            self._conn.commit()
            curs.close()
            return document_id
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
        #finally:
        #    if conn is not None:
        #        conn.close()

    def reinit(self, document_id):
        try:
            curs = self._conn.cursor()
            curs.execute(self.UPDATE_BODY_SQL, (document_id, self.body,))
            print(curs.query)
            self._conn.commit()
            curs.close()
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def load(self, document_id):
        self._load_head(document_id)
        self._load_body(document_id)

    def delete(self, document_id):
        try:
            curs = self._conn.cursor()
            curs.execute(self.DELETE_DOCUMENT_SQL, (document_id,))
            print(curs.query)
            self._conn.commit()
            curs.close()
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def commit(self, document_id, apprise=True):
        try:
            curs = self._conn.cursor()
            curs.execute(self.COMMIT_DOCUMENT_SQL, (document_id, apprise,))
            print(curs.query)
            self._conn.commit()
            curs.close()
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def decommit(self, document_id, apprise=True):
        curs = self._conn.cursor()
        curs.execute(self.DECOMMIT_DOCUMENT_SQL, (document_id, apprise,))
        print(curs.query)
        self._conn.commit()
        curs.close()

    def _load_head(self, document_id):
        try:
            curs = self._conn.cursor()
            curs.execute(self.GET_HEAD_SQL, (document_id,))
            # print(curs.query)
            self.head = curs.fetchone()[0]
            self._conn.commit()
            curs.close()
            # return head
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def _load_body(self, document_id):
        try:
            curs = self._conn.cursor()
            curs.execute(self.GET_BODY_SQL, (document_id,))
            # print(curs.query)
            self.body = curs.fetchone()[0]
            self._conn.commit()
            curs.close()
            # return body
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)

    def to_dict(self):
        _body = []
        for row in self.body:
            _body.append(row.to_dict())
        return {"head": self.head.to_dict(), "body": _body}

    def from_dict(self, d):
        self.head = pgcast.DocumentHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = pgcast.DocumentBody()
            b.from_dict(row)
            self.body.append(b)
            # return self.create_document(self.head, self.body)

    def to_json(self):
        return "json string {0}".format(self)

    def from_json(self, json):
        self.head = json
        self.body = json
        # return self


class OutboundDocument(BaseDocument):
    def from_dict(self, d):
        self.head = pgcast.OutboundHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = pgcast.DocumentBody()
            b.from_dict(row)
            self.body.append(b)
            # return self.create_document(self.head, self.body)


class InboundDocument(BaseDocument):
    def from_dict(self, d):
        self.head = pgcast.InboundHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = pgcast.DocumentBody()
            b.from_dict(row)
            self.body.append(b)
            # return self.create_document(self.head, self.body)


class Delivery(InboundDocument):
    GET_HEAD_SQL = "SELECT delivery.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT delivery.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT delivery.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT delivery.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT delivery.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT delivery.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT delivery.do_decommit(__document_id := %s, __apprise := %s)"


class Demand(OutboundDocument):
    GET_HEAD_SQL = "SELECT demand.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT demand.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT demand.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT demand.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT demand.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT demand.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT demand.do_decommit(__document_id := %s, __apprise := %s)"


class Despatch(OutboundDocument):
    GET_HEAD_SQL = "SELECT despatch.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT despatch.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT despatch.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT despatch.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT despatch.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT despatch.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT despatch.do_decommit(__document_id := %s, __apprise := %s)"


class Issue(OutboundDocument):
    GET_HEAD_SQL = "SELECT issue.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT issue.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT issue.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT issue.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT issue.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT issue.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT issue.do_decommit(__document_id := %s, __apprise := %s)"


class Picklist(OutboundDocument):
    GET_HEAD_SQL = "SELECT picklist.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT picklist.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT picklist.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT picklist.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT picklist.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT picklist.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT picklist.do_decommit(__document_id := %s, __apprise := %s)"


class Rebound(InboundDocument):
    GET_HEAD_SQL = "SELECT rebound.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT rebound.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT rebound.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT rebound.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT rebound.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT rebound.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT rebound.do_decommit(__document_id := %s, __apprise := %s)"


class Receipt(InboundDocument):
    GET_HEAD_SQL = "SELECT receipt.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT receipt.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT receipt.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT receipt.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT receipt.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT receipt.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT receipt.do_decommit(__document_id := %s, __apprise := %s)"


class Reserve(OutboundDocument):
    GET_HEAD_SQL = "SELECT reserve.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT reserve.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT reserve.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT reserve.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT reserve.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT reserve.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT reserve.do_decommit(__document_id := %s, __apprise := %s)"

class Cutoff(BaseDocument):
    pass

class Stocktake(BaseDocument):
    GET_HEAD_SQL = "SELECT stocktake.get_head(__document_id := %s)"
    GET_BODY_SQL = "SELECT stocktake.get_body(__document_id := %s)"
    UPDATE_BODY_SQL = "SELECT stocktake.reinit(__document_id := %s, __body := %s)"
    DELETE_DOCUMENT_SQL = "SELECT stocktake.destroy(__document_id := %s)"
    CREATE_DOCUMENT_SQL = "SELECT stocktake.init(__head := %s, __body := %s)"
    COMMIT_DOCUMENT_SQL = "SELECT stocktake.do_commit(__document_id := %s, __apprise := %s)"
    DECOMMIT_DOCUMENT_SQL = "SELECT stocktake.do_decommit(__document_id := %s, __apprise := %s)"

    def from_dict(self, d):
        self.head = pgcast.DocumentHead()
        self.head.from_dict(d['head'])
        self.body = []
        for row in d['body']:
            b = pgcast.StocktakeBody()
            b.from_dict(row)
            self.body.append(b)
            # return self.create_document(self.head, self.body)


class BaseDocumentList:
    GET_LSIT_SQL = None

    def __init__(self, facility=None, sdate=None, edate=None):
        self.facility_code = None
        if facility:
            self.facility_code = facility
        self.date_start = None
        if sdate:
            self.date_start = sdate
        self.date_end = None
        if edate:
            self.date_end = edate
        self._conn = connection()
        _register_cast(self._conn)

    def get_document_list(self):
        curs = self._conn.cursor()
        curs.execute(self.GET_LSIT_SQL, (self.facility_code, self.date_start, self.date_end,))
        document_list = curs.fetchone()[0]
        self._conn.commit()
        curs.close()
        return document_list

    def to_dict(self):
        result_list = []
        list_in = self.get_document_list()
        for row in list_in:
            result_list.append(row.to_dict())
        return result_list


class DeliveryList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT delivery.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class DemandList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT demand.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class DespatchList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT despatch.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class IssueList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT issue.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class PicklistList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT picklist.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class ReboundList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT rebound.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class ReceiptList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT receipt.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class ReserveList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT reserve.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class StocktakeList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT stocktake.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"


class CutoffList(BaseDocumentList):
    GET_LSIT_SQL = "SELECT cutoff.get_head_batch_proposed(__facility_code := %s, __date_start := %s, __date_end := %s)"
