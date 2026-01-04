CREATE DATABASE IF NOT EXISTS thuongmaidientu;

USE thuongmaidientu;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2),
    stock INT,
    status ENUM('active', 'inactive')
);

INSERT INTO products (product_id, product_name, price, stock, status) VALUES
(1, 'Laptop Gaming Asus', 25000000, 10, 'active'),
(2, 'Chuột Logitech G304', 850000, 50, 'active'),
(3, 'Bàn phím cơ cũ', 200000, 0, 'inactive'),
(4, 'Màn hình Dell 24 inch', 3500000, 15, 'active'),
(5, 'Tai nghe iPhone', 500000, 5, 'active'),
(6, 'Sản phẩm lỗi', 0, 0, 'inactive');

SELECT * FROM products;

SELECT * FROM products 
WHERE status = 'active';

SELECT * FROM products 
WHERE price > 1000000;

SELECT * FROM products 
WHERE status = 'active' 
ORDER BY price ASC;