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
    .view-app-left{
        float: left;
        margin-top: 15rem;
        width: 35%;
    }

    .view-app-left a{
        font-size: 2rem;
        margin-left: 5rem;
        text-decoration: none;
        padding: 2rem;
        display: inline-block;
    }

    .view-app-left i{
        font-size: 3rem;
        margin-right: 1.5rem;
    }


    .view-app-right{
        margin-bottom: 5rem;

    }

    #applied-list{
        margin-top: 5rem;
        font-weight: bold;
        font-size: 5rem;
    }


    .table {
        width: 65% !important;
        background-color: white;
        float: right;
        margin-top: 5rem;
    }


    .table thead>tr {
        border: 1rem solid white;
    }

    .table tr th{
        font-size: 2rem;
        font-weight: bold;
    }

    .table th,
    td {
        color: black;
        font-size: 1.3rem;
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


<body>
    <div class="view-app-left">
        <a href="<c:url value="/job/viewMyJob"/>"><i class="fa-solid fa-paper-plane"></i>My Applications</a>
        <br>
        <a href="<c:url value="/post-detail/view"/>"><i class="fa-solid fa-heart-circle-check"></i>Favourite Jobs</a>
    </div>
    <div class="view-app-right">

        <h1 id="applied-list">My Applications</h1>
        <hr>
        <table class="table table-striped">

            <thead>
                <tr>
                    <th>No.</th>
                    <th>Job Title</th>
                    <th>Apply Date</th>
                    <th>View Schedule</th>
                </tr>
            </thead>
            <c:forEach var="jobApplication" items="${JobApplications}" varStatus="counter">
                <tbody>
                    <tr>
                        <td>${counter.count}</td>
                        <td>${jobApplication.jobPosting.jobPosition.jobName}</td>
                        <td><fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></td>
                        <td><button class="btn btn-success detail-toggle">View Detail</button></td>
                        <td><button class="btn btn-danger">Cancel Application</button></td>
                    </tr>

                    <tr class="detail-row">
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
                                        <c:forEach var="schedule" items="${jobApplication.getJobApSche()}">
                                            Schedule date: <fmt:formatDate value="${schedule.schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/>
                                            Status: ${schedule.schedule.getStatus()} 

                                        </c:forEach> </li>


                                </ul>
                                <p><strong><a href="<c:url value="/post-detail/${jobApplication.jobPosting.getPostId()}"/>">Link to Job Posting</a></strong></p>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item "><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </div>


    <%--
        <h1 >Welcome <%= candidate.getName()%></h2>
        <h2><c:forEach var="jobApplication" items="${JobApplications}">
                Cho 1 link dan sang post-detail page
                <a href="<c:url value="/post-detail/${jobApplication.jobPosting.getPostId()}"/>"/><h2>Job Name: ${jobApplication.jobPosting.jobPosition.jobName}</h2></a>
                <h2>Apply Date: <fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></h2>
                <c:forEach var="round" items="${jobApplication.jobPosting.getRounds()}">

                Round ${round.getRoundNumber()}: ${round.getContent()}
            </c:forEach>
        </h2>
        In lịch ngay đây, thêm pojo schedule, 1 job application có nhiều schedule
        <h2><c:forEach var="schedule" items="${jobApplication.getJobApSche()}">
                Schedule date: <fmt:formatDate value="${schedule.schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/>
                <h2>Status: ${schedule.schedule.getStatus()} </h2>
                <h2>------------------------------------------------------------------------------------------------------------------------------------------------------------------------</h2>
            </c:forEach></h2> 

    </c:forEach></h2>--%>

    <script>
        $(document).ready(function () {
            $('.detail-toggle').on('click', function () {
                var row = $(this).closest('tr');
                row.next('.detail-row').toggle();
            });
        });
    </script>

</body>