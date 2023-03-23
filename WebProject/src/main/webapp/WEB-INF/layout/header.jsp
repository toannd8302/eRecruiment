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

        <script type="text/javascript">
            window.addEventListener("scroll", function () {
        var navbar = document.querySelector(".navbar");
        navbar.classList.toggle("sticky", window.scrollY > 0);
      });
        </script>
        
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&family=Poppins:wght@400;500;600;800&display=swap");
            html {
                font-size: 62.5%;
                font-family: "Poppins", sans-serif;
            }

            * {
                box-sizing: border-box;
                margin: 0;
            }

            body {
                width: 100%;
                min-height: 200vh;
                /*background: #000;*/
            }

            .navbar {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                display: flex;
                justify-content: space-between;
                align-items: center;
                transition: 0.5s;
                padding: 3rem 5rem;
                z-index: 10000;
                height: 10rem;
            }

            .navbar.sticky {
                padding: 3rem 3rem;
                background: #fff;
                border-bottom: 3px solid silver;
            }

            .navbar #logo a {
                position: relative;
                text-decoration: none;
                font-size: 3rem;
                font-weight: bold;
                color: #fff;
            }

            .navbar #logo img {
                margin-top: -1rem;
                width: 12rem;
                height: 6rem;
            }

            .navbar > .header-info > ul {
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: -1rem;
                width: 80rem;
            }

            .navbar .header-info ul li {
                position: relative;
                list-style: none;
                margin: 0 1rem;
            }
            .navbar .header-info ul li a {
                position: relative;
                text-decoration: none;
                margin: 0 2rem;
                font-size: 2rem;
                color: #fff;
            }

            .navbar .header-info ul li a::after {
                content: "";
                height: 0.3rem;
                width: 0;
                background: #009688;
                position: absolute;
                left: 0;
                bottom: -0.5rem;
                transition: 0.5s;
            }

            .navbar .header-info ul li a:hover::after {
                width: 100%;
            }

            .navbar .header-info .account {
                display: flex;
                margin-top: 1rem;
            }

            .navbar .header-info .account img {
                width: 5rem;
                height: 5rem;
                border-radius: 50%;
                margin-top: -1rem;
            }

            .navbar .header-info .account ul {
                position: absolute;
                left: 0;
                width: 27rem;
                padding: 2rem;
                display: none;
            }

            .navbar .header-info .account ul li {
                background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4));
                padding: 1rem;
            }

            .navbar .header-info ul li:hover > ul {
                display: initial;
                margin-top: 2rem;
            }

            .navbar.sticky ul li a {
                color: #000;
            }

            .navbar.sticky ul li > ul li a {
                color: #fff;
            }
            
            .navbar.sticky #logo > a{
                color: #000;
            }
        </style>
    </head>
    <body>
        <!-- Header here -->
        <div class="navbar" style="position: fixed">
            <div id="logo">
                <a href="<c:url value="/"/>"
                   ><img
                        src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                        alt="MonkeTech"
                        />MonkeTech</a>
            </div>
            <div class="header-info">
                <ul>
                    <li><a href="<c:url value="/"/>">Home</a></li>
                    <li><a href="#service">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <div class="account">
                        <sec:authorize access="!isAuthenticated()">
                            <li><a href="<c:url value="/login"/>">For Department</a></li>
                            <li><a href="<c:url value="/loginPage"/>">Login</a></li>
                            </sec:authorize>

                        <sec:authorize access="isAuthenticated()">
                            <li>
                                <img
                                    src="<c:url value="${sessionScope.user.getPicture()}"/>"
                                    alt="avatar"/>
                                <a href="#">${sessionScope.user.name}</a>
                                <ul>
                                    <li><a href="<c:url value="/account"/>">My Profile</a></li>
                                    <li><a href="<c:url value="/job/viewMyJob"/>">My Applications</a></li>
                                    <li><a href="<c:url value="/logout"/>">Logout</a></li>
                                </ul>
                            </li>
                        </sec:authorize>    
                    </div>

                </ul>
            </div>
        </div>


