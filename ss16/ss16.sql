drop database if exists quanlybanhang;
create database quanlybanhang;
use quanlybanhang;

create table customers (
    customer_id int auto_increment primary key,
    customer_name varchar(100) not null,
    phone varchar(20) not null unique,
    address varchar(255) null
);

create table products (
    product_id int auto_increment primary key,
    product_name varchar(100) not null unique,
    price decimal(10,2) not null,
    quantity int not null check (quantity >= 0),
    category varchar(50) not null
);

create table employees (
    employee_id int auto_increment primary key,
    employee_name varchar(100) not null,
    birthday date null,
    position varchar(50) not null,
    salary decimal(10,2) not null,
    revenue decimal(10,2) default 0
);

create table orders (
    order_id int auto_increment primary key,
    customer_id int,
    employee_id int,
    order_date datetime default current_timestamp,
    total_amount decimal(10,2) default 0,
    foreign key (customer_id) references customers(customer_id),
    foreign key (employee_id) references employees(employee_id)
);

create table orderdetails (
    order_detail_id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int not null check (quantity > 0),
    unit_price decimal(10,2) not null,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

alter table customers
add column email varchar(100) not null unique;

alter table employees
drop column birthday;

insert into customers (customer_name, phone, address, email) values
('nguyen van a', '0901234567', 'ha noi', 'a@gmail.com'),
('tran thi b', '0902234567', 'ho chi minh', 'b@gmail.com'),
('le van c', '0903234567', 'da nang', 'c@gmail.com'),
('pham thi d', '0904234567', 'can tho', 'd@gmail.com'),
('hoang van e', '0905234567', 'hai phong', 'e@gmail.com');

insert into products (product_name, price, quantity, category) values
('laptop dell xps', 1500.00, 50, 'laptop'),
('iphone 15', 1200.00, 200, 'phone'),
('samsung galaxy s24', 1100.00, 150, 'phone'),
('mouse logitech', 25.00, 500, 'accessories'),
('keyboard keychron', 85.00, 100, 'accessories');

insert into employees (employee_name, position, salary, revenue) values
('nhan vien 1', 'sales', 1000.00, 0),
('nhan vien 2', 'sales', 1000.00, 0),
('nhan vien 3', 'manager', 2000.00, 0),
('nhan vien 4', 'marketing', 1200.00, 0),
('nhan vien 5', 'support', 800.00, 0);

insert into orders (customer_id, employee_id, order_date, total_amount) values
(1, 1, '2024-01-10 10:00:00', 1550.00),
(1, 2, '2024-01-12 14:00:00', 1200.00),
(2, 1, '2024-01-15 09:30:00', 0),
(3, 2, now(), 121000.00),
(4, 1, now(), 85.00);

insert into orderdetails (order_id, product_id, quantity, unit_price) values
(1, 1, 1, 1500.00), 
(1, 4, 2, 25.00),   
(2, 2, 1, 1200.00), 
(3, 3, 110, 1100.00), 
(4, 5, 1, 85.00);

select customer_id, customer_name, email, phone, address 
from customers;

update products 
set product_name = 'laptop dell xps', price = 99.99 
where product_id = 1;

select o.order_id, c.customer_name, e.employee_name, o.total_amount, o.order_date
from orders o
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id;

select c.customer_id, c.customer_name, count(o.order_id) as total_orders
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

select e.employee_id, e.employee_name, coalesce(sum(o.total_amount), 0) as total_revenue
from employees e
left join orders o on e.employee_id = o.employee_id 
    and year(o.order_date) = year(curdate())
group by e.employee_id, e.employee_name;

select p.product_id, p.product_name, sum(od.quantity) as total_ordered
from orderdetails od
join products p on od.product_id = p.product_id
join orders o on od.order_id = o.order_id
where month(o.order_date) = month(curdate()) 
  and year(o.order_date) = year(curdate())
group by p.product_id, p.product_name
having sum(od.quantity) > 100
order by total_ordered desc;

select customer_id, customer_name 
from customers 
where customer_id not in (select distinct customer_id from orders);

select * from products 
where price > (select avg(price) from products);

select c.customer_id, c.customer_name, sum(o.total_amount) as total_spending
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.total_amount) = (
    select sum(total_amount) 
    from orders 
    group by customer_id 
    order by sum(total_amount) desc 
    limit 1
);

create view view_order_list as
select o.order_id, c.customer_name, e.employee_name, o.total_amount, o.order_date
from orders o
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id
order by o.order_date desc;

create view view_order_detail_product as
select od.order_detail_id, p.product_name, od.quantity, od.unit_price
from orderdetails od
join products p on od.product_id = p.product_id
order by od.quantity desc;

delimiter //

create procedure proc_insert_employee(
    in p_name varchar(100),
    in p_position varchar(50),
    in p_salary decimal(10,2),
    out p_new_id int
)
begin
    insert into employees (employee_name, position, salary, revenue) 
    values (p_name, p_position, p_salary, 0);
    set p_new_id = last_insert_id();
end //

create procedure proc_get_orderdetails(in p_order_id int)
begin
    select * from orderdetails where order_id = p_order_id;
end //

create procedure proc_cal_total_amount_by_order(
    in p_order_id int,
    out p_product_type_count int
)
begin
    select count(distinct product_id) into p_product_type_count
    from orderdetails 
    where order_id = p_order_id;
end //

delimiter ;

delimiter //
create trigger trigger_after_insert_order_details
after insert on orderdetails
for each row
begin
    declare current_stock int;
    
    select quantity into current_stock 
    from products 
    where product_id = new.product_id;
    
    if current_stock < new.quantity then
        signal sqlstate '45000' 
        set message_text = 'so luong san pham trong kho khong du';
    else
        update products 
        set quantity = quantity - new.quantity 
        where product_id = new.product_id;
    end if;
end //
delimiter ;

delimiter //
create procedure proc_insert_order_details(
    in p_order_id int,
    in p_product_id int,
    in p_quantity int,
    in p_unit_price decimal(10,2)
)
begin
    declare v_order_exists int default 0;
    
    declare exit handler for sqlexception
    begin
        rollback;
        select 'loi xay ra, da rollback giao dich' as message;
    end;

    start transaction;

    select count(*) into v_order_exists from orders where order_id = p_order_id;
    
    if v_order_exists = 0 then
        signal sqlstate '45000'
        set message_text = 'khong ton tai ma hoa don';
    end if;

    insert into orderdetails (order_id, product_id, quantity, unit_price)
    values (p_order_id, p_product_id, p_quantity, p_unit_price);

    update orders
    set total_amount = total_amount + (p_quantity * p_unit_price)
    where order_id = p_order_id;

    commit;
    select 'them chi tiet don hang thanh cong' as message;
end //
delimiter ;