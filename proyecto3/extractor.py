import sys
import csv
import time
from datetime import datetime


from conf import mssql_connection,prueba_sql

#genera un csv con los datos de sql


def extractor():
	try: 
		query = 'select * from clients'

		#sql connection
		con_sb = mssql_connection()

		data = prueba_sql(query)

		if len(data) <= 0:
			print('No data retrived')
			sys.exit(0)
		else:
			timestr = time.strftime("%Y%m%d-%H%M%S")
			access = "w"
			newline = {"newline": ""}

			with open(timestr+".csv", access, **newline) as outfile:
				writer = csv.writer(outfile, quoting=csv.QUOTE_NONNUMERIC)
				writer.writerow(["ID", "Nombre", "Apellido","FECHA","ESTADO"])

				for row in data:
					print(row)
					writer.writerow(row)

	except IOError as e:
		print ('Error {0} get data from sql {1}'.format(e.errno, e.strerror))

	finally: 
		con_sb.close()



def he():
	print('hl')

extractor()	

