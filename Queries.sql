-- Part A: Queries

-- Question i
SELECT Name FROM STUDENT WHERE Class = 5 AND Major = 'CS';

-- Question ii
SELECT Course_name
FROM COURSE
INNER JOIN SECTION ON COURSE.Course_number = SECTION.Course_number
WHERE Instructor = 'King' AND (Section_year = '98' OR Section_year = '99');

-- Question iii
SELECT SECTION.Course_number, SECTION.Semester, SECTION.SECTION_Year, COUNT(GRADE_REPORT.Student_number) AS NUMBER_OF_STUDENTS
FROM SECTION
INNER JOIN GRADE_REPORT ON SECTION.Section_identifier = GRADE_REPORT.Section_identifier
WHERE SECTION.Instructor = 'King'
GROUP BY SECTION.Course_number, SECTION.Semester, SECTION.SECTION_Year;

-- Question iv
SELECT STUDENT.Name, COURSE.Course_name, COURSE.Course_number, COURSE.Credit_hours, SECTION.Semester, SECTION.SECTION_Year, GRADE_REPORT.Grade
FROM ((STUDENT 
INNER JOIN GRADE_REPORT ON STUDENT.Student_number = GRADE_REPORT.Student_number)
INNER JOIN SECTION ON GRADE_REPORT.section_identifier = SECTION.Section_identifier)
INNER JOIN COURSE ON SECTION.Course_number = COURSE.Course_number
WHERE STUDENT.Class = 5 AND STUDENT.Major = 'CS';

-- Question v (Straight A Students)
SELECT STUDENT.Name, STUDENT.Major
FROM STUDENT
WHERE STUDENT.Student_number IN (
    SELECT GRADE_REPORT.Student_number 
    FROM GRADE_REPORT 
    WHERE GRADE_REPORT.Grade = 'A'
) 
AND STUDENT.Student_number NOT IN (
    SELECT GRADE_REPORT.Student_number 
    FROM GRADE_REPORT 
    WHERE GRADE_REPORT.Grade <> 'A'
);

-- Question vi (No A Grades)
SELECT STUDENT.Name, STUDENT.Major
FROM STUDENT
WHERE STUDENT.Student_number NOT IN (
    SELECT GRADE_REPORT.Student_number 
    FROM GRADE_REPORT 
    WHERE GRADE_REPORT.Grade = 'A'
);


-- Part B: Database Updates

-- Question i
INSERT INTO Student (Name, Student_number, class, major)
VALUES ('Johnson', 25, 1, 'MATH');

-- Question ii
UPDATE Student
SET class = 2
WHERE Name = 'Smith';

-- Question iii
INSERT INTO COURSE (Course_name, Course_number, Credit_hours, Department)
VALUES ('Knowledge Engineering', 'cs4390', 3, 'Cs');

-- Question iv
DELETE FROM Student
WHERE Name = 'Smith' AND Student_number = 17;