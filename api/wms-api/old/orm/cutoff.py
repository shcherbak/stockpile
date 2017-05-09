# coding: utf-8
from sqlalchemy import BigInteger, Column, Date, DateTime, Enum, ForeignKey, Integer, String, text
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql.base import UUID
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Blocker(Base):
    __tablename__ = 'blocker'
    __table_args__ = {'schema': 'cutoff'}

    head_id = Column(ForeignKey('cutoff.head.id', ondelete='CASCADE', onupdate='CASCADE'), primary_key=True, nullable=False)
    blocker_document = Column(NullType, primary_key=True, nullable=False)

    head = relationship('Head')


class Head(Base):
    __tablename__ = 'head'
    __table_args__ = {'schema': 'cutoff'}

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('cutoff.head_id_seq'::regclass)"))
    gid = Column(UUID, nullable=False, unique=True, server_default=text("uuid_generate_v1()"))
    display_name = Column(String)
    document_date = Column(Date, nullable=False, server_default=text("now()"))
    author = Column(String)
    facility_code = Column(String)
    prev_fsmt = Column(Enum('PROPOSED', 'COMMITTED', 'DECOMMITTED', name='document_fsmt'))
    prev_fsmt_date = Column(DateTime(True))
    curr_fsmt = Column(Enum('PROPOSED', 'COMMITTED', 'DECOMMITTED', name='document_fsmt'), nullable=False, server_default=text("'PROPOSED'::common.document_fsmt"))
    curr_fsmt_date = Column(DateTime(True), nullable=False, server_default=text("now()"))


class Numerator(Base):
    __tablename__ = 'numerator'
    __table_args__ = {'schema': 'cutoff'}

    facility_code = Column(String, primary_key=True, nullable=False)
    julianized_week = Column(Integer, primary_key=True, nullable=False)
    current_value = Column(Integer, nullable=False, server_default=text("0"))
