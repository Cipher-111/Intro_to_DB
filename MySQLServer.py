import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_password'
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print(f"Error while connecting to the DB: {e}")

finally:
    try:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")
    except NameError:
        print("Connection was not established.")
