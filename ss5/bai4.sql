USE thuongmaidientu;

ALTER TABLE products 
ADD sold_quantity INT DEFAULT 0;

UPDATE products SET sold_quantity = 150 WHERE product_id = 1;
UPDATE products SET sold_quantity = 1200 WHERE product_id = 2;
UPDATE products SET sold_quantity = 0 WHERE product_id = 3;
UPDATE products SET sold_quantity = 500 WHERE product_id = 4;
UPDATE products SET sold_quantity = 800 WHERE product_id = 5;
UPDATE products SET sold_quantity = 0 WHERE product_id = 6;

INSERT INTO products (product_id, product_name, price, stock, status, sold_quantity) VALUES
(7, 'USB Kingston 64GB', 150000, 50, 'active', 1500),
(8, 'Ổ cứng SSD Samsung', 1200000, 25, 'active', 450),
(9, 'Ram 8GB DDR4', 700000, 40, 'active', 600),
(10, 'Sạc dự phòng Xiaomi', 400000, 60, 'active', 1100),
(11, 'Cáp sạc iPhone', 200000, 80, 'active', 1800),
(12, 'Webcam Logitech', 900000, 10, 'active', 250),
(13, 'Loa Bluetooth JBL', 1800000, 15, 'active', 320),
(14, 'Giá đỡ Laptop', 300000, 40, 'active', 700),
(15, 'Túi chống sốc', 150000, 50, 'active', 900),
(16, 'Chuột không dây Genius', 120000, 20, 'inactive', 50);

SELECT * FROM products 
ORDER BY sold_quantity DESC 
LIMIT 10;

SELECT * FROM products 
ORDER BY sold_quantity DESC 
LIMIT 5 OFFSET 10;

SELECT * FROM products 
WHERE price < 2000000 
ORDER BY sold_quantity DESC;