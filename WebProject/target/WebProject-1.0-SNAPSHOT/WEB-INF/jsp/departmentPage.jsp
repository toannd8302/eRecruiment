<%-- 
    Document   : departmentPage
    Created on : Mar 1, 2023, 11:21:41 AM
    Author     : KHOA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--TẠI TRANG NÀY SẼ VIEW CÁC JOBPOSTING CỦA PHÒNG ĐANG ĐĂNG NHẬP VÀ TẠO MỚI 1 JOBPOSTING-->
<h1>DEPARTMENT PAGE</h1>

<h2>Department: ${sessionScope.department.departmentName}</h2>

<a href="<c:url value="/createjobposting" />">Create Job Posting</a>
