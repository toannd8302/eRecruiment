<%-- 
    Document   : loginDepartment
    Created on : Feb 28, 2023, 11:11:27 AM
    Author     : KHOA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>                            
<!--Body here-->
<h1>Login For Department</h1>
<c:if test="${param.error != null}">
    <div>
        There is error when login, please try again!!
    </div>
</c:if>

<form method="post" action="<c:url value="/login"/>">
    <p>
        Email: <input type="email" name="username" required/>
    </p>
    <p>
        Password: <input type="password" name="password" required/>
    </p>
    <p>
        <input type="submit" value="Sign in"/>
    </p>
</form>
