--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT * 
FROM Course 
CROSS JOIN AchievementType 

--List all Teachers without exam Grade
SELECT * FROM Teacher AS t
left join Grade AS g 
on g.TeacherID = t.ID
WHERE g.Grade = null


--Calculate the count of all grades per Teacher in the system
SELECT FirstName, COUNT(*) AS AllGrades
FROM Teacher AS t
INNER JOIN 
Grade g on g.TeacherID = t.ID
GROUP BY FirstName

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.FirstName, COUNT(*) AS AllGrades
FROM Teacher AS t
INNER JOIN 
Grade g on g.TeacherID = t.ID
WHERE g.StudentID < 100
GROUP BY t.FirstName

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName, MAX(g.Grade) AS MaxGrade,AVG(g.Grade) AS AvgGrade
FROM Student s
INNER JOIN Grade g on s.ID = g.StudentID
GROUP BY s.FirstName

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName, COUNT(*) as AllGradesLargerThen200
FROM Teacher t
INNER JOIN Grade g on t.ID = g.TeacherID
GROUP BY t.FirstName
HAVING COUNT(*) > 200

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.ID ,COUNT(g.Grade) as GradeCount, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade
FROM Student s
INNER JOIN Grade g on s.ID = g.StudentID
GROUP BY s.ID
HAVING MAX(g.Grade) = AVG(g.Grade)

--List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName,s.LastName ,COUNT(g.Grade) as GradeCount, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade
FROM Student s
INNER JOIN Grade g on s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)

















