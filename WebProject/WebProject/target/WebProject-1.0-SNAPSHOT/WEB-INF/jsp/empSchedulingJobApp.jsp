<%-- 
    Document   : empSchedulingJobApp
    Created on : Mar 6, 2023, 10:11:11 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<h1>MESSAGE: ${MESSAGE}</h1>
<c:if test="${ScheduleList != null}">
    <c:forEach var="schedule" items="${ScheduleList}">
        ============================================
        Schedule ID: ${schedule.getScheduleId()}
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
        <p>Number of candidates: ${schedule.getjAS().size()}</p>
        <p>Number of interviewers: ${schedule. getiRS().size()}</p>

        <form method="post" action="<c:url value="/schedule-app/choosed-schedule"/>">
            <input type="submit" value="Choose"/>
            <input type="hidden" name="jobAppID" value="${jobAppID}"/>
            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
        </form>
        ============================================
    </c:forEach>
</c:if>

<c:if test="${ScheduleList == null}">
    <h2>No suitable schedule found</h2>
</c:if>

<form method="post" action="<c:url value="/schedule-app/create-new-schedule"/>">
    <input type="submit" value="Create new schedule"/>
    <input type="hidden" name="jobAppID" value="${jobAppID}"/>
    <input type="hidden" name="postID" value="${postID}"/>
    <input type="hidden" name="roundNumber" value="${roundNumber}"/>
</form>
