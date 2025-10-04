<%-- 
    Document   : product-detail
    Created on : Aug 10, 2025, 1:18:51 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
	      integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
	      crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <style>
	    body {
		padding: 0;
		margin: 0;
	    }
	    header {
		color: #fff;
		height: 50px;
		width: 100vw;
		position: fixed;
		background-color: #444343;
	    }
	    header span {
		font-size: 23px;
		display: inline-block;
		margin: 10px 40px;
	    }
	    header a {
		color: #fff;
		font-size: 23px;
		text-decoration: none;
	    }
	    header h3 {
		position: relative;
		left: 500px;
		display: inline;
	    }
	    .container {
		display: flex;
	    }

	    .picture {
		position: fixed;
		top: 50px;
		width: 40%;
		height: 100vh;
		margin-right: 1%;
		text-align: center;
		background-color: #f0f0f0;
		border-radius: 8px;
	    }
	    .picture img {
		height: 200px;
	    }

	    .details {
		margin-top: 50px;
		margin-left: 41%;
		padding-left: 30px;
		font-size: 25px;
		background-color: #f8f8f8;
		width: 59%;
		height: calc(100vh - 50px);
		border-radius: 8px;
	    }
	    .details h3 {
		color: #1a1a1a;
		margin: 10px 0;
	    }
	    .details table {
		border-collapse: separate;
		border-spacing: 0 10px;
	    }
	    .details td {
		padding-right: 80px;
		padding-bottom: 10px;
		border-bottom: 2px solid #ece4e4;
	    }
	    .btn-add-cart {
		display: inline-block;
		margin-top: 5px;
		text-decoration: none;
		font-weight: bold;
		color: #000;
		padding: 10px 30px;
		background-color: #b79c9c;
		border: 2px solid #000;
		border-radius: 8px
	    }

	</style>
	<header>
	    <span><a href="./home?page=1">Home</a></span>
	    <span>About</span>
	    <span>Services</span>
	    <span>Contact</span>
	    <c:if test="${sessionScope.user != null}">
		<h3>Xin chào : ${sessionScope.user.first_name} ${sessionScope.user.last_name}</h3>
	    </c:if>
	</header>
	<div class="container">
	    <c:set var="product" value="${product}"/>
	    <div class="picture">
		<c:forEach var="img" items="${product.images}">
		    <img src="${img}" alt="">
		</c:forEach>
	    </div>
	    <div class="details">
		<h3>Thông tin sản phẩm: <big>${product.name}</big></h3>
		<table>
		    <tbody>
			<c:forEach var="entry" items="${product.specs}">
			    <tr>
				<td><b>${entry.key}:</b></td>
				<td>${entry.value}</td>
			    </tr>
			</c:forEach>
		    </tbody>
		</table>
		<a class="btn-add-cart" href="./add-to-cart?id=${product.id}">Thêm vào giỏ hàng</a>
	    </div>
	</div>
    </body>
</html>
