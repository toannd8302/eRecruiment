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
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f1f1f1;
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
    <c:url value="/account/update-information" var="action" />
    <form:form method="post" modelAttribute="user" action="${action}">
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
                        <form:input type="tel" id="phone" path="phone" value="${user.getPhone()}" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <form:textarea id="address" path="address" value="${user.getAddress()}" readonly="true"/>
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
                        <form:input type="text" id="job-name" path="jobName" value="${user.getJobName()}" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="skill">Skill</label>
                        <c:forEach var="item" items="${user.getSkillList()}">
                            ${item}
                        </c:forEach>
                        <%--
                        <!--<input type="text" id="skill" value="HTML, CSS, JavaScript" readonly>-->
                        <div id="welfare-container">
                            <form:select path="skillList" required="false">
                                <form:options items="${skillList}" itemValue="skillId" itemLabel="skillName" required="false"></form:options>
                            </form:select>
                        </div>
                        <div>
                            <button type="button" onclick="addWelfare()"><i class="fa-solid fa-plus"></i></button>
                        </div>
                        --%>
                    </div>
                    <div class="form-group">
                        <label for="experience">Experience Year</label>
                        <form:input type="number" id="experience" path="experience" value="${user.getExperience()}" readonly="true"/>
                    </div>
                </div>
            </div>
            <!--<button class="save-button" name="action" value="save"><i class="fas fa-save"></i> Save</button>-->
            <button name="action" value="save">Save</button>
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
