use quanlythuvien;

insert into reader(reader_id, reader_name,phone, email,register_date)
values("1","Nguyễn Văn An","0901234567","an.nguyen@gmail.com","2024-09-01"),
("2","Trần Thị Bình","0912345678","binh.tran@gmail.com","2024-09-05"),
("3","Lê Minh Châu","0923456789","chau.le@gmail.com","2024-09-10");

insert into book(book_id, book_title,author,publish_year)
values("101","Lập trình C căn bản","Nguyễn Văn A","2018"),
("102","Cơ cở dữ liệu","Trần Thị B","2020"),
("103","Lập trình Java","Lê Minh C","2019"),
("104","Hệ quản trị MySQL","Phạm Văn D","2021");

insert into borrow(reader_id, book_id,borrow_date,return_date)
values("1","101","2024-09-15","NULL"),
("1","102","2024-09-15","2024-09-25"),
("2","103","2024-09-18","NULL");


