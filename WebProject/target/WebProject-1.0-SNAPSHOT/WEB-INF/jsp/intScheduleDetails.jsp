<%-- 
    Document   : intScheduleDetails
    Created on : Mar 18, 2023, 10:20:27 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #wrapper {
        margin: 0px auto;
        margin-left: 3rem;
    }

    #wrapper h1 {
        margin-left: 20rem;
    }

    .interview-table1 {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        width: 60%;
        align-items: center;
        margin-left: 280px;
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

    /* Sidebar */
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

</style>

<!--<div class="sidebar">
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
        <li><a class="active" href="<c:url value="/interviewer/schedules"/>">Schedules List</a></li>
    </ul>
</div>-->

<div id="wrapper">
    <h1>Schedule Detail</h1>
    <p>Schedule ID: ${schedule.getScheduleId()}</p>
    <p>Job Name: ${schedule.getRound().getJobPosting().getJobPosition().getJobName()}</p>
    <p>
        <c:if test="${schedule.isTypeOfInterview() == true}">
            Type of interview: Offline
        </c:if>
        <c:if test="${schedule.isTypeOfInterview() == false}">
            Type of interview: Online
        </c:if>
        <c:if test="${schedule.isTypeOfInterview() == null}">
            Type of interview: Null
        </c:if>
    </p>
    <p>Round: ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
    <p>Schedule date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>

    <h2>
        <a href="<c:url value="/interviewer/view-post-detail/${schedule.getRound().getJobPosting().getPostId()}"/>">Link Post</a>
    </h2>

    <h2>Candidates information</h2>
    <table class="interview-table1">
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
                        <c:if test="${status.getStatus() eq 'Pending'}">
                            No Action available
                        </c:if>
                        <c:if test="${status.getStatus() eq 'Approved' and schedule.getStatus() eq 'On Going'}">
                            <form method="get" action="<c:url value="/interviewer/report"/>">
                                <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
                                <input type="hidden" name="jobAppID" value="${item.getJobApplication().getApplicationId()}"/>
                                <button name="action">more action</button>
                            </form>
                        </c:if>
                        <c:if test="${status.getStatus() eq 'Finished'}">
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

    <h2>interviewers information</h2>
    <table class="interviewer-table">
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
            <button name="action" value="accept">Accept</button>
            <button name="action" value="reject">Reject</button>
        </form>
    </c:if>
    <c:if test="${status.getStatus() eq 'On Going'}">
        <form method="post" action="<c:url value="/interviewer/schedules/schedule-detail/decision"/>">
            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
            <button name="action" value="end">End</button>
        </form>
    </c:if>
</div>