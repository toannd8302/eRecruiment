<%-- 
    Document   : viewWishList
    Created on : Feb 24, 2023, 8:54:38 AM
    Author     : loqua
--%>

<%@page import="java.util.Set"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

    .view-favour-right{
        position: absolute;
        top: 15%;
        left: 20%;
        width: 80%;
        background: #fff;
        text-align: center;
    }


    .view-favour-right h1{
        font-size: 2.5rem;
    }

    .table{
        margin-top: 3rem;

    }

    .table thead tr th{
        font-size: 2.5rem;
        padding-bottom: 2rem;
    }

    .table tbody tr td{
        font-size: 1.8rem;
    }

    .table tbody tr td button{
        font-size: 1.5rem;
    }
    .table tbody tr td button a{
        text-decoration: none;
        color: #fff;
    }
</style>



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

    <%

        //    List<jobPosting> wishList = (List<jobPosting>) session.getAttribute("List");
        Set<jobPosting> wishList = (Set<jobPosting>) session.getAttribute("wishList");
        //QUY ĐỊNH CHỈ ĐƯỢC 5 JOBPOSTINGS
        if (!wishList.isEmpty()) {
            //HANDLE VẤN ĐỀ TRÙNG THÌ DÙNG SET HOẶC IF
    %>

    <div class="head-content">
        <div class="create-post-head" style="display: flex; justify-content: space-between;">
            <h1 id="page-name">Favourite Jobs</h1>
            <h1 id="user-name">Welcome, ${sessionScope.user.getName()}</h1>
        </div>
    </div>   

    <div class="view-favour-right">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Job Position</th>
                    <th>Welfare</th>
                    <!--                <th>Department</th>-->
                    <th>Location</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (jobPosting j : wishList) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td style="padding-left: 1rem;"><%= j.getJobPosition().getJobName()%></td>
                    <td style="width: 50rem;"><%= j.getWelfare()%></td>
                    <%-- <td><%= j.getJobPosition().getDepartment().getDepartmentName()%></td> --%>
                    <td style="width: 10rem;"><%= j.getLocations()%></td>
                    <td style="width: 9rem;"><%= j.getSalary()%></td>
                    <td><button class="btn btn-success detail-toggle"> <a href="http://localhost:8080/WebProject/job/application?data=<%=j.getPostId()%>"/>Apply Now</a></button></td>
                    <td><button class="btn btn-danger detail-toggle" style="height: 3.2rem;">
                            <a href="http://localhost:8080/WebProject/post-detail/view/delete/<%=j.getPostId()%>" onclick="deletePost(event)" style="text-decoration: none; color: #fff; ">Unsave</a>
                        </button></td>
                </tr>
                <%
                }%>
            </tbody>
        </table>

        <% } else {
        %>
        <h1 style="color: red; font-family: serif; float: right; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%)">Your WishList is empty</h1>
        <%
            }
        %> 
    </div>

    <script>

                                function deletePost(event) {
                                    // Get a reference to the button element
                                    event.preventDefault();
                                    var confirmed = confirm("Are you sure you want to unasve?");
                                    if (confirmed) {
                                        // continue with the default action (i.e. follow the href link)
                                        window.location.href = event.currentTarget.getAttribute("href");
                                    } else {
                                        //do nothing
                                    }

                                }

    </script>

</body>

