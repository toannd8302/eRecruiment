<%-- 
    Document   : homePage
    Created on : Feb 6, 2023, 9:51:54 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<link href="<c:url value="/css/content.css" />" rel="stylesheet"/>


<form action="">
    <div class="banner">
        <div class="body">
            <div id="banner">
                <div class="search-box">
                    <div class="search-form">
                        <input type="text" name="keyword" placeholder="Keyword skill, job name" size="80">
                    </div>
                    <div class="search-button">
                        <button type="submit">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>



<c:forEach var="item" items="${list}">
    <a href="<c:url value="/post-detail/${item.postId}"/>">
        <li>
            <ul>Job Name: ${item.jobPosition.jobName}</ul>

            <ul>Description: ${item.descriptions}</ul>

            <ul><c:if test="${item.typeOfWork == true}">
                    Type Of Work: At Office
                </c:if> 
                <c:if test="${item.typeOfWork == false}">
                    Type Of Work: Hybrid
                </c:if> 
            </ul>

            <ul>Requirement: ${item.exprienceRequirement} Year</ul>

            <ul>Loaction: ${item.locations} Year</ul>

            <ul>Salary: ${item.salary} Year</ul>

            <ul>Welfare: ${item.welfare}</ul>

            Round: 
            <ul>
                <c:forEach var="round" items="${item.getRounds()}">
                    ${round.roundNumber} - ${round.content}
                </c:forEach>
            </ul>

            Skill:
            <ul>
                <c:forEach var="skill" items="${item.jobPosition.getSkills()}">
                    ${skill.skillName}
                </c:forEach>
            </ul>
        </li>
    </a>
</c:forEach>









<%--
<c:forEach var="round" items="${item.getRounds().stream().collect(Collectors.toList())}">
            ${round.roundNumber}
        </c:forEach>
--%>     

<%--
    <fmt:formatDate pattern="yyyy-MM-dd" value="${(nowDate.time - item.getPostingTime().time) / (1000*60*60*24)}" var="dateDifference"/>
        ${dateDifference}
--%>

<%--<c:if test="${user == null}">
    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/WebProject/LoginController&response_type=code
       &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login Google</a>
</c:if>
<c:if test="${user != null}">
    <c:url value="/LogoutController" var="action"/>
    <img class="img-fluid" src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>
    <form:form method="get" action="${action}">
        <input type="submit" value="Logout" class="btn btn-danger"/>
    </form:form>
</c:if>--%>

