<%-- 
    Document   : empPostDetails
    Created on : Mar 5, 2023, 9:25:13 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<h1>Job Posting Details</h1>

<h3>Post ID: ${jobPosting.getPostId()}</h3>

<p>Created date: <fmt:formatDate value="${jobPosting.getCreatedTime()}" pattern="dd/MM/yyyy"/></p>

<h2>Department: ${jobPosting.getJobPosition().getDepartment().getDepartmentName()}</h2>

<h2>Job Position: ${jobPosting.getJobPosition().getJobName()}</h2>

<p>Salary: ${jobPosting.getSalary()}</p>

<p>Location: ${jobPosting.getLocations()}</p>

<p>
    <c:if test="${jobPosting.isTypeOfWork() == true}">
        Type of Work: At Office
    </c:if>
    <c:if test="${jobPosting.isTypeOfWork() == false}">
        Type of Work: Hybrid
    </c:if>
</p>

<p>Description: ${jobPosting.getDescriptions()}</p>

<p>Welfare: ${jobPosting.getWelfare()}</p>

<p>Level: ${jobPosting.getLevel()}</p>

<p>Required: ${jobPosting.getExprienceRequirement()}</p>

<c:if test="${jobPosting.isApprovedStatus() eq 'Pending'}">
    <form method="post" action="<c:url value="/evaluate-post"/>">
        <input type="hidden" name="postID" value="${jobPosting.getPostId()}">
        <input type="date" name="expiredDate" required="true"/>
        <input type="submit" name="action" value="accept"/>
    </form>
    <form method="post" action="<c:url value="/reject-post"/>">
        <input type="hidden" name="postID" value="${jobPosting.getPostId()}">
        <input type="submit" name="action" value="reject"/>
    </form>
</c:if>

<c:if test="${jobPosting.isApprovedStatus() eq 'Approved'}">
    <form method="post" action="<c:url value="/end-post"/>">
        <input type="hidden" name="postID" value="${jobPosting.getPostId()}">
        <input type="submit" name="action" value="end"/>
    </form>
</c:if>