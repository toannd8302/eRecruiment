<%-- 
    Document   : test
    Created on : Feb 16, 2023, 11:30:54 AM
    Author     : toan0
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <%

            List<jobApplication> list = (List<jobApplication>) request.getAttribute("application");
          
        %>
        <table border="1">
          
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Position Apply</th>
                    <th>CV</th>
                    <th>Update</th>

                </tr>
            
             
            <c:forEach var="app" items="${application}">
                 
            
           

               <tr>
                    <td>${app.applicationId}</td>
                    <td>${app.candidate.name}</td>
                    <td>${app.jobPosting.jobPosition.jobName}</td>
                    <td>${app.cv}</td>
                    <td>
                        <a href="<c:url value="/test/edit/${app.applicationId}"/>">Update</a>
                    </td>
                    
                </tr>
            
            </c:forEach>
        </table>


        




    </body>
</html>
