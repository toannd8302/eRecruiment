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
            margin-bottom: 2rem;
            height: 8.5rem;
            text-align: center;
        }
        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-x: hidden;
            background-color: #baa9a3;
            font-weight: bold;
        }
        .sidebar h1 {
            margin-bottom: 30px;
        }
        .sidebar ul {
            list-style-type: none;
            padding-left: 0;
        }
        .sidebar .action {
            margin-top: 2rem;
        }
        .sidebar li {
            margin-bottom: 5px;
        }
        .sidebar a {
            display: block;
            color: rgb(69, 69, 69);
            padding-top: 2rem;
            padding-bottom: 2rem;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: rgb(208, 204, 204);
        }
        .sidebar a.active {
            background-color: rgb(208, 204, 204);
        }
        /* Account */
        .sidebar img {
            width: 13.5rem;
            height: 13.5rem;
            margin-left: 3rem;
            margin-right: 3rem;
            border-radius: 50%;
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
        #general-info h1 {
            font-size: 3rem;
        }
        #general-info h2 {
            font-size: 2.5rem;
        }
        #general-info p {
            margin-top: 1rem;
            font-size: 1.5rem;
        }
        #general-info p i {
            margin-right: 1rem;
        }
        /* CSS for Job posting */
        #job-detail-head {
            margin-left: 20rem;
        }
        #job-detail-head #apply-buton button:first-child:hover {
            background-color: #e74c3c;
        }
        #job-detail-head #apply-buton button:last-child {
            margin-top: 2rem;
            padding: 1rem;
            border-radius: 1rem;
            background-color: #ffffff;
            border: 0.2rem solid #00b14f;
            margin-right: 1rem;
            color: #00b14f;
            font-size: 1.5rem;
            text-align: center;
        }
        #job-detail-head #apply-buton button:last-child:hover {
            background-color: #e74c3c;
        }
        #job-detail-head #apply-buton button a {
            text-decoration: none;
            color: white;
            font-size: 1.5rem;
        }
        #job-detail-head #apply-buton button i:first-child {
            font-size: 2rem;
            color: #ffffff;
            margin-right: 1rem;
        }
        #job-detail-head #apply-buton button i:last-child {
            font-size: 2rem;
            color: #00b14f;
            margin-right: 1rem;
        }
        .general-info-list a {
            text-decoration: none;
            color: rgb(244, 131, 131);
        }
        .application-info-list a {
            text-decoration: none;
            color: rgb(244, 131, 131);
        }
        #general-info .apply-time {
            font-size: 2.5rem;
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
            padding-top: 2rem;
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
                <li><a href="<c:url value="/interviewer/schedules"/>"><i class="fa-solid fa-list"></i> Schedule List</a></li>
                <li><a href="#"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
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
                    <img src="https://www.pngitem.com/pimgs/m/208-2088629_employee-png-free-employees-icon-png-transparent-png.png"
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
                                <button name="action" value="create">Create report</button>
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
</htm