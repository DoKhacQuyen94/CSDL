use ss6;
SELECT 
    products.product_name,
    SUM(order_items.quantity) AS tong_so_luong_ban,
    SUM(order_items.quantity * products.price) AS tong_doanh_thu,
    AVG(products.price) AS gia_ban_trung_binh
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.product_id, products.product_name
HAVING SUM(order_items.quantity) >= 10
ORDER BY tong_doanh_thu DESC
LIMIT 5;