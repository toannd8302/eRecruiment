<%-- 
    Document   : resultPage
    Created on : Mar 13, 2023, 11:27:25 AM
    Author     : loqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
       
    <div id="banner">

        <div id="search-box">
            <h1>Welcome to our company</h1>

            <form action="<c:url value="/${keyword}"/>">
                <input type="text" name="keyword" value="${param.keyword}" placeholder="I'm looking for..." width="10rem" height="20rem">
                
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <h1>Find your dream job</h1>
        </div>
    </div>
   
     
                
    </body>
</html>
