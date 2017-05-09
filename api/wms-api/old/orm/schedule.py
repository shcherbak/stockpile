# coding: utf-8
from sqlalchemy import Column, Date, Integer
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Calendar(Base):
    __tablename__ = 'calendar'
    __table_args__ = {'schema': 'schedule'}

    calendar_date = Column(Date, primary_key=True)
    day_number = Column(Integer)
    week_number = Column(Integer)
    julianized_day = Column(Integer)
    julianized_week = Column(Integer)
