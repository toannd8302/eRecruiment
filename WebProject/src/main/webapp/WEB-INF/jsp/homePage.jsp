<%-- 
    Document   : homePage
    Created on : Feb 6, 2023, 9:51:54 AM
    Author     : KHOA
--%>



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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css" integrity="sha256-sWZjHQiY9fvheUAOoxrszw9Wphl3zqfVaz1kZKEvot8=" crossorigin="anonymous">

<style>
    @import url("https://fonts.googleapis.com/css2?family=Climate+Crisis&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=Noto+Sans+Lepcha&display=swap");
    @import url("https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:wght@400;700&family=Climate+Crisis&family=IBM+Plex+Mono:wght@400;600&family=Noto+Sans+Lepcha&display=swap");
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
        /* height: 50vh; */
        padding-top: 40%;
        background: url("https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Blue%20Modern%20Tips%20Business%20Banner.png?raw=true")
            top center / cover no-repeat;
    }

    #banner #search-box {
        text-align: center;
        position: absolute;
        top: 10%;
        right: 0%;
        transform: translate(-50%, -50%);
        color: white;
        /* bottom: 50%; */
        margin-top: 30rem;
        color: #393a3a;

        /* font-family: "Atkinson Hyperlegible", sans-serif;
        font-family: "Climate Crisis", cursive; */
    }

    #banner #search-box h1:first-child {
        font-family: "Noto Sans Lepcha", sans-serif;
        font-size: 6rem;
        margin-bottom: 3rem;
        margin-top: 8rem;
    }

    #banner #search-box h1 {
        font-family: "Noto Sans Lepcha", sans-serif;
        text-transform: uppercase;
        font-size: 6rem;
        margin-bottom: 4rem;
        margin-top: 4rem;
        margin-right: -10rem;
        font-weight: bold;
    }

    #banner #search-box p {
        font-size: 2rem;
        margin-right: -50rem;
        width: 42rem;
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
        text-align: center;
        text-transform: uppercase;
        font-size: 4rem;
        margin-bottom: 2rem;
        color: rgb(171, 36, 36);
        font-weight: bold;
        font-family: 'IBM Plex Mono', monospace;
        display: inline-block;
        margin-left: 1rem;
    }

    #introduce #intro-body {
        margin-left: 5rem;
        margin-right: 5rem;
        font-size: 1.5rem;
    }

    #introduce #intro-body .intro-info {
        width: 40rem;
        text-align: center;
    }

    #intro-body .intro-info i {
        margin-bottom: 2rem;
        font-size: 5rem;
        padding: 4rem;
        border-radius: 50%;
        background-color: rgb(238, 190, 58);
        animation: rotate 3s infinite linear;
    }

    #intro-body .intro-info i:hover {
        /* transform: rotate3d(1,0,1,360deg); */
        animation: rotate 1s infinite reverse;
    }

    @keyframes rotate {
        to {
            transform: rotateY(360deg);
        }
    }
    /* CSS for hot-jobs */

    #job-post-title {
        text-align: center;
        text-transform: uppercase;
        font-size: 4rem;
        margin-bottom: 2rem;
        color: rgb(171, 36, 36);
        font-weight: bold;
        font-family: 'IBM Plex Mono', monospace;
        margin-right: 3rem;
    }
    .hot-jobs {
        margin-left: 13rem;
    }

    .hot-jobs .hot-post {
        border: 1px solid black;
        border-top: 5px solid rgb(94, 93, 93);
        padding: 2rem;
        margin: 2rem;
    }
    .hot-jobs .hot-post a {
        text-decoration: none;
        color: black;
    }


    .hot-jobs .hot-post h3 {
        font-weight: bold;
        margin-bottom: 1.5rem;
    }

    .hot-jobs .hot-post p {
        font-size: 1.5rem;
    }

    .hot-jobs .hot-post .salary {
        color: rgb(250, 31, 31);
    }
    .hot-jobs .hot-post .post-down i {
        margin-right: 1rem;
        font-size: 2rem;
        cursor: pointer;
        width: 4rem;
        display: block;
        text-align: center;
        padding: 1rem;
        transition: 0.3s ease;
    }

    .hot-jobs .hot-post .post-down i:hover {
        border-radius: 50%;
        background-color: rgb(170, 249, 203);
    }

    .hot-jobs .hot-post .post-down i:active {
        border-radius: 50%;
        background-color: aquamarine;
        transition: 0.3s ease;
    }

    .hot-jobs .hot-post .post-down {
        width: 100%;
        display: flex;
        justify-content: space-between;
    }

    .product-area-list {
        padding-top: 5rem;
        margin-left: 5.8rem;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        padding-bottom: 10rem;
    }

    .product-area-list .product {
        border-radius: 1rem;
        width: 80%;
        text-align: center;
        transition: 0.3s ease-in-out;
    }

    .product-area-list .product:hover {
        box-shadow: 0 0 1rem rgba(0, 0, 0, 0.5);
        transform: scale(1.2);
        cursor: pointer;
    }

    .product-area-list .product h1 {
        font-size: 3.5rem;

    }

    .product-area-list .product h1 a{
        text-decoration: none;
        color: #2e2e2e;
    }

    .product-area-list .product a{
        font-size: 2rem;
        color: rgb(208, 41, 203);
        text-decoration: none;
    }

    .product-area-list .product a i{
        font-size: 1.7rem;
        margin-left: 0.5rem;
    }

    .product-area-list .product p {
        font-size: 1.5rem;
    }

    .product-area-list .product i {
        font-size: 4rem;
        color: rgb(185, 27, 185);
        transition: 0.2s ease-in-out;
    }

    .product-area-list .product:hover i {
        color: rgb(243, 20, 243);
        transform: scale(1.1);
    }

    .product-area-list .product .welfare{
        width: 33rem;
        overflow: hidden;
        text-align: center;
        margin-left: 3rem;
        max-height: 9rem;
    }

    .product-area-list .product .welfare::after{
        content: '...';
    }



    #seek-job{
        text-align: center;
        text-transform: uppercase;
        font-size: 4rem;
        margin-bottom: 2rem;
        color: rgb(171, 36, 36);
        font-weight: bold;
        font-family: 'IBM Plex Mono', monospace;
    }

    .search-job{
        width: 100%;
        height: 30vh;
        /* background: linear-gradient(#5e5e60,#3b3be0); */
        display: flex;
        align-items: center;
    }

    .search-job .search-bar{
        width: 85%;
        background: rgba(200, 200, 200, 0.4);
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 2rem;
        padding: 1rem 2rem;
        margin-left: 10rem;
        opacity: 0.8;
    }

    .search-bar input{
        background: transparent;
        flex: 1;
        border: 0;
        outline: none;
        padding: 1.5rem 1.5rem;
        font-size: 2rem;
        color: #000;
    }

    ::placeholder{
        color: #2e2e2e;
    }

    .search-bar button {
        width: 5rem;
        height: 5rem;
        border: 0;
        border-radius: 50%;
        background: #58629b;
        cursor: pointer;
    }

    .search-bar button i{
        font-size: 2rem;
    }

    .search-bar button:hover{
        background-color: #b8b8b8;
    }


    .search-result{
        width: 85%;
        border: #a8a8a8 1px solid;
        margin-left: 10rem;
        margin-bottom: 5rem
    }

    .search-result{
        border-radius: 1rem;
    }
    .search-result .result-post{
        border-top: #a8a8a8 1px solid;
        display: flex;
        justify-content: space-between;
        transition: background-color 0.3s ease;  
    }

    .search-result .result-post:hover{
        background-color: rgb(252, 222, 252);
    }

    .search-result .result-post:hover img{
        opacity: 1;
        background-color: white;
    }

    .search-result .result-post:hover .post-down {
        opacity: 1;
        background-color: white;
    }

    .search-result .result-post img{
        box-shadow: 0 0 0.5rem rgba(0, 0, 0, 0.3);
        height: 17rem;
        width: 17rem;
        transition: background-color 0.3s ease;
        background-color: white;
    }

    .search-result .result-post h2{
        font-size: 3rem;
        font-weight: bold;
    }

    .search-result .result-post h2 a{
        text-decoration: none;
        color: black;
    }

    .search-result .result-post p{
        font-size: 1.5rem;
        margin-left: 1rem;
    }

    .search-result .result-post i{
        margin-right: 1rem;
    }

    .search-result .result-post .post-down{
        padding: 0.5rem;
        box-shadow: 0 0 0.5rem rgba(0, 0, 0, 0.3);
        display: inline-block;
        background-color: white;
        border: 2px solid white;
        border-radius: 0.5rem;
        display: flex;
    }

    .search-result .result-post .post-down .skill-lists{
        display: flex;
    }

    .search-result .result-post .result-post-right{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .search-result .result-post .result-post-right i{
        margin-top: 2rem;
        font-size: 3rem;
        width: 5rem;
        padding: 1rem;
        text-align: center;
        transition: 0.3s ease;

    }


    .search-result .result-post .result-post-right p{
        margin-right: 1rem;
        font-style: italic;
        color: rgb(47, 47, 246);
    }

    .search-result .result-post .result-post-right i:hover{
        background-color: rgb(246, 248, 114);
        border-radius: 50%;
    }

    .search-result .result-post .result-post-right i:active{
        background-color: aquamarine;
        border-radius: 50%;
    }


    .contact-us{
        background: url('https://images.unsplash.com/photo-1423666639041-f56000c27a9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80')top center / cover no-repeat;
        width: 100%;
        height: 80vh;
    }

    .contact-form h1{
        border-bottom: 0.4rem solid black;
        display: inline-block;
        text-align: center;
        margin-left: 65rem;
        font-size: 4rem;
        color: white;
        padding-top: 2rem;
    }

    .contact-form .text-items{
        display: flex;
        flex-direction: column;
        margin-left: 35rem;
        margin-top: 5rem;
    }

    .contact-form .text-items h2{
        margin: 2rem 0;
        color: white;
    }

    .contact-form .text-items input{
        width: 70%;
        border-radius: 1rem;
        height: 4rem;
        font-size: 2rem;
        opacity: 0.6;
        background: linear-gradient(150deg,#64aef9,#fff);
    }

    .contact-form button{
        width: 10rem;
        border-radius: 0.5rem;
        opacity: 0.8;
        background: linear-gradient(150deg,#3c9eff,#196c79);
        border: none;
        margin-left: 68rem;
        margin-top: 3rem;
    }

    .contact-form button a{
        text-decoration: none;
        font-size: 2.5rem;
        color: #fff;
    }

    .contact-form button:hover{
        background: linear-gradient(150deg,#153e68,#196c79);
    }


    .modal-btn{
        background:linear-gradient(transparent, transparent);
        border: none;
    }

    .modal .modal-content .modal-header h2{
        margin-left: 11.5rem;
        font-weight: bold;
    }

    .modal .modal-content .modal-body i{
        display: inline-block;
        font-size: 3.5rem;
        padding: 0.3rem 0.5rem;
        background: #006400;
        color: #fff;
        border-radius: 50%;

        margin-left: 21.5rem;
    }

    .modal .modal-content .modal-footer{
        margin-right: 22.5rem;
        border-top: o;
        font-size: 2rem;
    }
</style>

<!-- Header here -->

<body>
    <div id="banner">
        <div id="search-box">
            <h1>GROW YOUR</h1>
            <h1>CARRER NOW</h1>
            <p>We have been a software company since 2010. 
                Let us help your problem in this digital age</p>
        </div>

    </div>

    <div id="introduce">
        <div id="intro-head">
            <h1>find your job and come to us</h1>
            <p class="text-muted" style="font-weight: bold;">A wise man know where he belongs to</p>
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
    <h1 id="job-post-title">Today Hotjobs</h1>
    <div class="product-area-list">
        <c:forEach var="item" items="${listOfJobPosting}">
            <div class="product">
                <i class="fa-solid fa-chevron-down"></i>
                <h1><a href="<c:url value="/post-detail/${item.postId}"/>">${item.jobPosition.jobName}</a></h1>
                <p>${item.salary} $</p>
                <!--<p>Assurance, Oversea traveling, Team building, Professional workplace welfare</p>-->
                <p class="welfare">${item.welfare}</p>
                <a href="<c:url value="/post-detail/${item.postId}"/>">See more<i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </c:forEach>
    </div>    


    <h1 id="seek-job">You are seeking a Job?</h1>
    <form action="<c:url value="/${keyword}"/>">
        <div class="search-job">
            <div class="search-bar">

                <input type="text" name="keyword" value="${param.keyword}" placeholder="I'm looking for..." />
                <button><i class="fa-solid fa-magnifying-glass"></i></button>

            </div>
        </div>
    </form>
    <div class="search-result">
        <h2 style="margin-left: 2rem">Found 6969 works</h2>
        <c:forEach var="item" items="${listOfJobPosting}">
            <div class="result-post">
                <div class="result-post-left">
                    <div class="container mt-3">
                        <div class="d-flex p-3">
                            <div class="p-2">
                                <a href="<c:url value="/post-detail/${item.postId}"/>"
                                   ><img
                                        src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Removed-bg-logo-comp.png?raw=true"
                                        alt=""
                                        /></a>
                            </div>
                            <div class="p-2">
                                <h2><a href="<c:url value="/post-detail/${item.postId}"/>">${item.jobPosition.jobName}</a></h2>
                                <p>MT Company</p>
                                <p>
                                    <i class="fa-solid fa-location-dot"></i>${item.locations}
                                </p>
                                <p class="salary">
                                    <i class="fa-sharp fa-solid fa-money-bill"></i>${item.salary}
                                </p>
                                <div class="post-down">
                                    <c:forEach var="skill" items="${item.jobPosition.skills}">
                                        <li class="skill-lists">
                                            <p style="margin-bottom: 0;">${skill.skillName}</p>
                                        </li> 
                                    </c:forEach>

                                </div>
                            </div>
                        </div>           
                    </div>
                </div>
                <div class="result-post-right">
                    <a href="<c:url value="/post-detail/save/${item.postId}"/>"><button class="modal-btn" onclick="saveJob()"> <i class="fa-regular fa-bookmark"></i></button></a>

                    <!-- <i class="fa-solid fa-bookmark marked" style="color: rgb(243, 243, 79);"></i>     -->
                    <p>4 hours ago</p>
                </div>
            </div>
        </c:forEach>
    </div>



    <div id="contact" class="contact-us">
        <div class="contact-form">
            <h1>Contact us</h1>
            <div class="text-items">
                <h2>Your Name</h2>
                <input type="text">
                <h2>Your Email</h2>
                <input type="text">
                <h2>Your Phone</h2>
                <input type="text">
            </div>
            <button><a href="#">Send</a></button>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
    <script>
        function saveJob() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
            })
        }
    </script>
</body>
