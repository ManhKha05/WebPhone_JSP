<%-- 
    Document   : success-register
    Created on : Aug 8, 2025, 1:40:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <style>
	    body {
		font-size: 18px;
		margin: 0;
		padding: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	    }
	    form {
		text-align: center;
		border: 2px solid rgb(165, 94, 106);
		border-radius: 10px;
		box-shadow: 0 0 10px rgb(173, 164, 166);
		overflow: hidden;
		width: 300px;
		height: 50vh;
	    }  
	    .icon {
		background-color: rgb(80, 199, 80);
		color: #fff;
		width: 100%;
		height: 45%;
	    }
	    .icon i {
		font-size: 80px;
		margin-bottom: 20px;
	    }
	    .inform {
		padding: 20px 10px 5px;
	    }
	    .btn {
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
	<div class="container">
	    <form action="./login" method="get">
		<div class="icon">
		    <i class="fa-solid fa-check"></i><br>
		    <span>SUCCESS</span>
		</div>
		<div class="inform">
		    Congratulations, your account has been successfully created.
		</div>
		<button class="btn">Continue</button>
	    </form>
	</div>
    </body>
</html>
