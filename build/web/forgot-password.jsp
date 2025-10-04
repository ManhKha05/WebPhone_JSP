<%-- 
    Document   : forgot-password
    Created on : Aug 7, 2025, 2:12:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
        body {
            font-size: 20px;
        }
        .forgot {
            position: absolute;
            top: calc(50% - 150px);
            left: calc(50% - 175px);
            text-align: center;
            border: 2px solid rgb(165, 94, 106);
            border-radius: 10px;
            box-shadow: 0 0 10px rgb(173, 164, 166);
            width: 350px;
            height: 300px;
        }     
        input {
            font-size: 16px;
            margin: 10px;
            padding: 6px 20px;
            width: 200px;
        }
        input:focus {
            outline: none;
        }
        .failed {
            color: red;
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
    </style>
    <form action="./forgot-password" method="post" class="forgot">
	<input style="display: none" name="action" value="request-reset">
        <h2>Forgot Password</h2>
        <p>Enter your Username</p>
        <input type="text" name="username" placeholder="Enter username">
	<c:if test="${not empty message}">
	    <div class="failed">
		${message}
	    </div>
	</c:if>
        <button class="btn-login">Continue</button>
    </form>
    </body>
</html>
