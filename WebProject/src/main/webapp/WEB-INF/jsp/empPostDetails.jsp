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
    * {
        box-sizing: border-box;
        margin: 0;
    }
    /* CSS for body */
    #job-detail-head {
        background-color: white;
        width: 85%;
        margin-left: 14%;
        padding: 2rem;
        margin-top: 3%;
    }
    #job-logo img {
        width: 15rem;
        height: 15rem;
    }
    #general-info {
        margin-top: 2rem;
        font-size: 2rem;
    }
    #general-info h2,
    p {
        margin-top: 1rem;
    }
    #general-info p i {
        margin-right: 1rem;
    }
    #job-detail-head #apply-buton button:first-child {
        margin-top: 2rem;
        padding: 1rem;
        border-radius: 1rem;
        background-color: #00b14f;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;
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
        font-size: 1.5rem;
        text-align: center;
    }
    #job-detail-head #apply-buton button a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;
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
    .end-button{
        width: 17rem;
        height: 7rem;
    }
    /* CSS for recruit detail  */
    #job-detail-body {
        background-color: white;
        width: 85%;
        margin-left: 14%;
        padding: 2rem;
        margin-top: 3%;
    }
    #job-detail-body #job-general-info {
        margin-top: 2rem;
        background-color: #d4f2e1;
        padding: 2rem;
    }
    #job-detail-body #job-general-info h1 {
        margin-bottom: 1rem;
        text-decoration: underline;
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
    #job-detail-body #job-location h1 {
        text-decoration: underline;
    }
    /* CSS for Job Describe */
    #job-detail-body #job-describe {
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
    /* CSS for Job Apply */
    #job-detail-body #job-apply {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    #job-detail-body #job-apply p a {
        font-weight: bold;
        text-decoration: none;
        color: #00b14f;
    }
    #job-detail-body #job-apply p,
    button {
        margin: 0.5rem;
    }
    #job-detail-body #job-apply button a {
        text-decoration: none;
        color: white;
    }
    #job-detail-body .apply-button {
        padding: 1rem;
        border-radius: 1rem;
        background-color: #00b14f;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;
    }
    #job-detail-head {
        margin-left: 20rem;
    }
    #job-detail-head #apply-buton .accept-button {
        margin-top: 2rem;
        padding: 1rem;
        border-radius: 1rem;
        background-color: #00b14f;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;
    }
    #job-detail-head #apply-buton .accept-button:hover {
        background-color: #ffffff;
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
        font-size: 2rem;
    }
    #job-detail-head #apply-buton button:last-child:hover {
        background-color: #00b14f;
        color: #fff;
    }
    #job-detail-head #apply-buton button a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;
    }
    #job-detail-head #apply-buton .accept-button {
        font-size: 2rem;
        color: #ffffff;
        margin-right: 1rem;
        width: 15rem;
        height: 7rem;
    }
    #job-detail-head #apply-buton .reject-button {
        font-size: 2rem;
        margin-right: 1rem;
        width: 15rem;
        height: 7rem;
    }
    #job-detail-head #apply-buton button i:last-child {
        font-size: 2rem;
        color: #00b14f;
        margin-right: 1rem;
    }
    #job-detail-body .save-job-button {
        padding: 1rem;
        border-radius: 1rem;
        background-color: #ffffff;
        border: 0.2rem solid #00b14f;
        margin-right: 1rem;
        color: #00b14f;
        font-weight: bold;
        font-size: 1.5rem;
        text-align: center;
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
        font-size: 20px;
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

<!-- Sidebar here -->
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
        <li><a  href="<c:url value="/jobApps"/>">Application List</a></li>
        <li><a  class="active" href="<c:url value="/jobPostings"/>">Job Postings List</a></li>
        <li><a href="<c:url value="/schedules"/>">Schedule List</a></li>
    </ul>
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
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="apply-buton">
                        <input type="hidden" name="postID" value="${jobPosting.getPostId()}">
                        <button class="accept-button" name="action" onclick="validateForm(event)" value="accept">Accept</button>
                        <button class="reject-button" name="action" value="reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</c:if>

<form method="post" action="<c:url value="/jobPostings/job-posting-details/reject-post"/>"></form>

<c:if test="${jobPosting.isApprovedStatus() eq 'Approved'}">
    <div id="job-detail-head">
        <div class="row">
            <div class="col-sm-2">
                <div id="job-logo">
                    <img src="<c:url value="${jobPosting.getPicture()}"/>" alt="Back-end">
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
        <h1>Recruitment information</h1>
        <div id="job-general-info">
            <h1>General information</h1>
            <ul class="general-info-list">
                <div class="row">
                    <div class="col-sm-6">
                        <li><i class="fa-solid fa-money-bill"></i>
                            Salary
                            <p>${jobPosting.getSalary()}</p>
                        </li>

                        <li><i class="fa-sharp fa-solid fa-suitcase"></i>Type of work
                            <p>
                                <c:if test="${jobPosting.isTypeOfWork() == true}">
                                    At Office
                                </c:if>
                                <c:if test="${jobPosting.isTypeOfWork() == false}">
                                    Hybrid
                                </c:if>
                            </p>
                        </li>

                        <!--                        <li><br><i class="fa-solid fa-venus-mars"></i>Giới tính<p>Nam</p>
                                                </li>-->
                    </div>
                    <div class="col-sm-6">
                        <li><i class="fa-sharp fa-solid fa-people-group"></i>number of recruitments<p>No</p>
                        </li>

                        <li><br><i class="fa-solid fa-ranking-star"></i>Level<p>${jobPosting.getLevel()}</p>
                        </li>

                        <li><br><i class="fa-brands fa-black-tie"></i>Year Experience<p>${jobPosting.getExprienceRequirement()}</p>
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
        <h1>Requirements</h1>
        <ul class="info-list">
            <!--Thêm phần kinh nghiệm-->
            <li>Yêu cầu tối thiểu 6 tháng kinh nghiệm lập trình trên .NET</li>
            <li>Kỹ năng lập trình</li>
            <li>Chịu áp lực công việc cao</li>
            <li>Tiếng anh trình độ A</li>
        </ul>
    </div>

    <div id="job-welfare">
        <h1>Welfare</h1>
        <ul class="info-list">
            <c:forTokens var="welfare" items="${jobPosting.getWelfare()}" delims=";">
                <li>${welfare}</li>
                </c:forTokens>
            <!--            <li>Thưởng lễ, tết, sinh nhật, lương tháng 13, phép năm</li>
                        <li>Tham gia các hoạt động teambuilding, du lịch, tất niên</li>
                        <li>Xét tăng lương định kỳ 1 lần/năm</li>
                        <li>Yoga miễn phí</li>-->
        </ul>
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