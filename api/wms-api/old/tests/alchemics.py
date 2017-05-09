from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, ForeignKey
from sqlalchemy.orm import mapper

# default
#engine = create_engine('postgresql://scott:tiger@localhost/mydatabase')
#
# psycopg2
#engine = create_engine('postgresql+psycopg2://scott:tiger@localhost/mydatabase')
#
# pg8000
#engine = create_engine('postgresql+pg8000://scott:tiger@localhost/mydatabase')
#
engine = create_engine('sqlite:///:memory:', echo=True)

metadata = MetaData()

users = Table('users', metadata,
              Column('id', Integer, primary_key=True),
              Column('name', String),
              Column('fullname', String),
              Column('password', String)
              )

addresses = Table('addresses', metadata,
              Column('id', Integer, primary_key=True),
              Column('user_id', None, ForeignKey('users.id')),
              Column('email_address', String, nullable=False)
              )

metadata.create_all(engine)

class User(object):
    def __init__(self, name, fullname, password):
        self.name = name
        self.fullname = fullname
        self.password = password

    def __repr__(self):
        return "<User('%s','%s', '%s')>" % (self.name, self.fullname, self.password)


print(mapper(User, users))  # и отобразить. Передает класс User и нашу таблицу
#
user = User("Вася", "Василий", "qweasdzxc")
#
print(user)
#
print(user.id)  #Напечатает None