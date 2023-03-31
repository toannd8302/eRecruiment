<%-- 
    Document   : managerAllApplications
    Created on : Mar 23, 2023, 8:26:03 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>


<style>
    @import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&family=Poppins:wght@400;600;800&display=swap');
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
    }
    * {
        box-sizing: border-box;
        margin: 0;
    }

    body{
        background: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url('https://images.unsplash.com/photo-1521737711867-e3b97375f902?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80');
        background-size: cover;
        background-position: center;
        /*background-repeat: no-repeat;*/
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
        background: black;
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
        justify-content: end;
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
        background: linear-gradient(rgba(0, 0, 0, 1), rgba(0, 0, 0, 1));
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
    .post-list-right{
        left: 10%;
        width: 80%;

        margin-top: 12rem;
        position:relative;
        top: 18%;
        background-color: #fff;
        /*        VỪA MỚI THỆM VÀO LÚC 11H NGÀY 9/3/2023 BỞI TOÀN*/
        border-radius: 1rem;
    }
    .post-list-right .table thead{
        background-color: #00b14f;
        color: white;
    }
    .post-list-right h1{
        font-weight: bold;
        font-size: 3.5rem;
        color: orangered;
    }
    .trash-bin{
        cursor: pointer;
    }
    .styled-table {
        border-collapse: collapse;
        margin: 3rem 0;
        font-size: 0.9em;
        font-family: sans-serif;
        /*min-width: 400px;*/
        width: 100%;
        border-radius: 5px 5px 0 0;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    }
    .styled-table thead tr {
        background-color:  #009688;
        color: #ffffff;
        text-align: left;
    }
    .styled-table th{
        font-size: 2rem;
        font-weight: bold;
        padding: 2rem 3rem;
        text-align: center;
    }
    .styled-table td {
        padding: 2rem 3rem;
        font-size: 1.5rem;
        text-align: center;
    }
    .styled-table tbody tr {
        border-bottom: 1px solid #dddddd;
    }
    .styled-table tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }
    .styled-table tbody tr:last-of-type {
        border-bottom: 2px solid #009879;
    }
    .styled-table tbody tr.active-row {
        font-weight: bold;
        color: #009879;
    }
    .blank{
        height: 2.5rem;
    }
    .trash-bin{
        margin-bottom: 1rem;
        color:black;
    }


    .hr-modal{
        background: #fff;
        position: absolute;
        top: 15%;
        width: 80%;
        left: 10%;
        border-radius: 1rem;
        overflow: hidden;
    }

    .hr-modal .hr-modal-inner{
        width: 50%;
        position: relative;
        top: 30%;
        left: 50%;
        transform: translate(-50%,-50%);
        background: #000;
        border-radius: 0.5rem;
        overflow: hidden;
        animation: hr-modalShow 0.1s linear;
        /* height: 50rem; */
    }

    .hr-modal .hr-modal-header{
        display: flex;
        justify-content: space-between;
        padding: 1rem;
        background: #000;
        color: #000;
    }

    .hr-modal .hr-modal-header h1{
        font-size: 3rem;
    }

    .hr-modal .hr-modal-header i{
        font-size: 2rem;
        cursor: pointer;
    }

    .hr-modal .hr-modal-body h2{
        margin: 1rem 0;
    }

    .hr-modal .hr-modal-footer{
        padding: 1rem;
        text-align: right;
    }

    .hr-modal .hr-modal-footer button{
        font-size: 1.5rem;
        padding: 0.5rem 0.8rem;
        border-radius: 0.5rem;
        background: #669999;
        border: none;
        color: #fff;
        outline: none;
        cursor: pointer;
    }
    .modal-header{
        background: #000;
        color: #fff;
        display: flex;
        justify-content: space-between;
    }
    .modal-header h1{
        margin-left: -60rem;
    }
    .modal-header i{
        margin-right: -60rem;
        font-size: 3rem;
        cursor: pointer;
    }
    .hr-hide{
        display: none;
    }

    @keyframes hr-modalShow {
        from{
            left: 50%;
            top: 0;
        }

        to{
            top: 30%;
            transform: translate(-50%, -50%);
        }
    }

    .swal2-popup {
        font-size: 1.6rem !important;
        font-family: Georgia, serif;
    }

    .tabs {
        display: flex;
        position: relative;
        background: #669999;
    }
    .tabs .line {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 0;
        height: 6px;
        border-radius: 15px;
        background-color: #669999;
        transition: all 0.2s ease;
    }

    .tab-item {
        padding: 1.5rem 1rem;
        font-size: 2rem;
        text-align: center;
        color: #333;
        cursor: pointer;
        transition: all 0.5s ease;

    }

    .tab-icon {
        font-size: 24px;
        width: 32px;
        position: relative;
        top: 2px;
    }

    .tab-item:hover {
        opacity: 1;
        background-color: rgba(194, 53, 100, 0.05);
        border-color: rgba(194, 53, 100, 0.1);
    }
    .tab-item.active {
        opacity: 1;
        background-color: #fff;
    }

    .tab-pane {
        color: #333;
        display: none;
    }
    .tab-pane.active {
        display: block;
    }

    .tab-pane h3{
        margin: 0;
        font-weight: bold;
    }


    .report p{
        color: #828282;
        font-style: italic;
        padding: 1rem 0;
        font-size: 2rem;
    }

    .report h4{
        text-decoration: underline;
        font-weight: bold;
    }

    #view-btn{
        border-radius: 0.5rem;
        background: #fff;
        border: 0.5rem black solid;
        font-weight: bold;
    }
</style>

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
                <div class="account">
                    <sec:authorize access="isAuthenticated()">
                        <li>
                            <img
                                src="<c:url value="${sessionScope.user.getPicture()}"/>"
                                alt="avatar"/>
                            <a href="#">${sessionScope.user.name}</a>                            
                            <ul>
                                <li><a href="<c:url value="/logout"/>">Logout</a></li>
                            </ul>
                        </li>
                    </sec:authorize>    
                </div>

            </ul>
        </div>
    </div>

    <c:url value="/manager/jobapps/job-app-detail" var="action"/>

    <div class="post-list-right">
        <div class="container mt-3">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Job</th>                       
                        <th>Apply Date</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>View Detail</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" varStatus="counter" items="${JobApps}">
                        <form:form action="${action}" method="GET" modelAttribute="JobApps">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${item.getJobPosting().getJobPosition().getJobName()}</td>                          
                                <td> <fmt:formatDate value="${item.getCreatedTime()}" pattern="dd-MM-yyyy"/></td>
                                <td>${item. getCandidate().name}</td>
                                <td>${item. getCandidate().email}</td>
                                <td><button id="view-btn" onclick="viewReport()">View</button></td> 
                            </tr>
                        <input type="hidden" name="jobAppId" value="${item.applicationId}" />   
                    </form:form>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>





</body>