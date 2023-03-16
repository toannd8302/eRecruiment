<%-- 
    Document   : empScheduleDetails
    Created on : Mar 5, 2023, 9:25:29 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    header {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px;
    }

    h1 {
        margin: 0;
    }

    section {
        margin: 20px;
    }

    h2 {
        margin-bottom: 10px;
        font-size: 25px;
    }
    h3{
        font-size: 20px;
    }
    .interview-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .interview-table th {
        text-align: left;
        padding: 10px;
        background-color: #444343;
        border-bottom: 2px solid #ccc;
    }

    .interview-table td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
    }

    th, td {
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #333;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .box-container {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .box {
        width: 600px;
        height: 270px;
        background-color: lightgray;
        border: 2px solid black;
        padding: 10px;
    }
    .question {
        font-size: 17px;
        margin-bottom: 10px;
    }
    .container{
        margin-left:20rem;
    }
    .option {
        font-size: 16px;
        margin-bottom: 5px;
    }

    select {
        padding: 10px;
        border-radius: 5px;
        border: none;
        background-color: #f7f7f7;
        color: #444;
        font-size: 16px;
        transition: all 0.2s ease-in-out;
    }

    select:focus {
        outline: none;
        box-shadow: 0px 0px 5px #6cb2eb;
        background-color: #fff;
    }

    .submit {
        margin-top: 20px;
        background-color: #6cb2eb;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.2s ease-in-out;
    }

    .submit:hover {
        background-color: #fff;
        color: #6cb2eb;
        cursor: pointer;
    }
    .center {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .start-btn {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
        box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    .start-btn:hover {
        background-color: #3e8e41; /* Dark green */
    }
    label {
        display:flex;
    }

    input[type="checkbox"] {
        margin-right: 5px;
        font-size: 10px;
    }
    .multiple-checkbox h2{
        font-size: 17px;
        margin-bottom: 10px;
    }
    .sidebar {
        background-color: #baa9a3;
        height: 100vh;
        width: 200px;
        color: black;
        position: fixed;
        top: 0;
        left: 0;
        overflow-x: hidden;
    }

    .sidebar h1 {
        text-align: center;
        margin-bottom: 30px;
    }

    .sidebar ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .sidebar li {
        margin-bottom: 5px;
    }

    .sidebar a {
        display: block;
        color: black;
        padding: 10px;
        text-decoration: none;
    }

    .sidebar a:hover {
        background-color: #1abc9c;
    }

    .sidebar a.active1 {
        background-color: #1abc9c;
    }

    /* Account */

    .sidebar img {
        width: 13.5rem;
        height: 13.5rem;
        margin-left: 3rem;
        margin-right: 3rem;
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

    #my-account {
        margin-left: 1.5rem;
        margin-top: 1.5rem;
    }

    #my-account .dropdown-menu {
        padding: 0%;
        background-color: #1abc9c;
    }

    #my-account .dropdown-item {
        background-color: #1abc9c;
    }

    #my-account .dropdown-item:hover {
        background-color: #1abc9c;
    }
    
    /*
    PHẦN SCHEDULE DETAIL CỦA ON GOING
    */
    
    header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 20px;
    }
  .schedule-detail {
    background-color: #f7f7f7;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    margin: 40px auto;
    width: 80%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
  }
  
  .schedule-detail h2 {
    font-size: 30px;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
  }
  
  .schedule-detail p {
    font-size: 18px;
    color: #555;
    margin: 10px 0;
    width: 100%;
  }
  
  .schedule-detail .label {
    font-size: 20px;
    font-weight: bold;
    color: #555;
    margin-right: 10px;
  }
  
  .schedule-detail .value {
    font-size: 20px;
    color: #333;
    margin-right: 20px;
  }

  
  .status.on-going {
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    padding-top: 20px;
  }
  h1 {
    margin: 0;
  }
  
  h2 {
    font-size: 36px;
    margin-bottom: 40px;
  }
  h3{
    font-size: 26px;
    margin-bottom: 40px;
  }
  .info-candidate{
   text-align: center;
   font-weight: bold;
   font-size: 20px;
  }
  
  .info-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    background-color: lightgray;
    border: 2px solid black;
    border-radius: 10px;
    padding: 40px;
    width: 80%;
    text-align: center;
    margin: 0 auto;
  }
  
  .info-row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
  }
  
  .info-col {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-gap: 20px;
  }
  
  .info-item {
    display: flex;
    flex-direction: column;
  }
  
  .info-date,
  .info-time {
    grid-row: 2;
  }
  
  .info-label {
    font-size: 14px;
    font-weight: bold;
    color: #777;
    margin-bottom: 5px;
  }
  
  .info-value {
    font-size: 16px;
    color: #444;
    margin-bottom: 10px;
  }
  
  span {
    font-weight: bold;
    margin-right: 10px;
  }
  
  p {
    margin: 0;
  }
  
  .info-col p:before {
    content: "";
    display: inline-block;
    height: 16px;
    width: 16px;
    background-color: #4b4a4a;
    margin-right: 10px;
    border-radius: 50%;
  }
  .interview-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    width: 60%;
    align-items: center;
    margin-left: 280px;
  }
  
  .interview-table th {
    text-align: left;
    padding: 10px;
    background-color: #cdcbcb;
    border-bottom: 2px solid #9b9b9b;
    color: #040404;
  }
  
  .interview-table td {
    padding: 10px;
    border-bottom: 1px solid #ccc;
  }
</style>


<div class="sidebar">
    <sec:authorize access="isAuthenticated()">
        <div class="row">
            <div>
                <img src="<c:url value="${sessionScope.user.getPicture()}"/>" />
            </div>
            <div>
                <div id="my-account">
                    <ul>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">My
                                Account</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item active" href="<c:url value="/account"/>">My Profile</a></li>
                                <li><a class="dropdown-item active" href="<c:url value="/logout"/>">Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </sec:authorize>
    <ul>
        <li><a href="<c:url value="/jobApps"/>">Application List</a></li>
        <li><a href="<c:url value="/jobPostings"/>">Job Postings List</a></li>
        <li><a class="active1" href="<c:url value="/schedules"/>">Schedule List</a></li>
    </ul>
</div>
<c:if test="${schedule.getStatus() eq 'Pending'}">
    <div class="container">
        <header>
            <h1>Interview Schedule Detail</h1>
        </header>
        <section>
            <h2>Pending</h2>
        </section>
        <hr>
        <section>
            <table class="interview-table">
                <thead>
                    <tr>
                        <th>Job Name</th>
                        <th>Schedule ID</th>
                        <th>Round</th>
                        <th>Type of interview</th>
                        <th>Number of candidate</th>
                        <th>Number of interviewer</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${schedule.getRound().getJobPoting().getJobPosition().getJobName()}</td>
                        <td>${schedule.getScheduleId()}</td>
                        <td>${schedule.getRound().getRoundNumber()} - ${schedule.getRound().getContent()}</td>
                        <td>
                            <c:if test="${schedule.isTypeOfInterview() == true}">
                                Offline
                            </c:if>
                            <c:if test="${schedule.isTypeOfInterview() == false}">
                                Online
                            </c:if>
                            <c:if test="${schedule.isTypeOfInterview() == null}">
                                Null
                            </c:if>
                        </td>
                        <td>${schedule.getjAS().size()}/10</td>
                        <td>${schedule.getiRS().size()}</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <form method="post" action="<c:url value="/schedules/schedule-details/start-schedule"/>">
            <input type="hidden" name="scheduleID" value="${schedule.getScheduleId()}"/>
            <h4>Number of interviewers: ${schedule.getiRS().size()}</h4>
            <c:forEach var="item" items="${schedule.getiRS()}" varStatus="counter">
                <p>Count: ${counter.count}</p>
                <p>Interviewer: ${item.getEmployee().getEmail()}</p>
            </c:forEach>
            <section>
                <h2>Interviewer & Date and Time</h2>
                <div class="box-container">
                    <div class="box">
                        <h4>Day and Time Interview</h4>
                        <p>- Setup day and time of interview schedule</p>
                        <!--                        <label for="datetime">- Select date and time:</label>
                                                <input type="datetime-local" id="datetime" name="datetime" required="true">-->
                        Date: <input type="date" name="InterviewDate" required="true"/>
                        Time: <input type="time" min="08:00" max="17:00" name="InterviewTime"  required="true"/>
                    </div>
                    <div class="box">
                        <h4>Interviewer</h4>
                        <p>- Choose the number of interview for this schedule</p>
                        <div class="question">- Interviewer:</div>
                        <select id="interviewers" name="interviewers" multiple>
                            <c:forEach var="item" items="${listInterviewers}">
                                <c:if test="${fn:contains(stringMatch, item.getId()) == false}">
                                    <option value="${item.getId()}">
                                        ${item.getId()} - ${item.getEmail()} - ${item.getName()}
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <h3>Choose location and type of interview</h3>
                Location: <input type="text" name="Location" required="true"/>
                Offline <input type="checkbox" name="typeOfInterview" checked="true" value="1"/>

            </section>
            <div class="center">
                <input type="submit" name="action" value="start"/>
            </div>
        </form>
    </div>
</c:if>

<c:if test="${schedule.getStatus() eq 'On Going'}">
    <section>
        <h2>Interviewer & Date and Time</h2>
        <div class="box-container">
            <div class="box">
                <h4>Day and Time Interview</h4>
                <p>- Setup day and time of interview schedule</p>
                <label for="datetime">- Select date and time:</label>
                <input type="datetime-local" id="datetime" name="datetime">
            </div>
            <div class="box">
                <h4>Interviewer</h4>
                <p>- Choose the number of interview for this schedule</p>
                <label for="quantity">Number of Interview:</label>
                <input type="number" id="quantity" name="quantity" min="1" max="3" step="1">
                <div class="question">- Interviewer:</div>
                <div class="label">
                    <label class="multiple-checkbox">
                        <input type="checkbox" name="fruit" value="apple">
                        Email: TranVanC@gmail.com;
                        Full Name: Tran Van C;
                        Role: Manager
                    </label>
                    <label>
                        <input type="checkbox" name="fruit" value="banana">						
                        Email: TranVanC@gmail.com;
                        Full Name: Tran Van C;
                        Role: Manager
                    </label>
                    <label>
                        <input type="checkbox" name="fruit" value="banana">						
                        Email: TranVanC@gmail.com;
                        Full Name: Tran Van C;
                        Role: Manager
                    </label>

                </div>
            </div>
        </div>

    </section>
    <div class="center">
        <input type="submit" name="action" value="start"/>
    </div>
</c:if>



<header>
    <h1>Interview Schedule Detail</h1>
</header>
<div class="status on-going">Status: On Going</div>
<div class="schedule-detail">
    <div class="info-col">
        <div class="info-row">
            <div class="label">Schedule ID:</div>
            <div class="value">S0002</div>
        </div>
        <div class="info-row">
            <div class="label">Job Name:</div>
            <div class="value">Front-End</div>
        </div>
        <div class="info-row">
            <div class="label">Round 1:</div>
            <div class="value">Soft Skill</div>
        </div>
        <div class="info-row">
            <div class="label">Type of Interview:</div>
            <div class="value">Online</div>
        </div>
        <div class="info-row">
            <div class="label">Interview Date:</div>
            <div class="value">Monday, March 14, 2022</div>
        </div>
        <div class="info-row">
            <div class="label">Interview Time:</div>
            <div class="value">9:00 AM - 10:00 AM</div>
        </div>
    </div>
</div>
<table class="interview-table">
    <div class="info-candidate">Infomation Candidate</div>
    <thead>
        <tr>
            <th>Number</th>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>C01</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>2</td>
            <td>C02</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>3</td>
            <td>C03</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>4</td>
            <td>C04</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>5</td>
            <td>C05</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>6</td>
            <td>C06</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>7</td>
            <td>C07</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>8</td>
            <td>C08</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>9</td>
            <td>C09</td>
            <td>Tran Van A</td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>

    <tbody>
        <tr>
            <td>10</td>
            <td>C10</td>
            <td>Tran Van A  </td>
            <td>tranvana@gmail.com</td>
        </tr>
    </tbody>
</table>
<table class="interview-table">
    <div class="info-candidate">Infomation Interviewer</div>
    <thead>
        <tr>
            <th>Number</th>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>I01</td>
            <td>Lo Quang B</td>
            <td>loquangb@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>2</td>
            <td>I02</td>
            <td>Lo Quang B</td>
            <td>loquangb@gmail.com</td>
        </tr>
    </tbody>
    <tbody>
        <tr>
            <td>3</td>
            <td>I03</td>
            <td>Lo Quang B</td>
            <td>loquangb@gmail.com</td>
        </tr>
    </tbody>
</table>