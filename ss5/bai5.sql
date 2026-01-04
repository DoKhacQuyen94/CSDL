USE thuongmaidientu;

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(107, 1, 100000, '2023-10-21', 'pending'),
(108, 2, 200000, '2023-10-22', 'completed'),
(109, 3, 300000, '2023-10-23', 'completed'),
(110, 4, 400000, '2023-10-24', 'pending'),
(111, 1, 500000, '2023-10-25', 'completed'),
(112, 2, 600000, '2023-10-26', 'pending'),
(113, 3, 700000, '2023-10-27', 'completed'),
(114, 4, 800000, '2023-10-28', 'pending'),
(115, 1, 900000, '2023-10-29', 'completed'),
(116, 2, 1000000, '2023-10-30', 'completed'),
(117, 3, 1100000, '2023-10-31', 'pending');

SELECT * FROM orders 
WHERE status != 'cancelled' 
ORDER BY order_date DESC 
LIMIT 5 OFFSET 0;

SELECT * FROM orders 
WHERE status != 'cancelled' 
ORDER BY order_date DESC 
LIMIT 5 OFFSET 5;

SELECT * FROM orders 
WHERE status != 'cancelled' 
ORDER BY order_date DESC 
LIMIT 5 OFFSET 10;