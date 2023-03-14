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
            .post-list-left{
                width: 8rem;
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                height: 100%;
                /*background-color: rgb(172, 170, 170);*/
                background: #5c6664;
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
                margin-bottom: 3.5rem;
            }
            .skill-item{
                margin-right: 1rem;
                border: 1px solid black;
                border-radius: 1rem;
                padding: 0.5rem;
                font-weight: bold;
                background-color: rgb(206, 249, 238);
            }
            #Concak select{
                -webkit-appearance:none;
                -moz-appearance:none;
                -ms-appearance:none;
                appearance:none;
                outline:0;
                box-shadow:none;
                border:0!important;
                background-image: none;
                flex: 1;
                padding: 0 .5em;
                color:#fff;
                cursor:pointer;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                display: flex;
                width: 95%;
                height: 3em;
                line-height: 3;
                background: #5c6664;
                overflow: hidden;
                border-radius: .25em;
                font-size: 1.8rem;
            }
            #Concak select option{
                background: #5c6664;
            }
            #Concak select::-ms-expand{
                display: none;
            }
            .row input{
                width: 80%;
                border-radius: 0.5rem;
                height: 3rem;
                height: 3.5rem;
            }
            #checkbox{
                height: 6.7rem;
            }
            #checkbox label{
                font-size: 2rem;
            }
            #checkbox input{
                height: 2rem;
                width: 10%;
            }
            .text-info{
                color: black !important;
                margin: 2rem 0;
            }

            .text-info textarea{
                width: 100%;
            }
            .welfare-list h1 {
                font-weight: bold;
                font-size: 3.5rem;
            }

            .welfare-list button {
                padding: 0.5rem 2rem;
                border-radius: 0.5rem;
                margin-top: 2rem;
                font-size: 1.5rem;
                box-shadow: 0 0.8rem 0rem 0rem rgba(0, 0, 0, 0.2);
                border: none;
                background-color: rgb(102, 240, 164);
            }

            .welfare-list button:active{
                box-shadow: 0 0.4rem 0rem 0rem rgba(0, 0, 0, 0.2);
                transform: translateY(0.5rem);
            }


            .select-skill-container {
                position: relative;
                max-width: 80%;
            }

            .select-btn {
                /* height: 5rem; */
                background-color: rgb(198, 237, 224);
                align-items: center;
                padding-top: 1rem;
                padding-bottom: 0.5rem;
                border-radius: 0.5rem;
                cursor: pointer;
                box-shadow: 0 0.3rem 0.7rem rgba(0, 0, 0, 0.2);
            }

            .select-btn .btn-text {
                font-size: 1.5rem;
                color: #333;
            }

            .select-btn .arrow-dwn i {
                font-size: 1.5rem;
                transition: 0.3s;
                top: 0;
            }

            .select-btn.open .arrow-dwn i{
                transform: rotate(-180deg);
            }

            .select-btn.open ~ .list-items {
                display: block;
            }

            .list-items {
                position: relative;
                background-color: rgb(198, 237, 224);
                margin-top: 1rem;
                box-shadow: 0 0.3rem 0.7rem rgba(0, 0, 0, 0.2);
                border-radius: 0.5rem;
                padding: 1rem;
                display: none;
            }

            .list-items .item {
                list-style: none;
                height: 3.5rem;
                cursor: pointer;
                transition: 0.3s;
                margin-top: 2rem;
                padding: 2rem 2rem;
                border-radius: 0.5rem;
                display: flex;
                margin-bottom: 2rem;
            }

            .list-items .item:hover {
                background-color: #e7edfe;
            }

            .item .checkbox {
                border: 1px solid #c0c0c0;
                padding: 0.3rem;
                margin-right: 1rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease-in-out;
                display: inline-block;
                height: 2rem;
                width: 2rem;
            }

            .item .item-text {
                font-size: 1.5rem;
                display: block;
                height: 3rem;
                border: none;
                background-color: rgb(198, 237, 224);

            }

            .checkbox .check-icon {
                font-size: 1.3rem;
                transform: scale(0);
                transition: 0.3s;
                top: 0;
                text-align: left;
            }

            .item.checked .check-icon {
                transform: scale(1);
                top: 0;
                text-align: left;
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
                    <a href="<c:url value="/logout"/>" class="logo">
                        <img
                            src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                            alt="Monke Tech"
                            />                     
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
            <div class="create-post-head" style="display: flex; justify-content: space-around">
                <h1 style="display: flex; flex-direction: column-reverse;">Create a Job Posting</h1>
                <h1 class="nav-item" style="padding-bottom: 2rem; color: red;">${sessionScope.department.departmentName} Department</h1>
            </div>
            <hr />
            <h2>*Job Position</h2>     
            <c:url value="/createjobposting" var="action" />
            <form:form method="post" modelAttribute="jobPosting" action="${action}" >

                <div id="Concak">           
                    <form:select  path="jobPosition.jobId" required="true">
                        <form:option value="">-- Select Job Position --</form:option>
                        <form:options items="${joPositions}" itemValue="jobId" itemLabel="JobName"></form:options>
                    </form:select>
                </div>

                <h2><br />*General Information</h2>
                <div class="container-fluid mt-3">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="text-info">
                                <h3>Salary</h3>
                                <form:input type="number" path="salary" required="true"/> <i class="fa-solid fa-dollar-sign dollar" style="top: 0;"></i>
                            </div>
                            <div class="text-info">
                                <%--<form:label path="level">Level</form:label>--%>
                                <h3>Level</h3>
                                <form:select  path="level" required="true">
                                    <form:option value="Intern">Intern</form:option>
                                    <form:option value="Fresher">Fresher</form:option>
                                    <form:option value="Junior">Junior</form:option>
                                    <form:option value="Senior">Senior</form:option>

                                </form:select>

                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div id="checkbox"  class="text-info">

                                <h3>Type of Job</h3>
                                <form:label path="typeOfWork">Full Time</form:label>                            
                                <form:checkbox  path="typeOfWork" checked="true" value="1"/>
                            </div>

                            <div class="text-info">

                                <%--<form:label path="exprienceRequirement">Exprience Requirement</form:label>--%>
                                <h3>Exprience Requirement</h3>
                                <form:input type="number" path="exprienceRequirement" min="0" required="true"/> (year/years)
                            </div>
                        </div>
                    </div>
                    <h2><br />Detail Information</h2>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="text-info">
                                <h3>Location</h3>
                                <form:select  path="locations" required="true">
                                    <form:option value="District 1">District 1</form:option>
                                    <form:option value="District 3">District 3</form:option>
                                    <form:option value="District 4">District 4</form:option>
                                    <form:option value="District 5">District 5</form:option>
                                    <form:option value="District 6">District 6</form:option>
                                    <form:option value="District 7">District 7</form:option>
                                    <form:option value="District 8">District 8</form:option>
                                    <form:option value="District 10">District 10</form:option>
                                    <form:option value="District 11">District 11</form:option>
                                    <form:option value="District 12">District 12</form:option>
                                    <form:option value="Thu Duc City"> Thu Duc City </form:option>                             
                                </form:select>

                            </div>

                            <div class="text-info">

                                <h3>Welfare</h3>
                                <%--<form:input type="text" path="welfare" required="true" />--%>
                                <div class="welfare-list">
                                    <div class="select-skill-container">
                                        <div class="select-btn">
                                            <div class="d-flex justify-content-between mb-3">
                                                <div class="p-2">
                                                    <span class="btn-text">Select welfare</span>
                                                </div>
                                                <div class="p-2">
                                                    <span class="arrow-dwn">
                                                        <i class="fa-solid fa-chevron-down"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="list-items">
                                            <li class="item">
                                                <span class="checkbox">
                                                    <i class="fa-solid fa-check check-icon"></i>
                                                </span>
                                                <form:input type="text" path="welfare" class="item-text" value="A lot of Money if you deligent"  readonly="true"/>
                                            </li>
                                            <li class="item">
                                                <span class="checkbox">
                                                    <i class="fa-solid fa-check check-icon"></i>
                                                </span>
                                                <form:input type="text" path="welfare" class="item-text" value="You can off 2 days per week"  readonly="true"/>
                                            </li>
                                            <li class="item">
                                                <span class="checkbox">
                                                    <i class="fa-solid fa-check check-icon"></i>
                                                </span>
                                                <form:input type="text" path="welfare" class="item-text" value="Oversea traveling 1 time per year"  readonly="true"/>

                                            </li>
                                            <li class="item">
                                                <span class="checkbox">
                                                    <i class="fa-solid fa-check check-icon"></i>
                                                </span>
                                                <form:input type="text" path="welfare" class="item-text" value="You get social insurance periodically "  readonly="true"/>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="text-info">
                                <h3>Picture</h3>
                                <form:input type="text" path="picture" required="true"/>
                            </div>

                        </div>
                        <div class="text-info">
                            <h3>Description</h3>
                            <%--<form:input type="text" path="descriptions" required="true"/>--%>
                            <form:textarea cols="100" rows="10" path="descriptions"/>
                        </div>
                    </div>
                </div>

                <button>Create round</button>
                <input type="reset" value="Reset" />
            </form:form>

            <!--                Vẫn còn code dâm chỗ add more round này hãy lưu ý-->
            <c:url value="/viewround" var="action" />
            <form:form method="post" modelAttribute="jobPosting" action="${action}" >
                <button>ADD MORE ROUNDS</button>
            </form:form>
        </div>
        <script type="text/javascript">
            const selectBtn = document.querySelector(".select-btn"),
                    items = document.querySelectorAll(".item");

            selectBtn.addEventListener("click", () => {
                selectBtn.classList.toggle("open");
            });

            items.forEach(item => {
                item.addEventListener("click", () => {
                    item.classList.toggle("checked");

                    let checked = document.querySelectorAll(".checked"),
                            btnText = document.querySelector(".btn-text");

                    if (checked && checked.length > 0) {
                        btnText.innerText = `${checked.length} Selected`;
                    } else {
                        btnText.innerText = "Select Skills";
                    }
                });
            })

        </script>

    </body>

</html>
