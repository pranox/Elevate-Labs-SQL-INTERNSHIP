-- Task 4: Aggregate Functions and Grouping
-- SQL Developer Internship - Elevate Labs

-- Create Database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

--  Create Tables (from Task 1)

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--  Aggregate Queries

-- 🔸 Total sales from all orders
SELECT SUM(TotalAmount) AS TotalSales FROM Orders;

-- 🔸 Average order amount
SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;

-- 🔸 Total quantity sold per product
SELECT 
    P.ProductName,
    SUM(OI.Quantity) AS TotalQuantitySold
FROM OrderItems OI
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY P.ProductName;

-- 🔸 Number of orders by each customer
SELECT 
    C.Name,
    COUNT(O.OrderID) AS TotalOrders
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.Name;

-- 🔸 Highest order amount by each customer
SELECT 
    C.Name,
    MAX(O.TotalAmount) AS HighestOrderAmount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.Name;

-- 🔸 Products with total quantity sold more than 10
SELECT 
    P.ProductName,
    SUM(OI.Quantity) AS TotalQuantity
FROM OrderItems OI
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY P.ProductName
HAVING TotalQuantity > 10;

-- 🔸 Total sales grouped by product category
SELECT 
    P.Category,
    SUM(OI.Quantity * OI.Price) AS TotalSales
FROM OrderItems OI
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY P.Category;

-- 🔸 Average price of products in each category
SELECT 
    Category,
    ROUND(AVG(Price), 2) AS AverageProductPrice
FROM Products
GROUP BY Category;

