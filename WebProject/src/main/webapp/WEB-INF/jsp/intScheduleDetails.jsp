<%-- 
    Document   : intScheduleDetails
    Created on : Mar 18, 2023, 10:20:27 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
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
            font-weight: bold;
        }
        /* Style nav tabs */
        .tabs {
            border-bottom: 1px solid #f5f5f5;
            margin-left: 20rem;
        }
        td {
            padding: 6px 10px;
            text-align: center;
        }
        th {
            padding: 6px 10px;
            text-align: center;
        }
        p {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-align: left;
            margin: 20px 0;
        }
        This CSS code will set the font size
        /* Style tab-content */
        .tab-content {
            padding: 20px 0px;
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
        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            /* align form items to the left */
            justify-content: flex-start;
            /* push form items to the left */
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th,
        td {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        th {
            background-color: rgb(208, 204, 204);
            color: black;
        }
        .tab-content .post-link {
            color: #4285F4;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
        }
        .post-link:hover {
            color: #fff;
            background-color: #4285F4;
            text-decoration: none;
            border-radius: 0.25rem;
        }
        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        button {
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            padding: 12px 24px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            margin-top: 10px;
        }
        .accept-button {
            background-color: #2ecc71;
            color: #fff;
        }
        .reject-button {
            background-color: #e74c3c;
            color: #fff;
            margin-left: 10px;
        }
        button:hover {
            opacity: 0.8;
        }
        .user-profile{
            margin-bottom: 1rem;
        }
    </style>

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
                    <li><a href="<c:url value="/interviewer/schedules"/>"><i class="fa-solid fa-list"></i><span>Schedules List</span></a></li>
                    <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i><span>Log out</span></a></li>
                </ul>
            </div>
        </sec:authorize>
    </div>

    <div id="wrapper">
        <div class="header">
            <h1>Schedule Detail</h1>
        </div>
        <div class="tabs">
            <div class="tab-content">
                <div id="pending" class="tab-content-item">
                    <div class="user-profile">
                        <p>Schedule</p>
                        <table>
                            <tr>
                                <th>Job Name</th>
                                <th>Type of Interview</th>
                                <th>Round</th>
                                <th>Schedule Date</th>
                                <th>Time</th>
                                <th>Location</th>
                            </tr>
                            <tr>
                                <td>${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</td>
                                <td><c:if test="${schedule.isTypeOfInterview() == true}">
                                        Type of interview: Offline
                                    </c:if>
                                    <c:if test="${schedule.isTypeOfInterview() == false}">
                                        Type of interview: Online
                                    </c:if>
                                    <c:if test="${schedule.isTypeOfInterview() == null}">
                                        Type of interview: Null
                                    </c:if>
                                </td>
                                <td>${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                                <td><fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></td>
                                <td><fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></td>
                                <td>${schedule.getLocation()}</td>
                            </tr>
                        </table>
                    </div>
                    <a class="post-link" href="<c:url value="/interviewer/view-post-detail/${schedule.getRound().getJobPosting().getPostId()}"/>">Job Posting Link</a>
                    <p>Candidates information</p>
                    <table class="candidate-list">
                        <thead>
                            <tr>
                                <th>Number</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>CV Information</th>
                                <th>Report</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${schedule.getjAS()}" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${item.getJobApplication().getCandidate().getName()}</td>
                                    <td>${item.getJobApplication().getCandidate().getEmail()}</td>
                                    <td><a href="${item.getJobApplication().getCv()}">View Details</a></td>
                                    <td>
                                        <c:if test="${status.getStatus() eq 'Pending' or status.getStatus() eq 'Rejected'}">
                                            No Action available
                                        </c:if>
                                        <c:if test="${status.getStatus() eq 'Approved' and schedule.getStatus() eq 'On Going'}">
                                            <form method="get" action="<c:url value="/interviewer/report"/>">
                                                <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                                                <input type="hidden" name="jobAppID" value="${item.getJobApplication().getApplicationId()}"/>
                                                <button name="action">more action</button>
                                            </form>
                                        </c:if>
                                        <c:if test="${status.getStatus() eq 'Approved' and schedule.getStatus() eq 'Finished'}">
                                            <form method="get" action="<c:url value="/interviewer/report"/>">
                                                <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                                                <input type="hidden" name="jobAppID" value="${item.getJobApplication().getApplicationId()}"/>
                                                <button name="action">Edit</button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <p>Interviewers information</p>
                    <table class="candidate-list">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Full Name</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${item.getEmployee().getName()}</td>
                                    <td>${item.getEmployee().getEmail()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <c:if test="${status.getStatus() eq 'Pending'}">
                        <form method="post" action="<c:url value="/interviewer/schedules/schedule-detail/decision"/>">
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
                            <input type="hidden" name="userID" value="${userID}"/>
                            <div class="button-container">
                                <button class="accept-button" name="action" value="accept">Accept</button>
                                <button class="reject-button" name="action" value="reject">Reject</button>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${schedule.getStatus() eq 'On Going' and status.getStatus() eq 'Approved'}">
                        <form method="post" action="<c:url value="/interviewer/schedules/schedule-detail/decision"/>">
                            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
                            <button class="accept-button" name="action" value="end">End</button>
                        </form>
                    </c:if>
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
</html>