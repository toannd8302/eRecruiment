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
       

           
            <div>
                <label>Descriptions</label>
                <form:textarea id="" path="" />
            </div>
            <div>
                <label>Welfare</label>
                <form:input type="text" id="" path="" />
            </div>
            <div>
                <label>Type_of_work:</label>
                FullTime <form:checkbox id="" path="" value="1"/>
            </div>
            <div>
                <label>Welfare</label>
                <form:input type="text" id="" path="" />
            </div>
            <div>
                <label>Experience_requirement</label>
                <form:input type="number" id="" path="" min="0" /> year
            </div>
            <div>
                <label>Locations</label>
                <form:input type="text" id="" path="" />
            </div>
            <div>
                <label>Salary</label>
                <form:input type="number" id="" path="" min="1" /> $
            </div>
            <div>
                <label>Expired_time</label>
                <form:input type="date" id="" path="" />
            </div>
            <div>
                <label>Approved_status</label>
                <form:input type="text" id="" path="" />
            </div>
            <div>
                <label>Level</label>
                <form:input type="text" id="" path="" />
            </div>
            <div>
                <label>Picture</label>
                <form:input type="text" id="" path="" />
            </div>
            <label for="jobPosition">Job Position:</label>
            
            <form:select id="jobPosition" name="jobPosition" path="jobPosition"> 
                 
                <c:forEach items="${jobPosition}" var="jobPosition">
                    <form:option value="${jobPosition.id}">${jobPosition.name}</form:option>
                </c:forEach>
            </form:select>
        </form:form>

    </body>
</html>
