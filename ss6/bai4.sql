USE ss6;

-- 1. Tạo bảng products
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);

-- 2. Tạo bảng order_items (Bảng trung gian)
-- Lưu ý: Khóa chính là cặp (order_id, product_id) để tránh trùng lặp
CREATE TABLE IF NOT EXISTS order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- 3. Thêm dữ liệu vào bảng products (5 sản phẩm)
INSERT INTO products (product_id, product_name, price) VALUES 
(1, 'Laptop Dell XPS', 25000000),
(2, 'iPhone 15', 30000000),
(3, 'Chuot Logitech', 500000),
(4, 'Ban phim co', 1500000),
(5, 'Tai nghe Sony', 3500000);

-- 4. Thêm dữ liệu vào bảng order_items (Chi tiết đơn hàng)
-- (Giả định các order_id 101-105 đã tồn tại ở các bước trước)
INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(101, 1, 1),  -- Đơn 101 mua 1 Laptop
(101, 3, 2),  -- Đơn 101 mua thêm 2 Chuột
(102, 2, 1),  -- Đơn 102 mua 1 iPhone
(103, 4, 5),  -- Đơn 103 mua 5 Bàn phím
(104, 3, 1),  -- Đơn 104 mua 1 Chuột
(105, 5, 2);  -- Đơn 105 mua 2 Tai nghe

-- a. Hiển thị mỗi sản phẩm đã bán được bao nhiêu sản phẩm (Tổng số lượng)
SELECT 
    products.product_id,
    products.product_name,
    SUM(order_items.quantity) AS tong_so_luong_ban
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.product_id, products.product_name;

-- b. Tính doanh thu của từng sản phẩm (Giá * Số lượng bán)
SELECT 
    products.product_id,
    products.product_name,
    SUM(order_items.quantity * products.price) AS tong_doanh_thu
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.product_id, products.product_name;

-- c. Chỉ hiển thị các sản phẩm có doanh thu > 5.000.000
SELECT 
    products.product_id,
    products.product_name,
    SUM(order_items.quantity * products.price) AS tong_doanh_thu
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.product_id, products.product_name
HAVING SUM(order_items.quantity * products.price) > 5000000;