-- Bài 3: Khá
CREATE DATABASE QuanLyDaoTao;
USE QuanLyDaoTao;

-- BƯỚC : Tạo bảng Student
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY, -- Khóa chính
    FullName NVARCHAR(50) NOT NULL     -- Tên không được rỗng
);

-- BƯỚC : Tạo bảng Subject
CREATE TABLE Subject (
    SubjectID VARCHAR(10) PRIMARY KEY, -- Khóa chính
    SubjectName NVARCHAR(100) NOT NULL,-- Tên môn không được rỗng
    Credits INT,                       -- Số tín chỉ
    -- Ràng buộc: Tín chỉ phải là số dương
    CONSTRAINT Check_Credits_Positive CHECK (Credits > 0)
);