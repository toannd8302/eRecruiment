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
        margin-left: 20rem;
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
    .header{
        background-color: rgb(208, 204, 204);
        margin-bottom: 2rem;
        height: auto;
        padding-left: 2rem;

    }
    .header p{
        font-size: 3rem;
    }
    .header h1{
        font-weight: bold;
        padding-left: 30rem;
        margin-top: 0rem;
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
                <li><a class="active" href="<c:url value="/interviewer/schedules"/>"><i class="fa-solid fa-list"></i> Schedules List</a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
            </ul>
        </div>
    </sec:authorize>
</div>

<div id="wrapper">
    <div class="header">
        <h1>Schedule Detail</h1>
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
    </div>
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
    <c:if test="${schedule.getStatus() eq 'On Going' and status.getStatus() eq 'Approved'}">
        <form method="post" action="<c:url value="/interviewer/schedules/schedule-detail/decision"/>">
            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
            <button name="action" value="end">End</button>
        </form>
    </c:if>
</div>