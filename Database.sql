USE master
GO

DROP DATABASE HRManagement
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
	DOB date NULL,
	Phone nvarchar(max) NULL,
	Address nvarchar(max) NULL,
	Avatar nvarchar(max) NULL,
	Role nvarchar(20) NULL,
	Job_Name nvarchar(max) NULL,
	Experience int NULL,
	Blocked_status bit default 0,
)

CREATE TABLE Employees
(
	Employee_id nvarchar(30) NOT NULL PRIMARY KEY,
	FullName nvarchar(max) NULL,
	Given_Name nvarchar(max) NULL,
	Family_Name nvarchar(max) NULL,
	Email nvarchar(max) NULL,
	Gender bit NULL,
	DOB date NULL,
	Phone nvarchar(max) NULL,
	Address nvarchar(max) NULL,
	Avatar nvarchar(max) NULL,
	Role nvarchar(20) NULL,
	Blocked_status bit default 0,
)


CREATE TABLE Departments
(
	Department_id nvarchar(36) NOT NULL PRIMARY KEY,
	DepartmentName nvarchar(max) NULL,
	Email nvarchar(max) NULL,
	Password nvarchar(max) NULL,
	Role nvarchar(20) NULL
)
GO

CREATE TABLE Job_positions
(
	Job_id nvarchar(36) NOT NULL PRIMARY KEY,
	JobName nvarchar(max) NULL,
	Department_id nvarchar(36) NOT NULL,
)
GO

CREATE TABLE Job_postings
(
	Post_id nvarchar(36) NOT NULL PRIMARY KEY,
	Descriptions nvarchar(max) NULL,
	Type_of_work bit NULL,
	Experience_requirement int NULL,
	Locations nvarchar(max) NULL,
	Welfare nvarchar(max) NULL,
	Salary int NULL,
	Posting_time date NOT NULL,
	Expired_time date NOT NULL,
	Approved_status nvarchar(20) default N'Pending',
	Level nvarchar(50) NULL,
	Picture nvarchar(50) NULL,
	Job_id nvarchar(36) NOT NULL,
)

Create TABLE Job_Applications
(
	Application_id nvarchar(36) NOT NULL PRIMARY KEY,
	Created_time date NOT NULL,
	CV nvarchar(max) NOT NULL,
	CV_status nvarchar(20) default N'Pending',
	Round_number int NULL,
	Application_status nvarchar(20) default N'Review',
	Introduction nvarchar (max) NULL,
	Candidate_id nvarchar(30) NOT NULL,
	Post_id nvarchar(36) NOT NULL,
)


CREATE TABLE Schedules
(
	Schedule_id nvarchar(36) NOT NULL PRIMARY KEY,
	Schedule_date date NOT NULL,
	Schedule_time time NOT NULL,
	Location nvarchar(max) NOT NULL,
	Type_of_interview bit NULL,
	Status nvarchar(15) default N'Pending',
	Round_id nvarchar(36) NOT NULL
)


CREATE TABLE Skills
(
	Skill_id nvarchar(36) PRIMARY KEY,
	SKillName nvarchar(50) NULL,
)

CREATE TABLE Rounds
(
	Round_id nvarchar(36) NOT NULL PRIMARY KEY,
	Round_number int NULL,
	Content nvarchar(max) NULL,
	Post_id nvarchar(36) NOT NULL,
)


CREATE TABLE Reports
(
	Report_id nvarchar(36) NOT NULL PRIMARY KEY,
	Created_time date NOT NULL,
	Content nvarchar(max) NOT NULL,
	Point float NOT NULL,
	Employee_id  nvarchar(30) NOT NULL,
	Application_id nvarchar(36) NOT NULL,
	Schedule_id nvarchar(36) NOT NULL,
)

CREATE TABLE Candidate_Skills
(
	Candidate_id nvarchar(30) NOT NULL,
	Skill_id nvarchar(36) NOT NULL,
	CONSTRAINT PKJob_Candidate_Skills PRIMARY KEY (Candidate_id,Skill_id),
)

CREATE TABLE Employee_Skills
(
	Employee_id nvarchar(30) NOT NULL,
	Skill_id nvarchar(36) NOT NULL,
	CONSTRAINT PKJob_Employee_Skills PRIMARY KEY (Employee_id,Skill_id),
)

CREATE TABLE Job_Positions_Skills
(
	Job_id nvarchar(36) NOT NULL,
	Skill_id nvarchar(36) NOT NULL,
	CONSTRAINT PKJob_Positions_Skills PRIMARY KEY (Job_id,Skill_id),
)

CREATE TABLE Job_application_Schedule
(
	Reason_content nvarchar(max) NULL,
	File_path nvarchar(max) NULL,
	Status nvarchar(20) default N'Pending',
	Application_id nvarchar(36) NOT NULL,
	Schedule_id nvarchar(36) NOT NULL,
	CONSTRAINT PKJob_application_Schedule PRIMARY KEY (Application_id,Schedule_id),
)

CREATE TABLE Interviewer_Reasons
(
	Reason_content nvarchar(max) NULL,
	File_path nvarchar(max) NULL,
	Status nvarchar(20) default N'Pending',
	Schedule_id nvarchar(36) NOT NULL,
	Employee_id nvarchar(30) NOT NULL,
	CONSTRAINT PKReasons PRIMARY KEY (Schedule_id,Employee_id),
)

--Insert Candidate
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name,  Email, DOB, Phone, Address, Avatar, Role, Job_Name, Experience, Blocked_status) 
	   VALUES(N'CA0001', N'Luong Nhu H', N'Nhu H', N'Luong', N'LuongH@gmail.com', NULL, NULL, NULL, NULL, N'ROLE_CANDIDATE', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name, Email, DOB, Phone, Address, Avatar, Role, Job_Name, Experience, Blocked_status) 
	   VALUES(N'CA0002', N'Tran Van C', N'Van C', N'Tran', N'TranC@gmail.com', NULL, NULL, NULL, NULL, N'ROLE_CANDIDATE', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name, Email, DOB, Phone, Address, Avatar, Role, Job_Name, Experience, Blocked_status) 
	   VALUES(N'CA0003', N'Nguyen Thi D', N'Thi D', N'Nguyen', N'NguyenD@gmail.com', NULL, NULL, NULL, NULL, N'ROLE_CANDIDATE', NULL, NULL, 0)
INSERT Candidates(Candidate_id, FullName, Given_Name, Family_Name, Email, DOB, Phone, Address, Avatar, Role, Job_Name, Experience, Blocked_status) 
	   VALUES(N'CA0004', N'Truong Van A', N'Van A', N'Truong', N'TruongA@gmail.com', NULL, NULL, NULL, NULL, N'ROLE_CANDIDATE', NULL, NULL, 0)


--Insert Interviewer
INSERT Employees(Employee_id, FullName, Given_Name, Family_Name, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'EM0001', N'Nguyen The A', N'The A', N'Nguyen', N'NguyenA@gmail.com', 1, N'2000-10-2', N'Q.2', N'0302043234', Null, N'ROLE_INTERVIEWER', 0)
INSERT Employees(Employee_id, FullName, Given_Name, Family_Name, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'EM0002', N'Nguyen Van B', N'Van B', N'Nguyen', N'NguyenB@gmail.com', 0, N'1992-8-19', N'Q.9', N'0972834149', Null, N'ROLE_INTERVIEWER', 0)
INSERT Employees(Employee_id, FullName, Given_Name, Family_Name, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'EM0003', N'Truong Van C', N'Van C', N'Truong', N'TruongC@gmail.com', 1, N'1995-2-12', N'Q.5', N'0983716535', Null, N'ROLE_INTERVIEWER', 0)


--Insert HR manager/HR employee
INSERT Employees(Employee_id, FullName, Given_Name, Family_Name, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'EM0004', N'Tran The A', N'The A', N'Tran', N'TranA@gmail.com', 0, N'1998-1-2', N'Q.1', N'09038827488', Null, N'ROLE_MANAGER', 0)
INSERT Employees(Employee_id, FullName, Given_Name, Family_Name, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'EM0005', N'Nguyen Thi B', N'Thi B', N'Nguyen', N'NguyenB@gmail.com', 1, N'1992-12-3', N'Q.5', N'0936827812', Null, N'ROLE_EMPLOYEE', 0)
INSERT Employees(Employee_id, FullName, Given_Name, Family_Name, Email, Gender, DOB, Address, Phone, Avatar, Role, Blocked_status) 
	VALUES(N'100608636561630496525', N'le dang khoa', N'le', N'dang khoa', N'ledangkhoa9aa2@gmail.com', 1, null, null, null, N'https://lh3.googleusercontent.com/a/AGNmyxbHpqK1DJed-9OfIXatnXKRSvUznDmwLgIgIcr6=s96-c', N'ROLE_EMPLOYEE', 0)


--Insert Departments
INSERT Departments(Department_id, DepartmentName, Email, Password, Role)
	VALUES(N'MA', N'MARKETING', N'Marketing@gmail.com', N'123', N'ROLE_DEPARTMENT')
INSERT Departments(Department_id, DepartmentName, Email, Password, Role)
	VALUES(N'HC', N'Hanh Chinh', N'Hanhchinh@gmail.com', N'123', N'ROLE_DEPARTMENT')
INSERT Departments(Department_id, DepartmentName, Email, Password, Role)
	VALUES(N'NS', N'Nhan su', N'Nhansu@gmail.com', N'123', N'ROLE_DEPARTMENT')
INSERT Departments(Department_id, DepartmentName, Email, Password, Role)
	VALUES(N'KT', N'Ke Toan', N'Ketoan@gmail.com', N'123', N'ROLE_DEPARTMENT')
INSERT Departments(Department_id, DepartmentName, Email, Password, Role)
	VALUES(N'IT', N'Information Technology', N'ITech@gmail.com', N'123', N'ROLE_DEPARTMENT')

--Insert Job_positions
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0001', N'Back-end Developer', N'IT')
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0002', N'Front-end Developer', N'IT')
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0003', N'System Analyst', N'KT')
INSERT Job_positions(Job_id, JobName, Department_id)
	VALUES(N'J0004', N'Tester', N'NS')

--Insert Job_postings (4-5)
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Level, Picture, Job_id)
	VALUES(N'P0001', N'Participate in the software design phase;Analyze software functions as required by management or departments;Building and designing databases according to designs on SQL Server, programming Store procedures',
	'1', N'Q.4', N'15 annual days leave;13th bonus salary;Personal insurance for 2+ years staff;Provided with a Mac book and 2nd Monitoring','1200', N'2022-12-24', N'2023-1-15',N'Approved',N'Mid', Null, 'J0001' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Level, Picture, Job_id)
	VALUES(N'P0002', N'We will entrust you with the application development work of our marketing DX support service such as "AD EBiS" "AdRepo", "New Product", an advertising effectiveness measurement platform with the largest market share in the industry.', 
	'0', N'Q.3',N'Tet gift / birthday gift;Sports activities (badminton,foofball,billiards etc.,);Regular health checkup (once a year)','1500', N'2022-9-16', N'2023-7-15',N'Approved', N'Architect', Null, 'J0002' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Level, Picture, Job_id)
	VALUES(N'P0003', N'Segmed�s mission is to bring higher quality healthcare to millions of more patients around the world. We are revolutionizing healthcare research by building a medical AI development platform with secure and easy data access. We see a future where medical AI helps people get a better standard of care no matter where they are in the world, and we hope you do, too! We are a fast-growing startup in a quickly evolving field and we came out of Stanford and Y Combinator. We are a 100% remote and distributed team.', 
	'1', N'Q.2',N'Annual voluntary health insurance;Social insurance;Yearly company trip','2000', N'2023-2-4', N'2023-3-31',N'Approved', N'Junior', Null,'J0003' )
INSERT Job_postings(Post_id, Descriptions, Type_of_work, Locations, Welfare, Salary, Posting_time, Expired_time, Approved_status, Level, Picture, Job_id)
	VALUES(N'P0004', N'Analyzing and developing web applications and web services. Working with other developers to build applications with ReactJS/NextJS/AngularJS and Restful API. Work as part of a team to meet demanding project requirements. Write clean, modular, robust code to implement the desired requirements with little or no supervision. Work with the QA team to triage and fix bugs with rapid turnaround perform a technical.', 
	'0', N'Q.9',N'Salary raises or bonus by work performance per 12 months;All insurances according to Vietnamese Labor law','3000', N'2021-12-22', N'2022-3-24',N'Pending', N'Senior', Null,'J0004' )



--Insert Job_Applications
INSERT Job_Applications(Application_id, Created_time, CV, CV_status, Round_number, Application_status, Introduction, Candidate_id, Post_id)
	VALUES (N'A0001', N'2022-12-25', N'Null', N'Approved', '2', N'Schedule', N'I was the editor of the yearly periodical at Miranda House and also completed two internships at Caravan and The Indian Express. I was excited to find this position as an Assistant Editor at your organisation and I believe I would be a great fit for this role.', 
	N'CA0001', N'P0001')
INSERT Job_Applications(Application_id, Created_time, CV, CV_status, Round_number, Application_status, Introduction, Candidate_id, Post_id)
	VALUES (N'A0002', N'2023-3-13', N'Null', N'Pending', Null, N'Review', N'Being a certified professional, I have pursued BTech in Computer Science Engineering with a specialization in Networking and Security from VIT Vellore. I have recently appeared for the CCNA certification examination and I am awaiting the result.', 
	N'CA0002', N'P0003')
INSERT Job_Applications(Application_id, Created_time, CV, CV_status, Round_number, Application_status, Introduction, Candidate_id, Post_id)
	VALUES (N'A0003', N'2022-1-9', N'Null', N'Approved', Null, N'On Going', N'I was a part of the SEO Marketing team at Leverage Edu for the last 2 years and before that, I worked for a year at Infinity Inc. I have a thorough knowledge of on-page and off-page SEO as well as content marketing tools.', 
	N'CA0003', N'P0004')
INSERT Job_Applications(Application_id, Created_time, CV, CV_status, Round_number, Application_status, Introduction, Candidate_id, Post_id)
	VALUES (N'A0004', N'2022-1-9', N'Null', N'Approved', Null, N'Waiting', N'I was a part of the SEO Marketing team at Leverage Edu for the last 2 years and before that, I worked for a year at Infinity Inc. I have a thorough knowledge of on-page and off-page SEO as well as content marketing tools.', 
	N'CA0003', N'P0004')
INSERT Job_Applications(Application_id, Created_time, CV, CV_status, Round_number, Application_status, Introduction, Candidate_id, Post_id)
	VALUES (N'A0005', N'2022-1-9', N'Null', N'Rejected', Null, N'Fail', N'I was a part of the SEO Marketing team at Leverage Edu for the last 2 years and before that, I worked for a year at Infinity Inc. I have a thorough knowledge of on-page and off-page SEO as well as content marketing tools.', 
	N'CA0003', N'P0004')

--Insert Schedules
INSERT Schedules(Schedule_id, Schedule_date, Schedule_time, Location, Type_of_interview, Status, Round_id)
	VALUES(N'S0001', '2023-3-26', '13:30', N'At Home', 0, N'Pending', N'R0001')
INSERT Schedules(Schedule_id, Schedule_date, Schedule_time, Location, Type_of_interview, Status, Round_id)
	VALUES(N'S0002','2023-7-18', '15:00', N'Q.9', 1, N'Pending', N'R0002')
INSERT Schedules(Schedule_id, Schedule_date, Schedule_time, Location, Type_of_interview, Status, Round_id)
	VALUES(N'S0003', '2023-12-25', '16:00', N'At Home', 0, N'On Going', N'R0003')
INSERT Schedules(Schedule_id, Schedule_date, Schedule_time, Location, Type_of_interview, Status, Round_id)
	VALUES(N'S0004', '2023-9-7', '8:00', N'Q.2', 1, N'On Going', N'R0004')

--Insert Interviewer_Reasons
INSERT Interviewer_Reasons(Reason_content, File_path, Schedule_id, Employee_id, Status)
	VALUES(NULL,NULL, N'S0001', N'EM0001', N'Pending')
INSERT Interviewer_Reasons(Reason_content, File_path, Schedule_id, Employee_id, Status)
	VALUES(NULL, NULL, N'S0003', N'EM0002', N'Pending')
INSERT Interviewer_Reasons(Reason_content, File_path, Schedule_id, Employee_id, Status)
	VALUES(NULL,NULL, N'S0001', N'EM0003', N'Approved')
INSERT Interviewer_Reasons(Reason_content, File_path, Schedule_id, Employee_id, Status)
	VALUES(N'I dont have time :))', NULL, N'S0002', N'EM0001', N'Rejected')

--Insert Job_application_Schedule
INSERT Job_application_Schedule(Reason_content,File_path,Application_id, Schedule_id, Status)
	VALUES(NULL, NULL, 'A0001','S0001', N'Pending')
INSERT Job_application_Schedule(Reason_content,File_path,Application_id, Schedule_id, Status)
	VALUES(NULL, NULL, 'A0002','S0002', N'Approved')
INSERT Job_application_Schedule(Reason_content,File_path,Application_id, Schedule_id, Status)
	VALUES(NULL, NULL, 'A0003','S0003', N'Approved')
INSERT Job_application_Schedule(Reason_content,File_path,Application_id, Schedule_id, Status)
	VALUES(NULL, NULL, 'A0001','S0004', N'Rejected')

--Insert Rounds
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0001', '1', N'Soft skill', N'P0001')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0002', '2', N'Hard skill', N'P0001')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0003', '1', N'Soft skill', N'P0002')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0004', '2', N'Hard skill', N'P0002')
INSERT Rounds(Round_id, Round_number, Content, Post_id)
	VALUES(N'R0005', '1', N'Hard skill', N'P0003')

--Insert Reports
INSERT Reports(Report_id, Created_time, Content, Point, Employee_id, Application_id, Schedule_id)
	VALUES(N'RP0001', '2023-3-26', N'Soft Skill Online Interview', 8, N'EM0001', N'A0001', N'S0001')
INSERT Reports(Report_id, Created_time, Content, Point, Employee_id, Application_id, Schedule_id)
	VALUES(N'RP0002', '2023-3-26', N'Soft Skill Offline Interview', 7.5, N'EM0003', N'A0001', N'S0001')
INSERT Reports(Report_id, Created_time, Content, Point, Employee_id, Application_id, Schedule_id)
	VALUES(N'RP0003', '2023-7-18', N'Hard Skill Offline Interview', 8, N'EM0002', N'A0001', N'S0002')
INSERT Reports(Report_id, Created_time, Content, Point, Employee_id, Application_id, Schedule_id)
	VALUES(N'RP0004', '2023-12-25', N'Hard Skill Online Interview', 4, N'EM0001', N'A0002', N'S0003')

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

--Insert  Candidate_Skills
INSERT  Candidate_Skills(Candidate_id,Skill_id)
		VALUES(N'CA0001', N'1')
INSERT  Candidate_Skills(Candidate_id,Skill_id)
		VALUES(N'CA0001', N'4')
INSERT  Candidate_Skills(Candidate_id,Skill_id)
		VALUES(N'CA0002', N'7')


--Insert Employee_Skills
INSERT Employee_Skills(Employee_id,Skill_id)
		VALUES(N'EM0001', N'1')
INSERT Employee_Skills(Employee_id,Skill_id)
		VALUES(N'EM0001', N'2')
INSERT Employee_Skills(Employee_id,Skill_id)
		VALUES(N'EM0002', N'4')
INSERT Employee_Skills(Employee_id,Skill_id)
		VALUES(N'EM0003', N'4')

--Insert Job_Positions_Skills
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
		VALUES(N'J0003', N'6')
INSERT Job_Positions_Skills(Job_id,Skill_id)
		VALUES(N'J0004', N'3')


ALTER TABLE Job_Applications ADD CONSTRAINT [FK_application_posting1] FOREIGN KEY(Candidate_id)
REFERENCES  Candidates(Candidate_id)
GO

ALTER TABLE Job_Applications ADD CONSTRAINT [FK_application_posting2] FOREIGN KEY(Post_id)
REFERENCES  Job_postings(Post_id)
GO 

ALTER TABLE Job_postings ADD CONSTRAINT [FK_posting_position] FOREIGN KEY(Job_id)
REFERENCES  Job_positions(Job_id)
GO

ALTER TABLE Job_positions ADD CONSTRAINT [FK_Job_Department] FOREIGN KEY(Department_id)
REFERENCES  Departments(Department_id)
GO

ALTER TABLE Rounds ADD CONSTRAINT [FK_Round_Post] FOREIGN KEY(Post_id)
REFERENCES Job_postings(Post_id)
GO

ALTER TABLE Candidate_Skills ADD CONSTRAINT [FK_Candidate_Skill1] FOREIGN KEY(Skill_id)
REFERENCES SKills(Skill_id)
GO

ALTER TABLE Candidate_Skills ADD CONSTRAINT [FK_Candidate_Skill2] FOREIGN KEY(Candidate_id)
REFERENCES Candidates(Candidate_id)
GO

ALTER TABLE Employee_Skills ADD CONSTRAINT [Employee_Skill1] FOREIGN KEY(Skill_id)
REFERENCES SKills(Skill_id)
GO

ALTER TABLE Employee_Skills ADD CONSTRAINT [Employee_Skill2] FOREIGN KEY(Employee_id)
REFERENCES Employees(Employee_id)
GO

ALTER TABLE Job_Positions_Skills ADD CONSTRAINT [FK_Position_Skill1] FOREIGN KEY(Job_id)
REFERENCES Job_Positions(Job_id)
GO

ALTER TABLE Job_Positions_Skills ADD CONSTRAINT [FK_Position_Skill2] FOREIGN KEY(Skill_id)
REFERENCES SKills(Skill_id)
GO
----
ALTER TABLE Reports ADD CONSTRAINT [FK_Report_Schedule] FOREIGN KEY(Schedule_id)
REFERENCES Schedules(Schedule_id)
GO
-----
ALTER TABLE Reports ADD CONSTRAINT [FK_Report_Interviewer] FOREIGN KEY(Employee_id)
REFERENCES Employees(Employee_id)
GO

ALTER TABLE Reports ADD CONSTRAINT [FK_Report_Job_application] FOREIGN KEY(Application_id)
REFERENCES Job_Applications(Application_id)
GO

-----
ALTER TABLE Interviewer_Reasons ADD CONSTRAINT [FK_Interviewer_Reason1] FOREIGN KEY(Schedule_id)
REFERENCES Schedules(Schedule_id)
GO

-----
ALTER TABLE Interviewer_Reasons ADD CONSTRAINT [FK_Interviewer_Reason2] FOREIGN KEY(Employee_id)
REFERENCES Employees(Employee_id)
GO

ALTER TABLE Job_application_Schedule ADD CONSTRAINT [FK_Job_application_Schedule1] FOREIGN KEY(Application_id)
REFERENCES Job_Applications(Application_id)
GO

ALTER TABLE Job_application_Schedule ADD CONSTRAINT [FK_Job_application_Schedule2] FOREIGN KEY(Schedule_id)
REFERENCES Schedules(Schedule_id)
GO

ALTER TABLE Schedules ADD CONSTRAINT [FK_Schedules] FOREIGN KEY(Round_id)
REFERENCES Rounds(Round_id)
GO


