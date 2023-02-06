USE master
GO

CREATE DATABASE HRManagement
GO

USE HRManagement
GO

CREATE TABLE Candidates
(
	Candidate_id nvarchar(30) NOT NULL PRIMARY KEY,
	FullName nvarchar(max) NULL,
	Given_Name nvarchar(max) NULL,
	Family_Name nvarchar(max) NULL,
	Email nvarchar(max) NULL,
	Phone nvarchar(max) NULL,
	Avatar nvarchar(max) NULL,
	Role nvarchar(20) NULL,
	Job_Name nvarchar(max) NULL,
	Skill nvarchar(max) NULL,
	Experience int NULL,
	Blocked_status bit NULL,
)
GO

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
	Experience_requirement int NULL,
	Locations nvarchar(max) NULL,
	Welfare nvarchar(max) NULL,
	Salary int NULL,
	Posting_time date NOT NULL,
	Expired_time date NOT NULL,
	Approved_status bit NULL,
	Job_id nvarchar(6) NOT NULL,
)
GO

CREATE TABLE Skills
(
	Skill_id int NOT NULL PRIMARY KEY,
	SKillName nvarchar(50) NULL,
)
GO

CREATE TABLE Rounds
(
	Round_id nvarchar(6) NOT NULL PRIMARY KEY,
	Round_number int NOT NULL,
	Content nvarchar(50) NOT NULL,
	Post_id nvarchar(6) NOT NULL,
)
GO

CREATE TABLE Job_Positions_Skills
(
	Job_id nvarchar(6) NOT NULL,
	Skill_id int NOT NULL,
	CONSTRAINT PKJob_Positions_Skills PRIMARY KEY (Job_id,Skill_id),
)
GO


INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name,  Email, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	   VALUES(N'CA0001', N'Luong Nhu H', N'Nhu H', N'Luong', N'LuongH@gmail.com', NULL, NULL, N'candidate', N'Marketing', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name, Email, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	   VALUES(N'CA0002', N'Tran Van C', N'Van C', N'Tran', N'TranC@gmail.com', NULL, NULL, N'candidate', N'Front-end Developer', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name, Email, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	   VALUES(N'CA0003', N'Nguyen Thi D', N'Thi D', N'Nguyen', N'NguyenD@gmail.com', NULL, NULL, N'candidate', N'Bridge Software Engineer', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name, Email, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	   VALUES(N'CA0004', N'Truong Van A', N'Van A', N'Truong', N'TruongA@gmail.com', NULL, NULL, N'candidate', N'Full-stack Developer', NULL, NULL, 0)


INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'MA', N'MARKETING', N'Marketing@gmail.com')
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'HC', N'Hanh Chinh', N'Hanhchinh@gmail.com')
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'NS', N'Nhan su', N'Nhansu@gmail.com')
INSERT Departments(Department_id, DepartmentName, Email)
	VALUES(N'KT', N'Ke Toan', N'Ketoan@gmail.com')


INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0001', N'Back-end Developer', N'Back-end, ReactJS', N'MA')
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0002', N'Front-end Developer', N'Front-end, NodeJS', N'HC')
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0003', N'System Analyst', N'Back-end, SQL, .NET', N'KT')
INSERT Job_positions(Job_id, JobName, Skill, DepartmentId)
	VALUES(N'J0004', N'Tester', N'Back-end, C#, .NET', N'NS')


INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0001', N'Luong cao', '1', N'Q.4', N'1 nam nghi 12 ngay','1200', N'2022-12-24', N'2023-1-15','0','J0001' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0002', N'Dai ngo tot', '0', N'Q.3', N'Luong thuong sau 1 nam','1500', N'2022-9-16', N'2023-7-15','1','J0002' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0003', N'sadadjakxzc', '1', N'Q.2',N'Moi truong lam viec tot','2000', N'2023-2-4', N'2023-3-31','1','J0003' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary,  Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0004', N'adassqqexczx', '0', N'Q.9',N'Dong nghiep nhiet tinh','3000', N'2021-12-22', N'2022-3-24','0','J0004' )


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

INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0001', '1', N'Soft skill', N'P0001')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0002', '2', N'Hard skill', N'P0001')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0003', '2', N'Soft skill', N'P0002')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0004', '1', N'Hard skill', N'P0002')


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


