<%-- 
    Document   : intRejectSchedule
    Created on : Mar 19, 2023, 10:41:59 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Reject Schedule</h2>
<c:url value="/interviewer/schedules/schedule-detail/reject" var="action" />
<form:form method="post" modelAttribute="IRS" action="${action}" enctype="multipart/form-data">
    <form:hidden path="scheduleId" value="${IRS.getScheduleId()}"/>
    <form:hidden path="employeeId" value="${IRS.getEmployeeId()}"/>
    <p>Reason</p>
    <form:textarea path="reasonContent" rows="2" cols="50"/>
    <p>File</p>
    <form:input type="file" path="file"/>
    <button name="action" value="reject">Submit</button>
</form:form>