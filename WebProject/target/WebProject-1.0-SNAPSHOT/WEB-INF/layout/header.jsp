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

<!--<link rel="stylesheet" href="bootstrap/bootstrap.min.css">-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kaushan+Script&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aladin&amp;display=swap">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
<link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
<link rel="stylesheet" href="assets/css/Pretty-Search-Form-.css">
<link rel="stylesheet" href="assets/css/Projects-Grid-Horizontal-images.css">

<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css%22%3E">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">


<body id="page-top" data-bs-spy="scroll" data-bs-target="#mainNav" data-bs-offset="54">
    <nav class="navbar navbar-dark navbar-expand-md fixed-top bg-dark d-flex justify-content-xxl-center" id="mainNav" style="display: flex;height: 127px;width: 100%;">
        <div class="container"><img width="100" height="80" style="padding-bottom: 0px;width: 180px;height: 140px;" src="https://raw.githubusercontent.com/Toannd832/eRecruiment/Thang/View-Applications/img/MonkeTech_Logo_PNG.png"><button data-bs-toggle="collapse" data-bs-target="#navbarResponsive" class="navbar-toggler navbar-toggler-right" type="button" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
            <div class="collapse navbar-collapse text-center justify-content-center justify-content-lg-center" id="navbarResponsive" style="margin-right: 385px;width: 1112.47px;">
                <ul class="navbar-nav ms-auto text-uppercase" style="margin-left: 4.375px;margin-right: -201px;">
                    <li class="nav-item"><a class="nav-link" href="#page-top">Home</a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"><a class="nav-link" href="#introduce">About</a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">jobs by title</a>
                        <div class="dropdown-menu" style="width: 167.5px;margin: 0px 0px 0px;"><a class="dropdown-item" href="#" style="color: var(--bs-navbar-active-color);background: #343a40;padding: 10px 16px;width: 200px;">jobs by salary</a><a class="dropdown-item" href="#" style="background: #343a40;color: var(--bs-navbar-active-color);width: 200px;">jobs by location</a></div>
                    </li>
                </ul>
            </div>

            <c:if test="${sessionScope.user == null}">
                <div id="account">
                    <a>For Department</a>
                    <a id="login-btn" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/WebProject/LoginController&response_type=code
                       &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login</a>
                </div> 
            </c:if>

            <c:if test="${sessionScope.user != null}">
                <c:url value="/LogoutController" var="action"/>
                <div class="text-start d-flex flex-grow-0 align-items-center align-self-center" style="width: 302.525px;height: 91px;margin: 2px;padding: 0px;margin-left: 11px;margin-right: 17px;"><img class="rounded-circle" src="" style="width: 70px;height: 70px;">
                    <div class="dropdown" style="color: var(--bs-navbar-brand-color);"><a class="dropdown-toggle fs-4" aria-expanded="false" data-bs-toggle="dropdown" href="#" style="margin-left: 20px;color: var(--bs-navbar-brand-color);">My account</a>
                        <div class="dropdown-menu fs-5" style="width: 235.5px;margin: 0px 0px 0px;margin-left: 23px;padding: 0px;">
                            <a class="dropdown-item" href="<c:url value="/account"/>" style="background: #343a40;color: var(--bs-navbar-brand-color);padding-top: 10px;padding-bottom: 10px;">My Profile</a>
                            <a class=wn-item" href="dropdown-item" href="#" style="background: #343a40;color: var(--bs-navbar-brand-color);padding-top: 10px;padding-bottom: 10px;">View My Applications</a>
                            <a class="dropdo" href="<c:url value="/LogoutController"/>" style="background: #343a40;color: var(--bs-navbar-brand-color);padding-top: 10px;padding-bottom: 10px;">Log Out</a>
                        </div>
                    </div>
                </div>                      
            </c:if>
        </div>
    </nav>



    <!-- Banner here -->

    <header class="masthead" style="background-image: url('https://raw.githubusercontent.com/Toannd832/eRecruiment/Thang/Home_Page_For_Web/assets/img/header-bg.jpg');width: 100%;">
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in"><span style="font-family: Acme, sans-serif;">Welcome To Our Company!</span></div>
                <div class="intro-heading text-uppercase" style="font-family: 'Kaushan Script', serif;"><span>Find your dream job</span></div>
                <form class="search-form">
                    <div class="input-group" style="height: 69px;"><span class="input-group-text" style="width: 51.8625px;height: 60px;"><i class="fa fa-search"></i></span><input class="form-control" type="text" placeholder="I am looking for..." style="height: 60px;width: 172.99px;padding: 6px 12px;"><button class="btn btn-light" type="button" style="background: var(--bs-btn-hover-border-color);height: 60px;">Search </button></div>
                </form>
            </div>
        </div>
    </header>
</body>





















<%--
<style>
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
        margin: 0;
    }

    body {
        background-color: #343747;
    }


    /*CSS for header  */
    #header {
        background-color: #1a1c28;
        height: 150px;
        padding: 0;
        position: relative;
    }

    #header nav {
        display: flex;
        justify-content: space-between;
        justify-items: center;
        height: 150px;
        line-height: 150px;
    }


    /* CSS for Logo */

    #logo img {
        width: 180px;
        height: 150px;
    }


    /* CSS for main menu */
    nav #main-menu {
        display: flex;
        list-style: none;
        font-size: 20px;
        position: relative;
    }

    nav #main-menu li:hover {
        border-bottom: 3px solid red;
        background-color: #343747;
    }

    nav #main-menu li a {
        text-decoration: none;
        padding: 0px 20px;
        /* margin-top: 30px; */
        display: block;
        color: white;
        margin-right: 100px;
    }


    /* CSS for sub-menu*/
    #main-menu li>.sub-menu {
        display: none;
        position: absolute;
    }

    #main-menu .sub-menu ul {
        list-style: none;
        height: 100px;
    }

    #main-menu li:hover .sub-menu {
        display: block;
    }

    #main-menu .sub-menu ul li {
        background-color: #1a1c28;
        height: 100px;
    }

    #main-menu .sub-menu ul li:hover {
        background-color: #343747;
    }


    /* CSS for search box */
    #search {
        margin-top: 50px;
        display: flex;
        height: 40px;

    }

    #search input {
        border-radius: 5px;
    }

    #search button {
        border-radius: 5px;
        margin-left: 5px;
        background-color: rgb(197, 32, 32);
    }

    #search button:hover {
        background-color: rgb(216, 112, 112);
    }


    /* ////////////////////////////////// */
    /* CSS  for Login button*/

    #account {
        margin-right: 10px;
    }

    #account a {
        text-decoration: none;
        color: black;
    }

    #account{
        
    }
    #account a{
        color: gray;
        font-size: 2rem;
        margin-right: 1rem;
    }

    #account a:hover {
        color: white;
    }



    #login-account {
        display: flex;
    }

    #login-account img {
        height: 60px;
        border-radius: 50%;
        margin-top: 40px;

    }

    #login-account a {
        text-decoration: none;
        font-size: 20px;
        font-weight: bold;
        margin-right: 30px;
        margin-left: 20px;
        /* padding-bottom: 30px; */
        color: white;
    }


    #account-menu>.sub-menu{
        display: none;
        /* position: absolute; */
        list-style: none;
        padding: 0%;
        margin: 0%;

    }

    #account-menu:hover .sub-menu {
        display: block;

    }

    #account-menu .sub-menu li {
        background-color: #1a1c28;
        color: white;
        padding: 10px;
        height: 120px;
        /* align-items: center; */
    }
    #account-menu .sub-menu li a{
        margin-bottom: 5rem;
        display: inline;
    }
    #account-menu .sub-menu li:hover {
        border-bottom: 3px solid red;
        background-color: #343747;
    }

    #account-menu .sub-menu ul {
        height: 80px;
        list-style: none;
        padding-left: 0%;
    }
</style>

<!-- CSS Here -->

<div id="header">
    <nav>
        <div id="logo">
            <a href="#"><img src="https://raw.githubusercontent.com/Toannd832/eRecruiment/Thang/job-detail/img/MonkeTech_Logo_PNG.png" alt="Monke Tech"></a>
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

        <c:if test="${sessionScope.user == null}">
            <div id="account">
                <a>For Department</a>
                <a id="login-btn" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8084/WebProject/LoginController&response_type=code
                       &client_id=14093495895-chh4kno5un2kj4l9p5e2qh2a89h7tp3s.apps.googleusercontent.com&approval_prompt=force">Login</a>
            </div> 
        </c:if>

        <c:if test="${sessionScope.user != null}">
            <c:url value="/LogoutController" var="action"/>
            <div id="login-account">
                <img src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>
                <div id="account-menu">
                    <a href="#">My Account <i class="fa-solid fa-angle-down"></i></a>
                    <div class="sub-menu">
                        <ul>
                            <li><a href="<c:url value="/account"/>">My Profile</a></li>
                            <li><a href="#">View Job Applications</a></li>
                                <form:form method="get" action="${action}">
                                <li><input type="submit" value="Logout" /></li>
                                </form:form>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
    </nav>
</div>
--%>


