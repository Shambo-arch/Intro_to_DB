CREATE DATABASE IF NOT EXISTS alx_book_store;
SELECT database();
USE Alx_book_store;

CREATE TABLE Books
(
	book_id INT,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    PRIMARY KEY (book_id),
    FOREIGN KEY(author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Authors
(
	author_id INT,
    author_name VARCHAR(215),
    PRIMARY KEY (author_id)
);

CREATE TABLE Customers
(
	customer_id INT,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE Orders
(
	order_id INT,
    customer_id INT,
    order_date DATE,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details
(
	order_detail_id INT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    PRIMARY KEY (order_detail_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

