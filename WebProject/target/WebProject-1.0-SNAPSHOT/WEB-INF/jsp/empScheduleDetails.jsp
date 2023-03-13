<%-- 
    Document   : empScheduleDetails
    Created on : Mar 5, 2023, 9:25:29 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

    <h4>Number of applications ${schedule.getjAS().size()}</h4>
    <c:forEach var="item" items="${schedule.getjAS()}" varStatus="counter">
        <p>Count: ${counter.count}</p>
        <p>Application id: ${item.getJobApplication().getApplicationId()}</p>
        <p>candidate: ${item.getJobApplication().getCandidate().getEmail()}</p>
        =========================
    </c:forEach>
    <h4>Number of interviewers: ${schedule.getiRS().size()}</h4>
    <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
        <p>Count: ${counter.count}</p>
        <p>Interviewer: ${item.getEmployee().getEmail()}</p>
        =========================
    </c:forEach>

    <form method="post" action="<c:url value="/schedules/schedule-details/start-schedule"/>">
        <h3>Choose interviewers</h3>
        <select id="interviewers" name="interviewers" multiple>
            <c:forEach var="item" items="${listInterviewers}">
                <c:if test="${fn:contains(stringMatch, item.getId()) == false}">
                    <option value="${item.getId()}">
                        ${item.getId()} - ${item.getEmail()} - ${item.getName()}
                    </option>
                </c:if>
            </c:forEach>
        </select>

        <h3>Schedule time</h3>
        Date: <input type="date" name="InterviewDate" required="true"/>
        Time: <input type="time" min="08:00" max="17:00" name="InterviewTime"  required="true"/>
        <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
        <input type="submit" name="action" value="start"/>
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