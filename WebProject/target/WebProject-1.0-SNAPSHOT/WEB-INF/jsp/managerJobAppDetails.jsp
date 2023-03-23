<%-- 
    Document   : managerJobAppDetails
    Created on : Mar 23, 2023, 8:27:34 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<h1>Job Application Detail</h1>
<a href="${jobAppDetail.getCv()}"><i
        class="fa-solid fa-file"></i> Link CV</a>
<a href="<c:url value="/jobPostings/job-posting-details?postID=${jobAppDetail.getJobPosting().getPostId()}"/>">Link Post</a>

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
