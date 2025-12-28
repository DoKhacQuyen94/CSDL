use quanlydaotao;
CREATE TABLE Score (
    StudentID VARCHAR(10),
    SubjectID VARCHAR(10),
    ProcessScore DECIMAL(4, 2), -- Lưu số thập phân (VD: 8.50)
    FinalScore DECIMAL(4, 2),   -- Lưu số thập phân (VD: 9.75)

    -- 1. KHÓA CHÍNH PHỨC HỢP (Composite Primary Key)
    PRIMARY KEY (StudentID, SubjectID),

    -- 2. KHÓA NGOẠI (Foreign Keys)
    CONSTRAINT FK_Score_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Score_Subject FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID),

    -- 3. RÀNG BUỘC KIỂM TRA (Check Constraints)
    CONSTRAINT Check_ProcessScore_Range CHECK (ProcessScore >= 0 AND ProcessScore <= 10),
    CONSTRAINT Check_FinalScore_Range CHECK (FinalScore >= 0 AND FinalScore <= 10)
);