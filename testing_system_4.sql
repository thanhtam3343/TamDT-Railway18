-- Quesstion 1 Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
    AccountID, FullName, DepartmentName
FROM `account` a
        INNER JOIN
    department d ON a.DepartmentID = d.DepartmentID;

-- Quesstion 2 Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010

SELECT 
    AccountID, FullName, DepartmentName, CreatedDate
FROM `account` a
        INNER JOIN
    department d ON a.DepartmentID = d.DepartmentID
WHERE 
	CreatedDate > 20 - 12 - 2010;


-- Question 3 Viết lệnh để lấy ra tất cả các developer

SELECT 
    *
FROM
    `account` a
        INNER JOIN
    `position` p ON a.`positionid` = p.`positionid`
WHERE
    positionname IN ('Dev1' , 'Dev2');
    
    

-- Question 4 Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 
    d.departmentid,
    d.departmentname,
    COUNT(a.departmentid) AS totalaccount
FROM
    `account` a
        LEFT JOIN
    department d ON a.departmentid = d.departmentid
GROUP BY a.DepartmentID
HAVING totalaccount > 3;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT 
    eq.questionid, q.Content, COUNT(eq.questionid) AS totalQuestions
FROM
    examquestion eq
inner join question q on eq.QuestionID = q.QuestionID
GROUP BY eq.QuestionID
HAVING totalQuestions = (select max(total) 
from (select count(QuestionID) as total from examquestion e group by QuestionID) as ex_temp);


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT 
    c.CategoryID, c.CategoryName, COUNT(q.CategoryID)
FROM
    categoryquestion c
        INNER JOIN
    question q ON c.CategoryID = q.CategoryID
GROUP BY q.CategoryID;



-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select q.questionid, count(eq.questionid) as tong_so_cau_hoi from examquestion eq
right join question q on eq.QuestionID = q.QuestionID
group by eq.QuestionID
order by questionid
;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT 
    Q.QuestionID, Q.Content, COUNT(A.QuestionID)
FROM
    answer A
        INNER JOIN
    question Q ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING COUNT(A.QuestionID) = (SELECT 
        MAX(countQues)
    FROM
        (SELECT 
            COUNT(B.QuestionID) AS countQues
        FROM
            answer B
        GROUP BY B.QuestionID) AS countAnsw);

-- Question 9: Thống kê số lượng account trong mỗi group

select g.groupid, count(ga.accountid) as so_luong from groupaccount ga
join `group` g on ga.groupid = g.GroupID
group by g.groupid
order by so_luong
;

Question 10: Tìm chức vụ có ít người nhất
Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
Question 14:Lấy ra group không có account nào
Question 15: Lấy ra group không có account nào
Question 16: Lấy ra question không có answer nào
Exercise 2: Union
Question 17:
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
Question 18:
a) Lấy các group có lớn hơn 5 thành viên
b) Lấy các group có nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)


