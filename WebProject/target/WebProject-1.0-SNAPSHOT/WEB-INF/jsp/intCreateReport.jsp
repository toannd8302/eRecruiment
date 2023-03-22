<%-- 
    Document   : intReportDetails
    Created on : Mar 18, 2023, 10:25:56 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<h1>Create Report</h1>
<c:url value="/interviewer/report/update" var="action"/>
<form:form method="post" action="${action}" modelAttribute="report">
    Content:
    <form:textarea path="content" rows="2" cols="50" value="${report.getContent()}"/>

    Point:
    <form:input type="number" path="point" value="${report.getPoint()}"/>
    
    <%--<form:hidden path="createdTime" value="${report.getCreatedTime()}"/>--%>
    
    <form:hidden path="employee.id" value="${report.getEmployee().id}"/>
    <form:hidden path="jobApplication.applicationId" value="${report.getJobApplication().applicationId}"/>
    <form:hidden path="schedule.scheduleId" value="${report.getSchedule().scheduleId}"/>

    <c:if test="${report.getReportId() == null}">
        <button name="action" value="create">Create report</button>
    </c:if>
        
    <c:if test="${report.getReportId() != null}">
        <form:hidden path="reportId" value="${report.getReportId()}"/>
        <input type="hidden" name="date" value="${report.getCreatedTime()}"/>
        <button name="action" value="update">Update report</button>
        <a href="#">Back</a>
    </c:if>
</form:form>
