# coding: utf-8
from sqlalchemy import BigInteger, CheckConstraint, Column, Date, DateTime, Enum, ForeignKey, Integer, Numeric, String, text
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql.base import UUID
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Body(Base):
    __tablename__ = 'body'
    __table_args__ = {'schema': 'despatch'}

    head_id = Column(ForeignKey('despatch.head.id', ondelete='CASCADE', onupdate='CASCADE'), primary_key=True, nullable=False)
    good_code = Column(String, primary_key=True, nullable=False)
    quantity = Column(Numeric, server_default=text("0"))
    uom_code = Column(String)

    head = relationship('Head')


class Head(Base):
    __tablename__ = 'head'
    __table_args__ = (
        CheckConstraint('(ship_to)::text <> (ship_from)::text'),
        CheckConstraint('document_date <= due_date'),
        {'schema': 'despatch'}
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('despatch.head_id_seq'::regclass)"))
    gid = Column(UUID, nullable=False, unique=True, server_default=text("uuid_generate_v1()"))
    display_name = Column(String)
    document_date = Column(Date, nullable=False, server_default=text("('now'::text)::date"))
    author = Column(String)
    due_date = Column(Date, nullable=False)
    ship_to = Column(String)
    ship_from = Column(String)
    prev_fsmt = Column(Enum('PROPOSED', 'COMMITTED', 'DECOMMITTED', name='document_fsmt'))
    prev_fsmt_date = Column(DateTime(True))
    curr_fsmt = Column(Enum('PROPOSED', 'COMMITTED', 'DECOMMITTED', name='document_fsmt'), nullable=False, server_default=text("'PROPOSED'::common.document_fsmt"))
    curr_fsmt_date = Column(DateTime(True), nullable=False, server_default=text("now()"))


class Numerator(Base):
    __tablename__ = 'numerator'
    __table_args__ = {'schema': 'despatch'}

    facility_code = Column(String, primary_key=True, nullable=False)
    julianized_week = Column(Integer, primary_key=True, nullable=False)
    current_value = Column(Integer, nullable=False, server_default=text("0"))
