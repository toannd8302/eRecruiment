<%-- 
    Document   : viewWishList
    Created on : Feb 24, 2023, 8:54:38 AM
    Author     : loqua
--%>

<%@page import="com.codeweb.pojos.candidate"%>
<%@page import="java.util.Set"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
     @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&family=Poppins:wght@400;500;600;800&display=swap");
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

    .view-favour-right{
        position: absolute;
        top: 20%;
        left: 20%;
        width: 75%;
        background: #fff;
        text-align: center;
        border-radius: 1rem;
        padding-left: 5rem;
        padding-right: 5rem;
    }

    .view-favour-right::after{
        content: "";
        position: absolute;
        inset: 0;
        z-index: -1;
        margin: -10px;
        background-image: linear-gradient(to right top, #2979ff, #1f2123);
        border-radius: inherit;
    }

    .view-favour-right h1{
        font-size: 2.5rem;
    }

    .table{
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
        color: #fff;
        text-align: center;
    }

    .table thead tr th{
        font-size: 2rem;
        padding-bottom: 2rem;
    }

    .table tbody tr td{
        font-size: 1.5rem;
    }

    .table tbody tr td button{
        font-size: 1.5rem;
    }
    .table tbody tr td button a{
        text-decoration: none;
        color: #fff;
    }

    #favor-list{
        display: flex;
        justify-content: space-between;
    }

    #favor-list h1{
        margin-top: 5rem;
        font-weight: bold;
        font-size: 4rem;
        color: red;
        font-family: "Poppins", sans-serif; 
    }
</style>



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
    <%
        //Get candidate
        Set<jobPosting> wishList = (Set<jobPosting>) session.getAttribute("JobPostings");
       
            //HANDLE VẤN ĐỀ TRÙNG THÌ DÙNG SET HOẶC IF
    %>


    <div class="view-favour-right">
        <div id="favor-list">
            <h1>Favourite Jobs</h1>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Job Position</th>
                    <th>Welfare</th>
                    <!--                <th>Department</th>-->
                    <th>Location</th>
                    <th>Salary</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (jobPosting j : wishList) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= j.getJobPosition().getJobName()%></td>
                    <td style="width: 45rem;"><%= j.getWelfare()%></td>
                    <%-- <td><%= j.getJobPosition().getDepartment().getDepartmentName()%></td> --%>
                    <td style="width: 10rem;"><%= j.getLocations()%></td>
                    <td style="width: 8rem;"><%= j.getSalary()%></td>
                    <td><button class="btn btn-success detail-toggle"> <a href="http://localhost:8080/WebProject/job/application?data=<%=j.getPostId()%>"/>Apply Now</a></button></td>
                    <td><button class="btn btn-danger detail-toggle" style="height: 3.2rem;">
                            <a href="http://localhost:8080/WebProject/post-detail/view/delete/<%=j.getPostId()%>" style="text-decoration: none; color: #fff; ">Unsave</a>
                        </button></td>
                </tr>
                <%
                    }%>
            </tbody>
        </table>

        
    </div>
</body>

