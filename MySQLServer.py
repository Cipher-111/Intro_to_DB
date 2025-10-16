import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL Server
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_password'   # Replace with your MySQL password
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    # Explicit exception handling for MySQL errors
    print(f"Error while connecting to the DB: {e}")

finally:
    # Ensure resources are always released
    try:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")
    except NameError:
        # Handle case where connection was never established
        print("Connection was not established.")
