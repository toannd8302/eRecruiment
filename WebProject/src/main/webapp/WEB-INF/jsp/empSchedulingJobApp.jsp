<%-- 
    Document   : empSchedulingJobApp
    Created on : Mar 6, 2023, 10:11:11 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<!DOCTYPE html>
<style>
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
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
    .sidebar i {
        padding-left: 0.5rem;
        font-size: 3rem;
    }
    .sidebar:hover {
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
        display: flex;
        display: block;
    }
    .sidebar span {
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
    }
    #general-info {
        margin-top: 2rem;
        width: 100%;
    }
    #general-info h1 {
        font-size: 3rem;
        text-align: center;
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
        background-color: white;
        width: auto;
        margin-left: 23rem;
        padding: 2rem;
        background-color: rgb(208, 204, 204);
    }
    #job-detail-head #apply-buton button {
        height: 75px;
        width: 150px;
        font-size: 2rem;
    }
    #job-detail-head #apply-buton button:first-child {
        padding: 1rem;
        border-radius: 1rem;
        background-color: #00b14f;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: #fff;
        font-weight: bold;
    }
    #job-detail-head #apply-buton button:first-child:hover {
        background-color: #fff;
        color: #00b14f;
    }
    #job-detail-head #apply-buton button:last-child {
        margin-top: 2rem;
        padding: 1rem;
        border-radius: 1rem;
        background-color: #ffffff;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: #00b14f;
        font-weight: bold;
        text-align: center;
    }
    #job-detail-head #apply-buton button:last-child:hover {
        background-color: #00b14f;
        color: #fff;
    }
    #job-detail-head #apply-buton button a {
        text-decoration: none;
        color: #fff;
        font-weight: bold;
    }
    #job-detail-head #apply-buton button a:hover {
        color: #00b14f;
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
    /* CSS for recruit detail  */
    #job-detail-body {
        background-color: white;
        width: 86.975%;
        margin-left: 21rem;
        padding: 2rem;
    }
    #job-detail-body #job-general-info {
        margin-top: 2rem;
        background-color: #d4f2e1;
        padding: 2rem;
    }
    #job-detail-body #job-general-info h1 {
        margin-bottom: 1rem;
        text-decoration: none;
    }
    #job-detail-body #job-general-info .general-info-list {
        list-style: none;
    }
    #job-detail-body #job-general-info .general-info-list li {
        font-weight: bold;
        font-size: 2rem;
        color: rgb(244, 131, 131);
    }
    #job-detail-body #job-general-info .general-info-list li p {
        color: initial;
        font-weight: normal;
        font-size: 2rem;
    }
    #job-detail-body #job-general-info .general-info-list i {
        margin-right: 1rem;
        font-size: 2rem;
        margin-top: 2rem;
        display: inline-block;
    }
    #job-detail-body #job-general-info .general-info-list p {
        margin-left: 3.5rem;
    }
    /* CSS for Application Detail */
    #job-detail-body #application-general-info {
        margin-top: 2rem;
        background-color: #d4f2e1;
        padding: 2rem;
    }
    #job-detail-body #application-general-info h1 {
        margin-bottom: 1rem;
        text-decoration: none;
    }
    #job-detail-body #application-general-info .application-info-list {
        list-style: none;
    }
    #job-detail-body #application-general-info .application-info-list li {
        font-weight: bold;
        font-size: 2rem;
        color: rgb(244, 131, 131);
    }
    #job-detail-body #application-general-info .application-info-list li p {
        color: initial;
        font-weight: normal;
        font-size: 2rem;
    }
    #job-detail-body #application-general-info .application-info-list i {
        margin-right: 1rem;
        font-size: 2rem;
        margin-top: 2rem;
        display: inline-block;
    }
    #job-detail-body #application-general-info .application-info-list p {
        margin-left: 3.5rem;
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
        margin-left: 48 rem;
        font-size: 2rem;
    }
    #footer {
        background-color: #161718;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th,
    td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        font-size: 15px;
    }
    th:first-child,
    td:first-child {
        border-left: none;
    }
    th:last-child,
    td:last-child {
        border-right: none;
    }
    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 8px 12px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 2px 2px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    button:hover {
        background-color: #3e8e41;
    }
    .create-schedule-button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 12px 24px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 10px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .create-schedule-button:hover {
        background-color: #3e8e41;
    }
</style>

<!-- Sidebar Here -->
<div class="sidebar">
    <div class="row">
        <div>
            <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
        </div>
    </div>
    <div class="action">
        <ul>
            <li><a href="<c:url value="/jobApps"/>"><i class="fa-solid fa-list"></i><span>Applications List</span></a></li>
            <li><a href="<c:url value="/jobPostings"/>"><i class="fa-solid fa-list"></i><span>Job Postings List</span></a></li>
            <li><a href="<c:url value="/schedules"/>"><i class="fa-solid fa-list"></i><span>Schedule List</span></a></li>
            <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i><span>Log out</span></a></li>
        </ul>
    </div>
</div>
<!-- Body here -->

<div id="job-detail-head">
    <div class="row">

        <div class="col-sm-12">
            <div id="general-info">
                <h1>Manual Scheduling</h1>
            </div>
        </div>
    </div>
</div>

<div id="job-detail-body">
    <div id="recrui-detail">
        <h1>Information Schedule</h1>
        <c:if test="${ScheduleList != null}">
            <div id="application-general-info">
                <ul class="application-info-list">
                    <table>
                        <tr>
                            <th>Number</th>
                            <th>Job Name</th>
                            <th>Round</th>
                            <th>Type of Interview</th>
                            <th>Number of Candidates</th>
                            <th>Number of Interviewers</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach var="schedule" items="${ScheduleList}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                                <td>${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                                <td>
                                    <c:if test="${schedule.isTypeOfInterview() == true}">
                                        Type of Interview: Online
                                    </c:if>
                                    <c:if test="${schedule.isTypeOfInterview() == false}">
                                        Type of Interview: Offline
                                    </c:if>
                                </td>
                                <td>${schedule.getjAS().size()}</td>
                                <td>${schedule. getiRS().size()}</td>
                                <td>${schedule.getStatus()}</td>
                                <td>
                                    <form method="post" action="<c:url value="/schedule-app/choosed-schedule"/>">
                                        <button onclick="alert('You have chosen this schedule')">Choose</button>
                                        <input type="hidden" name="jobAppID" value="${jobAppID}"/>
                                        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </ul>
            </div>
        </c:if>
        <c:if test="${ScheduleList.isEmpty()}">
            <h2>No suitable schedule found</h2>
        </c:if>
        <form method="post" action="<c:url value="/schedule-app/create-new-schedule"/>">
            <button class="create-schedule-button" value="Create new schedule">Create New Schedule</button>
            <input type="hidden" name="jobAppID" value="${jobAppID}"/>
            <input type="hidden" name="postID" value="${postID}"/>
            <input type="hidden" name="roundNumber" value="${roundNumber}"/>
        </form>
    </div>
</div>