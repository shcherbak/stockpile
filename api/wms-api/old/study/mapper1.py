from sqlalchemy import *
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import mapper

db = create_engine('sqlite:///joindemo.db')
db.echo = True

metadata = MetaData(db)

users = Table('users', metadata, autoload=True)
emails = Table('emails', metadata, autoload=True)

# These are the empty classes that will become our data classes
class User(object):
    pass
class Email(object):
    pass

usermapper = mapper(User, users)
emailmapper = mapper(Email, emails)

Session = sessionmaker(bind=db)
session = Session()

mary = session.query(User).filter_by(name='Mary').first()
mary.age += 1

session.flush()

fred = User()
fred.name = 'Fred'
fred.age = 37

#print ("About to flush() without a save()...")
#session.flush()  # Will *not* save Fred's data yet

session.save(fred)
print ("Just called save(). Now flush() will actually do something.")
session.flush()  # Now Fred's data will be saved

session.delete(fred)
session.flush()