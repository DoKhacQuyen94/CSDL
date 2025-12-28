use QuanLyDaoTao;
CREATE TABLE Enrollment (
    StudentID VARCHAR(10),
    SubjectID VARCHAR(10),
    RegistrationDate DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (StudentID, SubjectID),
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Enrollment_Subject FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);