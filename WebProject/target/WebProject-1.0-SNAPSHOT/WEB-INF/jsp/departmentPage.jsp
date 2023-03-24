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

<!--TẠI TRANG NÀY SẼ VIEW CÁC JOBPOSTING CỦA PHÒNG ĐANG ĐĂNG NHẬP VÀ TẠO MỚI 1 JOBPOSTING-->



<style>
    @import url("https://fonts.googleapis.com/css2?family=Climate+Crisis&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=Noto+Sans+Lepcha&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&family=Poppins:wght@400;500;600;800&display=swap");
    html {
        font-size: 62.5%;
        font-family: "Poppins", sans-serif;
    }

    * {
        box-sizing: border-box;
        margin: 0;
    }

    body {
        width: 100%;
        height: 100%;
        background: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url('https://media.discordapp.net/attachments/1059668998503026770/1088380001059082271/people-office-background_236854-36902.png?width=782&height=521');
        background-size: cover;
    }

    .navbar {
        position: fixed;
        top: 0;
        right: 0;
        width: 84.2%;
        transition: 0.5s;
        padding: 2rem 4rem;
        z-index: 10000;
        height: 10rem;
        background: linear-gradient(90deg, rgba(10,5,101,0.6940827356333159) 1%, rgba(2,86,103,0.7557073854932598) 52%, rgba(15,157,186,0.685679374288778) 100%);
        /*background: #000;*/
    }

    .navbar.sticky {
        padding: 1rem 4rem;
        background: #fff;
        border-bottom: 3px solid silver;
    }

    .navbar #logo a {
        position: relative;
        text-decoration: none;
        font-size: 2rem;
        font-weight: bold;
        color: #fff;
    }

    .navbar #logo img {
        margin-top: -1rem;
        width: 12rem;
        height: 6rem;
    }

    .navbar .header-info ul li {
        position: relative;
        right: 0;
        list-style: none;
        margin: 0 1rem;
        text-align: right;
    }

    .navbar .header-info ul li a {
        position: relative;
        text-decoration: none;
        margin: 0 2rem;
        font-size: 3rem;
        color: #fff;
        font-family: serif;
    }

    .navbar .header-info ul li a::after {
        content: "";
        height: 0.3rem;
        width: 100%;
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

    .post-list-left{
        width: 23rem;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        height: 100%;
        /*background: radial-gradient(circle, rgba(226,226,226,0.8313376375941002) 0%, rgba(255,255,255,0.850945480731355) 100%);*/
        /*background: linear-gradient(90deg, rgba(10,5,101,0.6940827356333159) 1%, rgba(2,86,103,0.7557073854932598) 52%, rgba(15,157,186,0.685679374288778) 100%);*/
        background: #fff;
        overflow: hidden;
        transition: witdh 0.2s linear;
        box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);
        border-top-right-radius: 1rem;
        border-bottom-right-radius: 1rem;
    }

    .post-list-left ul, li{
        padding-left: 0;
    }
    .nav-body{
        margin-top: 10rem;
    }

    .nav-body li{
        margin: 4rem 0;
    }
    .logo img{
        width: 10rem;
        height: 5rem;
    }

    .logo{
        display: flex;
        transition: all 0.5s ease-in-out;

    }

    .logo span{
        font-weight: bold;
        font-size: 2rem;
        text-transform: uppercase;
    }

    .post-list-left a{
        position: relative;
        color: #000;
        font-size: 1.5rem;
        display: table;
        width: 40rem;
        text-decoration: none;
        padding: 1.5rem;
        transition: 0.5s ease;
        font-weight: bold;
    }


    .fa-solid{
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
        background: #000;
        color: #fff;
    }

    /*            .post-list-left a:hover li{
                    color: 
                }
    */
    .logout{
        position: absolute;
        top: 90%;
        bottom: 0%;
    }


    .post-list-right{
        width: 79%;
        padding-left: 2rem;
        margin-top: 15rem;
        position: relative;
        top: 15%;
        left: 19%;
        background: #fff;
        border-radius: 1rem;
        padding: 1rem;
    }


    .post-list-right::after{
        content: "";
        position: absolute;
        inset: 0;
        z-index: -1;
        margin: -10px;
        background-image: linear-gradient(to right top, #2979ff, #1f2123);
        border-radius: inherit;
    }

    .post-list-right h1{
        font-weight: bold;
        font-size: 3.5rem;
        font-family: serif;
    }

    .styled-table {
        border-collapse: collapse;
        margin: 3rem 0;
        font-size: 0.9em;
        font-family: sans-serif;
        width: 100%;
        border-radius: 5px 5px 0 0;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }

    .styled-table thead tr {
        background-color: #009879;
        color: #fff;
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

<body>
    <div class="navbar" style="position: fixed">
        <div class="header-info">
            <ul>         
                <div class="account">           
                    <li>
                        <a href="#" style="text-transform: uppercase;"><%= department.getDepartmentName()%> Department</a>
                    </li>
                </div>
            </ul>
        </div>
    </div>

    <nav class="post-list-left">
        <ul>
            <li>
                <a style="font-size: 2rem;" href="<c:url value="/logout"/>" class="logo">
                    <img
                        src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                        alt="Monke Tech"
                        />
                    MonkeTech
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
                        <span class="nav-item">Post List</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/createjobposting" />">
                        <i class="fa-solid fa-folder-plus"></i>
                        <span class="nav-item">Create Post</span>
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

    <div class="post-list-right">
        <h1>Job Posting List</h1>
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
                        <td>
                            <%
                                if (jobposting.isApprovedStatus().equals("Pending")) {
                            %>

                            <a id="delete-post" onclick="deletePost(event)" 
                               href="http://localhost:8080/WebProject/deletejobposting/<%= jobposting.getPostId()%>">
                                <i class="fa-solid fa-trash trash-bin"></i></a>

                            <%
                                }
                            %>
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