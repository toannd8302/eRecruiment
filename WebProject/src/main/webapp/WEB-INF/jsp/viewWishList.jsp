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
    .post-list-left{
        width: 8rem;
        position: fixed;
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
        text-height: 1rem;

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

    .view-favour-right{
        float: right;
        width: 80%;
        margin-top: 5rem;
    }

    .view-favour-right h1{
        font-size: 4rem;
    }

    .table{
        margin-top: 3rem;

    }

    .table thead tr th{
        font-size: 2rem;
    }

    .table tbody tr td{
        font-size: 1.5rem;
    }

    .table tbody tr td button{
        font-size: 1.5rem;
    }
</style>






<nav class="post-list-left">
    <ul>
        <li>
            <a href="<c:url value="/"/>" class="logo">
                <img
                    src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/MonkeTech_Logo_PNG.png?raw=true"
                    alt="Monke Tech"
                    />
                <span class="nav-item">User</span>
            </a>
        </li>
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
<div class="view-favour-right">
    <h1>Favourite Jobs</h1>
    <hr>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>Job Title</th>
                <th>Welfare</th>
                <th>Department</th>
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
                <td><%= j.getJobPosition().getJobName()%></td>
                <td><%= j.getWelfare()%></td>
                <td><%= j.getJobPosition().getDepartment().getDepartmentName()%></td>
                <td><%= j.getLocations()%></td>
                <td><%= j.getSalary()%></td>
                <td><button class="btn btn-success detail-toggle">Apply Now</button></td>
                <td><button class="btn btn-danger detail-toggle" style="height: 5.2rem;">
                        <a href="http://localhost:8080/WebProject/post-detail/view/delete/<%=j.getPostId()%>" style="text-decoration: none; color: #fff; ">Unsave</a>
                    </button></td>
            </tr>
            <%
                }%>
        </tbody>
    </table>

    <% } else {
    %>
    <h1 style="color: red; font-family: serif; float: right; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%)">NO RESULT</h1>
    <%
        }
    %> 
</div>





