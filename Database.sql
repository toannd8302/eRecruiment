USE master
GO

CREATE DATABASE HRManagement
GO

USE HRManagement
GO


CREATE TABLE Candidates
(
	Candidate_id nvarchar(6) NOT NULL PRIMARY KEY,
	FullName nvarchar(max) NULL,
	Email nvarchar(max) NULL,
	Gender bit NULL,
	DOB date NULL,
	Phone nvarchar(max) NULL,
	Address nvarchar(max) NULL,
	Avatar nvarchar(max) NULL,
	Role nvarchar(20) NULL,
	Job_Name nvarchar(max) NULL,
	Skill nvarchar(max) NULL,
	Experience int NULL,
	Blocked_status bit NULL,
)



CREATE TABLE HR_Employees
(
	HREmployee_id nvarchar(6) NOT NULL PRIMARY KEY,
	FullName nvarchar(max) NULL,
	Email nvarchar(max) NULL,
	Gender bit NULL,
	DOB date NULL,
	Phone nvarchar(max) NULL,
	Address nvarchar(max) NULL,
	Avatar nvarchar(max) NULL,
	Role nvarchar(20) NULL,
	Blocked_status bit NULL,
)

CREATE TABLE Interviewers
(
	Interviewer_id nvarchar(6) NOT NULL PRIMARY KEY,
	FullName nvarchar(max) NULL,
	Email nvarchar(max) NULL,
	Gender bit NULL,
	DOB date NULL,
	Phone nvarchar(max) NULL,
	Address nvarchar(max) NULL,
	Avatar nvarchar(max) NULL,
	Role nvarchar(20) NULL,
	Skill nvarchar(max) NULL,
	Blocked_status bit NULL,
)

CREATE TABLE Departments
(
	Department_id nvarchar(6) NOT NULL PRIMARY KEY,
	DepartmentName nvarchar(max) NULL,
	Email nvarchar(max) NULL,
)
GO

CREATE TABLE Job_positions
(
	Job_id nvarchar(6) NOT NULL PRIMARY KEY,
	JobName nvarchar(max) NULL,
	Skill nvarchar(max) NULL,
	DepartmentId nvarchar(6) NOT NULL,
)
GO

CREATE TABLE Job_postings
(
	Post_id nvarchar(6) NOT NULL PRIMARY KEY,
	Descriptions nvarchar(max) NULL,
	Type_of_work bit NULL,
	Skill_requirement nvarchar(max) NULL,
	Experience_requirement int NULL,
	Locations nvarchar(max) NULL,
	Welfare nvarchar(max) NULL,
	Salary int NULL,
	Interview_process nvarchar(max) NULL,
	Posting_time date NOT NULL,
	Expired_time date NOT NULL,
	Approved_status bit NULL,
	Job_id nvarchar(6) NOT NULL,
)

Create TABLE Job_Applications
(
	Application_id nvarchar(6) NOT NULL PRIMARY KEY,
	Created_time date NOT NULL,
	CV nvarchar(max) NOT NULL,
	CV_status bit NULL,
	Round_number int NULL,
	Application_status bit NULL,
	Candidate_id nvarchar(6) NOT NULL,
	Post_id nvarchar(6) NOT NULL,
)

CREATE TABLE Schedules
(
	Schedule_id int NOT NULL PRIMARY KEY,
	Schedule_time date NOT NULL,
	Location nvarchar(max) NOT NULL,
	Type_of_interview bit NULL,
	Status bit NULL,
)

CREATE TABLE Reasons
(
	Reason_content nvarchar(max) NULL,
	File_path nvarchar(max) NULL,
	Schedule_id int NOT NULL,
	Account_id nvarchar(6) NOT NULL,
	CONSTRAINT PKReasons PRIMARY KEY (Schedule_id,Account_id),
)

CREATE TABLE Skills
(
	Skill_id int NOT NULL PRIMARY KEY,
	SKillName nvarchar(50) NULL,
)

CREATE TABLE Rounds
(
	Round_id nvarchar(6) NOT NULL PRIMARY KEY,
	Round_number int NOT NULL,
	Content nvarchar(50) NOT NULL,
	Post_id nvarchar(6) NOT NULL,
)

DROP TABLE Reports
(
	Report_id nvarchar(6) NOT NULL PRIMARY KEY,
	Created_time date NOT NULL,
	Content nvarchar(max) NOT NULL,
	Point int NOT NULL,
	Interviewer_id  nvarchar(6) NOT NULL,
	Application_id nvarchar(6) NOT NULL,
	Schedule_id nvarchar(6) NOT NULL,
)

CREATE TABLE Schedule_Interviewer
(
	Schedule_id int NOT NULL,
	Interviewer_id nvarchar(6) NOT NULL,
	CONSTRAINT PKSchedule_account PRIMARY KEY (Schedule_id,Interviewer_id),
)

CREATE TABLE Job_Positions_Skills
(
	Job_id nvarchar(6) NOT NULL,
	Skill_id int NOT NULL,
	CONSTRAINT PKJob_Positions_Skills PRIMARY KEY (Job_id,Skill_id),
)

CREATE TABLE Job_Applications_Rounds
(
	Application_id nvarchar(6) NOT NULL,
	Round_id nvarchar(6) NOT NULL,
	CONSTRAINT PKJob_Applications_Rounds PRIMARY KEY (Application_id,Round_id),
)

--Insert Interviewer
INSERT Interviewers(Interviewer_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role,Skill, Blocked_status) 
	VALUES(N'IN0001', N'Nguyen The A', N'NguyenA@gmail.com', 1, N'2000-10-2', N'Q.2', N'0302043234', N'aaaksk/asa/asa', N'interviewer', N'Back-End,Java,NodeJS', 0)
INSERT Interviewers(Interviewer_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role,Skill, Blocked_status) 
	VALUES(N'IN0002', N'Nguyen Van B', N'NguyenB@gmail.com', 0, N'1992-8-19', N'Q.9', N'0972834149', N'sadsad/123/zxc', N'interviewer', N'ReactJS,PHP', 0)


--Insert Candidate(3-4)
INSERT Candidates(Candidate_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'CA0001', N'Luong Nhu H', N'LuongH@gmail.com', 1, N'2002-7-12', N'Q.3', NULL, N'hhh/sds/aas', N'candidate', N'Marketing', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'CA0002', N'Tran Van C', N'TranC@gmail.com', 0, N'1992-12-24', N'Q.5', NULL, N'ada/adas/asd', N'candidate', N'Front-end Developer', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'CA0003', N'Nguyen Thi D', N'NguyenD@gmail.com', 1, N'1989-8-8', N'Q.9', NULL, N'sak/xcz/dkk', N'candidate', N'Bridge Software Engineer', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'CA0004', N'Truong Van A', N'TruongA@gmail.com', 0, N'1999-3-31', N'Q.7', NULL, N'pwe/als/kkk', N'candidate', N'Full-stack Developer', NULL, NULL, 0)


--Insert HR manager/HR employee
INSERT HR_Employees(HREmployee_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'EM0001', N'Tran The A', N'TranA@gmail.com', 0, N'1998-1-2', N'Q.1', N'09038827488', N'aaaksk/asa/asa', N'HR manager', 0)

INSERT HR_Employees(HREmployee_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status)
	VALUES(N'EM0002', N'Nguyen Thi B', N'NguyenB@gmail.com', 1, N'1992-12-3', N'Q.5', N'0936827812', N'13123hdhshcx.jpg', N'HR Employee',0)



--Insert Departments
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'MA', N'MARKETING', N'Marketing@gmail.com')
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'HC', N'Hanh Chinh', N'Hanhchinh@gmail.com')
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'NS', N'Nhan su', N'Nhansu@gmail.com')
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'KT', N'Ke Toan', N'Ketoan@gmail.com')

--Insert Job_positions
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0001', N'Back-end Developer', N'Back-end, ReactJS', N'MA')
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0002', N'Front-end Developer', N'Front-end, NodeJS', N'HC')
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0003', N'System Analyst', N'Back-end, SQL, .NET', N'KT')
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0004', N'Tester', N'Back-end, C#, .NET', N'NS')

--Insert Job_postings (4-5)
INSERT Job_postings(Post_id, Descriptions, Type_of_work, SKill_requirement,Locations, Welfare, Salary, Interview_process, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0001', N'Luong cao', '1',N'Back-end, ReactJS',N'Q.4',N'1 nam nghi 12 ngay','1200',N'Standing', N'2022-12-24', N'2023-1-15','0','J0001' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, SKill_requirement,Locations, Welfare, Salary, Interview_process, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0002', N'Dai ngo tot', '0',N'Front-end, NodeJS',N'Q.3',N'Luong thuong sau 1 nam','1500',N'Standing', N'2022-9-16', N'2023-7-15','1','J0002' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, SKill_requirement,Locations, Welfare, Salary, Interview_process, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0003', N'sadadjakxzc', '1',N'Back-end, C#, C++',N'Q.2',N'Moi truong lam viec tot','2000',N'Standing', N'2023-2-4', N'2023-3-31','1','J0003' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, SKill_requirement,Locations, Welfare, Salary, Interview_process, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0004', N'adassqqexczx', '0',N'Back-end, Softskill',N'Q.9',N'Dong nghiep nhiet tinh','3000',N'Standing', N'2021-12-22', N'2022-3-24','0','J0004' )

--Insert Job_Applications
INSERT Job_Applications(


--Insert Schedules
INSERT Schedules


--Insert Reasons
INSERT Reasons

--Insert Skills
INSERT Skills(Skill_id, SKillName)
	VALUES(N'1', N'Back-end')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'2', N'Front-end')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'3', N'Marketing')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'4', N'C#')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'5', N'ReactJS')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'6', N'NodeJS')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'7', N'.NET')
INSERT Skills(Skill_id, SKillName)
	VALUES(N'8', N'C++')

--Insert Rounds
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0001', '1', N'Soft skill', N'P0001')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0002', '2', N'Hard skill', N'P0001')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0003', '2', N'Soft skill', N'P0002')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0004', '1', N'Hard skill', N'P0002')

--Insert Schedule_account
INSERT Schedule_account



ALTER TABLE Schedule_account ADD CONSTRAINT [FK_schedule_account1] FOREIGN KEY(Schedule_id)
REFERENCES  Schedules(Schedule_id)
GO

ALTER TABLE Schedule_account ADD CONSTRAINT [FK_schedule_account2] FOREIGN KEY(Account_id)
REFERENCES  Accounts(Account_id)
GO

ALTER TABLE Reasons ADD CONSTRAINT [FK_reason1] FOREIGN KEY(Schedule_id)
REFERENCES  Schedules(Schedule_id)
GO

ALTER TABLE Reasons ADD CONSTRAINT [FK_reason2] FOREIGN KEY(Account_id)
REFERENCES  Accounts(Account_id)
GO

ALTER TABLE Job_Applications ADD CONSTRAINT [FK_application_posting1] FOREIGN KEY(Candidate_id)
REFERENCES  Candidates(Candidate_id)
GO

ALTER TABLE Job_Applications ADD CONSTRAINT [FK_application_posting2] FOREIGN KEY(Post_id)
REFERENCES  Job_postings(Post_id)
GO 

ALTER TABLE Job_postings ADD CONSTRAINT [FK_posting_position] FOREIGN KEY(Job_id)
REFERENCES  Job_positions(Job_id)
GO

ALTER TABLE Job_positions ADD CONSTRAINT [FK_Job_Department] FOREIGN KEY(DepartmentId)
REFERENCES  Departments(Department_id)
GO

ALTER TABLE Rounds ADD CONSTRAINT [FK_Round_Post] FOREIGN KEY(Post_id)
REFERENCES Job_postings(Post_id)
GO

ALTER TABLE Job_Positions_Skills ADD CONSTRAINT [FK_Position_Skill1] FOREIGN KEY(Job_id)
REFERENCES Job_Positions(Job_id)
GO

ALTER TABLE Job_Positions_Skills ADD CONSTRAINT [FK_Position_Skill2] FOREIGN KEY(Skill_id)
REFERENCES SKills(Skill_id)
GO


ALTER TABLE Schedule_account DROP CONSTRAINT [FK_schedule_account2] 
GO

ALTER TABLE Reasons DROP CONSTRAINT [FK_reason2]
GO

ALTER TABLE Job_Applications DROP CONSTRAINT [FK_application_posting1]
GO