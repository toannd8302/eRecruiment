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

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Font here -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kaushan+Script&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aladin&amp;display=swap">

        <!-- Bootstrap here -->
        <!--        <link rel="stylesheet" type="text/css"
                      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
                <link rel="stylesheet" type="text/css"
                      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css%22%3E">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>-->


        <style>
            html {
                font-size: 62.5%;
                font-family: Arial, Helvetica, sans-serif;
            }

            * {
                box-sizing: border-box;
                margin: 0;
            }


            .container-fluid {
                padding: 0%;
                margin: 0%;
            }

            #header {
                background-color: #161718;
                width: 100%;
                height: 10rem;
                position: relative;
            }

            #logo img {
                width: 15rem;
                height: 12rem;
            }

            #main-info {
                list-style: none;
                font-size: 2rem;
                margin-top: 4rem;
                position: relative;
            }

            #main-info a {
                text-decoration: none;
                color: white;
            }

            #main-info .dropdown-menu {
                padding: 0%;
            }

            #main-info .dropdown-item {
                color: white;
                background-color: #161718;
            }

            #main-info .dropdown-item:hover {
                background-color: #393a3a;
            }

            #account {
                margin-left: 10rem;
                margin-top: 2.5rem;
                position: relative;
                height: 6.5rem;
            }

            #account img {
                width: 6.5rem;
                height: 6.5rem;
                border-radius: 50%;
                margin-right: 3rem;
            }

            #account h2,
            li {
                font-size: 2rem;
                list-style: none;
            }

            #account li a {
                color: white;
            }

            #account ul {
                padding-left: 0%;
            }

            #my-account {
                margin-left: 1.5rem;
                margin-top: 1.5rem;
            }

            #my-account .dropdown-menu {
                padding: 0%;
            }

            #my-account .dropdown-item {
                background-color: #161718;
            }

            #my-account .dropdown-item:hover {
                background-color: #393a3a;
            }


            /* CSS for login link */
            #login{
                margin-left: 10rem;
                margin-top: 4rem;

            }

            #login a{
                font-size: 2rem;
                text-decoration: none;
                color: rgb(125, 123, 123);
            }
        </style>
    </head>
    <body>

        <!-- Header here -->
        <div class="container-fluid mt-3" style="margin-top: 0% !important; padding-left: 0%; padding-right: 0%;">
            <div id="header">
                <div class="row" style="margin: 0%;">
                    <div class="col-sm-3">
                        <div id="logo">
                            <a href="#"><img
                                    src="https://github.com/Toannd832/eRecruiment/blob/Thang/Job-posting-content/img/MonkeTech_Logo_PNG.png?raw=true"
                                    alt="Monke Tech"></a>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div id="header-info">
                            <ul id="main-info">
                                <div class="row">
                                    <div class="col-sm">
                                        <li><a href="#">Home</a></li>
                                    </div>
                                    <div class="col-sm">
                                        <li><a href="#">About</a></li>
                                    </div>
                                    <div class="col-sm">
                                        <li><a href="#">Contact</a></li>
                                    </div>

                                    <div class="col-sm">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" role="button"
                                               data-bs-toggle="dropdown">Jobs by title</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Jobs By Skill</a></li>
                                                <li><a class="dropdown-item" href="#">Jobs By Salary</a></li>
                                                <li><a class="dropdown-item" href="#">Job By Location</a></li>
                                            </ul>
                                        </li>
                                    </div>
                                </div>
                            </ul>
                        </div>
                    </div>
                    <c:if test="${sessionScope.user == null}">
                        <div class="col-sm-4">
                            <div id="login">
                                <a id="login-btn" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/WebProject/LoginController&response_type=code
                                   &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login</a>
                            </div> 
                        </div>

                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <c:url value="/LogoutController" var="action"/>
                        <div class="col-sm-4">
                            <div id="account">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="<c:url value="${user.getPicture()}"/>"/>
                                    </div>
                                    <div class="col-sm-8">
                                        <div id="my-account">
                                            <ul>
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" role="button"
                                                       data-bs-toggle="dropdown">My Account</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">My Profile</a></li>
                                                        <li><a class="dropdown-item" href="<c:url value="/job/viewMyJob"/>">View My Applications</a></li>
                                                        <li><a class="dropdown-item" href="<c:url value="/LogoutController"/>">Log Out</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>




