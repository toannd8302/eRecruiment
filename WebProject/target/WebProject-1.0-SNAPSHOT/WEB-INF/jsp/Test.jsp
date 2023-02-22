<%-- 
    Document   : Test
    Created on : Feb 22, 2023, 8:29:41 AM
    Author     : toan0
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.codeweb.pojos.candidate"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page import="java.util.Set"%>
<%@page import="com.codeweb.pojos.jobApplicationSchedule"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        Set<jobApplicationSchedule> SAS = (Set<jobApplicationSchedule>)request.getAttribute("SSS");
        for (jobApplicationSchedule j : SAS) {
                %>
        <%= j.getSchedule().getScheduleDate()%>
        <%
            }
        %>


<c:forEach var="jobApplication" items="${list}">
    <!--Cho 1 link dan sang post-detail page-->
    <h1>Job Name: ${jobApplication.jobPosting.jobPosition.jobName}</h1>
    <h1>Apply Date: <fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/></h1>
    <!--In lịch ngay đây, thêm pojo schedule, 1 job application có nhiều schedule-->
    <c:forEach var="s" items="SSS">
        <h1>Apply Date: <fmt:formatDate value="${s.jobApplication.applicationId}" pattern="dd/MM/yyyy"/></h1>
        
    </c:forEach>
</c:forEach>
        
</body>
</html>
