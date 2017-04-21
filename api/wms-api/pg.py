from sqlalchemy import create_engine
from sqlalchemy import Column, String, Integer
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


#engine = sqlalchemy.create_engine('postgresql+psycopg2://postgres:@localhost/wms')


def connect(user, password, db, host='localhost', port=5432):
    '''Returns a connection and a metadata object'''
    # We connect with the help of the PostgreSQL URL
    # postgresql://federer:grandestslam@localhost:5432/tennis
    url = 'postgresql://{}:{}@{}:{}/{}'
    url = url.format(user, password, host, port, db)

    # The return value of create_engine() is our connection object
    #engine = sqlalchemy.create_engine(url, client_encoding='utf8', pool_size=4)

    # We then bind the connection to MetaData()
    #meta = sqlalchemy.MetaData(bind=con, reflect=True)

    #return con, meta
    #return engine


db_connection_string = 'postgresql+psycopg2://postgres:@localhost/wms'

db = create_engine(db_connection_string)
base = declarative_base()

class Balance(base):
    __tablename__ = 'balance'
    __table_args__ = {'schema': 'alchemy'}

    good_code = Column(String, primary_key=True)
    qty = Column(Integer)


Session = sessionmaker(db)
session = Session()


# Create
good_1 = Balance(good_code="10.10.001-001", qty="10")
session.add(good_1)
session.commit()

# Read
films = session.query(Balance)
for film in films:
    print(film.good_code, film.qty)

# Update
good_1.qty = "20"
session.commit()

for film in films:
    print(film.good_code, film.qty)


# Delete
session.delete(good_1)
session.commit()

for film in films:
    print(film.good_code, film.qty)


#result = conn.execute('SELECT procname(?,?)', 1, 2).fetchall()