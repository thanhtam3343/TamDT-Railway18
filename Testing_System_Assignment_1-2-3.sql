DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department (
DeparmantID INT PRIMARY KEY AUTO_INCREMENT,
DepartmantName VARCHAR (250)
);

INSERT INTO Department(DepartmantName)
VALUES 		('Marketing'),
			('Sale'),
			('Bảo vệ'),
			('Nhân sự'),
			('Kỹ thuật'),
			('Tài chính'),
			('Phó giám đốc'),
			('Giám đốc'),
			('Thư ký'),
			('Bán hàng')
;

CREATE TABLE Position (
PositionID INT PRIMARY KEY AUTO_INCREMENT,
PositionName VARCHAR (50)
);

INSERT INTO Position (PositionName)
VALUES 		('Dev'),
			('Test'),
			('Scrum Master'),
			('PM')

CREATE TABLE `Account` (
AccountID 	INT PRIMARY KEY AUTO_INCREMENT,
Email 		VARCHAR (50),
Username 	VARCHAR(50),
Fullname 	VARCHAR(50),
DeparmentID INT,
PositionID 	INT,
CreateDate 	DATE
);

INSERT INTO `Account` (Email, Username, Fullname, DeparmentID, PositionID, CreateDate)
VALUES 		('nguyenvana@gmail.com', 'nguyenvana', 'Nguyen Van A', 1, 1, '2019-09-15'),
			('nguyenvanb@gmail.com', 'nguyenvanb', 'Nguyen Van B', 1, 2, '2020-12-20'),
			('nguyenvanc@gmail.com', 'nguyenvanc', 'Nguyen Van C', 2, 3, '2021-3-12'),
			('nguyenvand@gmail.com', 'nguyenvand', 'Nguyen Van D', 1, 3, '2020-3-12'),
			('nguyenvane@gmail.com', 'nguyenvane', 'Nguyen Van E', 1, 2, '2018-3-12')
;


CREATE TABLE `Group` (
GroupID 	INT PRIMARY KEY AUTO_INCREMENT,
GroupName 	VARCHAR(50),
CreatorID 	INT,
CreateDate	DATE
);

INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
VALUES 		('Nhom 1', 2, '2020-12-03'),
			('Nhom 2', 2, '2018-10-07'),
			('Nhom 3', 3, '2020-12-30'),
			('Nhom 4', 4, '2019-02-28'),
			('Nhom 5', 1, '2020-07-16')
;


CREATE TABLE GroupAccount (
GroupID 	INT,
AccountID 	INT,
JoinDate 	DATE
);

INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
VALUES 		('1', '1', '2020-06-23'),
			('1', '3', '2019-01-23'),
			('1', '2', '2018-02-15'),
			('1', '4', '2020-09-01'),
			('2', '1', '2018-12-20')
			;
           

CREATE TABLE TypeQuestion (
TypeID 		INT PRIMARY KEY AUTO_INCREMENT,
TypeName 	VARCHAR (250)
);

INSERT INTO TypeQuestion (Typename)
VALUES 		('Trac Nghiem'),
			('Tu luan')
;


CREATE TABLE CategoryQuestion (
CategoryID 	INT PRIMARY KEY AUTO_INCREMENT,
CategoryName VARCHAR (50)
);

INSERT INTO CategoryQuestion (CategoryName)
VALUES 		('Java'),
			('SQL'),
			('HTML'),
			('CSS '),
			('.NET'),
			('Python'),
			('Ruby'),
			('JavaScript')
;


CREATE TABLE Question (
QuestionID 	INT PRIMARY KEY AUTO_INCREMENT,
Content 	VARCHAR(250),
CategoryID 	INT,
TypeID 		INT,
CreatorID 	INT,
CreateDate 	DATE
);

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES 		('Cau hoi 1', 1, 2, 3, '2020-12-05'),
			('Cau hoi 2', 2, 2, 1, '2019-04-20'),
			('Cau hoi 3', 2, 2, 3, '2020-05-21'),
			('Cau hoi 4', 3, 2, 1, '2021-01-10'),
			('Cau hoi 5', 2, 1, 4, '2020-07-12')
;

CREATE TABLE Answer (
AnswerID 	INT PRIMARY KEY AUTO_INCREMENT,
Content 	VARCHAR(500),
QuestionID 	INT,
isCorrect 	ENUM('D','S')
);

INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES 		('Cau tra loi 1', 1, 'D'),
			('Cau tra loi 2', 2, 'S'),
			('Cau tra loi 3', 3, 'D'),
			('Cau tra loi 4', 4, 'D'),
			('Cau tra loi 5', 5, 'S')
;


CREATE TABLE Exam (
ExamID 		INT PRIMARY KEY AUTO_INCREMENT,
`Code` 		VARCHAR(50),
Title 		VARCHAR(50),
CategoryID 	INT,
Duration 	INT,
CreatorID 	INT,
CreateDate 	DATE 

);

INSERT INTO Exam (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES 		('MS_01', 'De thi 01', 1, 90, 1, '2020-09-09'),
			('MS_02', 'De thi 02', 1, 60, 5,'2020-09-09'),
			('MS_03', 'De thi 03', 2, 60, 9, '2020-09-09'),
			('MS_04', 'De thi 04', 2, 90, 1, '2020-09-09'),
			('MS_05', 'De thi 05', 1, 60, 2,  '2020-09-09'),
			('MS_06', 'De thi 06', 2, 90, 2, '2020-09-09'),
			('MS_07', 'De thi 07', 1, 60, 1, '2020-09-09')
;
           
CREATE TABLE ExamQuestion (
ExamID 		INT,
QuestionID 	INT
);

INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES 		(1, 2),
			(2, 2),
			(3, 4),
			(4, 2),
			(5, 4)
;