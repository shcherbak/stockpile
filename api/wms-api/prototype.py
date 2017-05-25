#!/usr/bin/env python

from decimal import Decimal

class BaseDocument1(object):
	"""docstring for BaseDocument"""
	def __init__(self, arg):
		super(BaseDocument1, self).__init__()
		self.arg = arg


class BaseDocument(object):
	def __init__(self, head=None, gid=None):
		self.head = head
		self.gid = gid


	def init(self):
		print("initing {}".format(self.gid))
		self.gid = 100
		return self

	def save(self):
		print("saving {}".format(self.gid))
		return self

	def load(self, gid):
		self.head = "document gid {0}".format(gid)
		self.gid = gid
		print("loading {0}".format(gid))
		return self

	def commit(self, gid, aprise=True):
		print("commiting {0}, apprise {1}".format(gid, aprise))


	def decommit(self, gid, aprise=True):
		print("decommiting {0}, apprise {1}".format(gid, aprise))

	def delete(self, gid):
		print("document deleted {0}".format(gid))

	def from_json(self, json):
		self.head = json
		self.gid = json
		return self

	def to_json(self):
		return "json string {0}".format(self.gid)

	def from_dict(self, dict):
		self.head = dict
		self.gid = dict
		return self

	def to_dict(self):
		return "dict string {0}".format(self.gid)

def testBaseDocument():
	doc = BaseDocument("document initialized uuid-000")
	doc.load("uuid-001")
	doc.load("uuid-002")
	doc.save()
	doc.commit(doc.gid)
	doc.delete(doc.gid)
	BaseDocument().commit("uuid-003")
	BaseDocument.commit(BaseDocument(), "uuid-004")
	doc = BaseDocument("head")
	print(doc.head)
	doc.from_dict("head2")
	print(doc.to_dict())
	print(doc.to_json())


	


testBaseDocument()