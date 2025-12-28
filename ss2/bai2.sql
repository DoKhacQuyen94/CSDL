-- BƯỚC 1: Tạo Database 
CREATE DATABASE QuanLyDaoTao;
USE QuanLyDaoTao;

-- BƯỚC 2: Tạo Bảng Class (Lớp học)
-- Phải tạo bảng này trước vì Sinh viên cần tham chiếu đến nó
CREATE TABLE Class (
    ClassID VARCHAR(10) PRIMARY KEY,   -- Khóa chính: Mã lớp
    ClassName VARCHAR(100) NOT NULL,  -- Tên lớp 
    SchoolYear VARCHAR(20)             -- Năm học (VD: 2023-2024)
);

-- BƯỚC 3: Tạo Bảng Student (Sinh viên)
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,  -- Khóa chính: Mã SV
    FullName VARCHAR(100) NOT NULL,    -- Họ tên 
    DateOfBirth DATE,                   -- Ngày sinh
    ClassID VARCHAR(10),                -- Cột này sẽ làm khóa ngoại
    
    -- THIẾT LẬP MỐI QUAN HỆ (Khóa ngoại)
    -- Liên kết cột ClassID của bảng Student với cột ClassID của bảng Class
    CONSTRAINT FK_Student_Class FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);