USE ss6;

ALTER TABLE orders ADD COLUMN total_amount DECIMAL(10,2);

UPDATE orders SET total_amount = 150000 WHERE order_id = 101;
UPDATE orders SET total_amount = 200000 WHERE order_id = 102;
UPDATE orders SET total_amount = 500000 WHERE order_id = 103;
UPDATE orders SET total_amount = 120000 WHERE order_id = 104;
UPDATE orders SET total_amount = 300000 WHERE order_id = 105;

SELECT 
    customers.customer_id, 
    customers.full_name, 
    SUM(orders.total_amount) AS tong_tien_chi_tieu
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.full_name;

SELECT 
    customers.customer_id, 
    customers.full_name, 
    MAX(orders.total_amount) AS don_hang_cao_nhat
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.full_name;

SELECT 
    customers.customer_id, 
    customers.full_name, 
    SUM(orders.total_amount) AS tong_tien_chi_tieu
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.full_name
ORDER BY tong_tien_chi_tieu DESC;