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
    .view-favour-left{
        float: left;
        width: 35%;
        margin-top: 15rem;
    }

    .view-favour-left a{
        font-size: 2rem;
        margin-left: 5rem;
        text-decoration: none;
        padding: 2rem;
        display: inline-block;
    }

    .view-favour-left i{
        font-size: 3rem;
        margin-right: 1.5rem;
    }

    .view-favour-right{
        float: right;
        width: 65%;
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




<%

    //    List<jobPosting> wishList = (List<jobPosting>) session.getAttribute("List");
    Set<jobPosting> wishList = (Set<jobPosting>) request.getAttribute("wishList");
    //QUY ĐỊNH CHỈ ĐƯỢC 5 JOBPOSTINGS
    if (!wishList.isEmpty()) {
        //HANDLE VẤN ĐỀ TRÙNG THÌ DÙNG SET HOẶC IF
%>

<div class="view-favour-left">
    <a href="<c:url value="/job/viewMyJob"/>"><i class="fa-solid fa-paper-plane"></i>My Applications</a>
    <br>
    <a href="<c:url value="/post-detail/view"/>"><i class="fa-solid fa-heart-circle-check"></i>Favourite Jobs</a>
</div>


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
                <td><button class="btn btn-danger detail-toggle">Unsave</button></td>
            </tr>
            <%
                    }%>
        </tbody>
    </table>

    <% } else {
    %>
    <h1 style="color: red">NO RESULT</h1>
    <%
        }
    %> 
</div>





