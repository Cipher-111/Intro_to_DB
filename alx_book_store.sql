-- Create the database
CREATE DATABASE alx_book_store;
GO

-- Use the database
USE alx_book_store;
GO

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);
GO

-- Create the Books table
CREATE TABLE Books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NULL,
    price FLOAT,
    publication_date DATE,
    CONSTRAINT FK_Books_Authors FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
GO

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address NVARCHAR(MAX)
);
GO

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity FLOAT,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetails_Books FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO
