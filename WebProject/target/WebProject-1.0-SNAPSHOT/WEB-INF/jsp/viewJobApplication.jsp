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
            candidate user = (candidate) session.getAttribute("User");
            Set<jobApplication> listOfJobApplication = (Set<jobApplication>) session.getAttribute("LOAP");
          
        %>
        <h2>Welcome <%= user%>!</h2>
        <h2>Here is your JobApplication: </h2>    
        



        <%
            if (listOfJobApplication == null) {
                listOfJobApplication = new TreeSet<>();
            }
            if (!listOfJobApplication.isEmpty()) {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <% for (jobApplication job : listOfJobApplication) {
            %>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        <%
            }
        } else {
        %>
        <h2 style="color: red">No result</h2>
        <%
            }

        %>



    </body>
</html>
