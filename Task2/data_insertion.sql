-- Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

---------------------------------------------------
-- Insert Data
---------------------------------------------------

-- Insert Customers
INSERT INTO Customers (customer_id, name, email, phone)
VALUES 
(1, 'John Doe', 'john@example.com', '1234567890'),
(2, 'Jane Smith', 'jane@example.com', NULL), -- Missing phone
(3, 'Mark Lee', NULL, '9876543210');          -- Missing email

-- Insert Products
INSERT INTO Products (product_id, name, price, stock)
VALUES 
(1, 'Laptop', 50000.00, 10),
(2, 'Mouse', 500.00, 50),
(3, 'Keyboard', 1500.00, NULL); -- Missing stock (defaults to NULL)

-- Insert Orders
INSERT INTO Orders (order_id, customer_id, order_date)
VALUES 
(1, 1, '2025-06-24'),
(2, 2, '2025-06-25');

-- Insert Order Items
INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity)
VALUES 
(1, 1, 1, 1),   -- John orders 1 Laptop
(2, 1, 2, 2),   -- John orders 2 Mice
(3, 2, 3, 1);   -- Jane orders 1 Keyboard

---------------------------------------------------
-- Update Data (Handling NULLs and Stock)
---------------------------------------------------

-- Update missing email for Mark Lee
UPDATE Customers
SET email = 'mark@example.com'
WHERE customer_id = 3 AND email IS NULL;

-- Update missing stock for Keyboard
UPDATE Products
SET stock = 20
WHERE product_id = 3 AND stock IS NULL;

-- Reduce stock after sales
UPDATE Products
SET stock = stock - 1
WHERE product_id = 1;

UPDATE Products
SET stock = stock - 2
WHERE product_id = 2;

UPDATE Products
SET stock = stock - 1
WHERE product_id = 3;

---------------------------------------------------
-- Delete Example (Cancel an order)
---------------------------------------------------

-- Delete Order 2 (Jane's order) - Will also delete from OrderItems due to ON DELETE CASCADE
DELETE FROM Orders
WHERE order_id = 2;

