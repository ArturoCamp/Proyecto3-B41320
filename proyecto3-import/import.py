import sys
import csv
import time
from datetime import datetime
import psycopg2


def pg_load_table(file_path, table_name, dbname, host, port, user, pwd):
    '''
    This function upload csv to a target table
    '''
    try:
        conn = psycopg2.connect(dbname=dbname, host=host, port=port,\
         user=user, password=pwd)
        print("Connecting to Database")
        cur = conn.cursor()
        f = open(file_path, "r")
        # Truncate the table first
        cur.execute("Truncate {} Cascade;".format(table_name))
        print("Truncated {}".format(table_name))
        # Load table from the file with header
        cur.copy_expert("copy {} from STDIN CSV HEADER QUOTE '\"'".format(table_name), f)
        cur.execute("commit;")
        print("Loaded data into {}".format(table_name))
        conn.close()
        print("DB connection closed.")

    except Exception as e:
        print("Error: {}".format(str(e)))
        sys.exit(1)

# Execution Example
file_path = r"C:\Users\Arturo\Desktop\proyecto3\20191030-184258.csv"
table_name = 'clients'
dbname = 'PROYECTO3'
host = 'localhost'
port = '5432'
user = 'postgres'
pwd = '101320'
pg_load_table(file_path, table_name, dbname, host, port, user, pwd)

