import mysql.connector
from mysql.connector import error

def database_name(dbname):
	try:
		connection = mysql.connector.connect(
			host = "localhost",
			username = "root",
			password = "yourpassword",
			database = dbname
		)

		if connection.isconnected():
			cursor = connection.cursor()
			cursor.execute("DESC Books")
			cursor.execute("SELECT DATA_TYPE, COLUMN_NAME,COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Books' AND TABLE_SCHEMA = 'alx_book_store'")
			cursor.close()
			connection.close()

	except error as e:
		print(f"Error:{e}")

database_name("alx_book_store")
