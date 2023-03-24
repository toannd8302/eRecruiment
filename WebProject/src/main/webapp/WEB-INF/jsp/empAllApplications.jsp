<%-- 
    Document   : allApplications
    Created on : Mar 3, 2023, 3:58:07 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<style>
 html {
        font-family: Arial, Helvetica, sans-serif;
    }
    body {
        font-size: 16px;
    }
    #wrapper {
        width: 85%;
        margin-left: 23rem;
    }
    #wrapper h1 {
        margin-left: 20rem;
        width: 100%;
        text-align: center;
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
    }
    .nav-tabs {
        display: flex;
        list-style: none;
        border-bottom: 3px solid #ddd;
        font-weight: bold;
        position: relative;
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
        width: 0%;
        position: absolute;
        left: 0px;
        bottom: -3px;
        background-color: transparent;
        transition: 0.5s;
    }
    .nav-tabs li.active a::after,
    .nav-tabs li:hover a::after {
        background: #e74c3c;
        width: 100%;
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
    .tab-content h2{
        margin-left: 2rem;
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
                <li><a class="active" href="<c:url value="/jobApps"/>"><i class="fa-solid fa-list"></i><span>Applications List</span></a></li>
                <li><a href="<c:url value="/jobPostings"/>"><i class="fa-solid fa-list"></i><span>Job Postings List</span></a></li>
                <li><a href="<c:url value="/schedules"/>"><i class="fa-solid fa-list"></i><span>Schedule List</span></a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i><span>Log out</span></a></li>
            </ul>
        </div>
    </sec:authorize>
</div>

<div id="wrapper">
    <div class="header">
        <h1>Job Application List</h1>
        <h1>Welcome <c:url value="${sessionScope.user.getName()}"/></h1>  
    </div>
    <div class="tabs">
        <ul class="nav-tabs">
            <li class="active"><a href="#pending">Review</a></li>
            <li><a href="#scheduling">Scheduling</a></li>
            <li><a href="#scheduled">Scheduled</a></li>
            <li><a href="#on-going">On-going</a></li>
            <li><a href="#finished">Finished</a></li>
            <li><a href="#rejected">Rejected</a></li>
        </ul>
        <div class="tab-content">
            <div id="pending" class="tab-content-item">
                <h2>Pending</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${REVIEW}" varStatus="counter">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${counter.count}</td>
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
                            <th>NO</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${SCHEDULING}" varStatus="counter">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${counter.count}</td>
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
                            <th>NO</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${SCHEDULED}" varStatus="counter">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${counter.count}</td>
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
                            <th>NO</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${ON_GOING}" varStatus="counter">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${counter.count}</td>
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
            
            <div id="finished" class="tab-content-item">
                <h2>Finished</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${FINISHED}" varStatus="counter">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${counter.count}</td>
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

            <div id="rejected" class="tab-content-item">
                <h2>Rejected</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Candidate</th>
                            <th>Job Apply</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>View Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="jobApplication" items="${REJECT}" varStatus="counter">
                        <form method="get" action="<c:url value="/jobApps/job-application-details"/>">
                            <tr>
                                <td>${counter.count}</td>
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
