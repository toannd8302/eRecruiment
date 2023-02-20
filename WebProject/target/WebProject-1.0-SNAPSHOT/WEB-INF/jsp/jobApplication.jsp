<%-- 
    Document   : jobApplication
    Created on : Feb 16, 2023, 10:24:55 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/job/application" var="action"/>
<form:form method="post" action="${action}" modelAttribute="application" enctype="multipart/form-data">
    <div>
        <label>Introduction</label>
        <form:input type="text" id="introduction" path="introduction"/>
    </div>
    
    <div>
        <label>File CV</label>
        <form:input type="file" id="file" path="file"/>
    </div>
   
    <div>
        <input type="submit" value="Submit"/>
    </div>
        <input type="hidden" name="postID" value="${postID}">
</form:form>