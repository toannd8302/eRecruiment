<%-- 
    Document   : intScheduleDetails
    Created on : Mar 18, 2023, 10:20:27 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<p>Schedule ID: ${schedule.getScheduleId()}</p>
<p>Job Name: ${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</p>
<p>
    <c:if test="${schedule.isTypeOfInterview() == true}">
        Type of interview: Offline
    </c:if>
    <c:if test="${schedule.isTypeOfInterview() == false}">
        Type of interview: Online
    </c:if>
    <c:if test="${schedule.isTypeOfInterview() == null}">
        Type of interview: Null
    </c:if>
</p>
<p>Round: ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
<p>Number of candidates: ${schedule.getjAS().size()}</p>
<p>Number of interviewers: ${schedule.getiRS().size()}</p>
<p>Schedule date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
<p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
<c:if test="${status.getStatus() eq 'Pending'}">
    <form method="post" action="<c:url value="/interviewer/schedules/schedule-detail/decision"/>">
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
        <input type="hidden" name="userID" value="${userID}"/>
        <button name="action" value="accept">Accept</button>
        <button name="action" value="reject">Reject</button>
    </form>
</c:if>

<c:if test="${schedule.getStatus() eq 'Finished'}">
    <form method="post" action="<c:url value="/interviewer/schedules/schedule-detail/decision"/>">
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}">
        <input type="hidden" name="userID" value="${userID}"/>
        <button name="action" value="accept">Make report</button>
    </form>
</c:if>