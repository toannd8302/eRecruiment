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
</style>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="AccpPage.css">
    </head>
    <body>
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
</html>

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
</script>