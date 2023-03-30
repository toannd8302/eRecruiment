<%-- 
    Document   : allApplications
    Created on : Mar 3, 2023, 3:58:07 PM
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
</style>
<!-- Sidebar Here -->

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
        </sec:authorize>
    </div>


    <ul>
        <li><a class="active" href="<c:url value="/jobApps"/>">Application List</a></li>
        <li><a href="<c:url value="/jobPostings"/>">Job Postings List</a></li>
        <li><a href="<c:url value="/schedules"/>">Schedule List</a></li>
    </ul>
</div>

<div id="wrapper">
    <h1>Welcome HR Employee</h1>
    <h1>Job Application List</h1>
    <div class="tabs">
        <ul class="nav-tabs">
            <li class="active"><a href="#pending">Review</a></li>
            <li><a href="#scheduling">Scheduling</a></li>
            <li><a href="#scheduled">Scheduled</a></li>
            <li><a href="#on-going">On-going</a></li>
            <li><a href="#rejected">Rejected</a></li>
        </ul>
        <div class="tab-content">
            <div id="pending" class="tab-content-item">
                <h2>Pending</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${REVIEW}">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${jobApplication.getApplicationId()}</td>
                                <td>${jobApplication.getCandidate().getName()}</td>
                                <td>${jobApplication.jobPosting.jobPosition.jobName}</td>
                                <td>
                                    <c:if test="${jobApplication.getCandidate().getPhone() == null}">
                                        Null
                                    </c:if>
                                    <c:if test="${jobApplication.getCandidate().getPhone() != null}">
                                        ${jobApplication.getCandidate().getPhone()}
                                    </c:if>
                                </td>
                                <td>${jobApplication.getCandidate().getEmail()}</td>
                                <td><input type="submit" value="View Details"/></td>
                                <!--                            <td><a href="jobapplicationdetail.html">View Details</a></td>-->
                            <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="scheduling" class="tab-content-item">
                <h2>Scheduling</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${SCHEDULING}">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${jobApplication.getApplicationId()}</td>
                                <td>${jobApplication.getCandidate().getName()}</td>
                                <td>${jobApplication.jobPosting.jobPosition.jobName}</td>
                                <td>
                                    <c:if test="${jobApplication.getCandidate().getPhone() == null}">
                                        Null
                                    </c:if>
                                    <c:if test="${jobApplication.getCandidate().getPhone() != null}">
                                        ${jobApplication.getCandidate().getPhone()}
                                    </c:if>
                                </td>
                                <td>${jobApplication.getCandidate().getEmail()}</td>
                                <td><input type="submit" value="View Details"/></td>
                            <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                            <td><a href="#">Cancel</a></td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="scheduled" class="tab-content-item">
                <h2>Scheduled</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${SCHEDULED}">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${jobApplication.getApplicationId()}</td>
                                <td>${jobApplication.getCandidate().getName()}</td>
                                <td>${jobApplication.jobPosting.jobPosition.jobName}</td>
                                <td>
                                    <c:if test="${jobApplication.getCandidate().getPhone() == null}">
                                        Null
                                    </c:if>
                                    <c:if test="${jobApplication.getCandidate().getPhone() != null}">
                                        ${jobApplication.getCandidate().getPhone()}
                                    </c:if>
                                </td>
                                <td>${jobApplication.getCandidate().getEmail()}</td>
                                <td><input type="submit" value="View Details"/></td>
                            <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                            <td><a href="#">Cancel</a></td>
                            </tr>
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
                            <th>ID</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${ON_GOING}">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${jobApplication.getApplicationId()}</td>
                                <td>${jobApplication.getCandidate().getName()}</td>
                                <td>${jobApplication.jobPosting.jobPosition.jobName}</td>
                                <td>
                                    <c:if test="${jobApplication.getCandidate().getPhone() == null}">
                                        Null
                                    </c:if>
                                    <c:if test="${jobApplication.getCandidate().getPhone() != null}">
                                        ${jobApplication.getCandidate().getPhone()}
                                    </c:if>
                                </td>
                                <td>${jobApplication.getCandidate().getEmail()}</td>
                                <td><input type="submit" value="View Details"/></td>
                            <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                            <td><a href="#">Cancel</a></td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="rejected" class="tab-content-item">
                <h2>Rejected</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${REJECT}">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${jobApplication.getApplicationId()}</td>
                                <td>${jobApplication.getCandidate().getName()}</td>
                                <td>${jobApplication.jobPosting.jobPosition.jobName}</td>
                                <td>
                                    <c:if test="${jobApplication.getCandidate().getPhone() == null}">
                                        Null
                                    </c:if>
                                    <c:if test="${jobApplication.getCandidate().getPhone() != null}">
                                        ${jobApplication.getCandidate().getPhone()}
                                    </c:if>
                                </td>
                                <td>${jobApplication.getCandidate().getEmail()}</td>
                                <td><input type="submit" value="View Details"/></td>
                            <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

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