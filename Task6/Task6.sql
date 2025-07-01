-- Using ECommerceDB database
USE ECommerceDB;

-- 1️⃣ Subquery in SELECT: Get total amount spent by each customer

SELECT 
    customer_id,
    name,
    (SELECT SUM(total_amount) 
     FROM Orders 
     WHERE Orders.customer_id = Customers.customer_id) AS total_spent
FROM Customers;

-- 2️⃣ Subquery in WHERE (IN): Get customers who have placed orders

SELECT * 
FROM Customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM Orders);

-- 3️⃣ Subquery in WHERE (EXISTS): Get customers who have orders

SELECT * 
FROM Customers c
WHERE EXISTS (SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id);

-- 4️⃣ Correlated Subquery: Get orders above the customer's average order amount

SELECT * 
FROM Orders o
WHERE total_amount > (
    SELECT AVG(total_amount) 
    FROM Orders 
    WHERE customer_id = o.customer_id
);

-- 5️⃣ Subquery in FROM (Derived Table): Get customer order counts

SELECT 
    customer_id,
    total_orders
FROM (
    SELECT 
        customer_id, 
        COUNT(order_id) AS total_orders
    FROM Orders
    GROUP BY customer_id
) AS OrderSummary;

-- 6️⃣ Scalar Subquery: Get the most recent order date for each customer

SELECT 
    customer_id,
    name,
    (SELECT MAX(order_date) 
     FROM Orders 
     WHERE Orders.customer_id = Customers.customer_id) AS last_order_date
FROM Customers;

-- 7️⃣ Subquery with NOT EXISTS: Customers with no orders

SELECT * 
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Orders o 
    WHERE o.customer_id = c.customer_id
);

