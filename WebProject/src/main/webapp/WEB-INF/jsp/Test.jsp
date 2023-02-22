<%-- 
    Document   : Test
    Created on : Feb 22, 2023, 8:29:41 AM
    Author     : toan0
--%>

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
            List<jobApplication> job = (List<jobApplication>) request.getAttribute("list");
            jobApplication JOB = job.get(1);
            Set<jobApplicationSchedule> set = (Set<jobApplicationSchedule>) request.getAttribute("SSS");
            for (jobApplicationSchedule s : set) {
        %>

        <%= s.getSchedule().getScheduleTime()%>
        <!--Tra ra 1 chuoi [com.codeweb.pojos.jobApplicationSchedule@cb517be, com.codeweb.pojos.jobApplicationSchedule@2b5f5fa3]-->
        <%
            }
        %>
        <%= JOB.getJobApSche()%>    
        <%

        %>

    </body>
</html>
