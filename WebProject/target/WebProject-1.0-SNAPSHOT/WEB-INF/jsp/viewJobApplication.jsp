<%-- 
    Document   : viewJobApplication
    Created on : Feb 20, 2023, 10:36:08 AM
    Author     : toan0
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="com.codeweb.pojos.jobApplication"%>
<%@page import="com.codeweb.pojos.candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewJobApplication Page</title>
    </head>
    <body>
        <%
            candidate candidate = (candidate) request.getAttribute("User");
            Set<jobApplication> listOfJobApplication = candidate.getJobApplications();
        %>
        <h2 style="text-align: center">Welcome <%= candidate.getName() %></h2>
        <h2 style="color: red; text-align: center">Here is your JobApplications</h2>

        <table border="1" style="text-align: center; margin-left: auto; margin-right: auto">
            <thead>
                <tr style="color: orange; align-content: center; background-color: greenyellow ">
                    <th>ID</th>
                    <th>Create-time</th>
                    <th>CV</th>
                    <th>RoundNumber</th>
                    <th>Introduction</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (jobApplication o : listOfJobApplication) {
                %>
                <tr>
                    <td><%= o.getApplicationId() %></td>
                    <td><%= o.getCreatedTime() %></td>
                    <td><%= o.getCv() %></td>
                    <td><%= o.getRoundNumber() %></td>
                    <td><%= o.getIntroduction() %></td>
                    <td>
                        <input type="submit" value="Delete" style="background-color: red; color: #ffc107"  />
                        <input type="submit" value="Update" style="background-color: blue; color: #fd7e14" />
                    </td>
                    
                </tr>  
                <%
                    }
                %>



            </tbody>
        </table>









    </body>
</html>
