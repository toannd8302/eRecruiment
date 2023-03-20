<%-- 
    Document   : empJobAppDetails
    Created on : Mar 5, 2023, 9:24:52 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<style>
    html {
            font-size: 62.5%;
            font-family: Arial, Helvetica, sans-serif;
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

        #my-account {
            margin-left: 1.5rem;
            margin-top: 1.5rem;
        }

        /* CSS for login link */

        #job-logo img {
            width: 15rem;
            height: 15rem;
            border-radius: 50%;
        }

        #general-info {
            margin-top: 2rem;
        }

        #general-info h1 {
            font-size: 3rem;
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
            margin-left: 20rem;
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
            width: 85%;
            margin-left: 20rem;
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
                <li><a href="<c:url value="/jobApps"/>"><i class="fa-solid fa-list"></i> Applications List</a></li>
                <li><a href="<c:url value="/jobPostings"/>"><i class="fa-solid fa-list"></i> Job Postings List</a></li>
                <li><a href="<c:url value="/schedules"/>"><i class="fa-solid fa-list"></i> Schedule List</a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
            </ul>
        </div>
    </sec:authorize>
</div>

<!-- Body here -->

<div id="job-detail-head">
    <div class="row">
        <div class="col-sm-2">
            <div id="job-logo">
                <img src="<c:url value="${jobApplication.getCandidate().getPicture()}"/>">
            </div>
        </div>
        <div class="col-sm-8">
            <div id="general-info">
                <h1>${jobApplication.getCandidate().getName()}</h1>
                <h2><i class="fa-solid fa-envelope"></i> ${jobApplication.getCandidate().getEmail()}</h2>
                <h2><i class="fa-solid fa-phone"></i> ${jobApplication.getCandidate().getPhone()}</h2>
                <h2><i class="fa-solid fa-business-time"></i> ${jobApplication.getCandidate().getExperience()}</h2>
                <h2 class="apply-time">Apply time: <fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></h2>
            </div>
        </div>
        <div class="col-sm-2">

            <c:if test="${jobApplication.getApplicationStatus() eq 'Review'}">
                <div class="review">
                    <form method="post" action="<c:url value="/jobApps/job-application-details/review-app"/>">
                        <div class="col-sm-2">
                            <div id="apply-buton">
                                <!--                                <input type="submit" name="action" value="accept"/>
                                                                <input type="submit" name="action" value="reject"/>-->
                                <button class="apply-button" name="action" value="accept">Approve</a></button>
                                <button class="save-job-button" name="action" value="reject">Reject</button>
                            </div>
                        </div>
                        <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                    </form>
                </div>
            </c:if>

            <c:if test="${jobApplication.getApplicationStatus() eq 'Scheduling'}">
                <div class="scheduling">
                    <form method="post" action="<c:url value="/jobApps/job-application-details/schedule-app"/>">
                        <div class="col-sm-2">
                            <div id="apply-buton">
                                <button class="apply-button" name="action" value="auto schedule">Auto schedule</button>
                                <button class="save-job-button" name="action" value="manually schedule">Manually schedule</button>
                            </div>
                        </div>
                        <input type="hidden" name="jobAppID" value="${jobApplication.getApplicationId()}">
                    </form>
                </div>
            </c:if>

            <c:if test="${jobApplication.getApplicationStatus() eq 'Scheduled'}">
                <div class="scheduled">
                    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                        <div class="col-sm-2">
                            <div id="apply-buton">
                                <input type="hidden" name="scheduleID" value="${scheduleID}">
                                <button name="action" value="View Schedule">View Schedule</button>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>

            <c:if test="${jobApplication.getApplicationStatus() eq 'On Going'}">
                <div class="on-going">
                    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                        <div class="col-sm-2">
                            <div id="apply-buton">
                                <input type="hidden" name="scheduleID" value="${scheduleID}">
                                <button name="action" value="View Schedule">View Schedule</button>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</div>

<div id="job-detail-body">
    <div id="recrui-detail">
        <h1>General information</h1>
        <div id="application-general-info">
            <h1>Candidate information</h1>
            <ul class="application-info-list">
                <div class="row">

                    <li><a href="${jobApplication.getCv()}"><i
                                class="fa-solid fa-file"></i> Link CV</a>
                    </li>

                    <li><i class="fa-solid fa-address-card"></i>Introduction<p>${jobApplication.getIntroduction()}</p>
                    </li>

                </div>
            </ul>
        </div>
    </div>
    <div id="job-general-info">
        <h1>Job Posting Details</h1>
        <ul class="general-info-list">
            <div class="row">
                <div class="col-sm-6">
                    <li><i class="fa-solid fa-money-bill"></i>Job Title<p>${jobApplication.getJobPosting().getJobPosition().getJobName()}</p>
                    </li>

                    <li><i class="fa-sharp fa-solid fa-suitcase"></i>Type of work
                        <p>
                            <c:if test="${jobApplication.getJobPosting().isTypeOfWork() == true}">
                                Type of Work: At Office
                            </c:if>
                            <c:if test="${jobApplication.getJobPosting().isTypeOfWork() == false}">
                                Type of Work: Hybrid
                            </c:if>
                        </p>
                    </li>
                </div>
                <div class="col-sm-6">
                    <li><i class="fa-solid fa-ranking-star"></i>Level<p>${jobApplication.getJobPosting().getLevel()}</p>
                    </li>
                    <li><i class="fa-solid fa-business-time"></i>Experience<p>${jobApplication.getJobPosting().getExprienceRequirement()}</p>
                    </li>
                </div>
            </div>
            <h2>
                <a href="<c:url value="/jobPostings/job-posting-details?postID=${jobApplication.getJobPosting().getPostId()}"/>">Link Post</a>
            </h2>
        </ul>
    </div>
</div>
