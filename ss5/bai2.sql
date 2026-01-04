USE thuongmaidientu;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    city VARCHAR(255),
    status ENUM('active', 'inactive')
);

INSERT INTO customers (customer_id, full_name, email, city, status) VALUES
(1, 'Nguyễn Văn An', 'an@gmail.com', 'TP.HCM', 'active'),
(2, 'Trần Thị Bình', 'binh@gmail.com', 'Hà Nội', 'active'),
(3, 'Lê Văn Cường', 'cuong@gmail.com', 'Đà Nẵng', 'inactive'),
(4, 'Phạm Thị Dung', 'dung@gmail.com', 'TP.HCM', 'active'),
(5, 'Hoàng Văn Em', 'em@gmail.com', 'Hà Nội', 'inactive'),
(6, 'Đỗ Thị Hoa', 'hoa@gmail.com', 'Hải Phòng', 'active');

SELECT * FROM customers;

SELECT * FROM customers 
WHERE city = 'TP.HCM';

SELECT * FROM customers 
WHERE status = 'active' AND city = 'Hà Nội';

SELECT * FROM customers 
ORDER BY full_name ASC;