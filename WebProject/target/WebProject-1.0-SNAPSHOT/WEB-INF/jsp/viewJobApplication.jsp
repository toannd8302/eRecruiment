<%-- 
    Document   : viewJobApplication
    Created on : Feb 20, 2023, 10:36:08 AM
    Author     : toan0
--%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="com.codeweb.pojos.round"%>
<%@page import="java.util.Set"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.codeweb.pojos.jobApplicationSchedule"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page import="com.codeweb.pojos.candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    h1{
        text-align: center;
        color: red;
    }
    h2{
        text-align: center;

    }
</style>

<%
    //hien tai chua co trong database
    candidate candidate = (candidate) session.getAttribute("user");
    List<jobPosting> wishList = (List<jobPosting>)request.getAttribute("wishList");
%>
<h1 >Welcome <%= candidate.getName()%></h2>

<h3>
    View your WishList now: <a href="<c:url value="/post-detail/view"/>">WishList</a>
</h3>
<h2><c:forEach var="jobApplication" items="${JobApplications}">
        <!--Cho 1 link dan sang post-detail page-->
        <a href="<c:url value="/post-detail/${jobApplication.jobPosting.getPostId()}"/>"/><h2>Job Name: ${jobApplication.jobPosting.jobPosition.jobName}</h2></a>
        <h2>Apply Date: <fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></h2>
        <c:forEach var="round" items="${jobApplication.jobPosting.getRounds()}">
            <h2>
                Round ${round.getRoundNumber()}: ${round.getContent()}
            </c:forEach>
        </h2>
        <!--In lịch ngay đây, thêm pojo schedule, 1 job application có nhiều schedule-->
        <h2><c:forEach var="schedule" items="${jobApplication.getJobApSche()}">
                Schedule date: <fmt:formatDate value="${schedule.schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/>
                <h2>Status: ${schedule.schedule.getStatus()} </h2>
                <h2>------------------------------------------------------------------------------------------------------------------------------------------------------------------------</h2>
            </c:forEach></h2> 

    </c:forEach></h2>


    

