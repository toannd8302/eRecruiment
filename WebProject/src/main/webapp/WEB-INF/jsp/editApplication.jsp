<%-- 
    Document   : editApplication
    Created on : Feb 16, 2023, 2:52:12 PM
    Author     : toan0
--%>

<%@page import="com.codeweb.pojos.jobApplication"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>EDIT FORM</h1>
       <%
       String id = (String)request.getAttribute("applicationId");
       %>
        <form action="">
            ID: <%= id%>  <br/>

<!--            Name:           <input type="hiden" name="name" value="" /> <br/>-->

            <!--Position:       <input type="text" position="position" value="" /> <br/>-->

            CV:             <input type="text" name="CV" value="" /> <br/>
            
            <input type="hidden" name="applicationId" value="<%= id %>" /> <br/>
                
            <button type="submit"> Update</button>
        </form>
            
    </body>
</html>
