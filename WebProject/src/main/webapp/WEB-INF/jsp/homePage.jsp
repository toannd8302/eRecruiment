<%-- 
    Document   : homePage
    Created on : Feb 6, 2023, 9:51:54 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Font here -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kaushan+Script&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aladin&amp;display=swap">

<!-- Bootstrap here -->
<!--<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css%22%3E">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>-->

<style>
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
        margin: 0;
    }



    #banner {
        width: 100%;
        height: 100%;
        padding-top: 50%;
        background: url('https://github.com/Toannd832/eRecruiment/blob/Thang/Home_Page_For_Web/img/banner.jpg?raw=true') top center / cover no-repeat;
    }

    #banner #search-box {
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        /* bottom: 50%; */
        margin-top: 18rem;
    }

    #banner #search-box h1:first-child {
        font-family: Acme, sans-serif;
        font-size: 6rem;
        margin-bottom: 3rem;
    }

    #banner #search-box h1 {
        font-family: 'Kaushan Script', serif;
        text-transform: uppercase;
        font-size: 6rem;
        margin-bottom: 3rem;
    }


    #banner #search-box input {
        padding: 1rem 20rem;
        border-radius: 1rem;
    }

    #banner #search-box button {
        padding: 1rem 2rem;
        border-radius: 0.5rem;
    }




    /* CSS for introduce */
    #introduce {
        /* height: 1000px; */
        margin-top: 5rem;
        margin-bottom: 10rem;
    }

    #introduce #intro-head {
        margin-bottom: 5rem;
        text-align: center;
        font-size: 1.5rem;

    }

    #introduce #intro-head h1 {
        text-transform: uppercase;
        margin-bottom: 2rem;
        font-size: 4rem;
    }

    #introduce #intro-body {
        margin-left: 8rem;
        margin-right: 5rem;
        font-size: 1.5rem;
    }

    #introduce #intro-body .intro-info {
        width: 40rem;
        text-align: center;
    }

    #intro-body .intro-info i {
        display: inline-block;
        margin-bottom: 2rem;
        font-size: 5rem;
        padding: 4rem;
        border-radius: 50%;
        background-color: rgb(238, 190, 58);
    }


    /* CSS for hot-jobs */

    #hot-jobs {
        margin-bottom: 5rem;
    }

    #hot-jobs>h1 {
        text-align: center;
        text-transform: uppercase;
        font-size: 3rem;
        margin-bottom: 2rem;
        color: rgb(171, 36, 36);
    }

    #job-posting {
        border: 1px solid black;
        width: 80%;
        padding: 3rem;
        border-radius: 2rem;
        background-color: rgb(170, 215, 248);
        margin-left: 15rem;
        margin-bottom: 2rem;
    }

    #hot-jobs #job-posting img {
        width: 15rem;
        height: 15rem;
        border-radius: 1rem;
        margin-right: 5rem;
        margin-top: 1rem;
    }


    #hot-jobs #job-posting .col-sm-6 a {
        text-decoration: none;
        color: rgb(225, 97, 225);
    }

    #hot-jobs #job-posting .col-sm-6 {
        font-size: 2rem;
    }

    #hot-jobs #job-posting .col-sm-4 {
        margin-top: 12rem;
        font-size: 1.2rem;
    }

    #hot-jobs #job-posting .col-sm-4 h2 {
        margin-bottom: 1rem;
    }


    #hot-jobs #job-posting .col-sm-4 button {
        padding: 0.5rem 5rem;
        font-size: 1.5rem;
        border-radius: 1rem;
    }

    #hot-jobs #job-posting .col-sm-4 .apply-btn a {
        text-decoration: none;
        color: black;
    }



    .dialog{
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%) scale(0.1);
        width: 30%;
        text-align: center;
        visibility: hidden;
        opacity: 0;
        transition: transform 0.5s;
    }


    .dialog:target{
        visibility: visible;
        opacity: 1;
        transform: translate(-50%,-50%) scale(1);
    }

    .overlay{
        background-color: #ffffff;
        border: 1px solid black;
        border-radius: 0.5rem;
    }

    .dialog-body i{
        padding: 3rem;
        background-color: rgb(52, 153, 52);
        border-radius: 50%;
        margin-top: -50%;
        font-size: 5rem;
        width: 13rem;
        color: white;
        margin-bottom: 2rem;
        box-shadow: 0 0.2rem 1rem rgba(0, 0, 0, 0.2);
    }

    .dialog-body button{
        margin-bottom: 2rem;
        border-radius: 0.5rem;
    }

    .dialog-body button a{
        text-decoration: none;
    }

    #ok-btn{

        font-size: 1.5rem;
        padding: 0.5rem 2rem;
        color: black;

    }

</style>

<!-- Header here -->

<body>
    <div id="banner">

        <div id="search-box">
            <h1>Welcome to our company</h1>
            <h1>Find your dream job</h1>
            <form action="<c:url value="/${keyword}"/>">
                <input type="text" name="keyword" placeholder="I'm looking for..." width="10rem" height="20rem">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </div>




    <div id="introduce">
        <div id="intro-head">
            <h1>find your job and come to us</h1>
            <p class="text-muted">A wise man know where he belongs to</p>
        </div>
        <div id="intro-body">
            <div class="row">
                <div class="col-sm-4">
                    <div class="intro-info">
                        <i class="fa-regular fa-heart"></i>
                        <h1>SUITABLE JOBS</h1>
                        <p class="text-muted">Find a job that suitable to your passion and inclination.</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="intro-info">
                        <i class="fa-sharp fa-solid fa-laptop"></i>
                        <h1>DEVELOPER'S WORLD</h1>
                        <p class="text-muted">As a technology company, we are seeking passionate developers and give
                            them the best
                            environment for them to work and become the best of version of themselves.</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="intro-info">
                        <i class="fa-solid fa-hand-holding-dollar"></i>
                        <h1>GOOD WELFARE</h1>
                        <p class="text-muted">If you work for us, you will&nbsp; not suffer any losses. You will enjoy
                            the best
                            perks and benefits we have for you.</p>

                    </div>
                </div>
            </div>

        </div>
    </div>




    <!-- Hot job here -->
    <div id="hot-jobs">
        <h1>Today Hot Jobs</h1>
        <c:forEach var="item" items="${list}">
            <div id="job-posting">

                <div class="row">
                    <div class="col-sm-2">
                        <div class="imgage">
                            <img src="https://dotnet.microsoft.com/static/images/redesign/social/square.png" alt="">
                        </div>
                    </div>
                    <div class="col-sm-6" id="job-posting-item">
                        <div class="job-intro">
                            <h1><a href="<c:url value="/post-detail/${item.postId}"/>">${item.jobPosition.jobName}</a></h1>
                            <h3>Công ty phần mềm Monke Tech</h3>
                            <p>Địa điểm: ${item.locations}</p>
                            <p>Mức lương: ${item.salary}</p>
                            <p>Cấp bậc: nhân viên</p>
                            <p>Yêu cầu: </p>
                            <c:forEach var="skill" items="${item.jobPosition.getSkills()}">

                                ${skill.skillName}
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <h2>Ngày đăng: 20/02/2023</h2>
                        <h2>Ngày hết hạn:30/04/2023</h2>
                        <button class="apply-btn"><a href="#">Ứng tuyển ngay</a></button>
                        <!--<button class="save-btn"><a class="dialog-btn" href="">Lưu tin</a></button>-->
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>




    <div class="dialog overlay" id="my-dialog">
        <div class="dialog-body">
            <i class="modal-title fa-solid fa-check"></i>
            <h2>Saved job successfully</h2>
            <button><a href="#hot-jobs" id="ok-btn">OK</a></button>
        </div>
    </div>

</body>









