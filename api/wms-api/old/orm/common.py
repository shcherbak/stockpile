# coding: utf-8
from sqlalchemy import Column, Enum, Integer, String, Text, text
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class CutoffPolicy(Base):
    __tablename__ = 'cutoff_policy'
    __table_args__ = {'schema': 'common'}

    document_kind_name = Column(Enum('ADJUSTMENTCREDIT', 'ADJUSTMENTDEBIT', 'DELIVERY', 'DEMAND', 'DESPATCH', 'GOAL', 'ISSUE', 'LOT', 'PICKLIST', 'REBOUND', 'RECEIPT', 'RESERVE', 'STOCKTAKE', 'CUTOFF', name='document_kind'), primary_key=True)
    policy_mode_applied = Column(Enum('DISABLED', 'PERMISSIVE', 'ENFORCING', name='policy_mode'), nullable=False, server_default=text("'DISABLED'::common.policy_mode"))


class DocumentAbbrevation(Base):
    __tablename__ = 'document_abbrevation'
    __table_args__ = {'schema': 'common'}

    doctype = Column(Enum('ADJUSTMENTCREDIT', 'ADJUSTMENTDEBIT', 'DELIVERY', 'DEMAND', 'DESPATCH', 'GOAL', 'ISSUE', 'LOT', 'PICKLIST', 'REBOUND', 'RECEIPT', 'RESERVE', 'STOCKTAKE', 'CUTOFF', name='document_kind'), primary_key=True)
    abbrevation = Column(String, nullable=False, server_default=text("'[ABBREVATION]'::character varying"))


class ExceptionCode(Base):
    __tablename__ = 'exception_code'
    __table_args__ = {'schema': 'common'}

    id = Column(Integer, primary_key=True, server_default=text("nextval('common.exception_code_id_seq'::regclass)"))
    message = Column(Text)
    detail = Column(Text)
    hint = Column(Text)
    errcode = Column(String(5), unique=True)
    condition_name = Column(String(100), unique=True)


class StocktakePolicy(Base):
    __tablename__ = 'stocktake_policy'
    __table_args__ = {'schema': 'common'}

    document_kind_name = Column(Enum('ADJUSTMENTCREDIT', 'ADJUSTMENTDEBIT', 'DELIVERY', 'DEMAND', 'DESPATCH', 'GOAL', 'ISSUE', 'LOT', 'PICKLIST', 'REBOUND', 'RECEIPT', 'RESERVE', 'STOCKTAKE', 'CUTOFF', name='document_kind'), primary_key=True)
    stocktake_mode_applied = Column(Enum('DISABLED', 'PERMISSIVE', 'ENFORCING', name='policy_mode'), nullable=False, server_default=text("'DISABLED'::common.policy_mode"))
