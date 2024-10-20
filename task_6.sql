import mysql.connector
from mysql.connector import Error

def insert_customers():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='alx_book_store',  
            user='root',       
            password='yourpassword'  
        )
        
        if connection.is_connected():
            cursor = connection.cursor()

            # SQL query to insert data into the Customers table
            insert_query = """
                INSERT INTO customer (customer_id, customer_name, email, address)
                VALUES (%s, %s, %s, %s);
            """

            customers_data = [
                (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
                (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
                (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.')
            ]
            cursor.executemany(insert_query, customers_data)

            connection.commit()

            print(f"{cursor.rowcount} rows were inserted successfully into Customers table.")

    except Error as e:
        print(f"Error occurred: {e}")
        
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

insert_customers()

