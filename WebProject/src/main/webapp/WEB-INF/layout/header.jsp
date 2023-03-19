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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

        <style>
            @import url("https://fonts.googleapis.com/css2?family=Climate+Crisis&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=Noto+Sans+Lepcha&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&display=swap");
            html {
                font-size: 62.5%;
                font-family: Arial, Helvetica, sans-serif;
            }

            * {
                box-sizing: border-box;
                margin: 0;
            }

            body {
                /* background-color: #FFEFD5; */
            }

            .container-fluid {
                padding: 0%;
                margin: 0%;
            }

            #header {
                background-color: #efefef;
                width: 100%;
                height: 10rem;
                position: relative;
            }

            #logo img {
                width: 18rem;
                height: 10rem;
            }

            #main-info {
                list-style: none;
                font-size: 2rem;
                margin-top: 3rem;
                position: relative;
            }

            #main-info a {
                text-decoration: none;
                color: crimson;
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
                margin-top: 1.5rem;
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
                font-size: 2.5rem;
                list-style: none;
                font-weight: bold;
            }

            #account li a {
                /* color: white; */
            }

            #account ul {
                padding-left: 0%;
            }

            #my-account {
                margin-left: 1.5rem;
                margin-top: 1rem;
            }

            #my-account .dropdown-menu {
                padding: 0%;
            }

            #my-account .dropdown-item {
                background-color: #161718;
                color: white;
            }

            #my-account .dropdown-item:hover {
                background-color: #393a3a;
            }

            /* CSS for login link */
            #login {
                margin-left: 10rem;
                margin-top: 3rem;
                transition: 0.3s ease-in-out;
            }

            #login:hover{
                transform: scale(1.2);
            }
            
            #login a {
                font-size: 2rem;
                text-decoration: none;
                color: rgb(77, 77, 77);
            }

            #for-department {
                margin-top: 3rem;
                display: inline-block;
                text-decoration: none;
                font-size: 2rem;
                color: rgb(228, 36, 75);
                transition: 0.3s ease-in-out;
            }

            #for-department:hover {
                color: rgb(162, 30, 57);
                transform: scale(1.1);
                
            }

            #for-department i {
                margin-right: 1rem;
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

                            <a href="<c:url value="/"/>"><img
                                    src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                                    alt="Monke Tech"></a>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div id="header-info">
                            <ul id="main-info">
                                <div class="row">
                                    <div class="col-sm">
                                        <li><a href="<c:url value="/"/>">Home</a></li>
                                    </div>
                                    <div class="col-sm">
                                        <li><a href="#introduce">About</a></li>
                                    </div>
                                    <div class="col-sm">
                                        <li><a href="#contact">Contact</a></li>
                                    </div>
                                </div>
                            </ul>
                        </div>
                    </div>

                    <sec:authorize access="!isAuthenticated()">
                        <div class="col-sm-2">
                            <div>
                                <a id="for-department" href="<c:url value="/login"/>"><i class="fa-solid fa-circle-chevron-right"></i>For Department</a>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div id="login">
                                <a href="<c:url value="/loginPage"/>">Login</a>
                            </div>
                        </div>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <div class="col-sm-4">
                            <div id="account">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="<c:url value="${sessionScope.user.getPicture()}"/>"/>
                                    </div>
                                    <div class="col-sm-8">
                                        <div id="my-account">
                                            <ul>
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" role="button"
                                                       data-bs-toggle="dropdown" style="color: crimson">My Account</a>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="<c:url value="/account"/>">My Profile</a></li>
                                                        <li><a class="dropdown-item" href="<c:url value="/job/viewMyJob"/>">View My Applications</a></li>
                                                        <li><a class="dropdown-item" href="<c:url value="/logout"/>">Log Out</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </sec:authorize>    
                </div>
            </div>
        </div>
    </body>
</html>



