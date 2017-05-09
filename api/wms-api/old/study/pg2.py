import psycopg2

try:
    connection = psycopg2.connect("dbname=wms user=postgres host=localhost")
except:
    print("Error 1")


cursor = connection.cursor()
try:
    cursor.execute("""SELECT * FROM common.exception_code""")
except:
    print("I can't SELECT common.exception_code")

rows = cursor.fetchall()
print("\nRows: \n")
for row in rows:
    print("   ", row[1])