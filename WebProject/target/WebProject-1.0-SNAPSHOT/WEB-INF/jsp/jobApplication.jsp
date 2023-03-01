<%-- 
    Document   : jobApplication
    Created on : Feb 16, 2023, 10:24:55 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body style="background-color: #1d1f28;">

    <!-- Body Here -->
    <div id="apply-job-page">
        <div id="job-detail-head">
            <div class="row">
                <div class="col-sm-3">
                    <div id="job-logo">
                        <img src="https://dotnet.microsoft.com/static/images/redesign/social/square.png" alt="Back-end">
                    </div>
                </div>
                <div class="col-sm-5">
                    <div id="general-info">
                        <h1>Lập trình viên .NET</h1>
                        <h2>Công ty phần mềm Monke Tech</h2>
                    </div>
                </div>
            </div>
        </div>
        <hr>

        <div id="cv-info">
            <div class="row">
                <div class="col-sm-2"><span class="input-group-text">
                        <p>Kimi no na wa</p>
                    </span></div>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="Full Name">
                </div>
            </div>
            <div id="apply-cv">
                <div class="row">
                    <div class="col-sm-2">
                        <span class="input-group-text">
                            <p>Your CV</p>
                        </span>
                    </div>
                    <div class="col-sm-8">
                        <a href="#" class="btn btn-success">Choose file</a>
                        <p>No file have been chose</p>

                        <p class="mute-text">We accept doc, docx, pdf files, no password protected, up to 3MB</p>
                    </div>
                </div>
            </div>

            <div id="apply-reason">
                <h3>What skills, work projects or achievements make you a strong candidate?</h3>
                <textarea rows="4" cols="130"></textarea>
            </div>
            <div id="send-cv-btn">
                <button type="button" class="btn btn-danger">Send CV</button>
            </div>
        </div>

    </div>
</body>

<c:url value="/job/application" var="action"/>
<form:form method="post" action="${action}" modelAttribute="application" enctype="multipart/form-data">
    <div>
        <label>Introduction</label>
        <form:input type="text" id="introduction" path="introduction"/>
    </div>
                
    <div>
        <label>File CV</label>
        <form:input type="file" id="file" path="file"/>
    </div>

    <div>
        <input type="submit" value="Submit"/>
    </div>
    <input type="hidden" name="postID" value="${postID}">
</form:form>