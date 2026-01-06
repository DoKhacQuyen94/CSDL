USE ss6;

-- 1. Tính tổng doanh thu theo từng ngày
SELECT 
    order_date, 
    SUM(total_amount) AS tong_doanh_thu
FROM orders
GROUP BY order_date;

-- 2. Tính số lượng đơn hàng theo từng ngày
SELECT 
    order_date, 
    COUNT(order_id) AS so_luong_don
FROM orders
GROUP BY order_date;

-- 3. Chỉ hiển thị các ngày có doanh thu > 10.000.000
SELECT 
    order_date, 
    SUM(total_amount) AS tong_doanh_thu
FROM orders
GROUP BY order_date
HAVING SUM(total_amount) > 10000000;