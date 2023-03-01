<%-- 
    Document   : loginPage
    Created on : Feb 27, 2023, 9:20:54 PM
    Author     : KHOA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LOGIN PAGE</h1>
        <c:if test="${ERROR != null}">
            <p>${ERROR}</p>
        </c:if>
        <sec:authorize access="!isAuthenticated()">
            <h2>Login for Candidate</h2>
            <p><a href="<c:url value="/oauth2/authorization/google-candidate"/>">Login with Google</a></p>
            <h2>Login for Employee</h2>
            <p><a href="<c:url value="/oauth2/authorization/google-employee"/>">Login with Google</a></p>
        </sec:authorize>
    </body>
</html>
