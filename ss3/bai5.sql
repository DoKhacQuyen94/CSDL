-- BƯỚC 1: TẠO BẢNG ENROLLMENT (ĐĂNG KÝ HỌC)
use quanlysinhvien;
CREATE TABLE Enrollment (
    student_id INT,
    subject_id INT,
    enroll_date DATE DEFAULT (CURRENT_DATE), -- Mặc định lấy ngày hiện tại nếu không nhập
    -- Tạo khóa chính tổ hợp (Composite Primary Key)
    -- Giúp đảm bảo 1 sinh viên không thể đăng ký trùng 1 môn 2 lần
    PRIMARY KEY (student_id, subject_id),
    -- Tạo khóa ngoại (Foreign Key) để liên kết dữ liệu
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

-- BƯỚC 2: THÊM DỮ LIỆU ĐĂNG KÝ (INSERT)=
-- Lưu ý: Phải dùng các student_id và subject_id ĐÃ CÓ ở bảng Student và Subject
-- Giả sử: Student (101, 102) và Subject (1, 2, 3)

INSERT INTO Enrollment (student_id, subject_id, enroll_date)
VALUES 
    (101, 1, '2023-09-05'), -- Sinh viên 101 học môn 1
    (101, 2, '2023-09-06'), -- Sinh viên 101 học thêm môn 2
    (102, 1, '2023-09-05'), -- Sinh viên 102 học môn 1
    (103, 3, '2023-09-10'); -- Sinh viên 103 học môn 3

-- BƯỚC 3: TRUY XUẤT DỮ LIỆU (SELECT)
-- Yêu cầu : Lấy ra tất cả các lượt đăng ký
SELECT * FROM Enrollment;

-- Yêu cầu : Lấy ra các lượt đăng ký của sinh viên có mã 101
SELECT * FROM Enrollment
WHERE student_id = 101;