--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(*) AS GradesCount
FROM Grade 
GROUP BY StudentID
GO

SELECT * FROM vv_StudentGrades

--Change the view to show Student First and Last Names instead of StudentID
GO
ALTER VIEW vv_StudentGrades
AS
SELECT st.FirstName, st.LastName, COUNT(*) AS GradesCount
FROM Student st
INNER JOIN Grade g
ON g.StudentID = st.ID
GROUP BY FirstName, LastName
GO

SELECT * FROM vv_StudentGrades

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY GradesCount DESC

--Declare scalar variable for storing FirstName values
-- Assign value ‘Antonio’ to the FirstName variable
-- Find all Students having FirstName same as the variable
DECLARE @FirstName nvarchar(100)
set @FirstName = 'Antonio'
SELECT * FROM Student
where FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
-- Fill the table variable with all Female students
DECLARE @FemaleStudents table
(StudentId int not null, StudentName nvarchar(100) not null, DateOfBirth date not null)
INSERT INTO @FemaleStudents(StudentId, StudentName, DateOfBirth)
SELECT Id, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT * FROM @FemaleStudents

--Declare temp table that will contain LastName and EnrolledDate columns
-- Fill the temp table with all Male students having First Name starting with ‘A’
-- Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudents
(LastName nvarchar(100) not null, EnrolledDate date not null)
INSERT INTO #MaleStudents(LastName,EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' and FirstName like 'A%'
GROUP BY FirstName, LastName, EnrolledDate
HAVING LEN(FirstName) = 7

SELECT * FROM #MaleStudents

--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT * FROM Teacher
WHERE LEN(FirstName) < 5 and LEFT(FirstName, 3) = LEFT(LastName, 3)




