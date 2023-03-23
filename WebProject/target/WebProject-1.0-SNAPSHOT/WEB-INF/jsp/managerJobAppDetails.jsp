<%-- 
    Document   : managerJobAppDetails
    Created on : Mar 23, 2023, 8:27:34 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<h1>Job Application Detail</h1>
<h2>Introduction</h2><p>${jobAppDetail.getIntroduction()}</p>
<a href="${jobAppDetail.getCv()}"> Link CV</a>

<h2>Post Detail</h2>
<p>Job Name: ${jobAppDetail.getJobPosting().getJobPosition().jobName}</p>
<a href="<c:url value="/manager/post-detail/${jobAppDetail.getJobPosting().getPostId()}"/>">Link Post</a>

<h1>Schedule List</h1>

<c:forEach var="item" varStatus="counter" items="${jobAppDetail.getJobApSche()}">
    ==============================
    <h5>Round Number: ${item.getApplicationSchedule().getRound().roundNumber} - ${item.getApplicationSchedule().getRound().getContent()}</h5>
    <c:forEach var="report" items="${item.getApplicationSchedule().getReports()}">
        <c:if test="${jobAppDetail.getReports().contains(report)}">
            <h5>Report</h5>
            <p>Content ${report.content} ----- Point: ${report.point}</p>
        </c:if>
    </c:forEach>
</c:forEach>

<form method="post" action="<c:url value="/manager/decision"/>">
    <button name="action" value="accept">Accept</button>
    <button name="action" value="reject">Accept</button>
    <input type="hidden" name="jobAppID" value="${jobAppDetail.applicationId}"/>
</form>