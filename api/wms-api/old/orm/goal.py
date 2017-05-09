# coding: utf-8
from sqlalchemy import BigInteger, Column, Date, DateTime, Enum, Integer, String, text
from sqlalchemy.dialects.postgresql.base import UUID
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Head(Base):
    __tablename__ = 'head'
    __table_args__ = {'schema': 'goal'}

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('goal.head_id_seq'::regclass)"))
    gid = Column(UUID, nullable=False, unique=True, server_default=text("uuid_generate_v1()"))
    display_name = Column(String)
    document_date = Column(Date, nullable=False, server_default=text("('now'::text)::date"))
    author = Column(String)
    facility_code = Column(String)
    prev_fsmt = Column(Enum('PROPOSED', 'ADVISED', 'REJECTED', 'ACCEPTED', 'CANCELED', 'COMMITTED', 'DECOMMITTED', 'FAILED', 'SATISFIED', name='goal_fsmt'))
    prev_fsmt_date = Column(DateTime(True))
    curr_fsmt = Column(Enum('PROPOSED', 'ADVISED', 'REJECTED', 'ACCEPTED', 'CANCELED', 'COMMITTED', 'DECOMMITTED', 'FAILED', 'SATISFIED', name='goal_fsmt'), nullable=False, server_default=text("'PROPOSED'::common.goal_fsmt"))
    curr_fsmt_date = Column(DateTime(True), nullable=False, server_default=text("now()"))


class Numerator(Base):
    __tablename__ = 'numerator'
    __table_args__ = {'schema': 'goal'}

    facility_code = Column(String, primary_key=True, nullable=False)
    julianized_week = Column(Integer, primary_key=True, nullable=False)
    current_value = Column(Integer, nullable=False, server_default=text("0"))
