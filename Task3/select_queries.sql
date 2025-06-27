-- Database: ECommerceDB
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- Assuming tables are already created (from Task 1):
-- Customers, Products, Orders, OrderItems

-- ✅ 1. Retrieve all customers
SELECT * FROM Customers;

-- ✅ 2. Retrieve specific columns: Customer Name and Email
SELECT customer_name, email FROM Customers;

-- ✅ 3. Filter customers from 'Kerala'
SELECT * FROM Customers
WHERE state = 'Kerala';

-- ✅ 4. Filter products with price between 500 and 2000
SELECT * FROM Products
WHERE price BETWEEN 500 AND 2000;

-- ✅ 5. Products whose name contains 'phone'
SELECT * FROM Products
WHERE product_name LIKE '%phone%';

-- ✅ 6. Customers from either 'Kerala' or 'Tamil Nadu'
SELECT * FROM Customers
WHERE state IN ('Kerala', 'Tamil Nadu');

-- ✅ 7. Orders placed after '2024-01-01'
SELECT * FROM Orders
WHERE order_date > '2024-01-01';

-- ✅ 8. Sort products by price ascending
SELECT * FROM Products
ORDER BY price ASC;

-- ✅ 9. Sort products by price descending
SELECT * FROM Products
ORDER BY price DESC;

-- ✅ 10. List top 5 most expensive products
SELECT * FROM Products
ORDER BY price DESC
LIMIT 5;

-- ✅ 11. Get distinct states from Customers table
SELECT DISTINCT state FROM Customers;

-- ✅ 12. Using alias for readability
SELECT customer_name AS Name, phone AS Contact
FROM Customers;

