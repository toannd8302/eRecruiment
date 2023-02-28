<%-- 
    Document   : department-home
    Created on : Feb 25, 2023, 2:55:45 PM
    Author     : toan0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Home Page</title>
    </head>
    <body>
        <!--    Informations: id(autmated generation), Descriptions, Type_of_work, Experience_requirement
            Locations, Welfare,Salary, Posting_time, Expired_time, Approved_status, Level, Picture, Job_id(Job_Name)
            Create a PAGE to view FORM INPUT EVERYTHING ABOVE -->
        <h1>Hello World!</h1>
        <!--        BẢN CHẤT CŨNG LÀ 1 USER TẠO 1 JOBPOSTING-->
        <c:url value="/department-homepage" var="action" />
        <form:form method="post" modelAttribute="jobposting" action="${action}" >
            Descriptions <input type="text" name="Descriptions" value="" /> <br/>
            Welfare <input type="text" name="Welfare" value="" /><br/>
            Type_of_work <input type="text" name="TypeOfWork" value="" /><br/>
            Experience_requirement <input type="text" name="experienceRequirement" value="" /><br/>
            Locations <input type="text" name="locations" value="" /><br/>
            Departmentname <input type="text" name="Departmentname" value="" /><br/>
            Level <input type="text" name="Level" value="" /><br/>

            SkillName <input type="text" name="SkillName" value="" /><br/>
            Expire_Day <input type="text" name="Expire_Day" value="" /><br/>

            Job Title: <input type="text" name="JobName" value="" /><br/>
            <input type="submit" value="Submit" />
            <input type="reset" value="Reset" />
            <input type="hidden" name="JobId" value="${JobId}" />
        </form:form>

    </body>
</html>
