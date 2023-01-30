<%-- 
    Document   : index
    Created on : Jan 29, 2023, 10:06:22 AM
    Author     : KHOA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ksadhasdhsalkdahskdj</h1>
        
        <c:forEach var="person" items="${content}">
            <li>${person.userID} - ${person.fullName}</li>
        </c:forEach>
    </body>
</html>
