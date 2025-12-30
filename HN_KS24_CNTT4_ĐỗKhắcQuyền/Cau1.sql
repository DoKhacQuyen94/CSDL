create database quanlythuvien;
use quanlythuvien;

create table Reader(
	reader_id int primary key auto_increment,
    reader_name varchar(100) not null,
    phone varchar(15) unique,
    register_date Date default(current_date())
);

create table book(
	book_id int primary key,
    book_title varchar(150) not null,
    author	varchar(100),
    publish_year INT, check  (publish_year >= 1900)
);

create table borrow(
	reader_id int,
    book_id int,
    borrow_date Date default (current_date()),
    return_date Date,
    PRIMARY KEY (reader_id, book_id),
    FOREIGN KEY (reader_id) REFERENCES reader(reader_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

