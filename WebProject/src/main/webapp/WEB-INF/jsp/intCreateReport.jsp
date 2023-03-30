<%-- 
    Document   : intReportDetails
    Created on : Mar 18, 2023, 10:25:56 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Job Application List</title>
    </head>

    <style>
        html {
            font-family: Arial, Helvetica, sans-serif;
        }
        body {
            font-size: 16px;
        }
        .header {
            background-color: rgb(208, 204, 204);
            margin-bottom: 1rem;
            height: 8.5rem;
            text-align: center;
            width: 95%;
        }
        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 50px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-x: hidden;
            background-color: #baa9a3;
            font-weight: bold;
            transition: 0.5s;
        }
        .sidebar i{
            padding-left: 0.5rem;
            font-size: 3rem;
        }
        .sidebar:hover{
            width: 230px;
        }
        .sidebar h1 {
            margin-bottom: 30px;
        }
        .sidebar ul {
            list-style-type: none;
            padding-left: 0;
            position: absolute;
            width: 50rem;
        }
        .sidebar .action {
            margin-top: 2rem;
        }
        .sidebar li {
            margin-bottom: 5px;
            position: relative;
            width: 100%;
            font-size: 2rem;
        }
        .sidebar a {
            color: rgb(69, 69, 69);
            padding-top: 2rem;
            padding-bottom: 2rem;
            text-decoration: none;
            position: relative;
            width: 100%;
            display: block;
            display: flex;
        }
        .sidebar span{
            padding-left: 2.5rem;
        }
        .sidebar a:hover {
            background-color: rgb(208, 204, 204);
        }
        .sidebar a.active {
            background-color: rgb(208, 204, 204);
        }
        /* Account */
        .sidebar img {
            width: 12rem;
            height: 12rem;
            margin-left: 6rem;
            margin-right: 3rem;
            border-radius: 50%;
            position: relative;
        }
        #account h2,
        li {
            font-size: 2rem;
            list-style: none;
        }
        #account li a {
            color: black;
        }
        #account ul {
            padding-left: 0%;
        }
        /* CSS for login link */
        #job-logo img {
            width: 15rem;
            height: 15rem;
            border-radius: 50%;
            margin-left: 4rem;
        }
        #general-info {
            margin-top: 2rem;
            margin-left: 3rem;
            font-size: 2.5rem;
        }
        /* CSS for Job posting */
        #job-detail-head {
            margin-left: 20rem;
            width: 85%;
        }
        input[type=text],
        textarea {
            width: 80%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        button[type=submit] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 20rem;
            font-weight: bold;
        }
        label {
            font-weight: 400;
            margin-bottom: 0;
        }
        .send-report{
            margin-top: 0px;
            text-align: center;
            transition: 0.5s;
            border-radius: 1rem;
        }
        .send-report:hover{
            background-color: rgb(208, 204, 204)
        }
    </style>

    <!-- Sidebar Here -->
    <div class="sidebar">
        <div class="row">
            <div>
                <img src="${sessionScope.user.getPicture()}" />
            </div>
        </div>
        <div class="action">
            <ul>
                <li><a href="<c:url value="/interviewer/schedules"/>"><i class="fa-solid fa-list"></i><span></span>Schedule List</span></a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i><span>Log out</span></a></li>
            </ul>
        </div>
    </div>

    <!-- Body here -->
    <c:url value="/interviewer/report/update" var="action"/>
    <div id="job-detail-head">
        <div class="header">
            <h1 class="send-report">Send Report Page</h1>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <div id="job-logo">
                    <img src="${candidate.getPicture()}"
                         alt="Back-end">
                </div>
            </div>
            <div class="col-sm-8">
                <div id="general-info">
                    <div class="form-group">
                        <label>${candidate.getName()}</label>
                    </div>
                    <div class="form-group">
                        <label><i class="fa-solid fa-envelope"></i> ${candidate.getEmail()}</label>
                    </div>
                    <div class="form-group">
                        <label><i class="fa-solid fa-phone"></i> ${candidate.getPhone()}</label>
                    </div>
                    <form:form method="post" action="${action}" modelAttribute="report">
                        <div class="form-group">
                            <label class="form-label" for="typeNumber">Point</label>
                            <form:input style="width: 20rem; height: 5rem; font-size: 2.5rem;" type="number" id="typeNumber" class="form-control" min="0" max="10" path="point" value="${report.getPoint()}" required="true"/>
                        </div>
                        <div class="form-group">
                            <h2><i class="fa-solid fa-comment"></i> Report</h2>
                            <form:textarea path="content" name="impression" rows="5" required="true" value="${report.getContent()}"/>
                            <c:if test="${report.getReportId() == null}">
                                <button class="send-report" name="action" value="create">Create report</button>
                            </c:if>
                            <c:if test="${report.getReportId() != null}">
                                <button name="action" value="update">Update report</button>
                                <form:hidden path="reportId" value="${report.getReportId()}"/>
                                <input type="hidden" type="date" name="date" value="${report.getCreatedTime()}"/>
                            </c:if>
                        </div>
                        <form:hidden path="employee.id" value="${report.getEmployee().id}"/>
                        <form:hidden path="jobApplication.applicationId" value="${report.getJobApplication().applicationId}"/>
                        <form:hidden path="schedule.scheduleId" value="${report.getSchedule().scheduleId}"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</html>