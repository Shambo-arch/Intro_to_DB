import mysql.connector
from mysql.connector import error

def database_name(dbname):
	try:
		connection = mysql.connector.connect(
			host = "localhost",
			username = "root",
			password = "yourpassword"
		)

		if connection.isconnected():
			USE alx_book_store;
			cursor = connection.cursor()
			cursor.execute("SHOW TABLES;")
			cursor.close()
			connection.close()

	except error as e:
		print(f"Error:{e}")

database_name("alx_book_store")

