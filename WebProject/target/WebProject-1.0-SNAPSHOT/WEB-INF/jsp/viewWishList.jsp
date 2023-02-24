<%-- 
    Document   : viewWishList
    Created on : Feb 24, 2023, 8:28:25 AM
    Author     : toan0
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Set"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
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

            //    List<jobPosting> wishList = (List<jobPosting>) session.getAttribute("List");
            Set<jobPosting> wishList = (Set<jobPosting>) request.getAttribute("wishList");
            //QUY ĐỊNH CHỈ ĐƯỢC 5 JOBPOSTINGS
            if (!wishList.isEmpty()) {
            //HANDLE VẤN ĐỀ TRÙNG THÌ DÙNG SET HOẶC IF
        %>
        <h2>Here is your WishList</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>JobName</th>
                    <th>Welfare</th>
                    <th>Department</th>
                    <th>Locations</th>
                    <th>Salary</th>
                    <th>Delete</th>

                </tr>
            </thead>
            <tbody>
                <%
                    for (jobPosting j : wishList) {
                %>
                <tr>
                    <td><%= j.getJobPosition().getJobName()%></td>
                    <td><%= j.getWelfare()%></td>
                    <td><%= j.getJobPosition().getDepartment().getDepartmentName()%></td>
                    <td><%= j.getLocations()%></td>
                    <td><%= j.getSalary()%></td>
                    <td><a href="<c:url value="/post-detail/delete"/>">Delete </a> </td>
                    
                </tr>

                <%
                    }
                %>

            </tbody>
        </table>    
        <%
            } else {
%>
<h1 style="color: red">NO RESULT</h1>
        <%
            }
        %>
    </body>
</html>
