<%-- 
    Document   : managerJobAppDetail
    Created on : Mar 22, 2023, 9:18:58 PM
    Author     : toan0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page import="com.codeweb.pojos.employee"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<h1>Job Application Detail</h1>
<a href="${jobAppDetail.getCv()}"><i
        class="fa-solid fa-file"></i> Link CV</a>
<a href="<c:url value="/jobPostings/job-posting-details?postID=${jobAppDetail.getJobPosting().getPostId()}"/>">Link Post</a>

<h1>Schedule List</h1>

<c:forEach var="item" varStatus="counter" items="${jobAppDetail.getJobApSche()}">

    <p>Round Number: ${item.getApplicationSchedule().getRound().roundNumber}</p>
    <p>Report</p>
    <c:forEach var="report" items="${item.getApplicationSchedule().getReports()}">
        <c:if test="${jobAppDetail.getReports().contains(report)}">
            <p>${report.content}</p>
        </c:if>
    </c:forEach>
</c:forEach>