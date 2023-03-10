<%-- 
    Document   : empScheduleDetails
    Created on : Mar 5, 2023, 9:25:29 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>Schedule details</h2>
<p>Schedule ID: ${schedule.getScheduleId()}</p>
<p>Status: ${schedule.getStatus()}</p>
<p>Job Name: ${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</p>
<p>Round: ${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</p>
<p>
    <c:if test="${schedule.isTypeOfInterview() == true}">
        Type of Interview: Online
    </c:if>
    <c:if test="${schedule.isTypeOfInterview() == false}">
        Type of Interview: Offline
    </c:if>
</p>

<c:if test="${schedule.getStatus() eq 'Pending'}">
    <h5>Number of applications ${schedule.getjAS().size()}</h5>
    <c:forEach var="item" items="${schedule.getjAS()}" varStatus="counter">
        ------
        <p>Count: ${counter.count}</p>
        <p>Application id: ${item.getJobApplication().getApplicationId()}</p>
        <p>candidate: ${item.getJobApplication().getCandidate().getEmail()}</p>
    </c:forEach>
    <h4>Number of interviewers: ${schedule.getiRS().size()}</h4>
    <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
        ------
        <p>Count: ${counter.count}</p>
        <p>Interviewer: ${item.getEmployee().getEmail()}</p>
    </c:forEach>
    <form method="post" action="<c:url value="/start-schedule"/>">
        Date: <input type="date" name="InterviewDate" required="true"/>
        Time: <input type="time" step="1" name="InterviewTime" required="true"/>
        <input type="submit" name="action" value="start"/>
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
    </form>
</c:if>


<c:if test="${schedule.getStatus() eq 'On Going'}">
    <p>Interview date: <fmt:formatDate value="${schedule.getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
    <p>Time: <fmt:formatDate value="${schedule.getScheduleTime()}" pattern="HH:mm:ss"/></p>
    <h5>Number of applications ${schedule.getjAS().size()}</h5>
    <c:forEach var="item" items="${schedule.getjAS()}" varStatus="counter">
        ------
        <p>Count: ${counter.count}</p>
        <p>Application id: ${item.getJobApplication().getApplicationId()}</p>
        <p>candidate: ${item.getJobApplication().getCandidate().getEmail()}</p>
    </c:forEach>
    <h5>Number of interviewers: ${schedule.getiRS().size()}</h5>
    <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
        ------
        <p>Count: ${counter.count}</p>
        <p>Interviewer: ${item.getEmployee().getEmail()}</p>
    </c:forEach>
</c:if>


