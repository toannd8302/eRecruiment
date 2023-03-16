<%-- 
    Document   : jobApplication
    Created on : Feb 16, 2023, 10:24:55 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
        margin: 0;
    }


    /* CSS for body */
    #apply-job-page {
        background-color: white;
        width: 80%;
        margin-left: 15rem;
    }

    #job-detail-head {
        background-color: rgb(255, 255, 255);
        margin-left: 30rem;
        padding: 2rem;
        margin-top: 1rem;
    }

    #job-logo img {
        width: 20rem;
        height: 15rem;
        /*background-color: #1d1f28;*/
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
    }


    #apply-reason {
        margin-left: 14rem;
    }


    #send-cv-btn input {
        margin-top: 2rem;
        padding: 1rem 20rem;
        margin-left: 20rem;
        font-size: 1.3rem;
    }
</style>


<body style="background-color: #ddd;">

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
                            <h1>${jobPost.getJobPosition().getJobName()}</h1>
                            <h2>Công ty phần mềm Monke Tech</h2>
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
                        <!--<input type="text" class="form-control" placeholder="Full Name">-->
                        <%--<form:input type="text" class="input-group-text" path="introduction"/>--%>
                        <form:textarea path="introduction" rows="2" cols="50"/>
                    </div>
                </div>
                <div id="apply-cv">
                    <div class="row">
                        <div class="col-sm-2">

                            <p>Your CV</p>

                        </div>
                        <div class="col-sm-8">
                            <form:input type="file" path="file"/>
                            <!--<a href="#" class="btn btn-success">Choose file</a>-->
                            <!--<p>No file have been chose</p>-->

                            <p class="mute-text">We accept doc, docx, pdf files, no password protected, up to 3MB</p>
                        </div>
                    </div>
                </div>

                <div id="send-cv-btn">
                    <!--<button type="button" class="btn btn-danger">Send CV</button>-->
                    <input type="submit" class="btn btn-danger" value="Send CV"/>
                </div>
            </div>
            <input type="hidden" name="postID" value="${jobPost.getPostId()}">
        </div>
    </form:form>
</body>