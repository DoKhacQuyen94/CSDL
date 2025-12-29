
CREATE DATABASE QuanLySinhVien; -- Tạo CSDL mới tên là QuanLySinhVien
USE QuanLySinhVien;             -- Lệnh này để bảo hệ thống: "Hãy làm việc trên CSDL vừa tạo"

CREATE TABLE Student (
    student_id INT not null PRIMARY KEY,          -- Khóa chính
    full_name VARCHAR(100) NOT NULL,     -- Không được để trống
    date_of_birth DATE,                  -- Kiểu ngày tháng
    email VARCHAR(100) UNIQUE            -- Không được trùng lặp
);

INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES 
    (101, 'Nguyen Van A', '2003-05-15', 'nguyenvana@gmail.com'),
    (102, 'Tran Thi B', '2003-08-20', 'tranthib@student.edu.vn'),
    (103, 'Le Hoang C', '2002-12-01', 'lehoangc@yahoo.com');

-- Yêu cầu : Lấy ra toàn bộ danh sách sinh viên
SELECT * FROM Student;

-- Yêu cầu : Lấy ra mã sinh viên và họ tên
SELECT student_id, full_name FROM Student;