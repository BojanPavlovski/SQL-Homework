CREATE DATABASE SEDCACADEMYDB

CREATE TABLE Students(
ID int identity(1, 1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date not null,
EnorolledDate date not null,
Gender nchar(1) not null,
NationalIDNumber int not null,
StudentCardNumber int not null
)

CREATE TABLE Teachers(
ID int identity(1, 1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date not null,
AcademicRank nvarchar(50) not null,
HireDate date not null
)

CREATE TABLE Grades(
ID int identity(1,1) not null,
StudentID int not null,
CourseID int not null,
TeacherID int not null,
Grade tinyint not null,
Comment nvarchar(max) null,
CreatedDate date not null
)


CREATE TABLE Courses(
ID int identity(1,1) not null,
Name nvarchar(100) not null,
Credit tinyint not null,
AcademicYear int not null,
Semester tinyint not null
)


CREATE TABLE GradeDetails(
ID int identity(1, 1) not null,
GradeID int not null,
AchivementTypeID int not null,
AchivementPoints int not null,
AchivementMaxPoints int not null,
AchivementDate date not null
)

CREATE TABLE AchivementType(
ID int identity(1, 1) not null,
Name nvarchar(100) not null,
[Description] nvarchar(max) not null,
ParticipationRate decimal(18, 2) not null
)