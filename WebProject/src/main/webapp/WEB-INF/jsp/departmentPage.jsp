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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--TẠI TRANG NÀY SẼ VIEW CÁC JOBPOSTING CỦA PHÒNG ĐANG ĐĂNG NHẬP VÀ TẠO MỚI 1 JOBPOSTING-->



<style>
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
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        height: 100%;
        background-color: rgb(172, 170, 170);
        overflow: hidden;
        transition: witdh 0.2s linear;
        box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);


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
    }


    .fa-solid{
        position: relative;
        width: 5rem;
        height: 3rem;
        top: 2rem;
        font-size: 2rem;
        text-align: center;
    }

    .nav-item{
        position: relative;
        top: 2rem;
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

    .logout{
        position: absolute;
        top: 90%;
        bottom: 0%;

    }
    .post-list-right{
        float: right;
        width: 80%;
        padding-left: 2rem;
        margin-top: 2rem;
    }

    .post-list-right .table thead{
        background-color: #00b14f;
        color: white;

    }

    .post-list-right h1{
        font-weight: bold;
        font-size: 3.5rem;
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
    }

    .styled-table td {
        padding: 2rem 3rem;
        font-size: 1.5rem;
    }

    .styled-table tbody tr {
        border-bottom: 1px solid #dddddd;
    }

    .styled-table tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    .styled-table tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
    }.styled-table tbody tr.active-row {
        font-weight: bold;
        color: #009879;
    }
</style>




<!--<h2>Department: ${sessionScope.department.departmentName}</h2>-->

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



<nav class="post-list-left">
    <ul>
        <li>
            <a href="<c:url value="/"/>" class="logo">
                <img
                    src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/MonkeTech_Logo_PNG.png?raw=true"
                    alt="Monke Tech"
                    />
                <span class="nav-item">Department</span>
            </a>
        </li>
        <li>
            <a href="<c:url value="/"/>">
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
        <li>
            <a href="#">
                <i class="fa-solid fa-square-plus"></i>
                <span class="nav-item">Create a Job Position</span>
            </a>
        </li>
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
    <hr>
    <div class="container mt-3">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Job Position</th>
                    <th>Level</th>
                    <th>Posted Date</th>
                    <th>Expired Date</th>
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
                    <td> <fmt:formatDate value="<%= jobposting.getPostingTime()%>"  pattern="dd/MM/yyyy"/></td>
                    <td><fmt:formatDate value="<%= jobposting.getExpiredTime()%>"  pattern="dd/MM/yyyy"/></td>
                    <td><%= typeOfWork%></td>
                    <td><%= jobposting.isApprovedStatus()%></td>
                    <td><a href="<c:url value="/post-detail/${item.postId}"/>">View Detail</a></td>
                    <td><i class="fa-solid fa-trash trash-bin"></i></td>
                </tr>   

                <%
                        }
                    }
                } else {
                %>
            </tbody>
        </table>



    </div>
</div>


<h2>No Result</h2>        

<%    }
%>

