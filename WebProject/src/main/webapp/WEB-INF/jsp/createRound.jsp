<%-- 
    Document   : createRound
    Created on : Mar 9, 2023, 11:38:25 AM
    Author     : toan0
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codeweb.pojos.jobPosting"%>
<%@page import="java.util.List"%>
<%@page import="com.codeweb.pojos.department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create round Page</title>
    </head>
    <body>
        <h2>Create rounds</h2>
        <%
            List<jobPosting> jobpostings = (List<jobPosting>) request.getAttribute("jobPostings");

        %>
        <%--<%= jobpostings.get(0).getPostId()%>--%>
        <c:url value="/createround" var="action"/>
     <body>
    <h1>Create Job Posting</h1>
    <form:form method="POST" modelAttribute="jobPosting" action="{action}">
        <table>
           
                <td>Rounds:</td>
                <td>
                    <div id="rounds">
                        <div class="round">
                            <form:input path="rounds.roundNumber" placeholder="Round Number"/>
                            <form:textarea path="rounds.content" placeholder="Content"/>
                            <button type="button" onclick="addRound()">Add Round</button>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <input type="submit" value="Save"/>
    </form:form>

    <script>
        function addRound() {
            var roundsDiv = document.getElementById("rounds");
            var roundDiv = document.createElement("div");
            var roundNumberInput = document.createElement("input");
            roundNumberInput.setAttribute("type", "text");
            roundNumberInput.setAttribute("name", "jobPosting.rounds[" + roundsDiv.childElementCount + "].roundNumber");
            roundNumberInput.setAttribute("placeholder", "Round Number");
            </script>

        <!--            <div>
        <%--<form:label path="roundNumber">Round Number</form:label>--%>                            
        <%--<form:input type="number" path="roundNumber" min="1" max="2"/>--%>
    </div>
    <div>
        <%--<form:label path="content">Content</form:label>--%>                            
        <%--<form:input type="text" path="content"/>--%>
    </div>
    
    <div>
        <%--<form:label path="roundNumber">Round Number</form:label>--%>                            
        <%--<form:input type="number" path="roundNumber" min="1" max="2"/>--%>
    </div>
    <div>
        <%--<form:label path="content">Content</form:label>--%>                            
        <%--<form:input type="text" path="content"/>--%>
    </div>
        <%--<form:input type="hidden" path="jobPoting.postId" value="<%= jobpostings.get(0).getPostId()%>" />--%>
       
    <button>Post</button>
    <input type="reset" value="Reset" />-->
    </body>
</html>
