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
            @import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&family=Poppins:wght@400;600;800&display=swap');
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
                opacity: 0.8;
            }

            .post-list-left .nav-body{
                margin-top: 12rem;
            }

            .post-list-left .nav-body li{
                margin-top: 2rem;
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
            .post-list-left .fa-solid{
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
                background: #eee;
                color: black;
            }
            nav:hover{
                width: 28rem;
                transition: all 0.5s ease;
            }
            nav:hover .logo{
                transform: translateX(30%);
                background: #5c6664;
            }
            .logout{
                position: absolute;
                top: 90%;
                bottom: 0%;
            }
            .create-job-post-right {
                position: absolute;
                width: 80%;
                left: 20%;
                padding-left: 2rem;
                top: 20%;
                /*margin-top: 1rem;*/
                background: #fff;
                border-top-left-radius: 1rem;
                padding-bottom: 8rem;
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
                font-size: 2.5rem;
                font-family: 'Poppins', sans-serif;
            }

            .text-info select{
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
                color:#000;
                cursor:pointer;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                display: flex;
                width: 80%;
                height: 4rem;
                line-height: 2;
                background: #bcb88a;
                overflow: hidden;
                border-radius: .25em;
                font-size: 1.8rem;
            }

            .text-info select option{
                background: #e3dac9;
            }



            #location-list select{
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
                color:#000;
                cursor:pointer;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                display: flex;
                width: 80%;
                height: 4rem;
                line-height: 2;
                background: #bcb88a;
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
                margin-top: 4rem;

            }

            .post-step h2{
                font-size: 4rem;
                color: #008B45;
            }

            .post-step p{
                padding: 0.3rem 1.6rem;
                border-radius: 50%;
                background: #006400;
                color: #fff;
                font-size: 3rem;
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
                margin-left: 17rem;
            }

            .welfare button i{
                top: 0;
                padding: 0.7rem 1rem;
                border-radius: 50%;
                background-color: #008B00;
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
                /*margin-left: 2rem;*/
            }

            .foot-btn button{
                font-size: 2rem;
                width: 105rem;
                background: #C60000;
                color: #eee;
                font-weight: bold;
                border: none;
                box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.3);
                transition: 0.3s ease-in-out;
                padding: 1rem 0;
                margin-left: 5rem;
            }

            .foot-btn button:active{
                transform: translateY(0.3rem);
            }

            .foot-btn button:hover{
                background: #CD0000;
                background: #fff;
                color: red;
                border: 1px solid red;
            }

        </style>

    </head>
    <body style="background: #FAF0E6">

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
                <div class="nav-body">


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
                </div>
                <li class="logout">
                    <a href="<c:url value="/logout"/>">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span class="nav-item ">Log Out</span>
                    </a>
                </li>
            </ul>
        </nav>


        <div class="create-post-head">
            <div class="head-content">
                <h1 style="font-weight: bold; font-size: 6rem; margin-top: 6rem; color:#fff;">Create a Job Posting</h1>
                <h1 style="font-family: 'Poppins', sans-serif; font-weight: bold; color: #FFD39B;" class="nav-item">${sessionScope.department.departmentName} Department</h1>
            </div>    
        </div>

        <div class="create-job-post-right">      
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

                <div class="container-fluid mt-3">
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

                    <div class="post-step" style="margin-top: 5rem; border-top: 2px solid silver; padding-top: 2rem;">
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
                                <input style=" text-align: center; font-size: 2rem;" type="number" name="numRounds" min ="0" onchange="createRounds(this.value)"/><br/>
                                <div id="rounds"></div>
                            </div>
                        </div>
                    </div>                 
                </div>
                <div class="foot-btn">


                    <button id="confirm-post" onclick="confirmPost(event)">Post</button>
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