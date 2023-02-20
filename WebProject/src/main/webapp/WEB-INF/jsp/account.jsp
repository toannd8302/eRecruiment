<%-- 
    Document   : account
    Created on : Feb 18, 2023, 8:37:15 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<img src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>

<p>${user.email}</p>

<p><fmt:formatDate value="${user.getDob()}" pattern="dd/MM/yyyy"/></p>

<p>${user.phone}</p>

<p>${user.address}</p>

<h2>Introduction</h2>

<p>Job: ${user.jobName}</p>

<p>Experience year: ${user.experience}</p>

<h2>Skill:</h2>
<c:forEach var="skill" items="${user.getSkills()}">
    <li>
        ${skill.skillName}
    </li>
</c:forEach>