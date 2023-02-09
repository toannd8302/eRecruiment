<%-- 
    Document   : postDetail
    Created on : Feb 9, 2023, 4:15:49 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<h1>Post Detail</h1>

Job Name: ${post.jobPosition.jobName}

Loaction: ${post.locations}

Description: ${post.descriptions}

Requirement: ${post.exprienceRequirement} Year

Salary: ${post.salary}

Welfare: ${post.welfare}

Round: 
<ul>
    <c:forEach var="round" items="${post.getRounds()}">
        ${round.roundNumber} - ${round.content}
    </c:forEach>
</ul>

Skill:
<ul>
    <c:forEach var="skill" items="${post.jobPosition.getSkills()}">
        ${skill.skillName}
    </c:forEach>
</ul>
