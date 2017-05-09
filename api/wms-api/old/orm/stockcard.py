# coding: utf-8
from sqlalchemy import Column, Date, DateTime, Enum, Index, Numeric, String, text
from sqlalchemy.dialects.postgresql.base import UUID
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Head(Base):
    __tablename__ = 'head'
    __table_args__ = (
        Index('head_document_kind_facility_code_good_code_idx', 'document_kind', 'facility_code', 'good_code'),
        {'schema': 'stockcard'}
    )

    document_gid = Column(UUID, primary_key=True, nullable=False)
    document_kind = Column(Enum('ADJUSTMENTCREDIT', 'ADJUSTMENTDEBIT', 'DELIVERY', 'DEMAND', 'DESPATCH', 'GOAL', 'ISSUE', 'LOT', 'PICKLIST', 'REBOUND', 'RECEIPT', 'RESERVE', 'STOCKTAKE', 'CUTOFF', name='document_kind'))
    document_name = Column(String)
    document_date = Column(Date)
    facility_code = Column(String)
    counterparty_code = Column(String)
    good_code = Column(String, primary_key=True, nullable=False)
    cutoff_date = Column(Date)
    cutoff_uom = Column(String)
    cutoff_qty = Column(Numeric, server_default=text("0"))
    receipt_uom = Column(String)
    receipt_qty = Column(Numeric, server_default=text("0"))
    issued_uom = Column(String)
    issued_qty = Column(Numeric, server_default=text("0"))
    adjusted_uom = Column(String)
    adjusted_qty = Column(Numeric, server_default=text("0"))
    rebounded_uom = Column(String)
    rebounded_qty = Column(Numeric, server_default=text("0"))
    stocktake_uom = Column(String)
    stocktake_qty = Column(Numeric, server_default=text("0"))
    log_datetime = Column(DateTime(True), nullable=False, server_default=text("now()"))
