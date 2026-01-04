USE thuongmaidientu;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled')
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(101, 1, 2500000, '2023-10-01', 'completed'),
(102, 2, 6000000, '2023-10-05', 'pending'),
(103, 1, 150000, '2023-10-10', 'cancelled'),
(104, 3, 8500000, '2023-10-12', 'completed'),
(105, 2, 4500000, '2023-10-15', 'completed'),
(106, 4, 12000000, '2023-10-20', 'pending');

SELECT * FROM orders 
WHERE status = 'completed';

SELECT * FROM orders 
WHERE total_amount > 5000000;

SELECT * FROM orders 
ORDER BY order_date DESC 
LIMIT 5;

SELECT * FROM orders 
WHERE status = 'completed' 
ORDER BY total_amount DESC;