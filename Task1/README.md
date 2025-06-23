# Task 1 – E-commerce Database Schema Design

This task focuses on designing a normalized relational database schema for a basic e-commerce system as part of the Elevate Labs SQL Developer Internship (June 2025 Batch).

---

## 📌 Objective

- Create an e-commerce database schema
- Define key entities, relationships, and constraints
- Visualize the schema using an ER diagram

---

## 📁 Files Included

| File              | Description                            |
|-------------------|----------------------------------------|
| `create_schema.sql` | SQL script to create database schema   |
| `er_diagram.png`    | ER diagram representing relationships |
| `task 1.pdf`        | Original task brief from Elevate Labs |

---

## 📊 Tables Created

- `Users` – Customer data
- `Categories` – Product classification
- `Products` – Items available for purchase
- `Orders` – User order records
- `OrderItems` – Products within each order
- `Payments` – Payment status per order

---

## 🔗 Relationships

- One `User` → Many `Orders`
- One `Order` → Many `OrderItems`
- One `Product` → Many `OrderItems`
- One `Category` → Many `Products`
- One `Order` → One `Payment`

---

## 🧠 Concepts Applied

- SQL DDL (`CREATE TABLE`)
- Primary and Foreign Keys
- AUTO_INCREMENT
- Normalization (up to 3NF)
- ER Diagram modeling

---

## ✅ Submission Notes

This folder contains all deliverables as per the task requirements. Please refer to the SQL file and diagram for schema structure and design decisions.

