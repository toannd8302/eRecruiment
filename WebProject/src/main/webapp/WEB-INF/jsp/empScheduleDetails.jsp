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
    }

    header {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px;
    }

    h1 {
        margin: 0;
    }

    section {
        margin: 20px;
    }

    h2 {
        margin-bottom: 10px;
        font-size: 25px;
    }
    h3{
        font-size: 20px;
    }
    .interview-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .interview-table th {
        text-align: left;
        padding: 10px;
        background-color: #444343;
        border-bottom: 2px solid #ccc;
    }

    .interview-table td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
    }

    th, td {
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #333;
        color: #fff;
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
        width: 600px;
        height: 270px;
        background-color: lightgray;
        border: 2px solid black;
        padding: 10px;
    }
    .question {
        font-size: 17px;
        margin-bottom: 10px;
    }
    .container{
        margin-left:20rem;
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

    input[type="checkbox"] {
        margin-right: 5px;
        font-size: 10px;
    }
    .multiple-checkbox h2{
        font-size: 17px;
        margin-bottom: 10px;
    }
    .sidebar {
        background-color: #baa9a3;
        height: 100vh;
        width: 200px;
        color: black;
        position: fixed;
        top: 0;
        left: 0;
        overflow-x: hidden;
    }

    .sidebar h1 {
        text-align: center;
        margin-bottom: 30px;
    }

    .sidebar ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .sidebar li {
        margin-bottom: 5px;
    }

    .sidebar a {
        display: block;
        color: black;
        padding: 10px;
        text-decoration: none;
    }

    .sidebar a:hover {
        background-color: #1abc9c;
    }

    .sidebar a.active1 {
        background-color: #1abc9c;
    }

    /* Account */

    .sidebar img {
        width: 13.5rem;
        height: 13.5rem;
        margin-left: 3rem;
        margin-right: 3rem;
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

    #my-account {
        margin-left: 1.5rem;
        margin-top: 1.5rem;
    }

    #my-account .dropdown-menu {
        padding: 0%;
        background-color: #1abc9c;
    }

    #my-account .dropdown-item {
        background-color: #1abc9c;
    }

    #my-account .dropdown-item:hover {
        background-color: #1abc9c;
    }
</style>


<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
        <div class="row">
            <div>
                <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
            </div>
            <div>
                <div id="my-account">
                    <ul>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">My
                                Account</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item active" href="<c:url value="/account"/>">My Profile</a></li>
                                <li><a class="dropdown-item active" href="<c:url value="/logout"/>">Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </sec:authorize>
    <ul>
        <li><a href="<c:url value="/jobApps"/>">Application List</a></li>
        <li><a href="<c:url value="/jobPostings"/>">Job Postings List</a></li>
        <li><a class="active1" href="<c:url value="/schedules"/>">Schedule List</a></li>
    </ul>
</div>
<div class="container">
    <header>
        <h1>Interview Schedule Detail</h1>
    </header>
    <section>
        <h2>Pending</h2>
    </section>
    <hr>
    <section>
        <table class="interview-table">
            <thead>
                <tr>
                    <th>Job Name</th>
                    <th>Schedule ID</th>
                    <th>Round</th>
                    <th>Type of interview</th>
                    <th>Number of candidate</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</td>
                    <td>${schedule.getScheduleId()}</td>
                    <td>${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                    <td>
                        <c:if test="${schedule.isTypeOfInterview() == true}">
                            Online
                        </c:if>
                        <c:if test="${schedule.isTypeOfInterview() == false}">
                            Offline
                        </c:if>
                    </td>
                    <td>10</td>
                </tr>
            </tbody>
        </table>
    </section>

    <c:if test="${schedule.getStatus() eq 'Pending'}">
        <form method="post" action="<c:url value="/schedules/schedule-details/start-schedule"/>">
            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
            <h4>Number of interviewers: ${schedule.getiRS().size()}</h4>
            <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
                <p>Count: ${counter.count}</p>
                <p>Interviewer: ${item.getEmployee().getEmail()}</p>
            </c:forEach>
            <section>
                <h2>Interviewer & Date and Time</h2>
                <div class="box-container">
                    <div class="box">
                        <h4>Day and Time Interview</h4>
                        <p>- Setup day and time of interview schedule</p>
                        Date: <input type="date" name="InterviewDate" required="true"/>
                        Time: <input type="time" min="08:00" max="17:00" name="InterviewTime"  required="true"/>
                    </div>
                    <div class="box">
                        <h4>Interviewer</h4>
                        <p>- Choose the number of interview for this schedule</p>
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
               
                <h3>Choose location and type of interview</h3>
                Location: <input type="text" name="Location" required="true"/>

            </section>
            <div class="center">
                <input type="submit" name="action" value="start"/>
            </div>
        </form>
    </c:if>

    <c:if test="${schedule.getStatus() eq 'On Going'}">
        <section>
            <h2>Interviewer & Date and Time</h2>
            <div class="box-container">
                <div class="box">
                    <h4>Day and Time Interview</h4>
                    <p>- Setup day and time of interview schedule</p>
                    <label for="datetime">- Select date and time:</label>
                    <input type="datetime-local" id="datetime" name="datetime">
                </div>
                <div class="box">
                    <h4>Interviewer</h4>
                    <p>- Choose the number of interview for this schedule</p>
                    <label for="quantity">Number of Interview:</label>
                    <input type="number" id="quantity" name="quantity" min="1" max="3" step="1">
                    <div class="question">- Interviewer:</div>
                    <div class="label">
                        <label class="multiple-checkbox">
                            <input type="checkbox" name="fruit" value="apple">
                            Email: TranVanC@gmail.com;
                            Full Name: Tran Van C;
                            Role: Manager
                        </label>
                        <label>
                            <input type="checkbox" name="fruit" value="banana">						
                            Email: TranVanC@gmail.com;
                            Full Name: Tran Van C;
                            Role: Manager
                        </label>
                        <label>
                            <input type="checkbox" name="fruit" value="banana">						
                            Email: TranVanC@gmail.com;
                            Full Name: Tran Van C;
                            Role: Manager
                        </label>

                    </div>
                </div>
            </div>

        </section>
        <div class="center">
            <input type="submit" name="action" value="start"/>
        </div>
    </c:if>
</div>