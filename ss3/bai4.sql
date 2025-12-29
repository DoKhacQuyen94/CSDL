use quanlysinhvien;
-- BƯỚC 1: TẠO BẢNG SUBJECT (MÔN HỌC)
CREATE TABLE Subject (
    subject_id INT NOT NULL PRIMARY KEY,          -- Mã môn học là khóa chính
    subject_name VARCHAR(100) NOT NULL,  -- Tên môn học
    credit INT,                          -- Số tín chỉ
    CHECK (credit > 0)                   -- Ràng buộc: Số tín chỉ phải lớn hơn 0
);

-- BƯỚC 2: THÊM DỮ LIỆU MẪU (INSERT)
INSERT INTO Subject (subject_id, subject_name, credit)
VALUES 
    (1, 'Toán cao cấp', 3),
    (2, 'Tin học đại cương', 2),
    (3, 'Cơ sở dữ liệu', 4);


-- Yêu cầu : Cập nhật số tín chỉ cho môn học có subject_id = 1 (Toán cao cấp) lên 4 tín chỉ
UPDATE Subject
SET credit = 4
WHERE subject_id = 1;

-- Yêu cầu : Đổi tên môn học có subject_id = 2 thành 'Nhập môn Lập trình'
UPDATE Subject
SET subject_name = 'Nhập môn Lập trình'
WHERE subject_id = 2;

-- BƯỚC 4: KIỂM TRA KẾT QUẢ (SELECT)
SELECT * FROM Subject;