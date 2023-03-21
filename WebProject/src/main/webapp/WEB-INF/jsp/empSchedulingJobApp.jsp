<%-- 
    Document   : empSchedulingJobApp
    Created on : Mar 6, 2023, 10:11:11 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
    html {
        font-family: Arial, Helvetica, sans-serif;
    }

    .header {
        background-color: rgb(208, 204, 204);
        margin-bottom: 2rem;
        height: 10rem;
        text-align: center;
    }
    .header h1{
        margin-top: 0rem;
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

    .create-schedule-body{
        margin-left: 20rem;
    }

    .schedule-detail{
        background-color: #d4f2e1;
        padding-top: 1rem;
        padding-left: 6rem;
        padding-bottom: 2rem;
        color: gray;
        font-size: 3rem;
    }
    .schedule-detail input{
        border-radius: 6%;
    }
    .schedule-detail input:hover{
        background: darkgrey
    }
</style>
<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
        <div class="row">
            <div>
                <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
            </div>
        </div>
        <div class="action">
            <ul>
                <li><a href="<c:url value="/jobApps"/>"><i class="fa-solid fa-list"></i> Applications List</a></li>
                <li><a href="<c:url value="/jobPostings"/>"><i class="fa-solid fa-list"></i> Job Postings List</a></li>
                <li><a href="<c:url value="/schedules"/>"><i class="fa-solid fa-list"></i> Schedule List</a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
            </ul>
        </div>
    </sec:authorize>
</div>
<div class="create-schedule-body">
    <div class="header">
        <h1>Manual Scheduling</h1>
        <h1>MESSAGE: ${MESSAGE}</h1>
    </div>
    <div class="schedule-detail">
        <c:if test="${ScheduleList != null}">
            <c:forEach var="schedule" items="${ScheduleList}">
                <h2>Schedule ID: ${schedule.getScheduleId()}</h2>
                <p>Job Name: ${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</p>
                <p>Round: </br>${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
                <p>
                    <c:if test="${schedule.isTypeOfInterview() == true}">
                        Type of Interview: Online
                    </c:if>
                    <c:if test="${schedule.isTypeOfInterview() == false}">
                        Type of Interview: Offline
                    </c:if>
                </p>
                <p>Number of candidates: ${schedule.getjAS().size()}</p>
                <p>Number of interviewers: ${schedule. getiRS().size()}</p>

                <form method="post" action="<c:url value="/schedule-app/choosed-schedule"/>">
                    <input type="submit" value="Choose"/>
                    <input type="hidden" name="jobAppID" value="${jobAppID}"/>
                    <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                </form>
            </c:forEach>
        </c:if>
    </div>
</div>
<c:if test="${ScheduleList == null}">
    <h2>No suitable schedule found</h2>
</c:if>

<form method="post" action="<c:url value="/schedule-app/create-new-schedule"/>">
    <input type="submit" value="Create new schedule"/>
    <input type="hidden" name="jobAppID" value="${jobAppID}"/>
    <input type="hidden" name="postID" value="${postID}"/>
    <input type="hidden" name="roundNumber" value="${roundNumber}"/>
</form>
