create database ss7;
use ss7;

create table customers (
    id int primary key auto_increment ,
    name varchar(100),
    email varchar(100)
);

create table orders (
    id int primary key auto_increment,
    customer_id int,
    order_date date,
    total_amount decimal(10, 2),
    foreign key (customer_id) references customers(id)
);
insert into customers (id, name, email) values 
(1, 'Do Khac Quyen', 'khacquyen@example.com'),
(2, 'Vu Van Doan', 'vuvandoan@example.com'),
(3, 'Phan Thanh Dat', 'thanhdat@example.com'),
(4, 'Nguyen Viet Nam', 'vietnam@example.com'),
(5, 'Tran Viet Anh', 'vietanh@example.com'),
(6, 'Nguyen Thi Phuong', 'thiphuong@example.com'), 
(7, 'Do Duc Cuong', 'duccuong@example.com'); 

insert into orders (id, customer_id, order_date, total_amount) values 
(101, 1, '2023-12-01', 500000),
(102, 4, '2023-12-20', 450000),
(103, 5, '2023-12-22', 900000),
(104, 1, '2023-12-25', 150000);

select id, name, email
from customers
where id in (
    select distinct customer_id 
    from orders
);