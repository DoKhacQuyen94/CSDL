use quanlysinhvien;
-- Yêu cầu: Cập nhật email cho sinh viên có student_id = 3
-- Giả sử email mới là 'sv3_updated@email.com'
UPDATE Student
SET email = 'sv3_updated@email.com'
WHERE student_id = 103;

-- Yêu cầu: Cập nhật ngày sinh cho sinh viên có student_id = 2
-- Giả sử ngày sinh đúng là 2003-01-01
UPDATE Student
SET date_of_birth = '2003-01-01'
WHERE student_id = 102;

-- Yêu cầu: Xóa sinh viên có student_id = 5 khỏi hệ thống
DELETE FROM Student
WHERE student_id = 105;

-- Lấy ra tất cả sinh viên để xem kết quả sau khi sửa và xóa
SELECT * FROM Student;