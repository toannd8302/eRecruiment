<%-- 
    Document   : formJobPosting
    Created on : Mar 5, 2023, 10:31:31 AM
    Author     : toan0
--%>


<%@page import="com.codeweb.pojos.department"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="com.codeweb.pojos.jobPosition"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            html {
                font-size: 62.5%;
                font-family: Arial, Helvetica, sans-serif;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                list-style: none;
            }

            body::-webkit-scrollbar {
                width: 10px;
            }
            body::-webkit-scrollbar-track {
                background-color: #fafafa;
            }
            body::-webkit-scrollbar-thumb {
                background-image: linear-gradient(-45deg, #6a5af9, #d66efd);
                border-radius: 50px;
            }

            .post-list-left{
                width: 8rem;
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                height: 100%;
                background-color: rgb(172, 170, 170);
                overflow: hidden;
                transition: witdh 0.2s linear;
                box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);


            }

            .post-list-left ul, li{
                padding-left: 0;
            }

            .logo img{
                width: 6rem;
                height: 6rem;
                background-color: rgb(43, 44, 44);
                border-radius: 50%;

            }

            .logo{
                display: flex;
                transition: all 0.5s ease;
            }

            .logo span{
                font-weight: bold;
                font-size: 2rem;
                text-transform: uppercase;
            }

            .post-list-left a{
                position: relative;
                color: white;
                font-size: 2rem;
                display: table;
                width: 30rem;
                text-decoration: none;
                padding: 1.5rem;

            }


            .fa-solid{
                position: relative;
                width: 5rem;
                height: 3rem;
                top: 2rem;
                font-size: 2rem;
                text-align: center;
            }

            .nav-item{
                position: relative;
                top: 2rem;
                margin-left: 1.8rem;
            }

            .post-list-left a:hover{
                background: #eee;
                color: black;
            }

            nav:hover{
                width: 28rem;
                transition: all 0.5s ease;
            }

            .logout{
                position: absolute;
                top: 90%;
                bottom: 0%;

            }

            .create-job-post-right {
                float: right;
                width: 80%;
                /*border-left: 1px solid black;*/
                /* margin-left: 2rem; */
                padding-left: 2rem;
                margin-top: 3rem;
            }

            .create-job-post-right h1 {
                font-weight: bold;
                font-size: 3.5rem;
            }

            .create-job-post-right select {
                font-size: 1.5rem;
            }

            .create-job-post-right input {
                font-size: 1.5rem;
            }

            .create-job-post-right button {
                margin-left: 10rem;
                font-size: 1.8rem;
                padding: 0.2rem 2rem;
                margin-bottom: 3rem;
                margin-top: 2rem;
                border-radius: 0.5rem;
            }

            #job-descript {
                margin-top: 1.35rem;
            }

            #skill option ul li {
                font-size: 1rem !important;
            }

            .mult-select-tag .item-label {
                font-size: 1.5rem;
            }

            .dollar{
                font-size: 1.5rem;
            }

            #skill-list{
                display: flex;
            }

            .skill-item{
                margin-right: 1rem;
                border: 1px solid black;
                border-radius: 1rem;
                padding: 0.5rem;
                font-weight: bold;
                background-color: rgb(206, 249, 238);
            }


        </style>

    </head>
    <body>

        <%
            String msg = (String) session.getAttribute("ERROR");
            if (msg != null) {
        %>
        <h2><%= msg%></h2>
        <%
            }
        %>





        <nav class="post-list-left">
            <ul>
                <li>
                    <c:url value="/viewround" var="action" />
                    <form:form method="post" modelAttribute="jobPosting" action="${action}" >
                        <button>ADD MORE ROUNDS</button>
                    </form:form>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="<c:url value="/logout"/>" class="logo">
                        <img
                            src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/MonkeTech_Logo_PNG.png?raw=true"
                            alt="Monke Tech"
                            />
                        <span class="nav-item">Department</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/"/>">
                        <i class="fa-solid fa-house"></i>
                        <span class="nav-item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/department" />">
                        <i class="fa-solid fa-list"></i>
                        <span class="nav-item">Job Posting List</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-folder-plus"></i>
                        <span class="nav-item">Create a Job Posting</span>
                    </a>
                </li>

                <li class="logout">
                    <a href="<c:url value="/logout"/>">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span class="nav-item ">Log Out</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="create-job-post-right">
            <h1>Create a Job Posting</h1>
            <hr />
            <h3>*Job Position</h3>     
            <c:url value="/createjobposting" var="action" />
            <form:form method="post" modelAttribute="jobPosting" action="${action}" >

                <div>           
                    <form:select  path="jobPosition.jobId" required="true">
                        <form:option value="">-- Select Job Position --</form:option>
                        <form:options items="${joPositions}" itemValue="jobId" itemLabel="JobName"></form:options>
                    </form:select>
                </div>

                <h2><br />General Information</h2>
                <div class="container-fluid mt-3">
                    <div class="row">
                        <div class="col-sm-6">
                            <div>
                                <h3>Salary</h3>
                                <form:input type="number" path="salary"/> <i class="fa-solid fa-dollar-sign dollar" style="top: 0;"></i>
                            </div>
                            <div>
                                <%--<form:label path="level">Level</form:label>--%>
                                <h3>Level</h3>
                                <form:input type="text" path="level" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div>
                                <br>
                                <h3>Type of Job</h3>
                                <form:label path="typeOfWork">Full Time</form:label>                            
                                <form:checkbox  path="typeOfWork" checked="true" value="1"/>
                            </div>

                            <div>

                                <%--<form:label path="exprienceRequirement">Exprience Requirement</form:label>--%>
                                <h3>Exprience Requirement</h3>
                                <form:input type="number" path="exprienceRequirement" min="0"/> (year/years)
                            </div>
                        </div>
                    </div>
                    <h2><br />Detail Information</h2>
                    <div class="row">
                        <div class="col-sm-6">
                            <div>
                                <h3>Location</h3>
                                <form:input type="text" path="locations" />
                            </div>

                            <div>
                                <h3>Welfare</h3>
                                <form:input type="text" path="welfare" />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <h3>Required Skills</h3>
                            <ul id="skill-list">
                                <li class="skill-item">.Net</li>
                                <li class="skill-item">ReactJS</li>
                                <li class="skill-item">Node.JS</li>
                                <li class="skill-item">Team work</li>
                            </ul>

                            <div>
                                <h3>Expired Time</h3>
                                <form:input type="date" path="ExpiredTime" required="true"/>

                            </div>
                        </div>
                    </div>


                </div>
                <button>Create round</button>
                <input type="reset" value="Reset" />

            </div>

        </form:form>





        <%--
                <h1 style="text-align: center">Create Job Posting</h1>

         <%
         String msg = (String)session.getAttribute("ERROR");
         if(msg!=null){
             %>
             <h2><%= msg %></h2>
                <%
        }
         %>

        <c:url value="/createjobposting" var="action" />
        <form:form method="post" modelAttribute="jobPosting" action="${action}" >      


            <div>
                <form:label path="descriptions">Descriptions</form:label>
                <form:textarea  path="descriptions" />
            </div>

            <div>
                <form:label path="typeOfWork">Full Time</form:label>
                <form:checkbox  path="typeOfWork" checked="true" value="1"/>
            </div>

            <div>
                <form:label path="exprienceRequirement">Exprience Requirement</form:label>
                <form:input type="number" path="exprienceRequirement" min="0"/> (year/years)
            </div>
            <div>
                <form:label path="locations">Locations</form:label>
                <form:input type="text" path="locations" />
            </div>
            <div>
                <form:label path="welfare">Welfare</form:label>
                <form:input type="text" path="welfare" />
            </div>
            <div>
                <form:label path="salary">Salary</form:label>
                <form:input type="number" path="salary" min="0" /> $
            </div>
            <div>
                <form:label path="ExpiredTime">Expired Time</form:label>
                <form:input type="date" path="ExpiredTime" required="true"/>

            </div>

            <div>
                <form:label path="level">Level</form:label>
                <form:input type="text" path="level" />
            </div>

            <div>           
                <form:select  path="jobPosition.jobId" required="true">
                    <form:option value="">-- Select Job Title --</form:option>
                    <form:options items="${joPositions}" itemValue="jobId" itemLabel="JobName"></form:options>
                </form:select>
            </div>



            <button type="submit">Create</button>
            <input type="reset" value="Reset" />
        </form:form>
        --%>
    </body>

</html>
