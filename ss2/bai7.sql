-- 1. KHỞI TẠO DATABASE
DROP DATABASE IF EXISTS UniversityDB; -- Xóa nếu đã tồn tại để làm mới
CREATE DATABASE UniversityDB;
USE UniversityDB;
-- . Tạo bảng Lớp học (Độc lập)
CREATE TABLE Class (
    ClassID VARCHAR(10) PRIMARY KEY,
    ClassName NVARCHAR(100) NOT NULL,
    SchoolYear VARCHAR(20)
);

-- . Tạo bảng Giảng viên (Độc lập)
CREATE TABLE Teacher (
    TeacherID VARCHAR(10) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE -- Email là duy nhất
);

-- . Tạo bảng Môn học (Phụ thuộc Giảng viên)
CREATE TABLE Subject (
    SubjectID VARCHAR(10) PRIMARY KEY,
    SubjectName NVARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0), -- Tín chỉ > 0
    TeacherID VARCHAR(10),
    
    -- Liên kết: Môn học do Giảng viên nào phụ trách
    CONSTRAINT FK_Subject_Teacher FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);

-- . Tạo bảng Sinh viên (Phụ thuộc Lớp học)
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    ClassID VARCHAR(10),
    
    -- Liên kết: Sinh viên thuộc lớp nào
    CONSTRAINT FK_Student_Class FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);


-- . Tạo bảng Đăng ký môn học (Enrollment)
CREATE TABLE Enrollment (
    StudentID VARCHAR(10),
    SubjectID VARCHAR(10),
    RegistrationDate DATE DEFAULT (CURRENT_DATE), -- MySQL dùng CURRENT_DATE, SQL Server dùng GETDATE()
    
    PRIMARY KEY (StudentID, SubjectID), -- Khóa phức hợp
    
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Enrollment_Subject FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

-- . Tạo bảng Kết quả học tập (Score)
CREATE TABLE Score (
    StudentID VARCHAR(10),
    SubjectID VARCHAR(10),
    ProcessScore DECIMAL(4, 2) CHECK (ProcessScore BETWEEN 0 AND 10),
    FinalScore DECIMAL(4, 2) CHECK (FinalScore BETWEEN 0 AND 10),
    
    PRIMARY KEY (StudentID, SubjectID), -- Khóa phức hợp
    
    CONSTRAINT FK_Score_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Score_Subject FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);