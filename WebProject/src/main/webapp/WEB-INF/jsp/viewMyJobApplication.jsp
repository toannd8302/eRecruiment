<%-- 
    Document   : viewJobApplication
    Created on : Feb 20, 2023, 10:36:08 AM
    Author     : toan0
--%>
<%@page import="com.codeweb.pojos.round"%>
<%@page import="java.util.Set"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.codeweb.pojos.jobApplicationSchedule"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page import="com.codeweb.pojos.candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<script type="text/javascript">
    expandBtns.forEach((btn) => {
        btn.addEventListener("click", () => {
            // Get the row that contains the clicked button
            const row = btn.parentNode.parentNode;
            // Check if the row is already expanded
            const isExpanded = row.nextElementSibling && row.nextElementSibling.classList.contains("expandable-row");
            // Toggle the visibility of the expandable row
            if (isExpanded) {
                row.nextElementSibling.remove();
            } else {
                // Create a new row to hold the expanded content
                const expandableRow = document.createElement("tr");
                expandableRow.classList.add("expandable-row");
                // Create a new table cell to hold the expanded content
                const cell = document.createElement("td");
                cell.setAttribute("colspan", "6");
                // Create the expanded content
                const content = `
        <h4>Details for ${row.cells[0].textContent}</h4>
        <p>Age: ${row.cells[1].textContent}</p>
        <p>Job Title: ${row.cells[2].textContent}</p>
      `;
                // Set the innerHTML of the cell to the expanded content
                cell.innerHTML = content;
                // Append the cell to the expandable row
                expandableRow.appendChild(cell);
                // Insert the expandable row below the clicked row
                table.tBodies[0].insertBefore(expandableRow, row.nextSibling);
            }
        });
    });
</script> 

<style>
    html {
        font-size: 62.5%;
        font-family: 'Poppins', sans-serif;
    }
    * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }
    body {
        width: 100%;
        min-height: 200vh;
        background: linear-gradient(rgba(0, 0, 0, 0.75),rgba(0, 0, 0, 0.75)), url('https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80');
        background-size: cover;
        background-position: center;
    }
    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: 0.5s;
        padding: 2rem 4rem;
        z-index: 10000;
        height: 10rem;
        background: #000;
    }
    .navbar.sticky {
        padding: 1rem 4rem;
        background: #000;
        /* border-bottom: 3px solid silver; */
    }
    .navbar #logo a {
        position: relative;
        font-size: 2rem;
        text-decoration: none;
        font-weight: bold;
        color: #fff;
    }
    .navbar #logo img {
        margin-top: -1rem;
        width: 12rem;
        height: 6rem;
    }
    .navbar > .header-info > ul {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: -1rem;
        width: 80rem;
    }
    .navbar .header-info ul li {
        position: relative;
        list-style: none;
        margin: 0 1rem;
    }
    .navbar .header-info ul li a {
        position: relative;
        text-decoration: none;
        margin: 0 2rem;
        font-size: 2rem;
        color: #fff;
    }
    .navbar .header-info ul li a::after {
        content: "";
        height: 0.3rem;
        width: 0;
        background: #009688;
        position: absolute;
        left: 0;
        bottom: -0.5rem;
        transition: 0.5s;
    }
    .navbar .header-info ul li a:hover::after {
        width: 100%;
    }
    .navbar .header-info .account {
        display: flex;
        margin-top: 1rem;
    }
    .navbar .header-info .account img {
        width: 5rem;
        height: 5rem;
        border-radius: 50%;
        margin-top: -1rem;
    }
    .navbar .header-info .account ul {
        position: absolute;
        left: 0;
        width: 27rem;
        padding: 2rem;
        display: none;
    }
    .navbar .header-info .account ul li {
        background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4));
        padding: 1rem;
    }
    .navbar .header-info ul li:hover > ul {
        display: initial;
        margin-top: 2rem;
    }
    .navbar.sticky ul li a {
        color: #fff;
    }
    .navbar.sticky ul li > ul li a {
        color: #fff;
    }
    #page-name{
        margin-left: 29.5rem;
        display: flex;
        flex-direction: column-reverse;
        margin-top: 5rem;
        background: #fff;
        color: #FF0000;
        display: inline-block;
        padding: 2rem 3.4rem;
        border-radius: 1rem;
    }
    #user-name{
        padding-bottom: 2rem;
        color: #eee;
        margin-top: 7rem;
        margin-left: 1rem;
    }
    .post-list-left{
        width: 20rem;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        height: 100%;
        background: #fff;
        overflow: hidden;
        transition: width 0.2s linear;
        box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);
    }
    .post-list-left ul, li{
        padding-left: 0;
    }
    .logo img{
        width: 6rem;
        height: 4rem;
        background-color: rgb(43, 44, 44);
        border-radius: 50%;
    }
    .logo{
        /* text-align: center; */
        display: flex;
        transition: all 0.5s ease;
    }
    .logo span{
        font-weight: bold;
        font-size: 1rem;
        text-transform: uppercase;
    }
    .post-list-left a{
        position: relative;
        color: #000;
        font-size: 1.5rem;
        display: table;
        width: 40rem;
        text-decoration: none;
        padding: 1rem;
        text-height: 1rem;
        font-weight: bold;
    }
    .post-list-left .nav-body li{
        margin-top: 4rem;
    }
    .post-list-left .fa-solid{
        position: relative;
        width: 5rem;
        height: 3rem;
        top: 0.2rem;
        font-size: 2rem;
        text-align: center;
    }
    .nav-item{
        position: relative;
        top: 0.2rem;
        margin-left: 1.8rem;
    }
    .post-list-left a:hover{
        background: #eee;
        color: black;
    }
    nav:hover{
        /* width: 28rem; */
        transition: all 0.5s ease;
    }
    nav:hover .logo{
        transform: translateX(20%);
        background-color: rgb(172, 170, 170);
    }
    .logout{
        position: absolute;
        top: 90%;
        bottom: 0%;
    }
    .view-app-right {
        margin-bottom: 5rem;
        margin-top: 15rem;
        background: #fff;
        position: absolute;
        left: 20%;
        width: 75%;
        border-radius: 1rem;
        padding-left: 5rem;
        padding-right: 5rem;
        /* border: 10px solid; */
    }
    .view-app-right::after{
        content: "";
        position: absolute;
        inset: 0;
        z-index: -1;
        margin: -10px;
        background-image: linear-gradient(to right top, #2979ff, #1f2123);
        border-radius: inherit;
    }
    #applied-list {
        display: flex;
        justify-content: space-between;
    }
    #applied-list h1{
        margin-top: 5rem;
        font-weight: bold;
        font-size: 4rem;
        color: red
    }
    .table {
        border-collapse: collapse;
        margin: 3rem 0;
        font-size: 0.9em;
        font-family: sans-serif;
        width: 100%;
        border-radius: 5px 5px 0 0;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }
    
    .table thead tr{
       background-color: #009879;
      
    }
    
    .table tr th {
        font-size: 2rem;
        font-weight: bold;
        color: #fff;
    }
    .table th,
    td {
        color: black;
        font-size: 1.5rem;
        /*font-weight: bold;*/
    }
    .table tbody tr > td > button{
        border-radius: 1rem;
        background: #fff;
        color: #000;
        font-weight: bolder;
        border: 0.4rem solid black;
    }
    .table tbody tr > td > a{
        text-decoration: none;
        font-weight: bold;
        color: #00a8b4;
        font-size: 1.5rem;
    }
    .table .row {
        position: static;
    }
    .table .row p {
        width: 3rem !important;
    }
    .detail-row {
        border-bottom: 2px solid black;
    }
    .table button {
        padding: 1rem 3rem;
        font-size: 1.2rem;
    }
    .detail-info a {
        text-decoration: none;
    }
    .detail-info ul {
        list-style: none;
    }
    .detail-info li {
        font-size: 1.3rem;
    }

    #acpt-btn{
        border-radius: 0.5rem;
        font-weight: bold;
        background: #009933;
        color: #fff;
        border: none;
    }

    #acpt-btn:hover{
        background: #006633;
    }

    #rej-btn{
        border-radius: 0.5rem;
        font-weight: bold;
        background: #CC0000;
        color: #fff;
        border: none;
    }
    
    #rej-btn:hover{
        background: #660000;
    }
    
</style>

<%
    //hien tai chua co trong database
    candidate candidate = (candidate) session.getAttribute("user");
%>


<body>
    <!-- Header here -->
    <div class="navbar" style="position: fixed">
        <div id="logo">
            <a href="<c:url value="/"/>"
               ><img
                    src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                    alt="MonkeTech"
                    />MonkeTech</a>
        </div>
        <div class="header-info">
            <ul>
                <li><a href="<c:url value="/"/>">Home</a></li>
                <li><a href="#service">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <div class="account">

                    <sec:authorize access="isAuthenticated()">
                        <li>
                            <img
                                src="<c:url value="${sessionScope.user.getPicture()}"/>"
                                alt="avatar"/>
                            <a href="#">${sessionScope.user.name}</a>                            
                            <ul>
                                <li><a href="<c:url value="/account"/>">My Profile</a></li>
                                <li><a href="<c:url value="/job/viewMyJob"/>">My Applications</a></li>
                                <li><a href="<c:url value="/logout"/>">Logout</a></li>
                            </ul>
                        </li>
                    </sec:authorize>    
                </div>

            </ul>
        </div>
    </div>


    <nav class="post-list-left">
        <ul>
            <li>
                <a href="<c:url value="/"/>" class="logo">
                    <img
                        src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                        alt="Monke Tech"
                        />
                </a>
            </li>
            <div class="nav-body">
                <li>
                    <a href="<c:url value="/"/>">
                        <i class="fa-solid fa-house"></i>
                        <span class="nav-item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/job/viewMyJob"/>">
                        <i class="fa-solid fa-paper-plane"></i>
                        <span class="nav-item">My Applications</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/post-detail/view"/>">
                        <i class="fa-solid fa-heart-circle-check"></i>
                        <span class="nav-item">Favourite Jobs</span>
                    </a>
                </li>
            </div>
            <li class="logout">
                <a href="<c:url value="/logout"/>">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span class="nav-item ">Log Out</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="view-app-right">
        <div id="applied-list">
            <h1>My Applications</h1>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Job Position</th>
                    <th>Salary</th>
                    <th>Location</th>
                    <th>Apply Date</th>
                    <th>View Schedule</th>
                </tr>
            </thead>
            <c:forEach var="jobApplication" items="${JobApplications}" varStatus="counter">
                <tbody>

                    <tr>
                        <td>${counter.count}</td>
                        <td>${jobApplication.getJobPosting().getJobPosition().jobName}</td> 
                        <td>${jobApplication.getJobPosting().salary}$</td> 
                        <td>${jobApplication.getJobPosting().locations}</td> 
                        <td><fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></td>
                        <td><button class="detail-toggle">View Detail</button></td>
                    </tr>

                    <tr class="detail-row" style="display: none;">
                        <td colspan="3">
                            <div class="detail-info">
                                <p><strong><a href="<c:url value="/post-detail/${jobApplication.getJobPosting().getPostId()}"/>">Link to Job Posting</a></strong></p>
                                <p><strong>Job Application Status  </strong> 
                                    <c:if test="${jobApplication.getApplicationStatus() eq 'Fail'}">
                                        Fail
                                    </c:if>
                                    <c:if test="${jobApplication.getApplicationStatus() eq 'Review'}">
                                        Waiting for review
                                    </c:if>
                                    <c:if test="${jobApplication.getApplicationStatus() eq 'Scheduling'}">
                                        Waiting for scheduling
                                    </c:if>
                                    <c:if test="${jobApplication.getApplicationStatus() eq 'On Going'}">
                                        Waiting for interviewing
                                    </c:if>
                                    <c:if test="${jobApplication.getApplicationStatus() eq 'Pass'}">
                                        Pass
                                    </c:if>
                                    <c:if test="${jobApplication.getApplicationStatus() eq 'Finished'}">
                                        Waiting for final evaluate
                                    </c:if> 
                                </p>
                                <p><strong>My Schedules</strong></p>
                                <ul>
                                    <c:if test="${jobApplication.getJobApSche().isEmpty()}">
                                        No Schedule available
                                    </c:if>
                                    <c:forEach var="jobAppSchedule" items="${jobApplication.getJobApSche()}" varStatus="counter">
                                        <c:if test="${jobAppSchedule.getApplicationSchedule().getStatus() eq 'On Going' or jobAppSchedule.getApplicationSchedule().getStatus() eq 'Finished'}">
                                            <li>
                                                <ul>NO: ${counter.count}</ul>
                                                <ul>Time: <fmt:formatDate value="${jobAppSchedule.getApplicationSchedule().getScheduleDate()}" pattern="dd/MM/yyyy"/> - <fmt:formatDate value="${jobAppSchedule.getApplicationSchedule().getScheduleTime()}" pattern="HH:mm:ss"/></ul>
                                                <ul>Round: ${jobAppSchedule.getApplicationSchedule().getRound().getRoundNumber()} - ${jobAppSchedule.getApplicationSchedule().getRound().getContent()}</ul>
                                                <ul>Status: 
                                                    <c:if test="${jobAppSchedule.getStatus() eq 'Pending'}">
                                                        Pending
                                                        <form method="post" action="<c:url value="/job/viewMyJob/schedule-decision"/>">
                                                            <input type="hidden" name="applicationId" value="${jobAppSchedule.getApplicationId()}"/>
                                                            <input type="hidden" name="scheduleId" value="${jobAppSchedule.getScheduleId()}"/>
                                                            <button id="acpt-btn" name="action" value="accept">Accept</button>
                                                            <button id="rej-btn" name="action" value="reject">Reject</button>
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${jobAppSchedule.getStatus() eq 'Approved'}">
                                                        ${jobAppSchedule.getApplicationSchedule().getStatus()}
                                                    </c:if>
                                                    <c:if test="${jobAppSchedule.getStatus() eq 'Rejected'}">
                                                        Rejected - No available
                                                    </c:if>
                                                </ul>
                                            </li>
                                            <hr>
                                        </c:if>
                                        <c:if test="${jobAppSchedule.getApplicationSchedule().getStatus() eq 'Pending'}">
                                            <c:set var = "counter" value="${counter - 1}"/>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>


    <script>
        $(document).ready(function () {
            $('.detail-toggle').on('click', function () {
                var row = $(this).closest('tr');
                row.next('.detail-row').toggle();
            });
        });
    </script>

</body>