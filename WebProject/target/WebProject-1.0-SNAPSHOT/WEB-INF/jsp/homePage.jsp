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

    .banner {
        position: relative;
        width: 100%;
        height: 100vh;
        background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)),
            url("https://images-ext-1.discordapp.net/external/YD6LN5qAdGqUhwI-L5aIvhTj7yn-u9CQkbIqDOF6uEw/https/static.wixstatic.com/media/ea71bb_370144e721bc43c289bfb35fed3376d1~mv2_d_4500_2124_s_2.jpg/v1/fill/w_1593%2Ch_668%2Cal_b%2Cq_85%2Cusm_0.66_1.00_0.01%2Cenc_auto/ea71bb_370144e721bc43c289bfb35fed3376d1~mv2_d_4500_2124_s_2.jpg?width=1203&height=505");
        background-size: cover;
    }

    .banner .banner-content {
        position: absolute;
        top: 30%;
        left: 25%;
        transform: translate(-50deg, -50deg);
        color: #fff;
    }

    .banner .banner-content h1 {
        font-size: 8rem;
    }

    .banner .banner-content p {
        font-size: 2rem;
        font-style: italic;
        margin: 3rem 0;
    }

    .banner .banner-content button {
        margin-left: 38rem;
        font-size: 2rem;
        border-radius: 0.5rem;
        background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5));
        border: none;
    }

    .banner .banner-content button a {
        text-decoration: none;
        color: #fff;
        padding: 1rem;
    }

    .banner .banner-content button:hover {
        background: linear-gradient(rgba(40, 40, 40, 0.5), rgba(40, 40, 40, 0.5));
    }

    .banner .banner-content button:hover > a i {
        opacity: 0.6;
        color: red;
    }


    /* CSS for introduce */
    .service>h1{
        text-align: center;
        padding: 5rem 0;
        font-size: 4rem;
        font-weight: bold;
        color: #009688;
        font-weight: bold;
        font-family: 'IBM Plex Mono', monospace;
        text-transform: uppercase;
    }

    .intro i{
        font-size: 5rem;
        transition: 0.3s;
    }

    .intro .suitable-job{
        display: flex;
        justify-content: space-around;
        align-items: center;
        text-align: center;
    }

    .intro .suitable-job i:hover{
        color: rgb(243, 47, 51);
    }

    .intro .suitable-job h1{
        font-size: 4rem;
        text-transform: uppercase;
        padding: 3rem 0;
    }

    .intro .suitable-job p{
        margin-top: -3rem;
        font-size: 2rem;
        color: rgb(146, 146, 146);
        font-style: italic;
    }

    .intro .developer{
        display: flex;
        justify-content: space-around;
        align-items: center;
        text-align: center;
    }

    .intro .developer img{
        width: 50rem;
    }

    .intro .developer > .text{
        width: 48rem;
    }

    .intro .developer i:hover{
        color: rgb(57, 221, 167);
    }

    .intro .developer h1{
        font-size: 4rem;
        text-transform: uppercase;
        padding: 3rem 0;
    }

    .intro .developer p{
        margin-top: -3rem;
        font-size: 2rem;
        color: rgb(146, 146, 146);
        font-style: italic;
    }

    .intro .good-welfare{
        display: flex;
        justify-content: space-around;
        align-items: center;
        text-align: center;
    }

    .intro .good-welfare img{
        width: 50rem;
    }

    .intro .good-welfare > .text{
        width: 48rem;
    }

    .intro .good-welfare i:hover{
        color: rgb(206, 206, 25);
    }

    .intro .good-welfare h1{
        font-size: 4rem;
        text-transform: uppercase;
        padding: 3rem 0;
    }

    .intro .good-welfare p{
        margin-top: -3rem;
        font-size: 2rem;
        color: rgb(146, 146, 146);
        font-style: italic;
    }

    /* CSS for hot-jobs */

    /* CSS for hot-jobs */
    #job-post-title {
        text-align: center;
        text-transform: uppercase;
        font-size: 4rem;
        margin-bottom: 2rem;
        color: rgb(171, 36, 36);
        font-weight: bold;
        font-family: 'IBM Plex Mono', monospace;
        margin-top: 17rem;
    }

    .product-area-list {
        padding-top: 5rem;
        margin-left: 6rem;
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
        color: #fff;
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
    list-style: none;
    }

    .search-result .result-post .post-down p{
        margin-bottom: 0%;
        margin-right: 0.5rem;
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



    .contact{
        margin-left: 30rem;
        margin-bottom: 5rem;
    }

    .contact h1{
        font-size: 3rem;
    }

    .contact input{
        width: 90rem;
        border-radius: 1rem;
        height: 3rem;
    }

    .contact p{
        font-size: 2rem;
    }

    .contact .name{
        display: flex;
    }

    .contact .name input{
        width: 44rem;
        margin: 0.5rem;
    }

    .contact button{
        margin-top: 2rem;
        margin-left: 37rem;
        font-size: 1.7rem;
        border-radius: 2rem;
        padding: 0.5rem 5rem;
        border: none;
        background: #ccc;
    }

    .contact button:hover{
        background: #aaa;
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
    <section class="banner">
        <div class="banner-content">
            <h1>GROW UP YOUR CAREER</h1>
            <p>
                We have been a software company since 2010. Let us solve your problem
                in this digital age.
            </p>
            <button>
                <a href="#seek-job"
                   >Get Started <i class="fa-solid fa-circle-chevron-right"></i
                    ></a>
            </button>
        </div>
    </section>


    <div id="service" class="service">
        <h1>Why choose us</h1>
        <div class="intro">
            <div class="suitable-job">
                <div class="text">
                    <i class="fa-regular fa-heart"></i>
                    <h1>Suitable Jobs</h1>
                    <p>Find a job that suitable to your passion and inclination.</p>
                </div>

                <img src="https://images.unsplash.com/photo-1570126618953-d437176e8c79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=494&q=80"
                     alt="suitable"
                     />
            </div>
            <div class="developer">

                <img src="https://images.unsplash.com/photo-1549692520-acc6669e2f0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
                     alt="suitable"
                     />

                <div class="text">
                    <i class="fa-sharp fa-solid fa-laptop"></i>
                    <h1>Developer's World</h1>
                    <p>As a technology company, we are seeking passionate developers and givethem the best 
                        environment for them to work and become the best of version of themselves.</p>
                </div>
            </div>

            <div class="good-welfare">
                <div class="text">
                    <i class="fa-solid fa-hand-holding-dollar"></i>
                    <h1>Competitive Welfare</h1>
                    <p>If you work for us, you will not suffer any losses. You will enjoy
                        the best
                        perks and benefits we have for you.</p>
                </div>

                <img src="https://images.unsplash.com/photo-1661257454984-260701259b64?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
                     alt="suitable"
                     />
            </div>
        </div>
    </div>




    <!-- Hot job here -->
    <h1 id="job-post-title">Today Hotjobs</h1>
    <div class="product-area-list">
        <c:forEach var="item" items="${listOfHotJob}">
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
        <h2 style="margin-left: 2rem">Found ${listOfJobPosting.size()} works</h2>
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
                    <p>${item.getExpiredTime()}</p>
                </div>
            </div>
        </c:forEach>
    </div>


        <div class="contact" id="contact">
        <h1>Contact us</h1>
        <div class="name">
            <div class="first-name">
                <p>First Name*</p>
                <input type="text">
            </div>
            <div class="last-name">
                <p>Last Name*</p>
                <input type="text">
            </div>
        </div>
        <div class="person-info">
            <p>Email Address*</p>
            <input type="text">
            <p>Phone Number</p>
            <input type="text">
        </div>
        <button>Send</button>
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