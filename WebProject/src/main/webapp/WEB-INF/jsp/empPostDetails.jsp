<%-- 
    Document   : empPostDetails
    Created on : Mar 5, 2023, 9:25:13 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



<style>
    html {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 62.5%;
    }
    /* CSS for body */
    #job-detail-head {
        background-color: white;
        width: auto;
        margin-left: 23rem;
        padding: 2rem;
        background-color: rgb(208, 204, 204);
    }
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
    #general-info h2,
    p {
        margin-top: 1rem;
        font-size: 3rem;
    }
    #general-info p i {
        margin-right: 1rem;
    }
    #job-detail-head #apply-buton button {
        height: 75px;
        width: 150px;
        font-size: 2rem;
    }
    #job-detail-head #apply-buton .apply-button {
        padding: 1rem;
        border-radius: 1rem;
        background-color: #00b14f;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: #fff;
        font-weight: bold;
    }
    #job-detail-head #apply-buton .apply-button:hover {
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
    /* CSS for recruit detail  */
    #job-detail-body {
        background-color: white;
        width: 84.95%;
        margin-left: 22rem;
        padding-left: 1rem;
        margin-top: 1.5rem;
    }
    #job-detail-body #recrui-detail .job-detail-recruit{
        font-weight: bold;
    }
    #job-detail-body #job-general-info {
        margin-top: 2rem;
        background-color: #d4f2e1;
        padding: 2rem;
    }
    #job-detail-body #job-general-info h1 {
        margin-bottom: 1rem;
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
    /* CSS for Job Location */
    #job-detail-body #job-location {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    /* CSS for Job Describe */
    #job-detail-body #job-describe {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    /* CSS for round*/
    #job-detail-body #job-rounds{
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    /* CSS for Job Require */
    #job-detail-body #job-require {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    /* CSS for Job Welfare */
    #job-detail-body #job-welfare {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    #job-detail-body .info-list {
        list-style-type: none;
        padding: 0%;
        font-size: 2rem;
    }
    #job-detail-body .info-list li {
        margin: 1rem;
    }
    #job-detail-body .info-list li::before {
        content: "\2013";
        /* Unicode character for an en dash */
        margin-right: 1rem;
    }
    /* Sidebar */
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
        display: block;
        display: flex;
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
    .hot-job-button{
        width: 3rem;
        height: 3rem;
    }
</style>

<!-- Sidebar here -->
<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
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
    </sec:authorize>
</div>

<!-- Body Here -->
<c:if test="${jobPosting.isApprovedStatus() eq 'Pending'}">
    <form id="jobPostingForm" method="post" action="<c:url value="/jobPostings/job-posting-details/evaluate-post"/>">
        <div id="job-detail-head">
            <div class="row">
                <div class="col-sm-2">
                    <div id="job-logo">
                        <img src="<c:url value="https://raw.githubusercontent.com/Toannd832/eRecruiment/Thang/Header/img/Remove_bg_logo.png"/>" alt="Back-end">
                    </div>
                </div>
                <div class="col-sm-8">
                    <div id="general-info">
                        <h1>${jobPosting.getJobPosition().getJobName()}</h1>
                        <h2>Software company Monke Tech</h2>
                        <p>Created date: <fmt:formatDate value="${jobPosting.getCreatedTime()}" pattern="dd/MM/yyyy"/></p>
                        <p><i class="fa-regular fa-clock"></i>Expired date: <input type="date" name="expiredDate" id="expiredDate" value=""/></p>
                        <p><i class="fa-solid fa-fire"></i>Hot Job <input class="hot-job-button" type="checkbox" name="isHotJob" checked="true" value="0"/></p>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="apply-buton">
                        <input type="hidden" name="postID" value="${jobPosting.getPostId()}">
                        <button class="apply-button" name="action" onclick="validateForm(event)" value="accept">Accept</button>
                        <button class="reject-button" name="action" value="reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</c:if>

<!--<form method="post" action="<c:url value="/jobPostings/job-posting-details/reject-post"/>"></form>-->

<c:if test="${jobPosting.isApprovedStatus() eq 'Approved'}">
    <div id="job-detail-head">
        <div class="row">
            <div class="col-sm-2">
                <div id="job-logo">
                    <c:if test="${jobPosting.getPicture() != null}">
                        <img src="<c:url value="${jobPosting.getPicture()}"/>" alt="${jobPosting.getJobPosition().getJobName()}">
                    </c:if>
                    <c:if test="${jobPosting.getPicture() == null}">
                        <img src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true" alt="${jobPosting.getJobPosition().getJobName()}">
                    </c:if>
                </div>
            </div>
            <div class="col-sm-8">
                <div id="general-info">
                    <h1>${jobPosting.getJobPosition().getJobName()}</h1>
                    <h2>Software company Monke Tech</h2>
                    <p>Created date: <fmt:formatDate value="${jobPosting.getCreatedTime()}" pattern="dd/MM/yyyy"/></p>
                    <p><i class="fa-regular fa-clock"></i>Expired date: <fmt:formatDate value="${jobPosting.getExpiredTime()}" pattern="dd/MM/yyyy"/></p>
                </div>
            </div>
            <div class="col-sm-2">
                <div id="apply-buton">
                    <form method="post" action="<c:url value="/jobPostings/job-posting-details/end-post"/>">
                        <div id="apply-buton">
                            <input type="hidden" name="postID" value="${jobPosting.getPostId()}">
                            <button class="end-button" type="submit" name="action" value="end">End</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</c:if>
<!--                <button class="save-job-button"><i class="fa-regular fa-circle-xmark"></i>Reject</button>-->
<!--                        <button class="apply-button"><i class="fa-solid fa-check-double"></i><a
                            href="#">Approve</a></button>-->
<div id="job-detail-body">
    <div id="recrui-detail">
        <h1 class="job-detail-recruit">Recruitment information</h1>
        <div id="job-general-info">
            <h1>General information</h1>
            <ul class="general-info-list">
                <div class="row">
                    <div class="col-sm-6 general-info-left">
                        <li><i class="fa-solid fa-money-bill"></i>
                            Salary
                            <p>${jobPosting.getSalary()}</p>
                        </li>

                        <li><i class="fa-sharp fa-solid fa-suitcase"></i>Type of work<p>
                                <c:if test="${jobPosting.isTypeOfWork() == true}">
                                    At Office
                                </c:if>
                                <c:if test="${jobPosting.isTypeOfWork() == false}">
                                    Hybrid
                                </c:if>
                            </p>
                        </li>
                    </div>
                    <div class="col-sm-6 general-info-right">

                        <li><i class="fa-solid fa-ranking-star"></i>Level<p>${jobPosting.getLevel()}</p>
                        </li>

                        <li><i class="fa-brands fa-black-tie"></i>Year Experience<p>${jobPosting.getExprienceRequirement()}</p>
                        </li>
                    </div>
                </div>
            </ul>
        </div>
    </div>

    <div id="job-location">
        <h1>Work location</h1>
        <ul class="info-list">
            <li>
                ${jobPosting.getLocations()}
            </li>
        </ul>
    </div>

    <div id="job-describe">
        <h1>Job description</h1>
        <ul class="info-list">
            <c:forTokens var="description" items="${jobPosting.getDescriptions()}" delims=";">
                <li>${description}</li>
                </c:forTokens>
        </ul>
    </div>

    <div id="job-require">
        <h1>Required Skills</h1>
        <ul class="info-list">
            <c:forEach var="skill" items="${jobPosting.jobPosition.skills}">
                <li>
                    ${skill.skillName}
                </li> 
            </c:forEach>
        </ul>
    </div>

    <div id="job-rounds">
        <h1>Interview Round</h1>
        <ul class="info-list">
            <c:forEach var="round" items="${jobPosting.rounds}">
                <li>
                    ${round.roundNumber} - ${round.content}
                </li> 
            </c:forEach>
        </ul>
    </div>

    <div id="job-welfare">
        <h1>Welfare</h1>
        <ul class="info-list">
            <c:forTokens var="welfare" items="${jobPosting.getWelfare()}" delims=",">
                <li>${welfare}</li>
                </c:forTokens>
            <!--            <li>Thưởng lễ, tết, sinh nhật, lương tháng 13, phép năm</li>
                        <li>Tham gia các hoạt động teambuilding, du lịch, tất niên</li>
                        <li>Xét tăng lương định kỳ 1 lần/năm</li>
                        <li>Yoga miễn phí</li>-->
        </ul>
    </div>
</div>
    <script>
        function validateForm(event) {
            var expiredDate = document.getElementById("expiredDate");
            if (expiredDate.value === "") {
                alert("Please enter an expired date.");
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>