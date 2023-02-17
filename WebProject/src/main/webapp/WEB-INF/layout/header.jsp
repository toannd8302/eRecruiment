<%-- 
    Document   : header
    Created on : Feb 6, 2023, 8:13:03 PM
    Author     : KHOA
--%>
<%-- 
    Document   : header
    Created on : Feb 2, 2023, 8:50:37 PM
    Author     : KHOA
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- CSS Here -->

<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css%22%3E">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">



<!--<link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css%22%3E">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    
<div id="header">
    <nav>
        <div id="logo">
            <a href="#"><img src="img/MonkeTech_Logo_PNG.png" alt="Monke Tech"></a>
        </div>
        
        <div>
            <ul id="main-menu">
                <li><a href="">All Jobs <i class="fa-solid fa-angle-down"></i></a>
                    <div class="sub-menu">
                        <ul>
                            <li><a href="#">Job by Location</a></li>
                            <li><a href="#">Job by Salary</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="">About</a> </li>
                <li><a href="">Contact</a> </li>
            </ul>
        </div>
        <div id="search">
            <input type="text" placeholder=" Search jobs"><button><i
                    class="fa-solid fa-magnifying-glass"></i>Search</button>
        </div>


        <c:if test="${sessionScope.user == null}">
            <div id="account">
                <button><a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/WebProject/LoginController&response_type=code
                           &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login</a></button>
            </div> 
        </c:if>

        <c:if test="${sessionScope.user != null}">
            <c:url value="/LogoutController" var="action"/>
            <div id="login-account">
                <img class="img-fluid" src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>
                <div id="account-menu">
                    <a href="#">My Account <i class="fa-solid fa-angle-down"></i></a>
                    <div class="sub-menu">
                        <li><a href="#">My Profile</a></li>
                        <li><a href="${action}">Logout</a></li>
                    </div>
                </div>
            </div>
        </c:if>

    </nav>
</div>-->


<div class="container">
    <div class="header">
        <div class="logo">
            <a href="#">Monke Company</a>
        </div>
        <nav>
            <ul >
                <li><a href="#"><i class="fa-sharp fa-solid fa-house"></i>Home</a></li>
                <li><a href="#"><i class="fa-sharp fa-solid fa-magnifying-glass"></i>Find a Job</a></li>
                <li><a href="#"><i class="fa-sharp fa-solid fa-address-card"></i>About</a></li>
                <li><a href="#"><i class="fa-sharp fa-solid fa-phone"></i>Contact</a></li>
            </ul>
        </nav>
        <div class="account">
            <div class="login">
                <c:if test="${sessionScope.user == null}">
                    <button><a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/WebProject/LoginController&response_type=code
                               &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login Google</a></button>
                </c:if>
            </div>
            <div class="logout">
                <c:if test="${sessionScope.user != null}">
                    <c:url value="/LogoutController" var="action"/>
                    <form:form method="get" action="${action}">
                        <img class="img-fluid" src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>
                        <input type="submit" value="Logout" />
                    </form:form>
                </c:if>
            </div>
        </div>
    </div>
</div>
