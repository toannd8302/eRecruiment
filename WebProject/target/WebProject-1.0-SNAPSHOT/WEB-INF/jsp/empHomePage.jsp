<%-- 
    Document   : employeeHomePage
    Created on : Mar 3, 2023, 9:47:59 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<h1>Hello Employee</h1>

<p><a href="<c:url value="/jobPostings"/>">view all job posting</a></p>
<p><a href="<c:url value="/jobApps"/>">view all job application</a></p>
<p><a href="<c:url value="/schedules"/>">view all schedule</a></p>
