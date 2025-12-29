use quanlysinhvien;
CREATE TABLE Score (
    student_id INT,
    subject_id INT,
    mid_score DECIMAL(4, 2),
    final_score DECIMAL(4, 2),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    CHECK (mid_score >= 0 AND mid_score <= 10),
    CHECK (final_score >= 0 AND final_score <= 10)
);

INSERT INTO Score (student_id, subject_id, mid_score, final_score) VALUES 
(101, 1, 7.5, 8.0),
(102, 1, 6.0, 7.5);

UPDATE Score SET final_score = 9.0 WHERE student_id = 101 AND subject_id = 1;

SELECT * FROM Score;

SELECT * FROM Score WHERE final_score >= 8;