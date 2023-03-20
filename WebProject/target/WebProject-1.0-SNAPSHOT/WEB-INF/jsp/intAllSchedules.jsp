<%-- 
    Document   : intAllSchedules
    Created on : Mar 13, 2023, 4:08:09 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>


<style>
    html {
        font-family: Arial, Helvetica, sans-serif;
    }

    body {
        font-size: 16px;
    }

    #wrapper {
        margin: 0px auto;
        margin-left: 3rem;
    }

    #wrapper h1 {
        margin-left: 20rem;
        width: 100%;
        text-align: center;
        padding: auto;

    }

    .header {
        display: flex;
        background-color: rgb(208, 204, 204);
        margin-bottom: 2rem;
        height: 8.5rem;
    }

    /* Style nav tabs */
    .tabs {
        border-bottom: 1px solid #f5f5f5;
        margin-left: 20rem;
    }

    .nav-tabs {
        display: flex;
        list-style: none;
        margin: 0px;
        padding: 0;
        border-bottom: 3px solid #ddd;
        font-weight: bold;
    }

    .nav-tabs li {
        margin-right: 10px;
    }

    .nav-tabs li a {
        display: block;
        padding: 6px 10px;
        text-decoration: none;
        position: relative;
        color: black;
    }

    .nav-tabs li a:after {
        content: "";
        height: 3px;
        width: 100%;
        position: absolute;
        left: 0px;
        bottom: -3px;
        background-color: transparent;
    }

    .nav-tabs li.active a::after,
    .nav-tabs li:hover a::after {
        background: #e74c3c;
    }

    td {
        padding: 6px 10px;
        text-align: center;
    }

    th {
        padding: 6px 10px;
        text-align: center;
    }

    /* Style tab-content */
    .tab-content {
        padding: 20px, 0px;
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
</style>
<!-- Sidebar Here -->
<!-- Sidebar Here -->
<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
        <div class="row">
            <div>
                <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
            </div>
        </div>
        <div class="action">
            <ul>
                <li><a class="active" href="<c:url value="/interviewer/schedules"/>"><i class="fa-solid fa-list"></i> Schedules List</a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
            </ul>
        </div>
    </sec:authorize>
</div>
<div id="wrapper">
    <div class="header">
        <h1>Schedule List</h1>
        <h1>Welcome <c:url value="${sessionScope.user.getName()}"/></h1>
    </div>
    <div class="tabs">
        <ul class="nav-tabs">
            <li class="active"><a href="#pending">Pending</a></li>
            <li><a href="#on-going">On going</a></li>
            <li><a href="#finished">Finished</a></li>
            <li><a href="#rejected">Rejected</a></li>
        </ul>
        <div class="tab-content">
            <div id="pending" class="tab-content-item">
                <h2>Pending</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Count</th>
                            <th>Job Name</th>
                            <th>Round</th>
                            <th>Number Of Candidates</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="schedule" items="${PENDING}" varStatus="counter">
                        <form method="get" action="<c:url value="/interviewer/schedules/schedule-detail"/>">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                                <td>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                                <td>${schedule.getjAS().size()}/10</td>
                                <td><input type="submit" value="View Details"/></td>
                            </tr>
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                            <input type="hidden" name="userID" value="${userID}"/>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="on-going" class="tab-content-item">
                <h2>On-going</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Count</th>
                            <th>Job Name</th>
                            <th>Round</th>
                            <th>Number Of Candidates</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="schedule" items="${ON_GOING}" varStatus="counter">
                        <form method="get" action="<c:url value="/interviewer/schedules/schedule-detail"/>">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                                <td>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                                <td>${schedule.getjAS().size()}/10</td>
                                <td><input type="submit" value="View Details"/></td>
                            </tr>
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                            <input type="hidden" name="userID" value="${userID}"/>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="finished" class="tab-content-item">
                <h2>Finished</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Count</th>
                            <th>Job Name</th>
                            <th>Round</th>
                            <th>Number Of Candidates</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="schedule" items="${FINISHED}" varStatus="counter">
                        <form method="get" action="<c:url value="/interviewer/schedules/schedule-detail"/>">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                                <td>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                                <td>${schedule.getjAS().size()}/10</td>
                                <td><input type="submit" value="View Details"/></td>
                            </tr>
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                            <input type="hidden" name="userID" value="${userID}"/>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="rejected" class="tab-content-item">
                <h2>Rejected Schedules</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Count</th>
                            <th>Job Name</th>
                            <th>Round</th>
                            <th>Number Of Candidates</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="schedule" items="${REJECTED}" varStatus="counter">
                        <form method="get" action="<c:url value="/interviewer/schedules/schedule-detail"/>">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                                <td>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                                <td>${schedule.getjAS().size()}/10</td>
                                <td><input type="submit" value="View Details"/></td>
                            </tr>
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                            <input type="hidden" name="userID" value="${userID}"/>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
    $(document).ready(function () {
        $('.tab-content-item').hide();
        $('.tab-content-item:first-child').fadeIn();
        $('.nav-tabs li').click(function () {
            //Active nav tabs
            $('.nav-tabs li').removeClass('active');
            $(this).addClass('active');

            //Show tab-content item
            let id_tab_content = $(this).children('a').attr('href');
            // alert(id_tab_content);
            $('.tab-content-item').hide();
            $(id_tab_content).fadeIn();
            return false;
        });
    });
</script>

<%--
<h3>Pending</h3>
<c:forEach var="schedule" items="${PENDING}">
    ==================================================================
    <p>Schedule ID: ${schedule.getScheduleId()}</p>
    <p>Job Name: ${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</p>
    <p>Round: ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
    <p>Number of candidates: ${schedule.getjAS().size()}</p>
    <p>Number of interviewers: ${schedule.getiRS().size()}</p>
    <p>Schedule date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
        <input type="submit" value="View Deatils"/>
    </form>
</c:forEach>

<h3>On Going</h3>
<c:forEach var="schedule" items="${ON_GOING}">
    ==================================================================
    <p>Schedule ID: ${schedule.getScheduleId()}</p>
    <p>Job Name: ${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</p>
    <p>Round: ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
    <p>Number of candidates: ${schedule.getjAS().size()}</p>
    <p>Number of interviewers: ${schedule.getiRS().size()}</p>
    <p>Schedule date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
        <input type="submit" value="View Deatils"/>
    </form>
</c:forEach>

<h3>Finished</h3>
<c:forEach var="schedule" items="${FINISHED}">
    ==================================================================
    <p>Schedule ID: ${schedule.getScheduleId()}</p>
    <p>Job Name: ${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</p>
    <p>Round: ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
    <p>Number of candidates: ${schedule.getjAS().size()}</p>
    <p>Number of interviewers: ${schedule.getiRS().size()}</p>
    <p>Schedule date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
        <input type="submit" value="View Deatils"/>
    </form>
</c:forEach>
--%>