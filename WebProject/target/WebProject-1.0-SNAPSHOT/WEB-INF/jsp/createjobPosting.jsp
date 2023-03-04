<%-- 
    Document   : createjobPosting
    Created on : Mar 4, 2023, 6:12:20 PM
    Author     : toan0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Job Posting Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Create Job Posting</h1>
        <c:url value="/createjobposting" var="action" />
        <form:form method="post" modelAttribute="jobPosting" action="${action}" >      


            <div>
                <form:label path="level">Level</form:label>
                <form:input type="text" path="level" />
            </div>


            <div>
                <form:label path="jobPosition">Job Title</form:label>
                <form:select  path="jobPosition" required="true">
                    <form:option value="">-- Select Job Title --</form:option>
                    <form:options items="${joPositions}" itemValue="jobId" itemLabel="JobName"></form:options>
                </form:select>

            </div>



            <button type="submit">Create</button>
            <input type="reset" value="Reset" />
        </form:form>
    </body>
</html>
