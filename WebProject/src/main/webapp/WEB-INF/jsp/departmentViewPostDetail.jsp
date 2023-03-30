<%-- 
    Document   : departmentViewPostDetail
    Created on : Mar 13, 2023, 3:26:47 PM
    Author     : toan0
--%>

<%@page import="com.codeweb.pojos.department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    html {
        font-size: 62.5%;
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
        margin: 0;
    }

    body {
        background-color: #343747;
    }

    #job-detail-head {
        background-color: white;
        width: 85%;
        margin-left: 10%;
        padding: 2rem;
        margin-top: 3%;
        display: flex;
        justify-content: space-between;
    }

    #job-head #job-logo img {
        width: 15rem;
        height: 8rem;
        border-radius: 50%;
    }

    #job-head {
        display: flex;
    }

    #general-info {
        margin-top: 10px;
    }

    #general-info h2,
    p {
        margin-top: 10px;
        font-size: 1.5rem;
    }

    #general-info p i {
        margin-right: 5px;
    }

    #return-btn{
        margin: 3rem;

    }

    #return-btn a{
        color: #000;
        font-size: 2rem;
        padding: 0.8rem 1rem;
        background: #ccc;
        border-radius: 50%;
    }

    #return-btn a:hover{
        background: #aaa;
    }

    /* CSS for recruit detail  */

    #job-detail-body {
        background-color: white;
        width: 85%;
        margin-left: 10%;
        padding: 2rem;
        margin-top: 3%;
    }

    #job-detail-body #job-general-info {
        margin-top: 10px;
        background-color: #d4f2e1;
        padding: 2rem;
    }

    #job-detail-body #job-general-info h1 {
        margin-bottom: 1rem;

    }

    #job-detail-body #job-general-info .general-info-list {
        display: grid;
        grid-template-columns: 1fr 1fr;
        list-style: none;
    }

    #job-detail-body #job-general-info .general-info-list li {
        font-weight: bold;
        font-size: 2rem;
        color: rgb(244, 131, 131);
    }

    #job-detail-body #job-general-info .general-info-list li p {
        color: initial;
        font-weight: normal;
    }

    #job-detail-body #job-general-info .general-info-list i {
        margin-right: 1rem;
        font-size: 2rem;
        margin-top: 2rem;
        display: inline-block;
    }

    #job-detail-body #job-general-info .general-info-list p {
        margin-left: 3.5rem;
    }







    /* CSS for Job Location */
    #job-detail-body #job-location {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    #job-detail-body #job-rounds{
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }


    /* CSS for Job Describe */
    #job-detail-body #job-describe {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }


    /* CSS for Job Require */
    #job-detail-body #job-require {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }


    /* CSS for Job Welfare */
    #job-detail-body #job-welfare {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }

    #job-detail-body .info-list {
        list-style-type: none;
        padding: 0%;
        font-size: 1.5rem;
    }

    #job-detail-body .info-list li {
        margin: 1rem;
    }

    #job-detail-body .info-list li::before {
        /*        content: "\2013";*/
        /* Unicode character for an en dash */
        margin-right: 5px;
    }




    /* CSS for Job Apply */

    #job-detail-body #job-apply {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }

    #job-detail-body #job-apply p a {
        font-weight: bold;
        text-decoration: none;
        color: #00b14f;
    }

    /* #job-detail-body #job-apply button{
        padding: 9px 25px;
        background-color: #00b14f;
        color: white;
        border-radius: 3px;
        border: 1px solid #00b14f;
        font-weight: bold;
    } */

    #job-detail-body #job-apply p,
    button {
        margin: 0.5rem;
    }

    #job-detail-body #job-apply button a {
        text-decoration: none;
        color: white;

    }

    #job-detail-body #job-skills{
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }

    #job-detail-body .apply-button {
        padding: 1rem;
        border-radius: 5px;
        background-color: #00b14f;
        border: 3px solid #00b14f;
        margin-right: 1rem;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;
    }

    #job-detail-body .save-job-button {
        padding: 1rem;
        border-radius: 5px;
        background-color: #ffffff;
        border: 3px solid #00b14f;
        margin-right: 1rem;
        color: #00b14f;
        font-weight: bold;
        font-size: 1.5rem;
        text-align: center;
    }

</style>

<div id="job-detail-head">
    <div id="job-head">
        <div id="job-logo">
            <img src="https://github.com/Toannd832/eRecruiment/blob/Thang/Header/img/Remove_bg_logo.png?raw=true"  alt="Back-end">
        </div>
        <div id="general-info">
            <h1>${jobPosting.jobPosition.jobName}</h1>
            <h2>Công ty phần mềm Monke Tech</h2> 

            <p><i class="fa-regular fa-clock"></i>Create Time: <fmt:formatDate value="${jobPosting.getCreatedTime()}" pattern="dd/MM/yyyy"/></p>
            <p style="color: red">Status: ${jobPosting.isApprovedStatus()}</p>
        </div>
    </div>
    <div id="return-btn">
        <a href="<c:url value="/department"/>"><i class="fa-solid fa-house"></i></a>

    </div>

</div>

<div id="job-detail-body">
    <div id="recrui-detail">
        <h1>Recruitment Details</h1>
        <div id="job-general-info">
            <h1>General information</h1>
            <ul class="general-info-list">
                <li><i class="fa-solid fa-money-bill"></i>
                    Salary
                    <p>${jobPosting.salary} $</p>
                </li>

                <li><i class="fa-sharp fa-solid fa-suitcase"></i>Type of works
                    <c:if test="${jobPosting.typeOfWork == true}"><p>At Office</p></c:if>
                    <c:if test="${jobPosting.typeOfWork == false}"><p>Hybrid</p></c:if>
                    </li>

                    <li><br><i class="fa-solid fa-ranking-star"></i>Level<p>${jobPosting.level}</p>
                </li>

                <li><br><i class="fa-brands fa-black-tie"></i>Experience Year
                    <c:if test="${jobPosting.exprienceRequirement == 0}"><p>none</p></c:if>
                    <c:if test="${jobPosting.exprienceRequirement != 0}"><p>${jobPosting.exprienceRequirement}</p></c:if>
                    </li>
                </ul>
            </div>
        </div>
        <div id="job-skills">
            <h1>Skills requirement</h1>
            <ul class="info-list">

            <c:forEach var="skill" items="${jobPosting.jobPosition.skills}">
                <li>
                    ${skill.skillName}
                </li> 
            </c:forEach>
        </ul>
    </div>
    <div id="job-rounds">
        <h1>Round</h1>
        <ul class="info-list">
            <c:forEach var="round" items="${jobPosting.rounds}">
                <li>
                    ${round.roundNumber} - ${round.content}
                </li> 
            </c:forEach>
        </ul>
    </div>
    <div id="job-location">
        <h1>Work Location</h1>
        <ul class="info-list">
            <li>
                ${jobPosting.locations}
            </li>
        </ul>
    </div>

    <div id="job-describe">
        <h1>Description</h1>
        <ul class="info-list">
            <c:forTokens var="description" items="${jobPosting.descriptions}" delims=";">
                <li>${description}</li>
                </c:forTokens>
        </ul>
    </div>
    <div id="job-welfare">
        <h1>Welfare</h1>
        <ul class="info-list">
            <c:forTokens var="welfare" items="${jobPosting.welfare}" delims=",">
                <li>${welfare}</li>
                </c:forTokens>
        </ul>
    </div>
</div>
