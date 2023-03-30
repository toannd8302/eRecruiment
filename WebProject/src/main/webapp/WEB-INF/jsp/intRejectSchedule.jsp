<%-- 
    Document   : intRejectSchedule
    Created on : Mar 19, 2023, 10:41:59 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<style>
    html {
        font-family: Arial, Helvetica, sans-serif;
    }
    body {
        font-size: 16px;
    }
    #wrapper {
        margin: 0px auto;
        margin-left: 3rem;
    }
    #wrapper h1 {
        margin-left: 20rem;
        width: 100%;
        text-align: center;
        padding: auto;
    }
    .header {
        display: flex;
        background-color: #25f080;
        margin-bottom: 2rem;
        height: 8.5rem;
    }
    /* Style nav tabs */
    .tabs {
        border-bottom: 1px solid #f5f5f5;
        margin-left: 20rem;
    }
    .nav-tabs {
        display: flex;
        list-style: none;
        margin: 0px;
        padding: 0;
        border-bottom: 3px solid #ddd;
        font-weight: bold;
    }
    .nav-tabs li {
        margin-right: 10px;
    }
    .nav-tabs li a {
        display: block;
        padding: 6px 10px;
        text-decoration: none;
        position: relative;
        color: black;
    }
    .nav-tabs li a:after {
        content: "";
        height: 3px;
        width: 100%;
        position: absolute;
        left: 0px;
        bottom: -3px;
        background-color: transparent;
    }
    .nav-tabs li.active a::after,
    .nav-tabs li:hover a::after {
        background: #e74c3c;
    }
    td {
        padding: 6px 10px;
        text-align: center;
    }
    th {
        padding: 6px 10px;
        text-align: center;
    }
    /* Style tab-content */
    .tab-content {
        padding: 20px, 0px;
    }
    /* Sidebar */
    .sidebar {
        height: 100vh;
        width: 200px;
        position: fixed;
        top: 0;
        left: 0;
        overflow-x: hidden;
        background-color: #baa9a3;
        font-weight: bold;
    }
    .sidebar h1 {
        margin-bottom: 30px;
    }
    .sidebar ul {
        list-style-type: none;
        padding-left: 0;
    }
    .sidebar .action {
        margin-top: 2rem;
    }
    .sidebar li {
        margin-bottom: 5px;
    }
    .sidebar a {
        display: block;
        color: rgb(69, 69, 69);
        padding-top: 2rem;
        padding-bottom: 2rem;
        text-decoration: none;
    }
    .sidebar a:hover {
        background-color: rgb(208, 204, 204);
    }
    .sidebar a.active {
        background-color: rgb(208, 204, 204);
    }
    /* Account */
    .sidebar img {
        width: 13.5rem;
        height: 13.5rem;
        margin-left: 3rem;
        margin-right: 3rem;
        border-radius: 50%;
    }
    #account h2,
    li {
        font-size: 2rem;
        list-style: none;
    }
    #account li a {
        color: black;
    }
    #account ul {
        padding-left: 0%;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        /* align form items to the left */
        justify-content: flex-start;
        /* push form items to the left */
        margin: 20px;
    }
    #reason {
        width: 80%;
        padding: 10px;
        margin: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
    }
    label {
        font-size: 20px;
        font-weight: bold;
        margin-top: 10px;
    }
    input[type="text"]{
        width: 100%;
    }
    input[type="file"] {
        padding: 10px;
        margin: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
        font-size: 16px;
    }
    .error-message {
        color: red;
        font-size: 16px;
        margin-top: 10px;
        display: none;
    }
    .file-label {
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #007bff;
        color: #fff;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
    .file-label input[type="file"] {
        display: none;
    }
    .file-label span {
        margin-right: 10px;
    }
</style>
<!-- Sidebar Here -->
<div class="sidebar">
    <div class="row">
        <div>
            <img src="https://pbs.twimg.com/media/FpvBfcyacAIaM64?format=jpg&name=large" />
        </div>
    </div>
    <div class="action">
        <ul>
            <li><a href=""><i class="fa-solid fa-list"></i> Schedule List</a></li>
            <li><a href="#"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
        </ul>
    </div>
</div>
<c:url value="/interviewer/schedules/schedule-detail/reject" var="action" />
<div id="wrapper">
    <div class="header">
        <h1>Schedule Report</h1>
        <h1>Welcome Interviewer</h1>
    </div>
    <div class="tabs">
        <div class="tab-content">
            <div id="pending" class="tab-content-item">
                <form:form method="post" modelAttribute="IRS" action="${action}" enctype="multipart/form-data">
                    <label for="reason" style="margin-right: 10px;">Reason:</label>
                    <form:textarea path="reasonContent" type="text" id="reason" name="reason" style="padding: 20px; margin-bottom: 10px;" required="true"/>

                    <label for="file-input" class="file-label">
                        <span>Choose a file</span>
                        <form:input type="file" path="file" id="file-input" name="file-input"/>
                    </label>
                    
                    <button type="submit" name="action" value="reject">Submit</button>

                    <div id="error-message" class="error-message" style="display: none;">
                        Please fill in all fields.
                    </div>
                    
                    <form:hidden path="scheduleId" value="${IRS.getScheduleId()}"/>
                    <form:hidden path="employeeId" value="${IRS.getEmployeeId()}"/>
                </form:form> 
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
    $(document).ready(function () {
        $('.tab-content-item').hide();
        $('.tab-content-item:first-child').fadeIn();
        $('.nav-tabs li').click(function () {
            //Active nav tabs
            $('.nav-tabs li').removeClass('active');
            $(this).addClass('active');
            //Show tab-content item
            let id_tab_content = $(this).children('a').attr('href');
            // alert(id_tab_content);
            $('.tab-content-item').hide();
            $(id_tab_content).fadeIn();
            return false;
        });
    });
    // Check if all fields are filled in before submitting the form
    const form = document.querySelector('form');
    form.addEventListener('submit', (event) => {
        const reason = document.getElementById('reason').value;
        const file = document.getElementById('file').value;
        if (!reason || !file) {
            event.preventDefault();
            document.getElementById('error-message').style.display = 'block';
        }
    });
</script>