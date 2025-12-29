INSERT INTO Student (student_id, full_name, date_of_birth, email) 
VALUES (200, 'Pham Van Moi', '2004-06-15', 'phamvanmoi@email.com');

INSERT INTO Enrollment (student_id, subject_id, enroll_date) 
VALUES 
(200, 1, CURRENT_DATE),
(200, 2, CURRENT_DATE),
(200, 3, CURRENT_DATE);

INSERT INTO Score (student_id, subject_id, mid_score, final_score) 
VALUES 
(200, 1, 7.0, 7.5),
(200, 2, 6.5, 8.0);

UPDATE Score 
SET final_score = 9.0 
WHERE student_id = 200 AND subject_id = 1;

DELETE FROM Enrollment 
WHERE student_id = 200 AND subject_id = 3;

SELECT 
    Student.student_id, 
    Student.full_name, 
    Subject.subject_name, 
    Score.mid_score, 
    Score.final_score
FROM Student, Score, Subject
WHERE Student.student_id = Score.student_id 
  AND Score.subject_id = Subject.subject_id;