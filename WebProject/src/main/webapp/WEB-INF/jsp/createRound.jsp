<%-- 
    Document   : createRound
    Created on : Mar 9, 2023, 11:38:25 AM
    Author     : toan0
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create round Page</title>
    </head>
    <body>
        <h2>Create rounds</h2>
        <%
        List<jobPosting> jobpostings = ( List<jobPosting>)request.getAttribute("jobPostings");
         
        %>
       <%= jobpostings.get(0).getPostId()%>
        <c:url value="/createround" var="action"/>
        <form:form method="post" action="${action}" modelAttribute="round">
            <div>
                <form:label path="roundNumber">Round Number</form:label>                            
                <form:input type="number" path="roundNumber" min="1" max="2"/>
            </div>
            <div>
                <form:label path="content">Content</form:label>                            
                <form:input type="text" path="content"/>
            </div>
            
<!--            <div>
                <form:label path="roundNumber">Round Number</form:label>                            
                <form:input type="number" path="roundNumber" min="1" max="2"/>
            </div>
            <div>
                <form:label path="content">Content</form:label>                            
                <form:input type="text" path="content"/>
            </div>-->
                <form:input type="hidden" path="jobPoting.postId" value="<%= jobpostings.get(0).getPostId()%>" />
               
            <button>Post</button>
            <input type="reset" value="Reset" />
        </form:form>
            
    </body>
</html>
