<%-- 
    Document   : departmentPage
    Created on : Mar 1, 2023, 11:21:41 AM
    Author     : KHOA
--%>

<%@page import="com.codeweb.pojos.skill"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--TẠI TRANG NÀY SẼ VIEW CÁC JOBPOSTING CỦA PHÒNG ĐANG ĐĂNG NHẬP VÀ TẠO MỚI 1 JOBPOSTING-->
<h1>DEPARTMENT PAGE</h1>

<h2>Department: ${sessionScope.department.departmentName}</h2>

<%
    department department = (department) session.getAttribute("department");

    List<jobPosting> jobPostings = (List<jobPosting>) request.getAttribute("jobPostings");

    String typeOfWork = "";

    if (jobPostings == null) {

        jobPostings = new ArrayList<>();

    }
    if (!jobPostings.isEmpty()) {

        for (jobPosting jobposting : jobPostings) {

            if (jobposting.getJobPosition().getDepartment().getDepartmentId().equals(department.getDepartmentId())) {

                if (jobposting.isTypeOfWork()) {

                    typeOfWork = "Full Time";

                } else {

                    typeOfWork = "Part Time";
                }
%>

<ul style="text-align: center">
    
    <h2>Job Name</h2>
    <p style="font-size: 15px;color: red "><%= jobposting.getJobPosition().getJobName() %></p>
    
    <h2>Job Description</h2>
    <p style="font-size: 15px"><%= jobposting.getDescriptions()%></p>

    <h2>Type Of Work</h2>
    <p style="font-size: 15px"><%= typeOfWork%></p>

    <h2>Experience requirement</h2>
    <p style="font-size: 15px"><%= jobposting.getExprienceRequirement()%> years</p> 

    <h2>Location</h2>
    <p style="font-size: 15px"><%= jobposting.getLocations()%></p>

    <h2>Welfare</h2>
    <p style="font-size: 15px"><%= jobposting.getWelfare()%></p>

    <h2>Salary</h2>
    <p style="font-size: 15px"><%= jobposting.getSalary()%></p>

    <h2>Posting Time</h2>
    <p style="font-size: 15px">
        <fmt:formatDate value="<%= jobposting.getPostingTime()%>" pattern="dd/MM/yyyy"/>
    </p> 

    <h2>Expire Time</h2>
    <p style="font-size: 15px; color: red">
        <fmt:formatDate value="<%= jobposting.getExpiredTime()%>" pattern="dd/MM/yyyy"/>
    </p>

    <h2>Skill Require </h2>
   <%
   for (skill skill : jobposting.getJobPosition().getSkills()) {
           %>
    <p style="font-size: 15px"><%= skill.getSkillName() %></p>       
    <%
       }
   %>   
    
    
    <h2>Status</h2>
    <p style="font-size: 15px"><%= jobposting.isApprovedStatus()%></p>
    <h3>------------------------------------------------------------------------------------------------------------------------------------------------------------------------</h3>
</ul>

<%
        }

    }

} else {

%>

<h2>No Result</h2>        

<%    }

%>

<a href="<c:url value="/createjobposting" />">Create Job Posting</a>
