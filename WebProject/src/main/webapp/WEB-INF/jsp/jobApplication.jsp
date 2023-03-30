<%-- 
    Document   : jobApplication
    Created on : Feb 16, 2023, 10:24:55 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&display=swap");
    html {
        font-size: 62.5%;
        font-family: 'Poppins', sans-serif;
    }
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
        background-size: cover;

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
        padding: 2rem 4rem;
        z-index: 10000;
        height: 10rem;
        background: #010016;
    }
    .navbar.sticky {
        padding: 1rem 4rem;
        background: #000;
        /* border-bottom: 3px solid silver; */
    }
    .navbar #logo a {
        position: relative;
        font-size: 2rem;
        text-decoration: none;
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
        color: #fff;
    }
    .navbar.sticky ul li > ul li a {
        color: #fff;
    }



    /* CSS for body */
    #apply-job-page {
        position: relative;
        background-color: white;
        width: 60%;
        left: 20%;
        margin-top: 15rem;
        border-radius: 2rem;

    }
    #apply-job-page::after{
        content: "";
        position: absolute;
        inset: 0;
        z-index: -1;
        margin: -10px;
        background-image: linear-gradient(to right top, #2979ff, #1f2123);
        border-radius: inherit;
    }




    #job-detail-head {
        padding: 2rem;
        margin-left: 20rem;
    }

    #job-logo img {
        width: 20rem;
        height: 15rem;
    }

    #general-info {
        margin-top: 2rem;
    }

    #general-info h1 {
        font-size: 3rem;
    }

    #general-info h2 {
        margin-top: 1rem;
        font-size: 1.5rem;
    }


    #cv-info {
        margin-top: 2rem;
        width: 70%;
        margin-left: 10rem;
        background-color: rgb(255, 255, 255);
        padding: 2rem;
    }

    #cv-info span {
        text-align: center;
    }

    #cv-info p {
        font-size: 1.3rem;

    }

    #cv-info input {
        padding: 0.8rem;
        font-size: 1.2rem;
        margin-bottom: 1rem;
    }

    #cv-info span {
        padding: 0.8rem;
        font-size: 1rem;
    }

    #apply-cv a {
        font-size: 1.5rem;
    }

    .mute-text {
        color: gray;
        font-style: italic;
    }


    #apply-reason {
        margin-left: 14rem;
    }


    #send-cv-btn input {
        margin-top: 2rem;
        padding: 1rem 20rem;
        margin-left: 10rem;
        font-size: 1.3rem;
    }
    
    textarea{
        border-radius: 1rem;
        font-size: 1.5rem;
        padding: 0.5rem;
        border: #fc466b 3px solid;
    }
    
</style>


<body style="background-color: #ddd;">

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


    <c:url value="/job/application" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="application" enctype="multipart/form-data">
        <div id="apply-job-page">
            <div id="job-detail-head">
                <div class="row">
                    <div class="col-sm-4">
                        <div id="job-logo">
                            <img src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Removed-bg-logo-comp.png?raw=true" alt="Back-end">
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div id="general-info">
                            <h1 style="font-weight: bold; color: #fc4646;">${jobPost.getJobPosition().getJobName()}</h1>
                            <h2 style="font-style: italic;">Monke Tech Company</h2>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div id="cv-info">
                <div class="row">
                    <div class="col-sm-2">

                        <p>Introduction</p>
                    </div>
                    <div class="col-sm-10">
                        <form:textarea path="introduction" rows="2" cols="50"/>
                    </div>
                </div>
                <div id="apply-cv">
                    <div class="row">
                        <div class="col-sm-2">

                            <p>Your CV</p>

                        </div>
                        <div id="submit-btn" class="col-sm-8">
                            <form:input type="file" path="file"/>
                            <p class="mute-text">We just accept img file CV up to 3MB </p>
                        </div>
                    </div>
                </div>

                <div id="send-cv-btn">
                    <input type="submit" class="btn btn-danger" value="Send CV"/>
                </div>
            </div>
            <input type="hidden" name="postID" value="${jobPost.getPostId()}">
        </div>
    </form:form>
</body>