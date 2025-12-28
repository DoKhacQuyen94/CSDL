use QuanLyDaoTao;
-- BƯỚC 1: Tạo bảng Teacher (Giảng viên)
CREATE TABLE Teacher (
    TeacherID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE -- Email không được trùng nhau
);

-- BƯỚC 2: Cập nhật bảng Subject (Thêm cột và khóa ngoại)
-- 2.1. Thêm cột TeacherID vào bảng Subject
ALTER TABLE Subject
ADD TeacherID VARCHAR(10);

-- 2.2. Tạo liên kết Khóa ngoại (Foreign Key)
ALTER TABLE Subject
ADD CONSTRAINT FK_Subject_Teacher 
FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID);
