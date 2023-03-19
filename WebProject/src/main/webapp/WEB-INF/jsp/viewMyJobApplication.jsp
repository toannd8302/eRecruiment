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
                cell.setAttribute("colspan", "5");

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

    .head-content{
        background: #00AE72;
        height: 10.6rem;
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
        width: 8rem;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        height: 100%;
        background: rgb(172, 170, 170);
        overflow: hidden;
        transition: witdh 0.2s linear;
        box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);
        opacity: 0.9;
    }

    .post-list-left ul, li{
        padding-left: 0;
    }

    .logo img{
        width: 6rem;
        height: 6rem;
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
        font-size: 2rem;
        text-transform: uppercase;
    }

    .post-list-left a{
        position: relative;
        color: white;
        font-size: 2rem;
        display: table;
        width: 40rem;
        text-decoration: none;
        padding: 1.5rem;
        text-height: 1rem;

    }
    
    .post-list-left .nav-body{
        margin-top: 10rem;
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
        width: 28rem;
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


    .view-app-right{
        margin-bottom: 5rem;
        position: absolute;
        top: 11%;
        left: 20%;
        width: 80%;
        margin-top: 2.5rem;
        background: #fff;
        border-bottom-left-radius: 1rem;
    }

    .table {
        width: 100%;
        background-color: white;

        margin-top: 2rem;
    }


    .table thead>tr {
        border: 1rem solid white;
    }

    .table tr th{
        font-size: 2.5rem;
        font-weight: bold;
    }

    .table th,
    td {
        color: black;
        font-size: 1.8rem;
        text-align: center;
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
        padding: 0.7rem 2rem;
        font-size: 1.5rem;
    }

    .detail-info{
        text-align: initial;
    }

    .detail-info a {
        text-decoration: none;

    }

    .detail-info ul {
        list-style: none;
    }

    .detail-info li {
        font-size: 1.5rem;
    }


    .pagination{
        margin-top: 2rem;
        clear: both;
        margin-left: 53rem;

    }

    .pagination li a{
        font-size: 1.5rem;
    }




</style>

<%
    //hien tai chua co trong database
    candidate candidate = (candidate) session.getAttribute("user");

%>


<body style="background: #FAF0E6">
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

    <div class="head-content">
        <div class="create-post-head" style="display: flex; justify-content: space-between;">
            <h1 id="page-name">My Applications</h1>
            <h1 id="user-name">Welcome, ${sessionScope.user.getName()}</h1>
        </div>
    </div>          

        
    <div class="view-app-right">
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
                        <td>${jobApplication.jobPosting.jobPosition.jobName}</td> 
                        <td>${jobApplication.jobPosting.salary}</td> 
                        <td>${jobApplication.jobPosting.locations}</td> 
                        <td><fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></td>
                        <td><button class="btn btn-success detail-toggle">View Detail</button></td>
                    </tr>
                    
                    <tr class="detail-row" style="display: none;">
                        <td colspan="3">
                            <div class="detail-info">
                                <p><strong>Rounds:</strong></p>
                                <ul>
                                    <li>
                                        <c:forEach var="round" items="${jobApplication.jobPosting.getRounds()}">
                                            <ul>
                                                <li>Round ${round.getRoundNumber()}: ${round.getContent()}</li>
                                            </ul>                                       
                                        </c:forEach>
                                    </li>
                                    <li><!--In lịch ngay đây, thêm pojo schedule, 1 job application có nhiều schedule-->
                                        <c:forEach var="jobAppSchedule" items="${jobApplication.getJobApSche()}">
                                            Schedule date: <fmt:formatDate value="${jobAppSchedule.getApplicationSchedule().getScheduleDate()}" pattern="dd/MM/yyyy"/>
                                            Status: ${jobAppSchedule.getApplicationSchedule().getStatus()} 
                                        </c:forEach> </li>

                                </ul>
                                <p><strong><a href="<c:url value="/post-detail/${jobApplication.jobPosting.getPostId()}"/>">Link to Job Posting</a></strong></p>
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