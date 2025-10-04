<%-- 
    Document   : reset-password
    Created on : Aug 7, 2025, 2:37:00 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
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
	    .reset {
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
		margin: 7px;
		padding: 2px 15px;
		width: 210px;
	    }
	    input:focus {
		outline: none;
	    }
	    span {
		font-size: 16px;
		margin-left: 50px;
		text-align: left;
		display: block;
	    }
	    .failed {
		font-size: 18px;
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
	<form action="./forgot-password" method="post" class="reset">
	    <input style="display: none" name="action" value="reset-password">
	    <input style="display: none" name="userId" value=${userId}>
	    <h2>Reset Password</h2>
	    <span>Password</span>
	    <input type="text" name="password" placeholder="Create your password"><br>
	    <span>Confirm Password</span>
	    <input type="text" name="confirm-password" placeholder="Confirm your password"><br>
	    <c:if test="${not empty message}">
		<div class="failed">
		    ${message}
		</div>
	    </c:if>
	    <button class="btn-login">Change</button>
	</form>
    </body>
</html>
