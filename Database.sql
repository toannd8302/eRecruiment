USE master
GO

CREATE DATABASE HRManagement
GO

USE HRManagement
GO

CREATE TABLE Accounts
(
	Account_id nvarchar(6) NOT NULL PRIMARY KEY,
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

CREATE TABLE Job_Applications
(
	Application_id nvarchar(6) NOT NULL PRIMARY KEY,
	Created_time date NOT NULL,
	CV nvarchar(max) NOT NULL,
	CV_status bit NULL,
	Round_number int NULL,
	Application_status bit NULL,
	Account_id nvarchar(6) NOT NULL,
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

CREATE TABLE Schedule_account
(
	Role nvarchar(20) NULL,
	Schedule_id int NOT NULL,
	Account_id nvarchar(6) NOT NULL,
	CONSTRAINT PKSchedule_account PRIMARY KEY (Schedule_id,Account_id),
)


--Insert Interviewer
INSERT Accounts(Account_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'IN0001', N'Nguyen The A', N'NguyenA@gmail.com', 1, N'2000-10-2', N'Q.2', N'0302043234', N'aaaksk/asa/asa', N'interviewer', NULL, 5, N'Back-End,Java,NodeJS', 0)


--Insert Candidate
INSERT Accounts(Account_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'CA0001', N'Luong Nhu H', N'LuongH@gmail.com', 1, N'2002-7-12', N'Q.3', NULL, N'hhh/sds/aas', N'candidate', N'Marketing', NULL, NULL, 0)


--Insert HR manager/HR employee
INSERT Accounts(Account_id, FullName, Email, Gender, DOB, Address, Phone, Avatar, Role, Job_Name, Experience, Skill, Blocked_status) 
	VALUES(N'EM0001', N'Tran The A', N'TranA@gmail.com', 0, N'1998-1-2', N'Q.1', N'09038827488', N'aaaksk/asa/asa', N'HR manager', NULL, 8, N'Digital Marketing,People Management,Talent Management', 0)



--Insert Departments



--Insert Job_positions



--Insert Job_postings



--Insert Job_Applications



--Insert Schedules



--Insert Reasons



--Insert Schedule_account




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

ALTER TABLE Job_Applications ADD CONSTRAINT [FK_application_posting1] FOREIGN KEY(Account_id)
REFERENCES  Accounts(Account_id)
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

