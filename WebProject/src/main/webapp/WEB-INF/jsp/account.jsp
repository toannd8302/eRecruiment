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
        background-color: #f1f1f1;
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
        background: #000;
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

    
    .container {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-top: 15rem;
    }

    .box {
        width: 100%;
        margin-bottom: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #f1f1f1;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .header h2 {
        font-size: 18px;
    }

    .actions button {
        background-color: transparent;
        border: none;
        cursor: pointer;
    }

    .content {
        padding: 10px;
    }

    .form-group {
        margin-bottom: 10px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    .form-group input:focus,
    .form-group textarea:focus {
        outline: none;
        border-color: #007bff;
    }

    .save-button {
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }

    .save-button:hover {
        background-color: #0069d9;
    }

    .edit-button {
        padding: 5px;
        border: none;
        cursor: pointer;
    }

    .edit-button:hover {
        color: #007bff;
    }

    .active {
        background-color: #007bff;
        color: #fff;
    }

    #welfare-container button{
        margin-left: 0;
        border: none;
        font-weight: bold;
        background: linear-gradient(transparent,transparent);
        transform: translateX(-5rem);

    }
</style>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    
    <c:url value="/update" var="action" />
    <form:form action="${action}" method="POST" modelAttribute="user">
        <div class="container">
            <div class="box">
                <div class="header">
                    <h2>Account Information</h2>
                    <div class="actions">
                        <button class="edit-button"><i class="fa-solid fa-user-pen"></i></button>
                    </div>
                </div>
                <div class="content">
                    <div class="form-group">
                        <label for="full-name">Full Name</label>
                        <form:input type="text" id="full-name" path="name" value="${user.getName()}" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <form:input type="email" id="email" path="email" value="${user.getEmail()}" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <form:input type="text" id="phone" path="phone" value="${user.getPhone()}" />
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <form:textarea id="address" path="address" value="${user.getAddress()}"/>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="header">
                    <h2>Job Information</h2>
                    <div class="actions">
                        <button class="edit-button"><i class="fas fa-edit"></i></button>
                    </div>
                </div>
                <div class="content">
                    <div class="form-group">
                        <label for="job-name">Job Name</label>
                        <form:input type="text" id="job-name" path="jobName" value="${user.getJobName()}"/>
                    </div>
                    
                    <div class="form-group">
                        <label for="experience">Experience Year</label>
                        <form:input type="number" id="experience" path="experience" value="${user.getExperience()}"/>
                    </div>
                </div>
            </div>
            <!--<button class="save-button" name="action" value="save"><i class="fas fa-save"></i> Save</button>-->
            <button class="save-button"><i class="fas fa-save"></i> Save</button>
        </div>
    </form:form>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

<script>
    const boxes = document.querySelectorAll('.box');

// loop through each box and attach event listeners to buttons
    boxes.forEach((box) => {
        const editButton = box.querySelector('.edit-button');
        const saveButton = box.nextElementSibling;

        // when edit button is clicked, switch to edit mode
        editButton.addEventListener('click', () => {
            editButton.classList.add('active');
            box.querySelectorAll('input, textarea').forEach((element) => {
                element.removeAttribute('readonly');
            });
            saveButton.classList.remove('hidden');
        });

        // when save button is clicked, switch back to view mode and save data
        saveButton.addEventListener('click', () => {
            editButton.classList.remove('active');
            box.querySelectorAll('input, textarea').forEach((element) => {
                element.setAttribute('readonly', true);
            });
            saveButton.classList.add('hidden');
            saveData(box);
        });
    });

// save data to local storage
    function saveData(box) {// get all boxes
        const boxes = document.querySelectorAll('.box');

        // loop through each box and attach event listeners to buttons
        boxes.forEach((box) => {
            const editButton = box.querySelector('.edit-button');
            const saveButton = box.nextElementSibling;

            // when edit button is clicked, switch to edit mode
            editButton.addEventListener('click', () => {
                editButton.classList.add('active');
                box.querySelectorAll('input, textarea').forEach((element) => {
                    element.removeAttribute('readonly');
                });
                saveButton.classList.remove('hidden');
            });

            // when save button is clicked, switch back to view mode and save data
            saveButton.addEventListener('click', () => {
                editButton.classList.remove('active');
                box.querySelectorAll('input, textarea').forEach((element) => {
                    element.setAttribute('readonly', true);
                });
                saveButton.classList.add('hidden');
                saveData(box);
            });
        });

        // save data to local storage
        function saveData(box) {
            const inputs = box.querySelectorAll('input, textarea');
            const data = {};
            inputs.forEach((input) => {
                data[input.name] = input.value;
            });
            localStorage.setItem(box.id, JSON.stringify(data));
        }

        // load saved data on page load
        window.addEventListener('load', () => {
            boxes.forEach((box) => {
                const savedData = localStorage.getItem(box.id);
                if (savedData) {
                    const data = JSON.parse(savedData);
                    const inputs = box.querySelectorAll('input, textarea');
                    inputs.forEach((input) => {
                        input.value = data[input.name];
                    });
                }
            });
        });
    }

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
</script>
