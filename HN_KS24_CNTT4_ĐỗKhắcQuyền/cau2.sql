use quanlythuvien;

ALTER TABLE reader
ADD email varchar(100) unique;

ALTER TABLE Book
modify author varchar(150);

ALTER TABLE Borrow
ADD CONSTRAINT chk_date_validity CHECK (return_date >= borrow_date);