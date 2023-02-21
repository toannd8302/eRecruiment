<%-- 
    Document   : viewJobApplication
    Created on : Feb 20, 2023, 10:36:08 AM
    Author     : toan0
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>





<c:forEach var="jobApplication" items="${JobApplications}">
    Job Name: ${jobApplication.jobPosting.jobPosition.jobName}
    Apply Date: <fmt:formatDate value="${jobApplication.getCreatedTime()}" pattern="dd/MM/yyyy"/>
    <%--In lịch ngay đây, thêm pojo schedule, 1 job application có nhiều schedule--%>
    <c:forEach var="schedule" items="${jobApplication.getSchedule()}">
        Schedule date: ${schedule.getScheduleDate()}
    </c:forEach>
</c:forEach>
















<!--<html>
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
</html>-->
