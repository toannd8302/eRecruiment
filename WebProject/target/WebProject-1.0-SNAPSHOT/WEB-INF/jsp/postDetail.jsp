<%-- 
    Document   : postDetail
    Created on : Feb 9, 2023, 4:15:49 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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
        width: 8rem;
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

    #job-detail-head #apply-buton button:first-child {
        margin-top: 2rem;
        padding: 1rem;
        border-radius: 5px;
        background-color: #00b14f;
        border: 3px solid #00b14f;
        margin-right: 1rem;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;

    }

    #job-detail-head #apply-buton button:last-child {
        margin-top: 2rem;
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

    #job-detail-head #apply-buton button{
        text-transform: uppercase;
    }

    #job-detail-head #apply-buton button a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 1.5rem;

    }

    #job-detail-head #apply-buton button i:first-child {
        font-size: 2rem;
        color: #ffffff;
        margin-right: 1rem;
    }

    #job-detail-head #apply-buton button i:last-child {
        font-size: 2rem;
        color: #00b14f;
        margin-right: 1rem;
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
        text-decoration: underline;
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

    #job-detail-body #job-location h1 {
        text-decoration: underline;
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
        content: "\2013";
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
            <img src="data:image/png;base64,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"
                 alt="Back-end">
        </div>
        <div id="general-info">
            <h1>${jobPosting.jobPosition.jobName}</h1>
            <h2>Công ty phần mềm Monke Tech</h2> 
            <p><i class="fa-regular fa-clock"></i>Expired time: <fmt:formatDate value="${jobPosting.getExpiredTime()}" pattern="dd/MM/yyyy"/></p>
        </div>
    </div>

    <div id="apply-buton">
        <button class="apply-button"><i class="fa-regular fa-paper-plane"></i><a href="<c:url value="/job/application?data=${jobPosting.postId}"/>">apply now</a></button>
<!--        <button class="save-job-button" value="<c:url value="/post-detail/save/${jobPosting.postId}"/>"v><i class="fa-regular fa-heart"></i>save job</button>-->
        <button class="save-job-button"><a href="<c:url value="/post-detail/save/${jobPosting.postId}"/>">SAVE JOB</a></button>
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

                    <li><br><i class="fa-solid fa-venus-mars"></i>Gender<p>No</p>
                    </li>

                    <li><br><i class="fa-sharp fa-solid fa-people-group"></i>Number of recruits<p>No</p>
                    </li>

                    <li><br><i class="fa-solid fa-ranking-star"></i>Level<p>${jobPosting.level}</p>
                </li>

                <li><br><i class="fa-brands fa-black-tie"></i>Experience
                    <c:if test="${jobPosting.exprienceRequirement == 0}"><p>none</p></c:if>
                    <c:if test="${jobPosting.exprienceRequirement != 0}"><p>${jobPosting.exprienceRequirement}</p></c:if>
                    </li>
                </ul>
            </div>
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

    <div id="job-require">
        <h1>Requirement</h1>
        <ul class="info-list">
            <c:forTokens var="requirement" items="" delims=";">
                <li>${requirement}</li>
                </c:forTokens>
        </ul>
    </div>

    <div id="job-welfare">
        <h1>Welfare</h1>
        <ul class="info-list">
            <c:forTokens var="welfare" items="${jobPosting.welfare}" delims=";">
                <li>${welfare}</li>
                </c:forTokens>
        </ul>
    </div>

    <div id="job-apply">
        <h1>How to apply</h1>
        <p>Candidates apply online by clicking <a href="<c:url value="/job/application?data=${jobPosting.postId}"/>">Apply now</a> below</p>
        <button class="apply-button"><a href="<c:url value="/job/application?data=${jobPosting.postId}"/>">APPLY NOW</a></button>
        <button class="save-job-button">SAVE JOB</button>
        <P>Submission deadline: <fmt:formatDate value="${jobPosting.getExpiredTime()}" pattern="dd/MM/yyyy"/></P>
    </div>
</div>

<%--
<h1>Post Detail</h1>

<c:url value="/job/application" var="action"/>

<form:form method="get" action="${action}" modelAttribute="jobPosting">
    Job Name: ${jobPosting.jobPosition.jobName}
    Loaction: ${jobPosting.locations}
    Description: ${jobPosting.descriptions}
    Requirement: ${jobPosting.exprienceRequirement} Year
    Salary: ${jobPosting.salary}
    Welfare: ${jobPosting.welfare}
    Round: 
    <ul>
        <c:forEach var="round" items="${jobPosting.getRounds()}">
            ${round.roundNumber} - ${round.content}
        </c:forEach>
    </ul>
    Skill:
    <ul>
        <c:forEach var="skill" items="${jobPosting.jobPosition.getSkills()}">
            ${skill.skillName}
        </c:forEach>
    </ul>
    <input type="submit" value="Apply Job"/>
</form:form>

--%>
