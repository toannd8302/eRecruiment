<%-- 
   Document   : departmentPage
   Created on : Mar 1, 2023, 11:21:41 AM
   Author     : KHOA
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css"/>-->

<!--TẠI TRANG NÀY SẼ VIEW CÁC JOBPOSTING CỦA PHÒNG ĐANG ĐĂNG NHẬP VÀ TẠO MỚI 1 JOBPOSTING-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css" integrity="sha256-sWZjHQiY9fvheUAOoxrszw9Wphl3zqfVaz1kZKEvot8=" crossorigin="anonymous">


<style>
    @import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&family=Poppins:wght@400;600;800&display=swap');
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
        margin: 0;
    }


    .post-list-left{
        width: 8rem;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        height: 100%;
        /*background-color: rgb(172, 170, 170);*/
        background: #5c6664;
        overflow: hidden;
        transition: witdh 0.2s linear;
        box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);
        opacity: 0.8;
    }

    .post-list-left .nav-body{
        margin-top: 12rem;
    }

    .post-list-left .nav-body li{
        margin-top: 2rem;
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
        width: 30rem;
        text-decoration: none;
        padding: 1.5rem;
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
        transform: translateX(30%);
        background: #5c6664;
    }
    .logout{
        position: absolute;
        top: 90%;
        bottom: 0%;
    }

    .create-post-head{
        background: #00AE72;
        height: 25rem;
        font-family: 'Poppins', sans-serif;

    }

    .head-content{
        margin-left: 30rem;
        display: flex;
        justify-content: space-around;
        color: #CD2626;

    }


    .post-list-right{
        left: 20%;
        width: 80%;
        padding-left: 2rem;
        margin-top: 2rem;
        position:absolute;
        top: 18%;
        background-color: #fff;
        /*        VỪA MỚI THỆM VÀO LÚC 11H NGÀY 9/3/2023 BỞI TOÀN*/
        border-top-left-radius: 1rem;

    }

    .post-list-right .table thead{
        background-color: #00b14f;
        color: white;

    }

    .post-list-right h1{
        font-weight: bold;
        font-size: 3.5rem;
        color: orangered;
    }

    .trash-bin{
        cursor: pointer;
    }


    .styled-table {
        border-collapse: collapse;
        margin: 3rem 0;
        font-size: 0.9em;
        font-family: sans-serif;
        /*min-width: 400px;*/
        width: 100%;
        border-radius: 5px 5px 0 0;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }

    .styled-table thead tr {
        background-color: #009879;
        color: #ffffff;
        text-align: left;
    }

    .styled-table th{
        font-size: 2rem;
        font-weight: bold;
        padding: 2rem 3rem;
        text-align: center;
    }

    .styled-table td {
        padding: 2rem 3rem;
        font-size: 1.5rem;
        text-align: center;
    }

    .styled-table tbody tr {
        border-bottom: 1px solid #dddddd;
    }

    .styled-table tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    .styled-table tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
    }
    .styled-table tbody tr.active-row {
        font-weight: bold;
        color: #009879;
    }
    .blank{
        height: 2.5rem;
    }
    .trash-bin{
        margin-bottom: 1rem;
        color:black;
    }
</style>


<%
    department department = (department) session.getAttribute("department");
    List<jobPosting> jobPostings = (List<jobPosting>) request.getAttribute("jobPostings");
    String typeOfWork = "";
    if (jobPostings == null) {
        jobPostings = new ArrayList<>();
    }
    if (!jobPostings.isEmpty()) {
        int count = 1;

%>

<body style="background: #FAF0E6">
    <nav class="post-list-left">
        <ul>
            <li>
                <a href="<c:url value="/logout"/>" class="logo">
                    <img
                        src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                        alt="Monke Tech"
                        />
                </a>
            </li>
            <div class="nav-body">
                <li>
                    <a href="<c:url value="/department"/>">
                        <i class="fa-solid fa-house"></i>
                        <span class="nav-item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/department" />">
                        <i class="fa-solid fa-list"></i>
                        <span class="nav-item">Job Posting List</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/createjobposting" />">
                        <i class="fa-solid fa-folder-plus"></i>
                        <span class="nav-item">Create a Job Posting</span>
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

    <div class="create-post-head">
        <div class="head-content">
            <h1 style="font-weight: bold; font-size: 6rem; margin-top: 6rem; color:#fff;">Job Post List</h1>
            <h1 style="font-weight: bold; margin-left: 28rem; color: #FFD39B;">${sessionScope.department.departmentName} Department</h1>
        </div>    
    </div>
    <div class="post-list-right">
        <div class="container mt-3">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Job Position</th>
                        <th>Level</th>
                        <th>Created Date</th>
                        <th>Type of Work</th>
                        <th>Status</th>
                        <th>View Detail</th>
                        <th>Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <%                    for (jobPosting jobposting : jobPostings) {
                            if (jobposting.getJobPosition().getDepartment().getDepartmentId().equals(department.getDepartmentId())) {
                                if (jobposting.isTypeOfWork()) {
                                    typeOfWork = "Full Time";
                                } else {
                                    typeOfWork = "Part Time";
                                }
                    %>
                    <tr>
                        <td><%= count++%></td>
                        <td><%= jobposting.getJobPosition().getJobName()%></td>
                        <td><%= jobposting.getLevel()%></td>
                        <td> <fmt:formatDate value="<%= jobposting.getCreatedTime()%>"  pattern="dd/MM/yyyy"/></td>
                        <td><%= typeOfWork%></td>
                        <td><%= jobposting.isApprovedStatus()%></td>
                        <td><a href="http://localhost:8080/WebProject/view-post-detail/<%= jobposting.getPostId()%>" style="text-decoration: none">View Detail</a></td>
                        <td >
                            <a id="delete-post" onclick="deletePost(event)" 
                               href="http://localhost:8080/WebProject/deletejobposting/<%= jobposting.getPostId()%>">
                                <i class="fa-solid fa-trash trash-bin"></i></a>
                            <!--                            <br>-->
                        </td>
                    </tr>   

                    <%
                            }
                        }
                    } else {

                    %>
                <h2>Your Department has not created Job Posting before</h2>        
                <%                }
                %>

                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
    <script>

                                function deletePost(event) {
                                    // Get a reference to the button element
                                    event.preventDefault();
                                    var confirmed = confirm("Are you sure you want to delete?");
                                    if (confirmed) {
                                        // continue with the default action (i.e. follow the href link)
                                        window.location.href = event.currentTarget.getAttribute("href");
                                    } else {
                                        //do nothing
                                    }

                                }

    </script>

</body>