# E-Recruiment - Java Web-based Project
This is a group project of the subject SWP391 of the 5th term at FPT University. The goal of the project is to develop a web application to be used for managing the online recruitment process
## Lecturer:
* Nguyen Thi Cam Huong
## Members:
* Le Dang Khoa  - <a href="https://github.com/khoaLe12">GitHub</a>
* Nguyen Duc Toan - <a href="https://github.com/Toannd832">GitHub</a>
* Lo Quang Thang  - <a href="https://github.com/Quang-Thang">GitHub</a>
* Tran Vo Hoang Trong An  - <a href="https://github.com/JTRerer">GitHub</a>
* Le Quang Phu -  <a href="https://github.com/Minstreal1">GitHub</a>
## Tech Stack
* Build tool: Maven

* Front-end: HTML/CSS, JavaScript

* Back-end: Spring Web MVC, Spring Security, Hibernate and JPA, Criteria query API, Google Authentication(OAuth2), SQL Server
# Description
This web application is developed for 5 user roles including Department, Candidate, HR Employee, Interviewer, HR Manager. Role department can login using email and password, the rest of roles can login with google as provider and there are 2 sections of login google (1 for candidates, 1 for employees). If candidate is a new account, system will automatically add new account to database.

Each role has its own specific functions, you can find it on section "Roles and features"

## The Recruitment Process: 
This is a brief description of the recruitment process

* Post job vacancies -> Job Application -> CV Evaluation(Pass/Fail) -> Interview -> Reports after interview -> Final Decision(Pass/Fail)

If CV fail, candidate will fail the job that he/she applied. If CV passed, candidate will get a interviewer schedule. 

Candidate or interviewer can reject their schedule but they have to write reasons for that rejection. 

After each Interview schedule, interviewers need to write reports for each candidate. HR Manager will base on that to give a final decision.

## Roles and features
* Department: Manage job postings (View/Create/Delete)
* Candidate: View Job Postings/Post Details, Apply job, View job applications, View schedules, Accepct/Deny interview schedule, ...
* HR Employee: Manage job postings (View/Accept,Deny/End), Manage job application(Evaluate CV, schedule,...), Manage interview schedule(Create,Start,...)
* Interviewer: Manage schedule (Accepct,Deny,End), Manage Report(Write/Edit Reports)
* HR Manager: View job applications, Make a final decisions(based on CV,reports)

## 🏃‍♂️ How to run project
- To run this project, you should use Netbeans IDE (version 8.2 or higher) to run. You need to find the way to config this project before using.
- You must install maven `https://phoenixnap.com/kb/install-maven-windows`
- You must install Tomact server `https://tomcat.apache.org/` and set server port to 8080
- After open project, you should build project to install all dependecies
- Set up database by running the `Database.sql` file (Note that MS SQL Server is used for this project)
- Follow this path of project: `WebProject/src/main/java/com/codeweb/configs/HibernateConfig.java` to change username and password for connecting to database (Note that port 1433 is used for connection)
#### If you use other DBMS, you need to
- Install suitable driver for the DBMS from `https://mvnrepository.com/` by adding dependency to file pom.xml and build again project
- Follow this path of project: `WebProject/src/main/java/com/codeweb/configs/HibernateConfig.java` to set up new DriverClassName, url and Dialect for connection
#### How to login
- For department: enter email and password

| Email | Password | Department |
| ----- | -------- | ---------- |
| Marketing@gmail.com | 123 | MARKETING |
| ITech@gmail.com | 123 | Information Technology |
| Ketoan@gmail.com | 123 | Ke Toan |
- For Canidates: use email (if new, system will auto register your account)
- For Employee: use email (you need add your email from database before login)

## File Structure
We build this web app following 3 layer achirtechture 

![File Structure](https://github.com/khoaLe12/java-swp391-HRManagement/blob/main/Pictures/Screenshot%202023-04-17%20203736.png)

## Home Page of this project
![Homepage](https://github.com/Toannd832/eRecruiment/blob/main/homepage.png)
