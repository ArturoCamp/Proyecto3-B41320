import pymssql
import psycopg2

#ConnectionToSQL

#_sql_server = "163.178.107.130"
#_sql_database = "b65949"
#_sql_server_port = 1433
#_sql_user = "laboratorios"
#_sql_password = "Saucr.118"

#Local SQL Connection
_sql_server = "localhost"
_sql_database = "PROYECTO3"
_sql_server_port = 1433
_sql_user = "Arturo"
_sql_password = "101320"

#ConnectionToPostGreSQL
_postgre_server = "localhost"
_postgre_database = "PROYECTO3"
_postgre_server_port = 5432
_postgre_user = "postgres"
_postgre_password = "101320"

#SQL Connection Prod
def mssql_connection():
    try:
        cnx = pymssql.connect(server=_sql_server, port=_sql_server_port,
                            user=_sql_user, password=_sql_password,database=_sql_database)
        return cnx
    except:
        print('Error: MSSQL Connection')

# Postgre Connection
def postgreSQL_Connection():
    try:
        cnx = psycopg2.connect("host="+_postgre_server+" dbname="+_postgre_database+" user="+_postgre_user+" password="+_postgre_password)
        
        return cnx
    except:
        print('Error: PostgreSQL Connection')



def prueba_sql(sp):
    try:
        con = mssql_connection()
        cur = con.cursor()
        cur.execute(sp)
        data_return = cur.fetchall()
        con.commit()

        return data_return
    except IOError as e:
        print("Error {0} Getting data from SQL Server: {1}".format(
            e.errno, e.strerror))