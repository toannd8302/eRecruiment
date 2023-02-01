<%-- 
    Document   : hello
    Created on : Feb 1, 2023, 9:39:27 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <h1>List of User: </h1>
        <c:forEach var="person" items="${content}">
            <li>${person.userID} - ${person.fullName}</li>
        </c:forEach>
    </body>
</html>
