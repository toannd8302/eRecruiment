<%-- 
    Document   : homePage
    Created on : Feb 6, 2023, 9:51:54 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>
<h1>Hello HomePage</h1>


<c:if test="${user == null}">
    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/WebProject/LoginController&response_type=code
       &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login Google</a>
</c:if>
<c:if test="${user != null}">
    <c:url value="/LogoutController" var="action"/>
    <img class="img-fluid" src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>
    <form:form method="get" action="${action}">
        <input type="submit" value="Logout" class="btn btn-danger"/>
    </form:form>
</c:if>
