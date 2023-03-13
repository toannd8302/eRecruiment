<%-- 
    Document   : intAllSchedules
    Created on : Mar 13, 2023, 4:08:09 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<h1>Schedules list</h1>

<h3>Pending</h3>
<c:forEach var="schedule" items="${PENDING}">
    ==================================================================
    <p>Schedule ID: ${schedule[0].getScheduleId()}</p>
    <p>Job Name: ${schedule[0].getRound().getJobPoting().getJobPosition().getJobName()}</p>
    <p>Round: ${schedule[0].getRound().getRoundNumber()} - ${schedule[0].getRound().getContent()}</p>
    <p>Number of candidates: ${schedule[1]}</p>
    <p>Number of interviewers: ${schedule[2]}</p>
    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
        <input type="hidden" name="scheduleID" value="${schedule[0].getScheduleId()}">
        <input type="submit" value="View Deatils"/>
    </form>
</c:forEach>

<h3>On Going</h3>
<c:forEach var="schedule" items="${ON_GOING}">
    ==================================================================
    <p>Schedule ID: ${schedule[0].getScheduleId()}</p>
    <p>Job Name: ${schedule[0].getRound().getJobPoting().getJobPosition().getJobName()}</p>
    <p>Round: ${schedule[0].getRound().getRoundNumber()} - ${schedule[0].getRound().getContent()}</p>
    <p>Number of candidates: ${schedule[1]}</p>
    <p>Number of interviewers: ${schedule[2]}</p>
    <p>Schedule date: <fmt:formatDate value="${schedule[0].getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule[0].getScheduleTime()}" pattern="HH:mm:ss"/></p>
    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
        <input type="hidden" name="scheduleID" value="${schedule[0].getScheduleId()}">
        <input type="submit" value="View Deatils"/>
    </form>
</c:forEach>

<h3>Finished</h3>
<c:forEach var="schedule" items="${FINISHED}">
    ==================================================================
    <p>Schedule ID: ${schedule[0].getScheduleId()}</p>
    <p>Job Name: ${schedule[0].getRound().getJobPoting().getJobPosition().getJobName()}</p>
    <p>Round: ${schedule[0].getRound().getRoundNumber()} - ${schedule[0].getRound().getContent()}</p>
    <p>Number of candidates: ${schedule[1]}</p>
    <p>Number of interviewers: ${schedule[2]}</p>
    <p>Schedule date: <fmt:formatDate value="${schedule[0].getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule[0].getScheduleTime()}" pattern="HH:mm:ss"/></p>
    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
        <input type="hidden" name="scheduleID" value="${schedule[0].getScheduleId()}">
        <input type="submit" value="View Deatils"/>
    </form>
</c:forEach>