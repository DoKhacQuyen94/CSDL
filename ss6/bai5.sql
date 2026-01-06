use ss6;
SELECT 
    customers.customer_id,
    customers.full_name,
    COUNT(orders.order_id) AS tong_so_don,
    SUM(orders.total_amount) AS tong_tien_chi,
    AVG(orders.total_amount) AS trung_binh_don
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.full_name
HAVING COUNT(orders.order_id) >= 3 
   AND SUM(orders.total_amount) > 10000000
ORDER BY tong_tien_chi DESC;