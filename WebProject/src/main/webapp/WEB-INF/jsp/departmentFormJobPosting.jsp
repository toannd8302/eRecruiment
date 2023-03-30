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
            @import url("https://fonts.googleapis.com/css2?family=Climate+Crisis&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=Noto+Sans+Lepcha&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&display=swap");
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
                height: 100%;
                background: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url('https://media.discordapp.net/attachments/1059668998503026770/1088380001059082271/people-office-background_236854-36902.png?width=782&height=521');
                background-size: cover;
            }

            .navbar {
                position: fixed;
                top: 0;
                right: 0;
                width: 84.2%;
                transition: 0.5s;
                padding: 2rem 4rem;
                z-index: 10000;
                height: 10rem;
                /*background: linear-gradient(90deg, rgba(10,5,101,0.6940827356333159) 1%, rgba(2,86,103,0.7557073854932598) 52%, rgba(15,157,186,0.685679374288778) 100%);*/
                 background: linear-gradient(90deg, rgba(10,5,101,0.6940827356333159) 1%, rgba(2,86,103,0.7557073854932598) 52%, rgba(15,157,186,0.685679374288778) 100%);
            }

            .navbar.sticky {
                padding: 1rem 4rem;
                background: #fff;
                border-bottom: 3px solid silver;
            }

            .navbar #logo a {
                position: relative;
                text-decoration: none;
                font-size: 2rem;
                font-weight: bold;
                color: #fff;
            }

            .navbar #logo img {
                margin-top: -1rem;
                width: 12rem;
                height: 6rem;
            }

            .navbar .header-info ul li {
                position: relative;
                right: 0;
                list-style: none;
                margin: 0 1rem;
                text-align: right;
            }

            .navbar .header-info ul li a {
                position: relative;
                text-decoration: none;
                margin: 0 2rem;
                font-size: 3rem;
                color: #fff;
                font-family: serif;
            }

            .navbar .header-info ul li a::after {
                content: "";
                height: 0.3rem;
                width: 100%;
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

            .post-list-left{
                width: 23rem;
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                height: 100%;
                /*background: radial-gradient(circle, rgba(226,226,226,0.8313376375941002) 0%, rgba(255,255,255,0.850945480731355) 100%);*/
                /*background: linear-gradient(90deg, rgba(10,5,101,0.6940827356333159) 1%, rgba(2,86,103,0.7557073854932598) 52%, rgba(15,157,186,0.685679374288778) 100%);*/
                background: #fff;
                overflow: hidden;
                transition: witdh 0.2s linear;
                box-shadow: 0 2rem 3rem rgba(0, 0, 0, 0.2);
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
            }

            .post-list-left ul, li{
                padding-left: 0;
            }
            .nav-body{
                margin-top: 10rem;
            }

            .nav-body li{
                margin: 4rem 0;
            }
            .logo img{
                width: 10rem;
                height: 5rem;
            }

            .logo{
                display: flex;
                transition: all 0.5s ease-in-out;

            }

            .logo span{
                font-weight: bold;
                font-size: 2rem;
                text-transform: uppercase;
            }

            .post-list-left a{
                position: relative;
                color: #000;
                font-size: 1.5rem;
                display: table;
                width: 40rem;
                text-decoration: none;
                padding: 1.5rem;
                transition: 0.5s ease;
                font-weight: bold;
            }


            .fa-solid{
                position: relative;
                width: 5rem;
                height: 3rem;
                top: 0.2rem;
                font-size: 2rem;
                text-align: center;
            }

            .nav-item{
                position: relative;
                top: 0.2rem;
                margin-left: 1.8rem;
            }

            .post-list-left a:hover{
                background: #000;
                color: #fff;
            }

            /*            .post-list-left a:hover li{
                            color: 
                        }
            */
            .logout{
                position: absolute;
                top: 90%;
                bottom: 0%;
            }

            .create-job-post-right {
                position: relative;
                width: 75%;
                left: 20%;
                padding-left: 2rem;
                margin-top: 15rem;
                background: #fff;
                border-radius: 1rem;
                padding-bottom: 8rem;
                padding: 0;
                overflow: hidden;
            }

            .create-job-post-right .head-title{
                background: #000;
                text-align: center;
                padding: 1rem 0;
                background-color: #00AE72;
            }

            .create-job-post-right .head-title > h1{
                font-size: 3rem;
                color: #fff;
                text-transform: uppercase;
                font-family: "Poppins", sans-serif;

            }

            .create-job-post-right h1 {
                font-weight: bold;
                font-size: 2.5rem;

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
            
            .general-info{
                padding:0 5rem;
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

            #Concak{
                padding-left: 5rem;
            }

            #Concak select{
                outline:0;
                box-shadow:none;
                background-image: none;
                flex: 1;
                padding: 0 .5em;
                color:#000;
                cursor:pointer;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                display: flex;
                width: 95%;
                height: 3em;
                line-height: 3;
                overflow: hidden;
                border-radius: .25em;
                font-size: 1.8rem;
                margin-top: 3rem;
            }

            #Concak select:after{
                content: '&#60';
                font-size: 5rem;
            }


            #Concak select::-ms-expand{
                display: none;
            }
            .row input{
                width: 80%;
                border-radius: 0.5rem;
                height: 4rem;
            }
            #checkbox{
                height: 6.7rem;
            }
            #checkbox label{
                font-size: 2rem;
                font-family: 'Poppins', sans-serif;
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

            .create-job-post-right h3{
                margin-bottom: 2rem;
                font-size: 2rem;
                font-family: 'Poppins', sans-serif;
            }

            .text-info select{
                outline:0;
                box-shadow:none;
                background-image: none;
                flex: 1;
                padding: 0 .5em;
                color:#000;
                cursor:pointer;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                display: flex;
                width: 80%;
                height: 4rem;
                line-height: 2;
                overflow: hidden;
                border-radius: .25em;
                font-size: 1.8rem;
            }

            .text-info select option{
                background: #e3dac9;
            }



            #location-list select{
                outline:0;
                box-shadow:none;

                background-image: none;
                flex: 1;
                padding: 0 .5em;
                color:#000;
                cursor:pointer;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                display: flex;
                width: 80%;
                height: 4rem;
                line-height: 2;

                overflow: hidden;
                border-radius: .25em;
                font-size: 1.8rem;
            }


            #location-list select option{
                background: #e3dac9;
            }

            .create-post-head{
                background: #00AE72;
                height: 25rem;
                font-family: 'Poppins', sans-serif;

            }

            .head-content{
                margin-left: 30rem;
                display: flex;
                justify-content: space-around;
                color: #CD2626;
            }

            .post-step{
                display: flex;
                margin-top: 2rem;
                padding:0 5rem;
            }

            .post-step h2{
                font-size: 2rem;
                color: #000;
            }

            .post-step p{
                padding: 0.3rem 1rem;
                border-radius: 50%;
                background: #000;
                color: #fff;
                font-size: 1.5rem;
                margin-right: 1rem;
                font-family: serif;
                font-weight: bold;
            }

            .round label{
                width: 9.3rem;
                font-size: 1.5rem;
                font-family: 'Poppins', sans-serif;
            }

            .round input{
                border: none;
                border-bottom: 2px solid silver;
            }

            .welfare{
                margin-top: 4rem;
            }

            .welfare .muted-text{
                color: #828282;
            }

            .welfare input{
                margin: 1rem 0;
                text-align: center;
                border: none;
                border-bottom: 1px solid silver;
                font-size: 2rem;
            }

            .welfare button{
                width: 0;
                border: none;
                background: #fff;
                margin-left: 15rem;
            }

            .welfare button i{
                top: 0;
                padding: 0.7rem 1rem;
                border-radius: 50%;
                background-color: #000;
                color: #fff;
                display: inline;
            }

            #welfare-container button{
                margin-left: 0;
                border: none;
                font-weight: bold;
                background: linear-gradient(transparent,transparent);
                transform: translateX(-5rem);

            }

            .foot-btn{
                text-align: center;
            }

            .foot-btn button{
                font-size: 2rem;
                width: 15rem;
                background: #fff;
                color: #000;
                font-weight: bold;                
                box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.3);
                transition: 0.3s ease-in-out;
                padding: 1rem 0;
                margin-left: 0;
            }

            .foot-btn button:active{
                transform: translateY(0.3rem);
            }

            .foot-btn button:hover{
                color: #fff;
                background: #000;
                border: 1px solid #fff;
            }


        </style>

    </head>
    <body>

        <div class="navbar" style="position: fixed">
            <div class="header-info">
                <ul>         
                    <div class="account">           
                        <li>
                            <a href="#">Information Technology Department</a>
                        </li>
                    </div>
                </ul>
            </div>
        </div>

        <nav class="post-list-left">
            <ul>
                <li>
                    <a style="font-size: 2rem;" href="<c:url value="/logout"/>" class="logo">
                        <img
                            src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"
                            alt="Monke Tech"
                            />
                        MonkeTech
                    </a>
                </li>
                <div class="nav-body">
                    <li>
                        <a href="<c:url value="/department"/>">
                            <i class="fa-solid fa-house"></i>
                            <span class="nav-item">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/department" />">
                            <i class="fa-solid fa-list"></i>
                            <span class="nav-item">Post List</span>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/createjobposting" />">
                            <i class="fa-solid fa-folder-plus"></i>
                            <span class="nav-item">Create Post</span>
                        </a>
                    </li>
                </div>
                <li class="logout">
                    <a href="<c:url value="/logout"/>">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span class="nav-item ">Log Out</span>
                    </a>
                </li>
            </ul>
        </nav>



        <div class="create-job-post-right">   
            <div class="head-title">
                <h1>Create a Job Posting</h1>
            </div>
            <div class="post-step">
                <p>1</p>
                <!--style="margin: 2rem 0; color: #000; text-align: center;"-->
                <h2>Job Position</h2>  
            </div>

            <c:url value="/createjobposting" var="action" />
            <form:form id="my-form" method="post" modelAttribute="jobPosting" action="${action}">
                <div id="Concak">   
                    <form:select  path="jobPosition.jobId" required="true">
                        <form:option value="">-- Select Job Position --</form:option>
                        <form:options items="${joPositions}" itemValue="jobId" itemLabel="JobName"></form:options>
                    </form:select>
                </div>

                <div class="post-step" style="margin-top: 5rem; border-top: 2px solid silver; padding-top: 2rem;" >
                    <p>2</p>
                    <h2>General Information</h2>
                </div>

                <div class="container-fluid mt-3 general-info">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="text-info">

                                <h3>Salary</h3>
                                <form:input type="number"  path="salary" min = "0" required="true"/> <i class="fa-solid fa-dollar-sign dollar" style="top: 0;"></i>
                            </div>
                            <%--<form:label path="level">Level</form:label>--%>
                            <div class="text-info">
                                <h3>Level</h3>
                                <form:select path="level" required="true">
                                    <form:option value="">-- Select Level --</form:option>
                                    <form:option value="Intern">Intern</form:option>
                                    <form:option value="Fresher">Fresher</form:option>
                                    <form:option value="Junior">Junior</form:option>
                                    <form:option value="Senior">Senior</form:option>
                                    <%--<form:option value=""></form:option>--%>                                 
                                </form:select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div id="checkbox"  class="text-info">
                                <h3>Type of Job</h3>
                                <form:label path="typeOfWork">Full Time</form:label>                            
                                <form:checkbox  path="typeOfWork" checked="true" value="1"/>
                            </div>
                            <div class="text-info" style="margin-top: 4rem;">
                                <%--<form:label path="exprienceRequirement">Exprience Requirement</form:label>--%>
                                <h3>Year of Exprience Requirement</h3>
                                <form:input type="number" path="exprienceRequirement" min="0" max="10" 
                                            placeholder="Please input the number of Exprience year" /> 
                            </div>
                        </div>
                    </div>

                    <div class="post-step" style="margin-top: 5rem; border-top: 2px solid silver; padding-top: 2rem; padding-left: 0;">
                        <p>3</p>
                        <h2>Detail Information</h2>
                    </div>

                    <div class="row">
                        <div id="location-list" class="col-sm-6" style="margin-top: 2rem;">
                            <h3>Location</h3>
                            <form:select  path="locations" required="true">
                                <form:option value="">-- Select Location --</form:option>
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



                            <%--<form:input type="text" path="welfare" required="true" />--%>
                            <div class="welfare">
                                <h3>Some default welfares</h3>
                                <form:input type="text" path="welfare" class="item-text muted-text" value="A lot of Money if you deligent"  readonly="true"/>
                                <form:input type="text" path="welfare" class="item-text muted-text" value="You can off 2 days per week"  readonly="true"/>
                                <form:input type="text" path="welfare" class="item-text muted-text" value="Oversea traveling 1 time per year"  readonly="true"/>
                                <form:input type="text" path="welfare" class="item-text muted-text" value="You get social insurance periodically "  readonly="true"/>

                                <div id="welfare-container">

                                </div>
                                <button type="button" onclick="addWelfare()"><i class="fa-solid fa-plus"></i></button> <br/>
                            </div>
                        </div>
                        <div id="location-list" class="col-sm-6">
                            <div class="text-info">
                                <h3>Description</h3>
                                <%--<form:input type="text" path="descriptions" required="true"/>--%>
                                <form:textarea cols="100" rows="10" path="descriptions" required="true" /> <br/>
                            </div>

                            <div class="round">


                                <label style="margin-bottom: 3rem;">Number of Rounds:</label>
                                <input style=" text-align: center; font-size: 2rem;" type="number" name="numRounds" min ="0" max="4" onchange="createRounds(this.value)"/><br/>
                                <div id="rounds"></div>
                            </div>
                        </div>
                    </div>                 
                </div>
                <div class="foot-btn">


                    <button id="confirm-post" onclick="confirmPost(event)">Create Job Posting</button>
                </div>
            </form:form>
        </div>
        <script type="text/javascript">
            function addWelfare() {
                //Using JQuery
                var welfareContainer = $("#welfare-container");
                var input = $("<input>").attr({
                    type: "text",
                    name: "welfare",
                    class: "item-text",
                    placeholder: "Enter a welfare benefit"
                });
                var deleteButton = $("<button>").text("X").click(function () {
                    $(this).parent().remove();
                });
                var div = $("<div>").append(input).append(deleteButton);
                welfareContainer.append(div);
            }
            function confirmPost(event) {
                var salaryInput = document.querySelector('input[name="salary"]');
                var expInput = document.querySelector('input[name="exprienceRequirement"]');
                var roundsInput = document.querySelector('input[name="numRounds"]');

                // Check for empty values
                if (salaryInput.value === "" || expInput.value === "" || roundsInput.value === "") {
                    alert("Please fill in all fields");
                    event.preventDefault();
                    return false;
                }


                // Get a reference to the button element
                var button = document.getElementById("confirm-post");

                // Disable the button to prevent multiple submissions
                button.disabled = true;

                // Display a confirmation dialog box
                var confirmed = confirm("Are you sure you want to post?");

                // If the user confirms, submit the form
                if (confirmed) {
                    // Submit the form or perform the desired action
                    // ...
                } else {
                    event.preventDefault();
                }

                // Re-enable the button
                button.disabled = false;
            }
            function createRounds(numRounds) {
                var roundContentArray = [];
                var roundsDiv = document.getElementById("rounds");
                var numRoundsInt = parseInt(numRounds);
                while (roundsDiv.firstChild) {
                    roundsDiv.removeChild(roundsDiv.firstChild);
                }


                for (var i = 1; i <= numRoundsInt; i++) {
                    var roundDiv = document.createElement("div");
                    var roundNumberLabel = document.createElement("label");
                    roundNumberLabel.innerHTML = "Round ";
                    var roundNumberInput = document.createElement("input");
                    roundNumberInput.type = "number";
                    roundNumberInput.name = "jobPosting.rounds[" + (i - 1) + "].roundNumber";
                    roundNumberInput.value = i;
                    roundNumberInput.readOnly = true;
                    var contentLabel = document.createElement("label");
                    contentLabel.innerHTML = "Round " + i + " Content:";
                    var contentInput = document.createElement("input");
                    contentInput.type = "text";
                    contentInput.name = "jobPosting.rounds[" + (i - 1) + "].content";
                    contentInput.required = true;
                    contentInput.oninput = function () {
                        // Lưu giá trị của input vào mảng roundContentArray
                        var currentRound = parseInt(this.name.match(/\[(.*?)\]/)[1]);
                        roundContentArray[currentRound] = this.value;
                        document.getElementById("roundContentArrayInput").value = JSON.stringify(roundContentArray);
                    };
                    roundDiv.appendChild(roundNumberLabel);
                    roundDiv.appendChild(roundNumberInput);
                    roundDiv.appendChild(document.createElement("br"));
                    roundDiv.appendChild(contentLabel);
                    roundDiv.appendChild(contentInput);
                    roundDiv.appendChild(document.createElement("br"));
                    roundDiv.appendChild(document.createElement("br"));
                    roundsDiv.appendChild(roundDiv);
                }

                // Add hidden input field to submit roundContentArray with the form
                var roundContentInput = document.createElement("input");
                roundContentInput.type = "hidden";
                roundContentInput.id = "roundContentArrayInput";
                roundContentInput.name = "roundContentArray";
                roundsDiv.appendChild(roundContentInput);
            }


        </script>
    </body>
</html>