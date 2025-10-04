<%-- 
    Document   : register
    Created on : Aug 8, 2025, 12:18:53 PM
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
		padding: 0;
		margin: 0;
		font-size: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	    }
	    .register-form {
		text-align: center;
		border: 2px solid rgb(165, 94, 106);
		border-radius: 10px;
		box-shadow: 0 0 10px rgb(173, 164, 166);
		width: 500px;
		height: 70vh;
	    }  
	    .input {
		display: inline-block;
		padding-bottom: 10px;
		text-align: left;
	    }
	    .input span {
		font-size: 17px;
	    }
	    .input input {
		font-size: 15px;
		padding-left: 10px;
		height: 25px;
		border: 1px solid #ccc;
		border-radius: 3px;
	    }
	    input:focus {
		outline: none;
	    }
	    .gender{
		display: inline-block;
		text-align: left;
	    }
	    .gender label {
		margin-right: 30px;
	    }
	    .inform {
		color: red;
	    }
	    .btn-register {
		color: #fff;
		font-size: 16px;
		background-color: #5372F0;
		border: none;
		border-radius: 5px;
		margin-top: 25px;
		width: 250px;
		height: 40px;
	    }
	</style>
	<div class="form">
	    <form action="./register" method="post" class="register-form">
		<h2>Registration</h2>
		<div class="input">
		    <span>First Name</span><br>
		    <input type="text" name="first-name" placeholder="Enter your first name">
		</div>
		<div class="input">
		    <span>Last Name</span><br>
		    <input type="text" name="last-name" placeholder="Enter your last name">
		</div>
		<div class="input">
		    <span>Username</span><br>
		    <input type="text" name="username" placeholder="Enter your username">
		</div>
		<div class="input">
		    <span>Email</span><br>
		    <input type="text" name="email" placeholder="Enter your email">
		</div>
		<div class="input">
		    <span>Password</span><br>
		    <input type="text" name="password" placeholder="Enter your password">
		</div>
		<div class="input">
		    <span>Confirm Password</span><br>
		    <input type="text" name="confirm-password" placeholder="Confirm your password">
		</div>
		<div class="gender">
		    <span>Gender</span><br>
		    <input type="radio" name="gender" value="male" id="male">
		    <label for="male">Male</label>
		    <input type="radio" name="gender" value="female" id="female">
		    <label for="female">Female</label>
		    <input type="radio" name="gender" value="prefer-not-to-say" id="prefer-not-to-say">
		    <label for="prefer-not-to-say">Prefer not to say</label>
		</div>
		<c:if test="${not empty message}">
		    <div class="failed">
			${message}
		    </div>
		</c:if>
		<button class="btn-register">Register</button>
	    </form>
	</div>
    </body>
</html>
