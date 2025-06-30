-- Creating Tables

CREATE DATABASE ECommerceDB;
USE ECommerceDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting Data

INSERT INTO Customers VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'David', 'david@example.com');

INSERT INTO Orders VALUES
(101, 1, '2024-01-10', 500.00),
(102, 2, '2024-02-15', 750.00),
(103, 1, '2024-03-20', 300.00),
(104, 3, '2024-04-25', 1200.00);

-- 🔗 INNER JOIN: Customers with their orders

SELECT 
    Customers.customer_id, 
    Customers.name, 
    Orders.order_id, 
    Orders.order_date, 
    Orders.total_amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 🔗 LEFT JOIN: All customers with or without orders

SELECT 
    Customers.customer_id, 
    Customers.name, 
    Orders.order_id, 
    Orders.order_date, 
    Orders.total_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 🔗 RIGHT JOIN: All orders with customer info (MySQL 8+ or MariaDB)

SELECT 
    Customers.customer_id, 
    Customers.name, 
    Orders.order_id, 
    Orders.order_date, 
    Orders.total_amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 🔗 FULL OUTER JOIN (MySQL workaround using UNION)

SELECT 
    Customers.customer_id, 
    Customers.name, 
    Orders.order_id, 
    Orders.order_date, 
    Orders.total_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id

UNION

SELECT 
    Customers.customer_id, 
    Customers.name, 
    Orders.order_id, 
    Orders.order_date, 
    Orders.total_amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

