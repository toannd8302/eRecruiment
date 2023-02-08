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
	Department_id nvarchar(6) NOT NULL,
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


INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0001', N'Back-end Developer', N'MA')
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0002', N'Front-end Developer', N'HC')
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0003', N'System Analyst', N'KT')
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0004', N'Tester', N'NS')


INSERT Job_postings(Post_id, Descriptions, Type_of_work, Experience_requirement, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0001', N'YRGLM Vietnam is a company established December 2013 in HCMC, owned by YRGLM Inc. in Japan. YRGLM Inc provide Marketing Platform Business with that have NO 1 Market share in Japan. With data and technology, we will support marketing activities by companies around the world and become a company that creates happiness for sellers and buyers..',
	'1', '2' , N'Q.4', N'15 annual days leave, 13th bonus salary, Personal insurance for 2+ years staff, Provided with a Mac book and 2nd Monitoring', '1200', N'2022-12-24', N'2023-1-15', '0', 'J0001' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Experience_requirement, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0002', N'We will entrust you with the application development work of our marketing DX support service such as "AD EBiS" "AdRepo", "New Product", an advertising effectiveness measurement platform with the largest market share in the industry.',
	'0', '1', N'Q.3', N'Tet gift / birthday gift, Sports activities (badminton,foofball,billiards etc.,), Regular health checkup (once a year)','1500', N'2022-9-16', N'2023-7-15','1','J0002' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Experience_requirement, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0003', N'Segmed’s mission is to bring higher quality healthcare to millions of more patients around the world. We are revolutionizing healthcare research by building a medical AI development platform with secure and easy data access. We see a future where medical AI helps people get a better standard of care no matter where they are in the world, and we hope you do, too! We are a fast-growing startup in a quickly evolving field and we came out of Stanford and Y Combinator. We are a 100% remote and distributed team',
	'1', '3', N'Q.2',N'Annual voluntary health insurance, Social insurance, Yearly company trip','2000', N'2023-2-4', N'2023-3-31','1','J0003' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Experience_requirement, Locations, Welfare, Salary,  Posting_time, Expired_time, Approved_status, Job_id)
	VALUES(N'P0004', N'Analyzing and developing web applications and web services. Working with other developers to build applications with ReactJS/NextJS/AngularJS and Restful API. Work as part of a team to meet demanding project requirements. Write clean, modular, robust code to implement the desired requirements with little or no supervision. Work with the QA team to triage and fix bugs with rapid turnaround perform a technical ',
	'0', '4', N'Q.9',N'Salary raises or bonus by work performance per 12 months, All insurances according to Vietnamese Labor law','3000', N'2021-12-22', N'2022-3-24','0','J0004' )


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


	
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0001', N'1')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0001', N'4')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0001', N'7')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0001', N'8')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0002', N'2')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0002', N'5')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0002', N'6')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0003', N'3')


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

ALTER TABLE Job_positions ADD CONSTRAINT [FK_Job_Department] FOREIGN KEY(Department_id)
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


