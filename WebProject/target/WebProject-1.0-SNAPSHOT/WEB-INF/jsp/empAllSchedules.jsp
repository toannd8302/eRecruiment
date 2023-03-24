<%-- 
    Document   : allSchedules
    Created on : Mar 3, 2023, 3:58:38 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<style>
    /* Interview list */
    .interview-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    .schedule-title{
        justify-content: space-between;
        display: flex;
        background-color: rgb(208, 204, 204);
        margin-bottom: 2rem;
        height: 8.5rem;
        width: auto;
        margin-left: 2.5rem;
        padding-right: 5rem;
        padding-left: 3rem;
    }
    .schedule-title h3{
        color: rgb(106, 105, 105);
        text-align: center;
        font-size: 40px;
        font-family: Arial, sans-serif;
        text-shadow: 2px 2px 4px #000000;
    }
    .view-toggle .active{
        background-color: #00C6FF;
        border-radius: 0%;
    }
    .view-toggle{
        text-align: center;
    }
    .view-toggle button {
        display: inline-block;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #fff;
        color: #333;
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
        transition: all 0.2s ease-in-out;
    }
    .view-toggle button:hover {
        background-color: #333;
        color: #fff;
    }
    .view-toggle button i {
        margin-right: 5px;
    }
    .view-toggle #list-view i {
        color: #f1c40f;
    }
    .view-toggle #grid-view i {
        color: #3498db;
    }
    .interview-list .interview-item {
        background-color: #8a8a8a;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        color: #f7f2f2;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        margin: 40px auto;
        width: 1200px;
    }
    .interview-list .interview-item .delete-interview{
        color: gray;
    }
    .interview-schedule{
        margin-left: 17.5rem;
    }
    .interview-item:hover {
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }
    .interview-item h3 {
        font-size: 24px;
        font-weight: bold;
        margin: 0;
        color: #fbfafa;
    }
    .interview-date, .interview-time {
        font-size: 16px;
        margin: 0;
        color: #00C6FF;
    }
    .interviewer {
        font-size: 18px;
        font-style: italic;
        color: #FF6B6B;
    }
    .interview-notes {
        font-size: 16px;
        color: #2EC4B6;
    }
    .interview-item .btn {
        padding: 10px 15px;
        border-radius: 5px;
        border: none;
        color: darkgray;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
    }
    .interview-item .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }
    .interview-item .edit-btn {
        background-color: #FFD23F;
        background-image: linear-gradient(45deg, #FFD23F 0%, #F9AE17 100%);
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    .interview-item .edit-btn:hover {
        background-color: #F9AE17;
        box-shadow: 0 2px 5px rgba(0,0,0,0.3);
    }
    .interview-item .delete-btn {
        background-color: #EB5E28;
        background-image: linear-gradient(45deg, #EB5E28 0%, #CD3F0A 100%);
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    .interview-item .delete-btn:hover {
        background-color: #CD3F0A;
        box-shadow: 0 2px 5px rgba(0,0,0,0.3);
    }
    /* Interview grid */
    .interview-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Change to two columns of equal width */
        justify-items: center;
        grid-gap: 20px;
    }
    .interview-grid .delete-interview{
        color: gray;
    }
    .interview-grid .interview-item {
        background-color: #8a8a8a;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        transition: box-shadow 0.2s ease-in-out;
        cursor: pointer;
        width: 500px;
        color: #f7f2f2;
    }
    .interview-grid .interview-item h3 {
        color: #efeded;
    }
    .interview-item:hover {
        box-shadow: 0 4
    }
    /* Sidebar */
    .sidebar {
        height: 100vh;
        width: 50px;
        position: fixed;
        top: 0;
        left: 0;
        overflow-x: hidden;
        background-color: #baa9a3;
        font-weight: bold;
        transition: 0.5s;
    }
    .sidebar i{
        padding-left: 0.5rem;
        font-size: 3rem;
    }
    .sidebar:hover{
        width: 230px;
    }
    .sidebar h1 {
        margin-bottom: 30px;
    }
    .sidebar ul {
        list-style-type: none;
        padding-left: 0;
        position: absolute;
        width: 50rem;
    }
    .sidebar .action {
        margin-top: 2rem;
    }
    .sidebar li {
        margin-bottom: 5px;
        position: relative;
        width: 100%;
        font-size: 2rem;
    }
    .sidebar a {
        color: rgb(69, 69, 69);
        padding-top: 2rem;
        padding-bottom: 2rem;
        text-decoration: none;
        position: relative;
        width: 100%;
        display: block;
        display: flex;
    }
    .sidebar span{
        padding-left: 2.5rem;
    }
    .sidebar a:hover {
        background-color: rgb(208, 204, 204);
    }
    .sidebar a.active {
        background-color: rgb(208, 204, 204);
    }
    /* Account */
    .sidebar img {
        width: 12rem;
        height: 12rem;
        margin-left: 6rem;
        margin-right: 3rem;
        border-radius: 50%;
        position: relative;
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
</style>

<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
        <div class="row">
            <div>
                <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
            </div>
        </div>
        <div class="action">
            <ul>
                <li><a href="<c:url value="/jobApps"/>"><i class="fa-solid fa-list"></i><span>Applications List</span></a></li>
                <li><a href="<c:url value="/jobPostings"/>"><i class="fa-solid fa-list"></i><span>Job Postings List</span></a></li>
                <li><a class="active" href="<c:url value="/schedules"/>"><i class="fa-solid fa-list"></i><span>Schedule List</span></a></li>
                <li><a href="<c:url value="/logout"/>"><i class="fa-solid fa-right-from-bracket"></i><span>Log out</span></a></li>
            </ul>
        </div>
    </sec:authorize>
</div>

<div class="interview-schedule">
    <div class="schedule-title">
        <h3>Interview Schedule</h3>
        <h3>Welcome <c:url value="${sessionScope.user.getName()}"/></h3>
    </div>
    <hr>
    <div class="view-toggle">
        <button id="list-view">
            <i class="fas fa-clock"></i>
            <span>Pending</span>
        </button>
        <button id="grid-view">
            <i class="fas fa-spinner"></i>
            <span>On Going</span>
        </button>
    </div>
    <div class="interview-list">
        <ul>
            <c:forEach var="schedule" items="${PENDING}" varStatus="counter">
                <div class="interview-item">
                    <h3>${schedule[0].getRound().getJobPosting().getJobPosition().getJobName()}</h3>
                    <p>NO: ${counter.count}</p>
                    <p>Round ${schedule[0].getRound().getRoundNumber()} - ${schedule[0].getRound().getContent()}</p>
                    <p>Number of candidate: ${schedule[1]}/10</p>
                    <p>Number of interview: ${schedule[2]}</p>
                    <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                        <input type="hidden" name="scheduleID" value="${schedule[0].getScheduleId()}">
                        <button class="delete-interview">View Detail</button>
                    </form>  
                </div>
            </c:forEach>
        </ul>
    </div>

    <div class="interview-grid">
        <c:forEach var="schedule" items="${ON_GOING}" varStatus="counter">
            <div class="interview-item">
                <h3>${schedule[0].getRound().getJobPosting().getJobPosition().getJobName()}</h3>
                <p>NO: ${counter.count}</p>
                <p>Round ${schedule[0].getRound().getRoundNumber()} - ${schedule[0].getRound().getContent()}</p>
                <p>Number of candidate: ${schedule[1]}/10</p>
                <p>Number of interview: ${schedule[2]}</p>
                <p>Date: <fmt:formatDate value="${schedule[0].getScheduleDate()}" pattern="dd/MM/yyyy"/></p>
                <p>Time: <fmt:formatDate value="${schedule[0].getScheduleTime()}" pattern="HH:mm:ss"/></p>
                <form method="get" action="<c:url value="/schedules/schedule-details"/>">
                    <input type="hidden" name="scheduleID" value="${schedule[0].getScheduleId()}">
                    <button class="delete-interview">View Detail</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    const listViewBtn = document.getElementById('list-view');
    const gridViewBtn = document.getElementById('grid-view');
    const interviewList = document.querySelector('.interview-list');
    const interviewGrid = document.querySelector('.interview-grid');
// Hide gridview initially
    interviewGrid.style.display = 'none';
// Event listener for listview button
    listViewBtn.addEventListener('click', function () {
        // Show listview, hide gridview
        interviewList.style.display = 'block';
        interviewGrid.style.display = 'none';
    })
// Event listener for gridview button
    gridViewBtn.addEventListener('click', function () {
        // Show gridview, hide listview
        interviewGrid.style.display = 'grid';
        interviewList.style.display = 'none';
    })
</script>