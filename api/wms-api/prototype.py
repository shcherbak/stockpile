#!/usr/bin/env python

from decimal import Decimal

class BaseDocument1(object):
	"""docstring for BaseDocument"""
	def __init__(self, arg):
		super(BaseDocument1, self).__init__()
		self.arg = arg


class BaseDocument(object):
	def __init__(self, document_id=None):
		self.body = []

	def load(self, document_id):
		return self

	def load_head(self, document_id):
		#self.head = BaseHead().load(document_id)
		return self

	def load_boby(self, document_id):
		#self.body = BaseBody().load(document_id)
		return self

	def init(self):
		"""Create new object in database"""
		#curs.execute(self.CREATE_DOCUMENT_SQL, (self.head, self.body,))
		return self

	def save(self):
		"""Update object in database"""
		#curs.execute(self.UPDATE_BODY_SQL, (self.head.document_id, self.body,))
		return self

	def delete(self, document_id):
		#curs = self._conn.cursor()
		#curs.execute(self.DELETE_DOCUMENT_SQL, (document_id,))
		#print(curs.query)
		#self._conn.commit()
		#curs.close()
		pass

	def commit(self, gid, aprise=True):
		#curs = self._conn.cursor()
		#curs.execute(self.COMMIT_DOCUMENT_SQL, (document_id, apprise,))
		#print(curs.query)
		#self._conn.commit()
		#curs.close()
		pass

	def decommit(self, gid, aprise=True):
		#curs = self._conn.cursor()
		#curs.execute(self.DECOMMIT_DOCUMENT_SQL, (document_id, apprise,))
		#print(curs.query)
		#self._conn.commit()
		#curs.close()
		pass
	

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

class TestClass(object):
	def __init__(self, arg=None):
		super(TestClass, self).__init__()
		self.arg = arg

	def commit():
		print("t1 commit")


class TestClass2(object):
	def __init__(self, arg=None):
		super(TestClass2, self).__init__()
		self.arg = arg

	def commit():
		print("t2 commit")

def load_document(document_class, document_id):
	print("loading \t {0} \t id=[{1}]".format(document_class.__class__.__name__, document_id))
	return "{0}[{1}]".format(document_class.__class__.__name__, document_id)

def delete_document(document_class, document_id):
	print("deletting \t {0} \t id=[{1}]".format(document_class.__class__.__name__, document_id))
	return "{0}[{1}]".format(document_class, document_id)

def commit_document(document_class, document_id):
	document_class.commit()
	print("committing \t {0} \t id=[{1}]".format(document_class.__class__.__name__, document_id))
	return "{0}[{1}]".format(document_class.__class__.__name__, document_id)

def decommit_document(document_class, document_id):
	print("decommitting \t {0} \t id=[{1}]".format(document_class.__class__.__name__, document_id))
	return "{0}[{1}]".format(document_class.__class__.__name__, document_id)



#load_document(TestClass(), 10)
#commit_document(TestClass(), 12)
#delete_document(TestClass(), 1)
#delete_document(TestClass2(), 2)





class Employee:
	'Common base class for all employees'
	empCount = 0

	def __init__(self, name, salary):
		self.name = name
		self.salary = salary
		Employee.empCount += 1

	def __del__(self):
		class_name = self.__class__.__name__
		print class_name, "destroyed"
   
	def displayCount(self):
		print "Total Employee %d" % Employee.empCount

	def displayEmployee(self):
		print "Name : ", self.name,  ", Salary: ", self.salary


emp1 = Employee("Zara", 2000)
emp2 = Employee("Manni", 5000)
emp1.displayEmployee()
emp2.displayEmployee()
print "Total Employee %d" % Employee.empCount


#hasattr(emp1, 'age')
# Returns true if 'age' attribute exists
#getattr(emp1, 'age')
# Returns value of 'age' attribute
#setattr(emp1, 'age', 8)
# Set attribute 'age' at 8
#delattr(emp1, 'age')
# Delete attribute 'age'


print "Employee.__doc__:", Employee.__doc__
print "Employee.__name__:", Employee.__name__
print "Employee.__module__:", Employee.__module__
print "Employee.__bases__:", Employee.__bases__
print "Employee.__dict__:", Employee.__dict__


a = 40      # Create object <40>
b = a       # Increase ref. count  of <40> 
c = [b]     # Increase ref. count  of <40> 

del a       # Decrease ref. count  of <40>
b = 100     # Decrease ref. count  of <40> 
c[0] = -1   # Decrease ref. count  of <40> 
#print (a)
print (b)
print (c)

e = Employee("Zara", 2000)
e.displayEmployee()
del e