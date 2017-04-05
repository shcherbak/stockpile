# coding: utf-8
from sqlalchemy import Column, Numeric, String, text
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Balance(Base):
    __tablename__ = 'balance'
    __table_args__ = {'schema': 'balance'}

    facility_code = Column(String, primary_key=True, nullable=False)
    good_code = Column(String, primary_key=True, nullable=False)
    uom_code = Column(String, nullable=False)
    on_hand_qty = Column(Numeric, server_default=text("0"))
    reserved_qty = Column(Numeric, server_default=text("0"))
    available_qty = Column(Numeric, server_default=text("0"))
    en_route_qty = Column(Numeric, server_default=text("0"))
    on_order_qty = Column(Numeric, server_default=text("0"))
