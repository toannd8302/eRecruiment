<%-- 
    Document   : loginPage
    Created on : Feb 27, 2023, 9:20:54 PM
    Author     : KHOA
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <style>
            *{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
            }
            body{
                background: url('https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80') no-repeat;
                background-size: cover;
            }
            .login-form{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                background-color: white;
                width: 40%;
                border-radius: 0.5rem;
            }
            .login-form h1{
                text-align: center;
                padding: 1.5rem;
                border-bottom: 1px solid rgb(133, 133, 133);
            }
            .login-with-acc{
                padding: 0 2rem;
                box-sizing: border-box;
            }
            .txt_field{
                position: relative;
                border-bottom: 0.2rem solid #adadad;
                margin: 2rem 0;
            }
            .txt_field input{
                width: 100%;
                padding: 0 0.5rem;
                height: 3rem;
                font-size: 1.5rem;
                border: none;
                background: none;
                outline: none;
            }
            .txt_field label{
                position: absolute;
                top: 50%;
                left: 1%;
                color: #adadad;
                transform: translateY(-50%);
                font-size: 1.5rem;
                pointer-events: none;
                transition: 0.5s;
            }
            .txt_field span::before{
                content: '';
                position: absolute;
                left: 0;
                width: 100%;
                height: 0.2rem;
                background: #2691d9;
                transition: 0.5s;
            }
            .txt_field input:focus ~ label,
            .txt_field input:valid ~ label{
                top: -0.3rem;
                color: #2691d9;
            }
            .txt_field input:focus ~ span::before,
            .txt_field input:valid ~ span::before{
                width: 100%;
            }
            #forgot-pass{
                text-decoration: none;
                color: #adadad;
                font-size: 1.3rem;
                margin-bottom: 1.5rem;
            }
            #forgot-pass:hover{
                text-decoration: underline;
            }
            #login-btn{
                width: 100%;
                height: 3rem;
                border: 1px solid;
                border-radius: 2rem;
                background: #2691d9;
                font-size: 1.5rem;
                color: #e9f4fb;
                font-weight: bold;
                cursor: pointer;
                outline: none;
                margin-top: 1.5rem;
                margin-bottom: 1.5rem;
            }
            #login-btn:hover{
                border-color: #2691d9;
                transition: 0.5s;
            }
            .signup_link{
                text-align: center;
            }
            .signup_link{
                color: #adadad;
            }
            .signup_link a{
                text-decoration: none;
                font-weight: bold;
                color: #2691d9;
            }
            #or{
                text-align: center;
                margin-top: 2rem;
            }
            .login-with-google{
                margin-top: 2rem;
                margin-bottom: 2rem;
                display: flex;
                justify-content: space-around;
            }
            .login-with-google h3{
                text-align: center;
            }
            .login-with-google a{
                margin-top: 1rem;
                width: 15rem;
                color: white;
                background-color: rgb(253, 69, 69);
                display: inline-block;
                text-align: center;
                font-size: 2rem;
                border-radius: 2rem;
                transition: 0.7s;
            }
            .login-with-google a:hover{
                background-color: rgb(167, 54, 54);
            }
            .login-with-google .right a{
                margin-top: 1rem;
                width: 15rem;
                color: rgb(253, 69, 69);
                background-color: white;
                display: inline-block;
                text-align: center;
                font-size: 2rem;
                border-radius: 2rem;
                border: 1px solid rgb(139, 139, 139);
                transition: 0.7s;
            }
            .login-with-google .right a:hover{
                background-color: rgb(168, 168, 168);
            }
        </style>
    </head>
    <body>
        <c:if test="${ERROR != null}">
            <p>${ERROR}</p>
        </c:if>
        <div class="login-form">
            <h1>LOGIN</h1>

            <div class="login-with-acc">
                <div class="txt_field">
                    <input type="text" required />
                    <span></span>
                    <label>Username</label>
                </div>
                <div class="txt_field">
                    <input type="text" required />
                    <span></span>
                    <label>Password</label>
                </div>
                <a href="#" id="forgot-pass">Forgot Password?</a>
                <br />
                <button id="login-btn">Login</button>
                <div class="signup_link">
                    Haven't an account yet?
                    <a href="#">Signup</a>
                </div>
            </div>

            <h3 id="or">Or</h3>

            <div class="login-with-google">
                <sec:authorize access="!isAuthenticated()">
                    <div class="left"><h3>A Candidate?</h3>
                        <a href="<c:url value="/oauth2/authorization/google-candidate"/>"><i class="fa-brands fa-google-plus-g"></i></a></div>

                    <div class="right"><h3>A Employee?</h3>
                        <a href="<c:url value="/oauth2/authorization/google-employee"/>"><i class="fa-brands fa-google-plus-g"></i></a></div>
                        </sec:authorize>
                
                
            </div>
        </div>

    </body>
</html>