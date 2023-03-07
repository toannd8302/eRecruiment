<%-- 
    Document   : formJobPosting
    Created on : Mar 5, 2023, 10:31:31 AM
    Author     : toan0
--%>


<%@page import="com.codeweb.pojos.department"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="com.codeweb.pojos.jobPosition"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1 style="text-align: center">Create Job Posting</h1>

        <%
            String msg = (String) session.getAttribute("ERROR");
            if (msg != null) {
        %>
        <h2><%= msg%></h2>
        <%
            }
        %>

        <c:url value="/createjobposting" var="action" />
        <form:form method="post" modelAttribute="jobPosting" action="${action}" >      


            <div>
                <form:label path="descriptions">Descriptions</form:label>
                <form:textarea  path="descriptions" required="true" />
            </div>

            <div>
                <form:label path="typeOfWork">Full Time</form:label>
                <form:checkbox  path="typeOfWork" checked="true" value="1"/>
            </div>

            <div>
                <form:label path="exprienceRequirement">Exprience Requirement</form:label>
                <form:input type="number" path="exprienceRequirement" min="0"/> (year/years)
            </div>
            <div>
                <form:label path="locations">Locations</form:label>
                <form:input type="text" path="locations" required="true" />
            </div>
            <div>
                <form:label path="welfare">Welfare</form:label>
                <form:input type="text" path="welfare" required="true"/>
            </div>
            <div>
                <form:label path="salary">Salary</form:label>
                <form:input type="number" path="salary" min="0" required="true"/> $
            </div>
            <div>
                <form:label path="ExpiredTime">Expired Time</form:label>
                <form:input type="date" path="ExpiredTime" required="true"/>

            </div>

            <div>
                <form:label path="level">Level</form:label>
                <form:input type="text" path="level" required="true" />
            </div>

            <div>    
                
                <form:select  path="jobPosition.jobId" required="true">
                    <form:option value="">-- Select Job Title --</form:option>
                    <form:options items="${joPositions}" itemValue="jobId" itemLabel="JobName"></form:options>
                </form:select>

            </div>

             

            <button type="submit">Create</button>
            <input type="reset" value="Reset" />
        </form:form>
    </body>

</html>
