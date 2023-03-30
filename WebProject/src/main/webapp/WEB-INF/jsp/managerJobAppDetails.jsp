<%-- 
    Document   : managerJobAppDetails
    Created on : Mar 23, 2023, 8:27:34 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
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
    }
    .hr-modal{
        background: #fff;
        position: relative;
        top: 10rem;
        height: 100%;
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
    .hide{
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

    #acpt-btn{
        border-radius: 0.5rem;
        background: #008B00;
        color: #fff;
        padding: 0.5rem 2rem;
        border: none;
        font-weight: bold;
    }

    #acpt-btn:hover{
        background: #006400;
    }

    #rej-btn{
        border-radius: 0.5rem;
        background: #C60000;
        color: #fff;
        padding: 0.5rem 2rem;
        border: none;
        font-weight: bold;
    }

    #rej-btn:hover{
        background: #8B0000;
    }
    /* CSS for recruit detail  */
    #job-detail-body {
        background-color: white;
        width: 84.95%;
        margin-left: 13rem;
        padding-left: 1rem;
        margin-top: 1.5rem;
    }
    #job-detail-body #recrui-detail .job-detail-recruit{
        font-weight: bold;
    }
    #job-detail-body #job-general-info {
        margin-top: 2rem;
        background-color: #d4f2e1;
        padding: 2rem;
    }
    #job-detail-body #job-general-info h1 {
        margin-bottom: 1rem;
    }
    #job-detail-body #job-general-info .general-info-list {
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
        font-size: 2rem;
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
    /* CSS for Job Describe */
    #job-detail-body #job-describe {
        background-color: #d4f2e1;
        margin-top: 1rem;
        padding: 2rem;
    }
    /* CSS for round*/
    #job-detail-body #job-rounds{
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
        font-size: 2rem;
    }
    #job-detail-body .info-list li {
        margin: 1rem;
    }
    #job-detail-body .info-list li::before {
        content: "\2013";
        /* Unicode character for an en dash */
        margin-right: 1rem;
    }
</style>

<div class="hr-modal ">
    <div class="modal-inner">
        <div class="modal-header">
            <h1>Grading Candiate Report</h1>
            <i class="fa-solid fa-xmark close-modal"></i>
        </div>
        <div>
            <!-- Tab items -->
            <div class="tabs">
                <div class="tab-item active">Introduction</div>
                <div class="tab-item">Post Detail</div>
                <div class="tab-item">Report List</div>
                <div class="line"></div>
            </div>

            <!-- Tab content -->
            <div class="tab-content">
                <div class="tab-pane active">
                    <div class="modal-body report">
                        <h3>Candidate's Introduction:</h3>
                        <p>${jobAppDetail.getIntroduction()}</p>
                        <!--<a href="${jobAppDetail.getCv()}"> Link CV</a>-->
                        <img src="${jobAppDetail.getCv()}" width="500px" height="auto">
                    </div>
                </div>
                <div class="tab-pane">
                    <!--                    <div class="modal-body report">
                                            <h3>Job Name:</h3>
                                            <p>${jobAppDetail.getJobPosting().getJobPosition().jobName}</p>
                                            <a href="<c:url value="/manager/post-detail/${jobAppDetail.getJobPosting().getPostId()}"/>">Link Post</a>
                    
                                        </div>-->
                    <div id="job-detail-body">
                        <div id="recrui-detail">
                            <h1 class="job-detail-recruit">Recruitment information</h1>
                            <div id="job-general-info">
                                <h1>General information</h1>
                                <ul class="general-info-list">
                                    <div class="row">
                                        <div class="col-sm-6 general-info-left">
                                            <li><i class="fa-solid fa-money-bill"></i>
                                                Salary
                                                <p>${jobAppDetail.jobPosting.getSalary()}</p>
                                            </li>

                                            <li><i class="fa-sharp fa-solid fa-suitcase"></i>Type of work<p>
                                                    <c:if test="${jobAppDetail.jobPosting.isTypeOfWork() == true}">
                                                        At Office
                                                    </c:if>
                                                    <c:if test="${jobAppDetail.jobPosting.isTypeOfWork() == false}">
                                                        Hybrid
                                                    </c:if>
                                                </p>
                                            </li>
                                        </div>
                                        <div class="col-sm-6 general-info-right">

                                            <li><i class="fa-solid fa-ranking-star"></i>Level<p>${jobAppDetail.jobPosting.getLevel()}</p>
                                            </li>

                                            <li><i class="fa-brands fa-black-tie"></i>Year Experience<p>${jobAppDetail.jobPosting.getExprienceRequirement()}</p>
                                            </li>
                                        </div>
                                    </div>
                                </ul>
                            </div>
                        </div>

                        <div id="job-location">
                            <h1>Work location</h1>
                            <ul class="info-list">
                                <li>
                                    ${jobAppDetail.jobPosting.getLocations()}
                                </li>
                            </ul>
                        </div>

                        <div id="job-describe">
                            <h1>Job description</h1>
                            <ul class="info-list">
                                <c:forTokens var="description" items="${jobAppDetail.jobPosting.getDescriptions()}" delims=";">
                                    <li>${description}</li>
                                    </c:forTokens>
                            </ul>
                        </div>

                        <div id="job-require">
                            <h1>Required Skills</h1>
                            <ul class="info-list">
                                <c:forEach var="skill" items="${jobAppDetail.jobPosting.jobPosition.skills}">
                                    <li>
                                        ${skill.skillName}
                                    </li> 
                                </c:forEach>
                            </ul>
                        </div>

                        <div id="job-rounds">
                            <h1>Interview Round</h1>
                            <ul class="info-list">
                                <c:forEach var="round" items="${jobAppDetail.jobPosting.rounds}">
                                    <li>
                                        ${round.roundNumber} - ${round.content}
                                    </li> 
                                </c:forEach>
                            </ul>
                        </div>

                        <div id="job-welfare">
                            <h1>Welfare</h1>
                            <ul class="info-list">
                                <c:forTokens var="welfare" items="${jobAppDetail.jobPosting.getWelfare()}" delims=";">
                                    <li>${welfare}</li>
                                    </c:forTokens>
                                <!--            <li>Thưởng lễ, tết, sinh nhật, lương tháng 13, phép năm</li>
                                            <li>Tham gia các hoạt động teambuilding, du lịch, tất niên</li>
                                            <li>Xét tăng lương định kỳ 1 lần/năm</li>
                                            <li>Yoga miễn phí</li>-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane">
                    <div class="modal-body report">
                        <c:forEach var="item" varStatus="counter" items="${jobAppDetail.getJobApSche()}">
                            <h3>Round Number: ${item.getApplicationSchedule().getRound().roundNumber} - ${item.getApplicationSchedule().getRound().getContent()}</h3>
                            <c:forEach var="report" items="${item.getApplicationSchedule().getReports()}">
                                <c:if test="${jobAppDetail.getReports().contains(report)}">
                                    <h3>Interviewer: ${report.getEmployee().getName()}</h3>
                                    <h4>Evaluate:</h4>
                                    <p>${report.content} </p>
                                    <h4>Point:</h4>
                                    <p> ${report.point}</p>
                                 
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        <form method="post" action="<c:url value="/manager/decision"/>">
                            <button id="acpt-btn" name="action" value="accept">Accept</button>
                            <button id="rej-btn" name="action" value="reject">Reject</button>
                            <input type="hidden" name="jobAppID" value="${jobAppDetail.applicationId}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button class="close-modal">Close</button>
        </div>
    </div>
</div>

<script>
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const tabs = $$(".tab-item");
    const panes = $$(".tab-pane");

    const tabActive = $(".tab-item.active");
    const line = $(".tabs .line");

// SonDN fixed - Active size wrong size on first load.
// Original post: https://www.facebook.com/groups/649972919142215/?multi_permalinks=1175881616551340
    requestIdleCallback(function () {
        line.style.left = tabActive.offsetLeft + "px";
        line.style.width = tabActive.offsetWidth + "px";
    });

    tabs.forEach((tab, index) => {
        const pane = panes[index];

        tab.onclick = function () {
            $(".tab-item.active").classList.remove("active");
            $(".tab-pane.active").classList.remove("active");

            line.style.left = this.offsetLeft + "px";
            line.style.width = this.offsetWidth + "px";

            this.classList.add("active");
            pane.classList.add("active");
        };
    });

    function viewReport() {
        const modal = document.querySelector(".modal");
        const closeModalBtns = document.querySelectorAll(".close-modal");

        modal.style.display = "block";

// Hide the modal when the icon or the close button is clicked
        closeModalBtns.forEach((btn) => {
            btn.addEventListener("click", () => {
                modal.style.display = "none";
            });
        });

// Hide the modal when clicking outside of it
        window.addEventListener("click", (event) => {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        });
    }
</script>

<%--
<h1>Job Application Detail</h1>
<h2>Introduction</h2><p>${jobAppDetail.getIntroduction()}</p>
<a href="${jobAppDetail.getCv()}"> Link CV</a>

<h2>Post Detail</h2>
<p>Job Name: ${jobAppDetail.getJobPosting().getJobPosition().jobName}</p>
<a href="<c:url value="/manager/post-detail/${jobAppDetail.getJobPosting().getPostId()}"/>">Link Post</a>

<h1>Schedule List</h1>

<c:forEach var="item" varStatus="counter" items="${jobAppDetail.getJobApSche()}">
    ==============================
    <h5>Round Number: ${item.getApplicationSchedule().getRound().roundNumber} - ${item.getApplicationSchedule().getRound().getContent()}</h5>
    <c:forEach var="report" items="${item.getApplicationSchedule().getReports()}">
        <c:if test="${jobAppDetail.getReports().contains(report)}">
            <h5>Report</h5>
            <p>Content ${report.content} ----- Point: ${report.point}</p>
        </c:if>
    </c:forEach>
</c:forEach>

<form method="post" action="<c:url value="/manager/decision"/>">
    <button name="action" value="accept">Accept</button>
    <button name="action" value="reject">Accept</button>
    <input type="hidden" name="jobAppID" value="${jobAppDetail.applicationId}"/>
</form>

--%>