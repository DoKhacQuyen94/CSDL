

CREATE DATABASE QuanLyDaoTao;
USE QuanLyDaoTao;

CREATE TABLE Student (
    MaSV VARCHAR(10) PRIMARY KEY,
    TenSV VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    Lop VARCHAR(20)
);

CREATE TABLE Subject (
    MaMH VARCHAR(10) PRIMARY KEY,
    TenMH VARCHAR(100) NOT NULL,
    SoTinChi INT
);

CREATE TABLE Enrollment (
    MaSV VARCHAR(10),
    MaMH VARCHAR(10),
    HocKy VARCHAR(20),
    NgayDangKy DATE,
    PRIMARY KEY (MaSV, MaMH, HocKy), 
    FOREIGN KEY (MaSV) REFERENCES Student(MaSV),
    FOREIGN KEY (MaMH) REFERENCES Subject(MaMH)
);

CREATE TABLE Score (
    MaSV VARCHAR(10),
    MaMH VARCHAR(10),
    DiemSo DECIMAL(4, 2),
    LanThi INT DEFAULT 1,
    PRIMARY KEY (MaSV, MaMH, LanThi),
    FOREIGN KEY (MaSV) REFERENCES Student(MaSV),
    FOREIGN KEY (MaMH) REFERENCES Subject(MaMH),
    CHECK (DiemSo >= 0 AND DiemSo <= 10) -- Ràng buộc điểm chỉ từ 0 đến 10
);

INSERT INTO Student (MaSV, TenSV, NgaySinh, Lop) VALUES 
('SV001', N'Nguyễn Văn A', '2003-01-01', 'CNTT01'),
('SV002', N'Trần Thị B', '2003-05-15', 'KT01');

INSERT INTO Subject (MaMH, TenMH, SoTinChi) VALUES 
('MH101', N'Cơ sở dữ liệu', 3),
('MH102', N'Lập trình Java', 4);

INSERT INTO Enrollment (MaSV, MaMH, HocKy) VALUES 
('SV002', 'MH101', 'HK1-2024');

INSERT INTO Score (MaSV, MaMH, DiemSo) VALUES 
('SV002', 'MH101', 7.5);

INSERT INTO Enrollment (MaSV, MaMH, HocKy)
VALUES ('SV001', 'MH101', 'HK1-2024');

INSERT INTO Score (MaSV, MaMH, DiemSo)
VALUES ('SV001', 'MH101', 8.0);

UPDATE Score
SET DiemSo = 9.5
WHERE MaSV = 'SV001' AND MaMH = 'MH101';

DELETE FROM Score 
WHERE MaSV = 'SV001' AND MaMH = 'MH101';

DELETE FROM Enrollment 
WHERE MaSV = 'SV001' AND MaMH = 'MH101';

