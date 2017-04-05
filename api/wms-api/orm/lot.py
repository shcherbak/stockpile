# coding: utf-8
from sqlalchemy import BigInteger, Column, text
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Head(Base):
    __tablename__ = 'head'
    __table_args__ = {'schema': 'lot'}

    ib = Column(BigInteger, primary_key=True, server_default=text("nextval('lot.head_ib_seq'::regclass)"))
