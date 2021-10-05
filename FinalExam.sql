DROP DATABASE IF EXISTS STUDENTMARK;
CREATE DATABASE STUDENTMARK;
USE STUDENTMARK;

DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
ID 					INT PRIMARY KEY AUTO_INCREMENT,
`Name` 				VARCHAR(50),
Age 				TINYINT,
Gender 				ENUM('M', 'F')
);

DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject` (
ID 					INT PRIMARY KEY AUTO_INCREMENT,
`Name` 				VARCHAR(50)
);

DROP TABLE IF EXISTS StudentSubject;
CREATE TABLE StudentSubject (
StudentID 			INT,
SubjectID 			INT,
Mark 				TINYINT,
`Date` 				DATE	
);

ALTER TABLE StudentSubject ADD CONSTRAINT fk_sdsj_student FOREIGN KEY (StudentID) REFERENCES Student(ID);
ALTER TABLE StudentSubject ADD CONSTRAINT fk_sdsj_subject FOREIGN KEY (SubjectID) REFERENCES `Subject`(ID);

ALTER TABLE Student CHANGE COLUMN Gender Gender ENUM('0', '1');

-- 1. Tạo table với các ràng buộc và kiểu dữ liệu Thêm ít nhất 3 bản ghi vào table

INSERT INTO Student (`Name`, Age, Gender)
VALUES 		('Nguyễn Phương Hằng', '20', '1'),
			('Trương Thế Vinh', '18', '0'),
			('Lương Minh Trang', '19', '1'),
			('Đặng Thanh Tâm', '18', '0'),
			('Vương Thế Dũng', '23', '0')
;

INSERT INTO `Subject` (`Name`)
VALUES 		('Toán'),
			('Lý'),
			('Hoá'),
			('Tiếng Anh'),
			('CNTT')
;

INSERT INTO StudentSubject (StudentID, SubjectID, Mark, `Date`)
VALUES 		('1', '1', '8', '2021-09-16'),
			('2', '2', '9', '2021-09-15'),
			('3', '3', '6', '2021-09-16'),
			('4', '1', '10', '2021-09-13'),
			('5', '2', '9', '2021-09-15')
;

-- 2. Viết lệnh để
-- a) Lấy tất cả các môn học không có bất kì điểm nào

SELECT 
    s.`Name`, ss.Mark
FROM
    `Subject` s
        RIGHT JOIN
    StudentSubject ss ON s.ID = ss.SubjectID
WHERE
    ss.Mark = NULL;

-- b) Lấy danh sách các môn học có ít nhất 2 điểm

SELECT 
    s.`Name`, COUNT(ss.SubjectID) AS TwoMark
FROM
    `Subject` s
        JOIN
    StudentSubject ss ON s.ID = ss.SubjectID
GROUP BY ss.SubjectID
HAVING TwoMark >= 2;

-- 3. Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm: 
-- Student ID,Subject ID, Student Name, Student Age, Student Gender, Subject Name, Mark, Date
-- (Với cột Gender show 'Male' để thay thế cho 0, 'Female' thay thế cho 1 và 'Unknow' thay thế cho null)

DROP VIEW StudentInfo;
CREATE VIEW StudentInfo AS
    SELECT 
        sd.ID AS StudentID,
        sj.ID AS SubjectID,
        sd.`Name`,
        sd.Age,
        IF(Gender = '0', 'Male', 'Female') AS Gender,
        sj.`Name` AS SubjectName,
        ss.Mark,
        ss.`Date`
    FROM
        StudentSubject ss
            JOIN
        Student sd ON ss.StudentID = sd.ID
            JOIN
        `Subject` sj ON ss.SubjectID = sj.ID
;

-- 4. Không sử dụng On Update Cascade & On Delete Cascade
-- a) Tạo trigger cho table Subject có tên là SubjectUpdateID:
-- Khi thay đổi data của cột ID của table Subject, thì giá trị tương ứng với cột SubjectID của 
-- table StudentSubject cũng thay đổi theo

DELIMITER $$
CREATE TRIGGER SubjectUpdateID 
    AFTER UPDATE ON `Subject`
    FOR EACH ROW 
BEGIN
    INSERT INTO StudentSubject (    
     SubjectID
  ) 
  VALUES(
    NEW.ID
  );
END$$
DELIMITER ;

-- USE

UPDATE `Subject` SET ID = 1 WHERE ID = 7;

-- b) Tạo trigger cho table StudentSubject có tên là StudentDeleteID: 
-- Khi xóa data của cột ID của table Student, thì giá trị tương ứng với 
-- cột StudentID của table StudentSubject cũng bị xóa theo

DELIMITER $$
CREATE TRIGGER StudentDeleteID 
    AFTER DELETE ON Student
    FOR EACH ROW 
BEGIN
    INSERT INTO StudentSubject (    
     StudentID
  ) 
  VALUES(
    OLD.ID
  );
END$$
DELIMITER ;

-- USE
DELETE FROM  Student WHERE ID = 1;

-- 5. Viết 1 store procedure (có 2 parameters: student name) sẽ xóa 
-- tất cả các thông tin liên quan tới học sinh có cùng tên như parameter
-- Trong trường hợp nhập vào student name = "*" thì procedure sẽ xóa tất cả các học sinh

DELIMITER $$
CREATE PROCEDURE DELSTUDENT(IN student_name VARCHAR(50))
BEGIN
	IF (student_name  = '*') THEN
		DELETE FROM Student;
    ELSE
		DELETE FROM Student WHERE `Name` = student_name;
	END IF;
END $$
DELIMITER ;  

-- USE
CALL DELSTUDENT('Đặng Thanh Tâm');
CALL DELSTUDENT('*');