<%-- 
    Document   : account
    Created on : Feb 18, 2023, 8:37:15 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<style>
    body{
        background-color: lightgray;
    }
    .main{
        padding: 15px;
        font-family: Arial, Helvetica, sans-serif;
    }
    .topbar{
        background-color: teal;
        overflow:hidden;
    }
    .topbar a{
        float: right;
        color:whitesmoke;
        text-align: center;
        padding: 20px 26px;
        text-decoration: none;
        font-size: 26px;
    }
    .sidebar{
        background-color:rgb(85, 85, 85);
        color: rgb(255, 255, 255);
        height: 100%;
    }
    .sidebar a{
        margin-left: 10px;
        display: block;
        color: white;
        padding-bottom: 10px;
        font-size: 30px;
        text-decoration: none;
    }
    .card{
        position: relative;
        display: flex;
        flex-direction: column;
    }
    .content{
        background-color: whitesmoke;
    }


    .job-info{
        margin-top: 2rem
    }

    #avatar{
        border-radius: 50%;
    }

    .button button{
        font-size: 1.5rem;
        margin-top: 2rem;
        border-radius: 0.5rem;

    }
</style>


<div class="container">
    <form:form method="post" action="${action}" modelAttribute="application" enctype="multipart/form-data">
        <div class="main">
            <img id="avatar" src="<c:url value="${user.getPicture()}" />" alt="${user.getName()}"/>
            <!--        <div class="topbar">
                        <a href="">Logout</a>
                        <a href="">Support</a>
                    </div>-->
            <div class="button">
                
                <%--<form:input type="file" id="file" path="file"/>--%>
                <button>Update</button>
                <button>Delete</button>
            </div>
            <div class="row">
                <div class="col-md-12 mt-1">
                    <div class="card mb-8 content">
                        <h1 class="m-3 pt-3">About</h1>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Full Name:</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    ${user.getName()}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Email:</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    ${user.email}
                                </div>
                            </div> 
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Phone:</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    ${user.phone}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-3">
                                    <h5>Address:</h5>
                                </div>
                                <div class="col-md-9 text-secondary">
                                    ${user.address}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="job-info">
                        <div class="card mb-3 content">
                            <h1 class="m-3">Job</h1>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Job Name:</h5>
                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        ${user.jobName}
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Skill:</h5>
                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        <c:forEach var="skill" items="${user.getSkills()}">
                                            <li>
                                                ${skill.skillName}
                                            </li>
                                        </c:forEach>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>Experience year:</h5>
                                    </div>
                                    <div class="col-md-9 text-secondary">
                                        ${user.experience}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form:form>

</div>









<p>${user.email}</p>

<p><fmt:formatDate value="${user.getDob()}" pattern="dd/MM/yyyy"/></p>

<p>${user.phone}</p>

<p>${user.address}</p>

<h2>Introduction</h2>

<p>Job: ${user.jobName}</p>

<p>Experience year: ${user.experience}</p>

<h2>Skill:</h2>
<c:forEach var="skill" items="${user.getSkills()}">
    <li>
        ${skill.skillName}
    </li>
</c:forEach>