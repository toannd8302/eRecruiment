<%-- 
    Document   : viewJobApplication
    Created on : Feb 20, 2023, 10:36:08 AM
    Author     : toan0
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page import="com.codeweb.pojos.candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    candidate candidate = (candidate) session.getAttribute("user");
    Set<jobApplication> listOfJobApplication = (Set<jobApplication>) request.getAttribute("JobApplications");
%>
<h2 style="text-align: center">Welcome <%= candidate.getName()%></h2>
<h2 style="color: red; text-align: center">Here is your JobApplications</h2>
<%
    for (jobApplication o : listOfJobApplication) {
%>
<ul><%= o.getCreatedTime() %></ul>
<ul><%= o.getJobPosting().getJobPosition().getJobName() %></ul>
<%
    }
%>
