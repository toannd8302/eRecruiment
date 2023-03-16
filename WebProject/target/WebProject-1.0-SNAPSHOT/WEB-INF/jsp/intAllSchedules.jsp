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
        color: black;
        position: fixed;
        top: 0;
        left: 0;
        overflow-x: hidden;
        background-color: #baa9a3;
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

    .sidebar a.active {
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
    
    .interview-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .interview-list .interview-item {
        background-color: #8a8a8a;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        color: #f7f2f2;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        margin: 40px auto;
        width: 1200px;  
    }
    
    .interview-item:hover {
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .interview-item h3 {
        font-size: 24px;
        font-weight: bold;
        margin: 0;
        color: #fbfafa;
    }

    .interview-date, .interview-time {
        font-size: 16px;
        margin: 0;
        color: #00C6FF;
    }
    
    .interview-item .btn {
        padding: 10px 15px;
        border-radius: 5px;
        border: none;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
    }

    .interview-item .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }

    .interview-item .edit-btn {
        background-color: #FFD23F;
        background-image: linear-gradient(45deg, #FFD23F 0%, #F9AE17 100%);
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .interview-item .edit-btn:hover {
        background-color: #F9AE17;
        box-shadow: 0 2px 5px rgba(0,0,0,0.3);
    }

    .interview-item .delete-btn {
        background-color: #EB5E28;
        background-image: linear-gradient(45deg, #EB5E28 0%, #CD3F0A 100%);
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    .interview-item .delete-btn:hover {
        background-color: #CD3F0A;
        box-shadow: 0 2px 5px rgba(0,0,0,0.3);
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
        <li><a class="active1" href="<c:url value="/interview/schedules"/>">Schedule List</a></li>
        <li><a href="<c:url value="/interview/reports"/>">Report List</a></li>
    </ul>
</div>

<div id="wrapper">
    <h1>Welcome Interviewer</h1>
    <h1>Schedule List</h1>
    <div class="tabs">
        <ul class="nav-tabs">
            <li class="active"><a href="#pending">Pending</a></li>
            <li><a href="#scheduling">On-going</a></li>
            <li><a href="#scheduled">Finished</a></li>
        </ul>
        <div class="interview-list">
            <ul>
                <c:forEach var="schedule" items="${PENDING}">
                    <div class="interview-item">
                        <h3>${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</h3>
                        <p>ID: ${schedule.getScheduleId()}</p>
                        <p>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
                        <p>Number of candidate: ${schedule.getjAS().size()}/10</p>
                        <p>Number of interview: ${schedule.getiRS().size()}</p>
                        <p>Date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
                        <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
                        <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
                            <button class="delete-interview">View Detail</button>
                        </form>  
                    </div>
                </c:forEach>
            </ul>
        </div>

        <div class="interview-list">
            <ul>
                <c:forEach var="schedule" items="${ON_GOING}">
                    <div class="interview-item">
                        <h3>${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</h3>
                        <p>ID: ${schedule.getScheduleId()}</p>
                        <p>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
                        <p>Number of candidate: ${schedule.getjAS().size()}/10</p>
                        <p>Number of interview: ${schedule.getiRS().size()}</p>
                        <p>Date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
                        <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
                        <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
                            <button class="delete-interview">View Detail</button>
                        </form>  
                    </div>
                </c:forEach>
            </ul>
        </div>

        <div class="interview-list">
            <ul>
                <c:forEach var="schedule" items="${FINISHED}">
                    <div class="interview-item">
                        <h3>${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</h3>
                        <p>ID: ${schedule.getScheduleId()}</p>
                        <p>Round ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
                        <p>Number of candidate: ${schedule.getjAS().size()}/10</p>
                        <p>Number of interview: ${schedule.getiRS().size()}</p>
                        <p>Date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
                        <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
                        <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
                            <button class="delete-interview">View Detail</button>
                        </form>  
                    </div>
                </c:forEach>
            </ul>
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