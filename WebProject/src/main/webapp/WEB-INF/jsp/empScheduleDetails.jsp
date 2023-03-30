<%-- 
    Document   : empScheduleDetails
    Created on : Mar 5, 2023, 9:25:29 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        width: 100%;
    }
    header {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px;
    }
    .title-pen h1 {
        margin: 0;
    }
    .section-pen {
        margin: 20px;
    }
    .section h2 {
        margin-bottom: 10px;
        font-size: 25px;
    }
    .interview-table-pen {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    .interview-table-pen th {
        text-align: left;
        padding: 10px;
        background-color: #444343;
        border-bottom: 2px solid #ccc;
    }
    .interview-table-pen td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
    }
    .interview-table-pen th, td {
        text-align: left;
        padding: 8px;
    }
    .interview-table-pen th {
        background-color: #333;
        color: #fff;
    }
    .interviewer-table {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px;
    }
    .interviewer-table thead th {
        background-color: #333;
        color: #fff;
        text-align: left;
        padding: 10px;
    }
    .interviewer-table tbody td, .interviewer-table tbody th {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    .interviewer-table tbody tr:hover {
        background-color: #f5f5f5;
    }
    .interviewer-table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .interviewer-table tbody td:first-child, .interviewer-table thead th:first-child {
        width: 10%;
    }
    .interviewer-table tbody td:nth-child(2), .interviewer-table thead th:nth-child(2) {
        width: 20%;
    }
    .interviewer-table tbody td:nth-child(3), .interviewer-table thead th:nth-child(3) {
        width: 40%;
    }
    .interviewer-table tbody td:last-child, .interviewer-table thead th:last-child {
        width: 30%;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .box-container {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    .box {
        width: auto;
        height: 220px;
        background-color: lightgray;
        border: 2px solid black;
        padding: 10px;
    }
    .question {
        font-size: 17px;
        margin-bottom: 10px;
    }
    .option {
        font-size: 16px;
        margin-bottom: 5px;
    }
    select {
        padding: 10px;
        border-radius: 5px;
        border: none;
        background-color: #f7f7f7;
        color: #444;
        font-size: 16px;
        transition: all 0.2s ease-in-out;
    }
    select:focus {
        outline: none;
        box-shadow: 0px 0px 5px #6cb2eb;
        background-color: #fff;
    }
    .submit {
        margin-top: 20px;
        background-color: #6cb2eb;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.2s ease-in-out;
    }
    .submit:hover {
        background-color: #fff;
        color: #6cb2eb;
        cursor: pointer;
    }
    .center {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .number-inter {
        font-size: 25px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #333;
    }
    .start-btn {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
        box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }
    .start-btn:hover {
        background-color: #3e8e41; /* Dark green */
    }
    label {
        display:flex;
    }
    .input-container {
        display: inline-block;
        vertical-align: top;
        margin-right: 20px;
    }
    .input-container label {
        display: block;
        margin-bottom: 5px;
    }
    .input-container input[type="text"], .input-container select {
        display: block;
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }
    .input-container select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 16 16' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M8 10.72l4.36-4.35.28-.29a1.12 1.12 0 000-1.58l-.43-.43a1.12 1.12 0 00-1.57 0L8 7.59l-2.64-2.64a1.12 1.12 0 00-1.57 0l-.43.43a1.12 1.12 0 000 1.58l.28.29L8 10.72z' fill='%23000000'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 10px center;
        background-size: 20px;
        padding-right: 40px;
    }
    input[type="checkbox"] {
        margin-right: 5px;
        font-size: 10px;
    }
    .multiple-checkbox h2{
        font-size: 17px;
        margin-bottom: 10px;
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
    /*
    PHẦN SCHEDULE DETAIL CỦA ON GOING
    */
    .schedule-detail {
        position: relative;
        background-color: #f7f7f7;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        margin: 40px auto;
        margin-left: 5rem;
        width: 80%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center;
        left: 13%;
    }
    .schedule-detail h2 {
        font-size: 30px;
        font-weight: bold;
        color: #333;
        margin-bottom: 20px;
    }
    .schedule-detail p {
        font-size: 18px;
        color: #555;
        margin: 10px 0;
        width: 100%;
    }
    .schedule-detail .label {
        font-size: 20px;
        font-weight: bold;
        color: #555;
        margin-right: 10px;
    }
    .schedule-detail .value {
        font-size: 20px;
        color: #333;
        margin-right: 20px;
    }
    .status.on-going {
        font-size: 20px;
        font-weight: bold;
        text-align: center;
        padding-top: 20px;
    }
    h1 {
        margin: 0;
    }
    h2 {
        font-size: 36px;
        margin-bottom: 40px;
    }
    h3{
        font-size: 26px;
        margin-bottom: 40px;
    }
    .info-candidate{
        text-align: center;
        font-weight: bold;
        font-size: 20px;
        margin-bottom: 2rem;
    }
    .info-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        background-color: lightgray;
        border: 2px solid black;
        border-radius: 10px;
        padding: 40px;
        width: 80%;
        text-align: center;
        margin: 0 auto;
    }
    .info-row {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }
    .info-col {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 20px;
    }
    .info-item {
        display: flex;
        flex-direction: column;
    }
    .info-date,
    .info-time {
        grid-row: 2;
    }
    .info-label {
        font-size: 14px;
        font-weight: bold;
        color: #777;
        margin-bottom: 5px;
    }
    .info-value {
        font-size: 16px;
        color: #444;
        margin-bottom: 10px;
    }
    span {
        font-weight: bold;
        margin-right: 10px;
    }
    p {
        margin: 0;
    }
    .info-col p:before {
        content: "";
        display: inline-block;
        height: 16px;
        width: 16px;
        background-color: #4b4a4a;
        margin-right: 10px;
        border-radius: 50%;
    }
    .interview-table1 {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        width: 60%;
        align-items: center;
        margin-left: 240px;
    }
    .interview-table1 th {
        text-align: left;
        padding: 10px;
        background-color: #cdcbcb;
        border-bottom: 2px solid #9b9b9b;
        color: #040404;
    }
    .interview-table1 td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }
    a {
        text-decoration: none;
    }
    .body-pending{
        margin-left: 23rem;
        width: 80%;
    }
</style>


<!-- Sidebar here -->
<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
        <div class="row">
            <div>
                <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
            </div>
        </div>
        <div class="action">
            <ul>
                <li><a href="<c:url value="/jobApps"/>"><i class="fa-solid fa-list"></i><span>Applications List</a></li>
                <li><a href="<c:url value="/jobPostings"/>"><i class="fa-solid fa-list"></i><span>Job Postings List</span></a></li>
                <li><a class="active" href="<c:url value="/schedules"/>"><i class="fa-solid fa-list"></i><span>Schedule List</span></a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i><span>Log out</span></a></li>
            </ul>
        </div>
    </sec:authorize>
</div>


<c:if test="${schedule.getStatus() eq 'Pending'}">
    <div class="body-pending">
        <header>
            <h1>Interview Schedule Detail</h1>
        </header>
        <section class="section-pen">
            <h2>Pending</h2>
        </section>
        <hr>
        <section>
            <table class="interview-table-pen">
                <thead>
                    <tr>
                        <th>Job Name</th>
                        <th>Schedule ID</th>
                        <th>Round ${schedule.getRound().getRoundNumber()}</th>
                        <th>Type of interview</th>
                        <th>Number of candidate</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                        <td>${schedule.getScheduleId()}</td>
                        <td>${schedule.getRound().getContent()}</td>
                        <td>
                            <c:if test="${schedule.isTypeOfInterview() == true}">
                                Offline
                            </c:if>
                            <c:if test="${schedule.isTypeOfInterview() == false}">
                                Online
                            </c:if>
                            <c:if test="${schedule.isTypeOfInterview() == null}">
                                Null
                            </c:if>
                        </td>
                        <td>${schedule.getjAS().size()}/10</td>
                    </tr>
                </tbody>
            </table>
        </section>
        <table class="interview-table1">
            <div class="info-candidate">Candidate information</div>
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>CV Information</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${schedule.getjAS()}" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${item.getJobApplication().getCandidate().getName()}</td>
                        <td>${item.getJobApplication().getCandidate().getEmail()}</td>
                        <td><a href="${item.getJobApplication().getCv()}">view</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <table class="interview-table1">
            <div class="info-candidate">Interviewer information</div>
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Information</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${item.getEmployee().getName()}</td>
                        <td>${item.getEmployee().getEmail()}</td>
                        <td><a href="#">view</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form method="post" action="<c:url value="/schedules/schedule-details/start-schedule"/>">
            <section>
                <h2>Interviewer & Date and Time</h2>
                <div class="box-container">
                    <div class="box">
                        <h4>Day and Time Interview</h4>
                        <p>- Setup day and time of interview schedule</p>
                        <label for="datetime">- Select date and time:</label>
                        Date: <input type="date" name="InterviewDate" required="true"/>
                        Time: <input type="time" min="08:00" max="17:00" name="InterviewTime"  required="true"/>
                        <!--<input type="datetime-local" id="datetime" name="datetime">-->
                    </div>
                    <div class="box">
                        <h4>Interviewer</h4>
                        <p>- Choose the interviewer for this schedule</p>
                        <div class="question">- Interviewer:</div>
                        <select id="interviewers" name="interviewers" multiple>
                            <c:forEach var="item" items="${listInterviewers}">
                                <c:if test="${fn:contains(stringMatch, item.getId()) == false}">
                                    <option value="${item.getId()}">
                                        ${item.getId()} - ${item.getEmail()} - ${item.getName()}
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </section>
            <div class="input-container">
                <label for="location">Location:</label>
                <input type="text" id="location" name="Location" required="true"/>
            </div>

            <div class="input-container">
                <label for="interview-type">Interview Type:</label>
                Offline <input type="checkbox" name="typeOfInterview" checked="true" value="1"/>
            </div>
            <div class="center">
                <button class="start-btn" name="action" value="start">Start</button>
            </div>
            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
        </form>
    </div>
</c:if>







<c:if test="${schedule.getStatus() eq 'On Going'}">
    <div class="body3">
        <header>
            <h1>Interview Schedule Detail</h1>
        </header>
        <div class="status on-going">Status: On Going</div>
        <div class="schedule-detail">
            <div class="info-col">
                <div class="info-row">
                    <div class="label">Schedule ID:</div>
                    <div class="value">${schedule.getScheduleId()}</div>
                </div>
                <div class="info-row">
                    <div class="label">Job Name:</div>
                    <div class="value">${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</div>
                </div>
                <div class="info-row">
                    <div class="label">Round ${schedule.getRound().getRoundNumber()}:</div>
                    <div class="value">${schedule.getRound().getContent()}</div>
                </div>
                <div class="info-row">
                    <div class="label">Type of Interview:</div>
                    <c:if test="${schedule.isTypeOfInterview() == true}">
                        <div class="value">Offline</div>
                    </c:if>
                    <c:if test="${schedule.isTypeOfInterview() == false}">
                        <div class="value">Online</div>
                    </c:if>
                    <c:if test="${schedule.isTypeOfInterview() == null}">
                        <div class="value">Null</div>
                    </c:if>
                </div>
                <div class="info-row">
                    <div class="label">Interview Date:</div>
                    <div class="value"><fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></div>
                </div>
                <div class="info-row">
                    <div class="label">Interview Time:</div>
                    <div class="value"><fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></div>
                </div>
            </div>
        </div>
        <table class="interview-table1">
            <div class="info-candidate">Candidate information</div>
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>CV Information</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${schedule.getjAS()}" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${item.getJobApplication().getCandidate().getName()}</td>
                        <td>${item.getJobApplication().getCandidate().getEmail()}</td>
                        <td><a href="${item.getJobApplication().getCv()}">view</a></td>
                        <td>${item.getStatus()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <table class="interview-table1">
            <div class="info-candidate">Interviewer information</div>
            <thead>
                <tr>
                    <th>Number</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Information</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${item.getEmployee().getName()}</td>
                        <td>${item.getEmployee().getEmail()}</td>
                        <td><a href="#">view</a></td>
                        <td>${item.getStatus()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
