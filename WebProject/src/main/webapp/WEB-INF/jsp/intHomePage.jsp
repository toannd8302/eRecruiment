<%-- 
    Document   : intHomePage
    Created on : Mar 13, 2023, 10:33:58 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<h1>Hello Interviewer</h1>

<p><a href="<c:url value="/interview/reports"/>">view all reports</a></p>
<p><a href="<c:url value="/interview/schedules"/>">view all schedules</a></p>

