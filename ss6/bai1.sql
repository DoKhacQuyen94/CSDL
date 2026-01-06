CREATE DATABASE IF NOT EXISTS ss6;

USE ss6;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES 
(1, 'Nguyen Van A', 'Ha Noi'),
(2, 'Tran Thi B', 'Ho Chi Minh'),
(3, 'Le Van C', 'Da Nang'),
(4, 'Pham Thi D', 'Can Tho'),
(5, 'Hoang Van E', 'Hai Phong');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES 
(101, 1, '2023-10-01', 'completed'),
(102, 1, '2023-10-05', 'pending'),
(103, 2, '2023-11-12', 'completed'),
(104, 3, '2023-12-20', 'cancelled'),
(105, 2, '2024-01-15', 'pending');

SELECT 
    orders.order_id, 
    customers.full_name, 
    orders.order_date, 
    orders.status
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

SELECT 
    customers.customer_id, 
    customers.full_name, 
    COUNT(orders.order_id) AS so_luong_don
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.full_name;

SELECT 
    customers.customer_id, 
    customers.full_name, 
    COUNT(orders.order_id) AS so_luong_don
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.full_name
HAVING COUNT(orders.order_id) >= 1;