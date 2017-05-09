from sqlalchemy import create_engine


def stored_procedure(connection, procedure, parameters):
    _cursor = connection.cursor()
    _cursor.callproc(procedure, parameters)
    _results = _cursor.fetchall()
    _cursor.close()
    connection.commit()
    return _results


class Adjustmentcredit():
    __schema_name = 'adjustmentcredit'

    def generate_display_name(parameters):
        print(stored_procedure(db_connection, "adjustmentcredit.generate_display_name", parameters))


db_connection_string = 'postgresql+psycopg2://postgres:@localhost/wms'
db = create_engine(db_connection_string)
db_connection = db.raw_connection()

#print(stored_procedure(db_connection, "adjustmentcredit.generate_display_name", ['2017-01-01', 'A1']))
#print(stored_procedure(db_connection, "adjustmentcredit.generate_display_name", ['2017-01-01', 'B1']))
#print(stored_procedure(db_connection, "adjustmentcredit.generate_display_name", ['2017-01-01', 'D1']))

Adjustmentcredit.generate_display_name(['2017-01-01', 'A1'])