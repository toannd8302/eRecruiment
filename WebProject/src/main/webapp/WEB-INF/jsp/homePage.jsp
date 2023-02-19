<%-- 
    Document   : homePage
    Created on : Feb 6, 2023, 9:51:54 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="bootstrap/bootstrap.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kaushan+Script&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme&amp;display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aladin&amp;display=swap">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
<link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
<link rel="stylesheet" href="assets/css/Pretty-Search-Form-.css">
<link rel="stylesheet" href="assets/css/Projects-Grid-Horizontal-images.css">

<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css%22%3E">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<body id="page-top" data-bs-spy="scroll" data-bs-target="#mainNav" data-bs-offset="54">
    <section id="introduce" style="width: 100%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="text-uppercase section-heading" style="background: var(--bs-navbar-color);font-family: Montserrat, sans-serif;">find your job and come to us</h2>
                    <h3 class="text-muted section-subheading">A wise man know where he belongs to</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa-regular fa-stack-1x fa-heart"></i></span>

                    <h4 class="section-heading">SUITABLE JOBS</h4>
                    <p class="text-muted">Find a job that suitable to your passion and inclination.</p>
                </div>
                <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa-sharp fa-stack-1x fa-solid fa-laptop"></i></span>
                    <h4 class="section-heading">DEVELOPER'S WORLD</h4>
                    <p class="text-muted">As a technology, we are seeking passionate developers and give them the best environment for them to work and become the best of version of themselves.</p>
                </div>
                <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa-solid fa-stack-1x fa-hand-holding-dollar"></i></span>
                    <h4 class="section-heading">GOOD WELFARE</h4>
                    <p class="text-muted">If you work for us, you will&nbsp; not suffer any losses. You will enjoy the best perks and benefits we have for you.</p>
                </div>
            </div>
        </div>
    </section>
    <section id="hot-jobs" style="margin-top: -150px;background: #ffffff;width: 100%;">
        <div class="container" style="margin-right: 160px;">
            <h1 class="text-center" style="color: var(--bs-red);margin-bottom: 50px;">TODAY HOT JOBS</h1>
        </div>
        <c:forEach var="item" items="${list}">
            <ul style="list-style: none;">
                <li class="d-flex justify-content-between" style="border-style: solid;padding: 36px;width: 1123.4px;margin: 1px;border-radius: 21px;background: #def4ea; margin-bottom: 40px;">
                    <div class="d-flex"><img style="height: 173px;width: 168px;border-radius: 15px;" src="https://dotnet.microsoft.com/static/images/redesign/social/square.png">
                        <div style="margin-left: 40px;">
                            <a href="<c:url value="/post-detail/${item.postId}"/>">
                                <h1>${item.jobPosition.jobName}</h1>
                            </a>
                            <p class="fs-4 fw-bold" style="margin-bottom: 0px;">Công ty phần mềm&nbsp; Monke Tech</p>
                            <p class="fs-5" style="margin-bottom: 0px;">TP.Hô Chí Minh</p>
                            <p class="fs-5" style="margin-bottom: 0px;">1000$-2000$</p>
                            <p class="fs-5">Lập trình viên</p>
                        </div>
                    </div>
                    <div style="margin-top: 65px;">
                        <p class="fs-5">Ngày đăng: 18/2/2023</p>
                        <p class="fs-5">Ngày hết hạn: 18/2/2023</p><button class="btn btn-primary" type="button" style="color: var(--bs-btn-disabled-color);background: var(--bs-cyan);">Lưu tin</button>
                    </div>
                </li>
            </ul>
        </c:forEach>
    </section>
</body>









<style>
    #hot-job{
        text-align: center;
        color: orangered;
        margin-top: 30px;
        font-size: 20px;

    }

    #job-list {
        /* border: solid 2px rgb(0, 0, 0); */
        max-width: 600px;
        font-size: 20px;
        background-color: white;
        margin-left: 30%;
        margin-top: 3%;
        border-radius: 5px;
    }
    #job-list ul{
        list-style: none;
        padding-left: 0;
    } 
    #job-list #job-list-head{
        padding: 5px;
        display: flex;
        margin-top: 10px;
    }
    #job-list #job-list-head .job-title a{
        text-decoration: none;
        color: rgb(160, 26, 26);
    }
    #job-list #job-list-head img{
        height: 80px;
        width: 80px;
        margin-right: 20px;
    }
    #job-list #job-list-body ul {
        /* border-top: 2px solid red; */
        display: flex;
        list-style: none;
        padding: 10px 25px;

    }

    #job-list #job-list-body ul li {
        margin-right: 10px;
        border: 2px solid rgb(15, 133, 180);
        border-radius: 15px;
        padding: 5px; 
    }


    #job-list #job-list-foot{
        border-bottom: 30px solid #343747;
        padding-bottom: 10px;
        margin-bottom: 10px;
    }
    #job-list #job-list-foot ul {
        border-top: 2px solid red;
        display: flex;
        list-style: none;
        margin-top: 5px;
        padding: 10px;
    }
    #job-list #job-list-foot ul li{
        margin-right: 10px;
        border: 2px solid rgb(21, 204, 73);
        border-radius: 15px;
        padding: 10px;
    }
    #job-list #job-list-foot ul i{
        color: black;
    }
    .search-box {
        margin-left:500px;
        width: 50%;
        padding-top: 20px;
        display: flex;

    }

    .search-form input {
        height:50px;
        width: 200px;
        border-radius: 5px;
        text-align: center;
    }

    .search-button button {
        height:50px;
        width: 100px;
        border-radius: 5px;
        margin-left: 5px;
        background-color: rgb(197, 32, 32);
        text-align: center;
    }



    .search-button button:hover {
        background-color: rgb(216, 112, 112);
    }
</style>


<form action="">
    <div class="banner">
        <div class="body">
            <div id="banner">
                <div class="search-box">
                    <div class="search-form">
                        <input class="fa-solid fa-magnifying-glass" type="text" name="keyword" placeholder="Keyword skill, job name" size="80">
                    </div>
                    <div class="search-button">
                        <button class="fa-solid fa-magnifying-glass" type="submit">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


<div id="hot-job">
    <h1><i class="fa-brands fa-hotjar"></i>Hot Jobs</h1>
</div>

<div id="job-list">
    <ul>
        <c:forEach var="item" items="${list}">
            <li>
                <div id="job-list-head">
                    <div id="job-pic">
                        <img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/front-end-developer-4830933-4041850.png" alt="Front-end">
                    </div>
                    <div class="job-title">
                        <a href="<c:url value="/post-detail/${item.postId}"/>">
                            <h1>${item.jobPosition.jobName}</h1>
                        </a>
                        <h1>Công ty phần mềm Monke Tech</h1>
                    </div>
                </div>
                <div id="job-list-body">
                    <ul>

                        <c:forEach var="skill" items="${item.jobPosition.getSkills()}">
                            <li>
                                ${skill.skillName}
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div id="job-list-foot">
                    <ul>
                        <li><i class="fa-solid fa-dollar-sign"></i>${item.salary}</li>
                        <li><i class="fa-solid fa-location-dot"></i>${item.locations}</li>
                        <li><i class="fa-solid fa-clock"></i>Time</li>
                        <li><c:if test="${item.typeOfWork == true}">
                                Type Of Work: At Office
                            </c:if> 
                            <c:if test="${item.typeOfWork == false}">
                                Type Of Work: Hybrid
                            </c:if> 
                        </li>
                    </ul>
                </div>
            </c:forEach>
        </li>
    </ul>
</div>







