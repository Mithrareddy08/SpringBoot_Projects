
CREATE TABLE Employee (
first_name Varchar(50), last_name Varchar(50), job_start_date Date, Salary Integer(40)
);

describe Employee;

-- Add Department Column
ALTER TABLE Employee ADD Department Varchar(60);

--  Insert table values
INSERT INTO Employee (first_name, last_name, job_start_date, Salary, Department) VALUES ('Mithra', 'Reddy', '2023-04-08', 400, 'Finance');
INSERT INTO Employee (first_name, last_name, job_start_date, Salary, Department) VALUES ('Rash', 'Reddy', '2023-07-10', 380, 'Health');
INSERT INTO Employee (first_name, last_name, job_start_date, Salary, Department) VALUES ('Sanjana', 'Reddy', '2023-07-17', 360, 'Marketing');
INSERT INTO Employee (first_name, last_name, job_start_date, Salary, Department) VALUES ('Roshini', 'Racha', '2023-05-24', 340, 'Hr')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ;
INSERT INTO Employee (first_name, last_name, job_start_date, Salary, Department) VALUES ('Rishika', 'Chekuri', '2023-07-14', 320, 'Sales');

-- Display
SELECT * from Employee;

-- Highest Salary
SELECT max(Salary) AS highest_salary from Employee;

        
SELECT * from Employee where job_start_date >= date_sub(curdate(), interval 6 month);

INSERT INTO Employee(first_name, last_name, job_start_date, Salary, Department) VALUES ('Sneha', 'Reddy', '2022-05-26', 300, 'Finance');

-- Joined last 6 months
SELECT * from Employee where job_start_date >= date_sub(curdate(), interval 6 month);

-- Count Employees in each department
SELECT Department, COUNT(*) from Employee group by Department;

SHOW Tables;

describe consultantdetails;

INSERT INTO consultantdetails (ConsultantId, LeadId, FirstName, LastName, Email, PhoneNumber) VALUES ('Ud123', 'Te789', 'Uday','Kumar', 'uday@gmail.com', 3634336789);
INSERT INTO consultantdetails(ConsultantId, LeadId, FirstName, LastName, Email, PhoneNumber) VALUES ('Na456', 'Te426', 'Narain', 'Tata', 'Narain@gmail.com', 4005671234);
INSERT INTO consultantdetails (ConsultantId, LeadId, FirstName, LastName, Email, PhoneNumber) VALUES ('Sr789', 'Kr416', 'SriHari', 'Prudhvi', 'Srihari@gmail.com', 7892549876);
INSERT INTO consultantdetails (ConsultantId, LeadId, FirstName, LastName, Email, PhoneNumber) VALUES ('Bh436', 'Sp678', 'Bharath', 'Reddy', 'Bharath@gmail.com', 8237247908);

SELECT * from consultantdetails;


-- Update Email Address
UPDATE consultantdetails SET Email = 'UdayKumar@gmail.com' where ConsultantId = 'ud123';

describe submission;

--     -
-- SELECT ConsultantId, COUNT(*) from submission group by ConsultantId; 
-- describe submission;

DROP TABLE submission;

create table submissions(
id varchar(60) primary key,
Consultant_id varchar(60),
submission_date date,
vendor_company  varchar(60),
vendor_name varchar(80),
vendor_email_address  varchar(60),
vendor_phone_number  varchar(15),
implementation_partner varchar(60), 
client_name varchar(80),
pay_rate integer,
submission_status varchar(60),
submission_type varchar(10),
city varchar(20),
state varchar(2),
zip integer);
describe submissions;
select * from consultantdetails;
select * from submissions;
select * from leaddetails;
-- query to update email_address on the consultant_detail table
update consultantdetails set Email="bharath.reddy@gmail.com" where ConsultantId="BH436";

-- to find total number of submissions for each constulant.
SELECT c.ConsultantId, c.FirstName, COUNT(s.id) AS total_submissions
FROM consultantdetails c
JOIN submissions s ON c.ConsultantId = s.Consultant_id
GROUP BY c.ConsultantId;


-- to find total number of submissions for each constulant by each submission day
select Consultant_id,submission_date,count(*) as Total_submissions
from submissions 
group by submission_date, Consultant_id;


-- to delete all submissions where "rate" is null
delete from submissions where pay_rate is null;


-- Given a lead name and submission date, Write a SQL query to find the submissions.
select * from leaddetails;
show tables;

select s.*
from submissions s
join consultantdetails c on c.ConsultantId=s.Consultant_id
join leaddetails l on l.Id=c.LeadId
where l.FirstName="Kranthi" and submission_date="2023-07-17";

-- query to find the number of submissions by each lead.
SELECT l.FirstName, l.LastName, COUNT(*) AS Count
FROM submissions s
join consultantdetails c on c.ConsultantId=s.Consultant_id
join leaddetails l on l.Id=c.LeadId
GROUP BY l.FirstName, l.LastName;











