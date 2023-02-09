<%-- 
    Document   : homePage
    Created on : Feb 6, 2023, 9:51:54 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/body.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<form action="">
    <div class="banner">
        <div class="body">
            <div id="banner">
                <div class="search-box">
                    <div class="search-form">
                        <input class="fa-solid fa-magnifying-glass" type="text" name="keyword" placeholder="Keyword skill, job name" size="80">
                    </div>
                    <div class="search-button">
                        <button class="fa-solid fa-magnifying-glass" type="submit">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<div id="hot-job">
    <h1><i class="fa-brands fa-hotjar"></i>Hot Jobs</h1>
</div>

<div id="job-list">
    <ul>
        <c:forEach var="item" items="${list}">
            <li>
                <div id="job-list-head">
                    <div id="job-pic">
                        <img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/front-end-developer-4830933-4041850.png" alt="Front-end">
                    </div>
                    <div class="job-title">
                        <a href="<c:url value="/post-detail/${item.postId}"/>">
                            <h1>${item.jobPosition.jobName}</h1>
                        </a>
                        <h1>Công ty phần mềm Monke Tech</h1>
                    </div>
                </div>
                <div id="job-list-body">
                    <ul>

                        <c:forEach var="skill" items="${item.jobPosition.getSkills()}">
                            <li>
                                ${skill.skillName}
                            </c:forEach>
                        </li>
                    </ul>
                </div>
                <div id="job-list-foot">
                    <ul>
                        <li><i class="fa-solid fa-dollar-sign"></i>${item.salary}</li>
                        <li><i class="fa-solid fa-location-dot"></i>${item.locations}</li>
                        <li><i class="fa-solid fa-clock"></i>Time</li>
                        <li><c:if test="${item.typeOfWork == true}">
                                Type Of Work: At Office
                            </c:if> 
                            <c:if test="${item.typeOfWork == false}">
                                Type Of Work: Hybrid
                            </c:if> 
                        </li>
                    </ul>
                </div>
            </c:forEach>
        </li>


        <!--        <li>
                    <div id="job-list-head">
                        <div id="job-pic">
                            <img src="img/Front-End-Developer1.jpg" alt="Front-end">
                        </div>
                        <div class="job-title">
                            <a href="#">
                                <h1>Front-end Developer</h4>
                            </a>
                            <h1>Công ty phần mềm Monke Tech</h4>
                        </div>
        
                    </div>
                    <div id="job-list-body">
                        <ul>
                            <li>Java</li>
                            <li>HTML</li>
                            <li>React JS</li>
                        </ul>
                    </div>
                    <div id="job-list-foot">
                        <ul>
                            <li><i class="fa-solid fa-dollar-sign"></i>1000-2000</li>
                            <li><i class="fa-solid fa-location-dot"></i>Ho Chi Minh</li>
                            <li><i class="fa-solid fa-clock"></i>Time</li>
                        </ul>
                    </div>
                </li>-->
    </ul>
</div>





<%--<c:forEach var="item" items="${list}">

    <li>
        <a href="<c:url value="/post-detail/${item.postId}"/>">
            <ul>Job Name: ${item.jobPosition.jobName}</ul>
        </a>

        <ul>Description: ${item.descriptions}</ul>

        <ul><c:if test="${item.typeOfWork == true}">
                Type Of Work: At Office
            </c:if> 
            <c:if test="${item.typeOfWork == false}">
                Type Of Work: Hybrid
            </c:if> 
        </ul>

        <ul>Requirement: ${item.exprienceRequirement} Year</ul>

        <ul>Loaction: ${item.locations}</ul>

        <ul>Salary: ${item.salary}</ul>

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
</c:forEach>--%>









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

