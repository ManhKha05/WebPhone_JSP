<%-- 
    Document   : login
    Created on : Aug 7, 2025, 12:13:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <style>
        body {
            font-size: 20px;
        }
        .log-in {
            position: absolute;
            top: calc(50% - 200px);
            left: calc(50% - 175px);
            text-align: center;
            border: 2px solid rgb(165, 94, 106);
            border-radius: 10px;
            box-shadow: 0 0 10px rgb(173, 164, 166);
            width: 350px;
            height: 400px;
        }
        .input-wrapper {
            position: relative;
        }
        .input-wrapper i {
            font-size: 18px;
            position: absolute;
            top: 17px;
            left: 55px;
        }
        
        .input-wrapper input {
            font-size: 16px;
            margin: 10px;
            padding: 6px 10px 6px 37px;
            width: 200px;
        }
        .input-wrapper input:focus {
            outline: none;
        }
	.failed {
            font-size: 17px;
            color: red;
        }
        .forgot {
            display: inline-block;
            margin-top: 20px;
        }
        .btn-login {
            color: #fff;
            font-size: 16px;
            background-color: #5372F0;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            width: 250px;
            height: 40px;
        }
        p, a {
            font-size: 18px;
        }
        a {
            text-decoration: none;
        }
    </style>
    <form action="./login" method="post" class="log-in">
        <h2>Login Form</h2>
        <div class="input-wrapper">
            <i class="fa-regular fa-circle-user"></i>
            <input type="text" name="username" placeholder="Username" value="${username}">
        </div>
        <div class="input-wrapper">
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="Password" value="${password}"><br>
        </div>
	<c:if test="${not empty message}">
	    <div class="failed">
		${message}
	    </div>
	</c:if>
        <a href="./forgot-password" class="forgot">Forgot password?</a><br>
        <button class="btn-login">Login</button>
        <p>Not yet member? <a href="./register">Signup now</a></p>
    </form>
    </body>
</html>
