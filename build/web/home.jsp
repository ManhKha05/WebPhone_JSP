<%-- 
    Document   : home
    Created on : Aug 7, 2025, 12:09:34 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page import="java.util.Map"%>
<%@page import="utils.PriceUtil"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
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
	    header .cart, .log-out  {
		font-size: 20px;
		margin-left: 200px;
		border-radius: 5px;
		padding: 5px 20px;
		text-decoration: none;
		border: 1px solid #d2e4e6;
	    }
	    header .log-out {
		margin-left: 20px;
	    }
	    .cart i {
		margin: 0px;
	    }
	    header h3 {
		margin-left: 20px;
		display: inline;
	    }
	    .container {
		display: flex;
	    }

	    nav {
		position: fixed;
		top: 50px;
		width: 15%;
		height: 100vh;
		margin-right: 1%;
		text-align: center;
		background-color: #f0f0f0;
		border-radius: 8px;
	    }

	    .brand li {
		list-style: none;
	    }

	    .brand li a {
		display: block;
		text-align: left;
		width: 140px;
		height: 40px;
		padding: 5px 10px;
		margin-bottom: 20px;
		margin-left: -20px;
		border: 2px solid #d9caca;
		border-radius: 10px;
	    }

	    .brand li a:hover {
		background-color: #ded9d9;
		border-radius: 10px;
	    }
	    .brand .selected {
		background-color: #ded9d9;
	    }

	    .brand img {
		width: 100px;
	    }

	    .brand .bigger {
		margin-left: -30px;
		width: 160px;
	    }

	    main {
		margin-top: 50px;
		margin-left: 16%;
		padding-left: 30px;
		background-color: #f8f8f8;
		width: 89%;
		border-radius: 8px;
	    }

	    .sort-options {
		display: flex;
		height: 30px;
		padding-top: 25px;
	    }

	    .sort-options i {
		margin-left: 20px;
	    }

	    .sort-options .item {
		color: #1d1d20;
		text-decoration: none;
		padding: 10px;
		margin: 0px 10px;
		border-radius: 50px;
		border: 1px solid #d2e4e6;
		background-color: #f7f7f8;
	    }

	    .sort-options .sort-selected {
		color: #3b82f6;
		border: 1px solid #3b82f6;
	    }

	    .product-list {
		display: flex;
		flex-wrap: wrap;
	    }

	    .product {
		display: block;
		background-color: #fff;
		width: 270px;
		box-sizing: border-box;
		height: 400px;
		margin: 10px;
		padding: 10px;
		border-radius: 10px;
		border: 1px solid #eaecf0;
		box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.3);
	    }

	    .product img {
		display: block;
		margin: 0 auto 20px;
		width: 200px;
		height: 200px;
	    }

	    .price-through {
		color: #6b7280;
		text-decoration: line-through;
	    }

	    .price {
		color: #d70018;
		font-size: 20px;
	    }
	    .sale-tag {
		color: #d70018;
		font-size: 15px;
	    }
	    .product .detail {
		color: #000;
		text-align: center;
		padding-top: 10px;
		margin-top: 15px;
		margin-right: 15px;
		display: inline-block;
		background-color:#ede1e1;
		border: 1px solid #e0e0e0;
		border-radius: 8px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.20);
		width: 150px;
		height: 30px;
		text-decoration: none;
	    }
	    .pagination {
		display: flex;
		justify-content: center;
		text-align: center;
	    }
	    .pagination li{
		list-style: none;
	    }
	    .pagination li a {
		display: inline-block;
		margin: 20px 5px;
		padding: 10px 15px;
		color: #000;
		border: 1px solid #e0e0e0;
		border-radius: 5px;
		box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.3);
		text-decoration: none;
	    }
	    .pagination li a:hover {
		color: #fff;
		background-color: #000;
	    }
	    .pagination .disabled {
		pointer-events: none;
		opacity: 0.5;
	    }
	    .pagination .selected {
		color: #fff;
		background-color: #000;
	    }
	</style>
	<header>
	    <span><a href="./home">Home</a></span>
	    <span>About</span>
	    <span>Services</span>
	    <span>Contact</span>
	    <span>
		<a class="cart" href="./cart"><i class="fa-solid fa-cart-plus"></i> Giỏ hàng</a>
	    </span>
	    <c:set var = "user" value= "${sessionScope.user}"/>
	    <c:if test="${user != null}">
		<h3>Xin chào : ${sessionScope.user.first_name} ${sessionScope.user.last_name}</h3>
		<span>
		    <a class="log-out" href="./log-out"></i> Đăng xuất</a>
		</span>
	    </c:if>
	    <c:if test="${user == null}">
		<span>
		    <a class="log-out" href="./login"></i> Đăng nhập</a>
		</span>
	    </c:if>
	</header>
	<div class="container">
	    <nav>
		<h2>Nhà sản xuất</h2>
		<ul class="brand">
		    <c:set var="brand" value="${param.brand}"/>
		    <c:set var="url" value=""/>
		    <c:forEach var="entry" items="${paramValues}">
			<c:if test="${entry.key ne 'brand' and entry.key ne 'page'}">
			    <c:set var="url" value="${url}${entry.key}=${entry.value[0]}&"/>
			</c:if>
		    </c:forEach>
		    <li><a href="./home?${url}brand=1&page=1" class="${brand eq '1' ? "selected" : ""}">
			    <img src="https://cdnv2.tgdd.vn/mwg-static/common/Category/57/03/5703d996359650c57421b72f3f7ff5cd.png" alt=""></a>
		    </li>
		    <li><a href="./home?${url}brand=2&page=1" class="${brand eq '2' ? "selected" : ""}">
			    <img src="https://cdnv2.tgdd.vn/mwg-static/common/Category/3f/68/3f68e22880dd800e9e34d55245048a0f.png" alt=""></a>
		    </li>
		    <li><a href="./home?${url}brand=3&page=1" class="${brand eq '3' ? "selected" : ""}">
			    <img src="https://cdnv2.tgdd.vn/mwg-static/common/Category/2c/ea/2cea467041fb9effb3a6d3dcc88f38f8.png"alt=""></a>
		    </li>
		    <li><a href="./home?${url}brand=4&page=1" class="${brand eq '4' ? "selected" : ""}">
			    <img class="bigger" src="https://cdnv2.tgdd.vn/mwg-static/common/Category/e6/02/e602583e5e16acedfe54ab41b08b5d4f.png"alt=""></a>
		    </li>
		</ul>
	    </nav>
	    <main>
		<div class="sort-options">
		    <span style="font-size: 20px;">Sắp xếp theo:</span>
		    <c:set var="sortFeild" value="${param.sortFeild}"/>
		    <c:set var="sortOrder" value="${param.sortOrder}"/>
		    <c:set var="brandId" value="${param.brand}"/>
		    <c:choose>
			<c:when test="${not empty brandId}">
			    <c:set var="brandId" value="brand=${brandId}&"/>
			</c:when>
			<c:otherwise>
			    <c:set var="brandId" value=""/>
			</c:otherwise>
		    </c:choose>
		    <div>
			<i class="fa-solid fa-percent"></i>
			<a href="./home?${brandId}sortFeild=sale-rate&page=1" class="item ${sortFeild eq "sale-rate" ? "sort-selected" : ""}" >Khuyến mãi HOT</a>
		    </div>
		    <div>
			<i class="fa-solid fa-arrow-up-short-wide"></i>
			<a href="./home?${brandId}sortFeild=price&sortOrder=asc&page=1" class="item ${sortOrder eq "asc" ? "sort-selected" : ""}">Giá Thấp - Cao</a>
		    </div>
		    <div>
			<i class="fa-solid fa-arrow-down-wide-short"></i>
			<a href="./home?${brandId}sortFeild=price&sortOrder=desc&page=1" class="item ${sortOrder eq "desc" ? "sort-selected" : ""}">Giá Cao - Thấp</a>
		    </div>
		</div>
		<div class="product-list">
		    <c:forEach var="p" items="${listProduct}">
			<div class="product">
			    <img src="${p.images[0]}" alt="">
			    <h3>${p.name}</h3>
			    <span class="price-through">
				${PriceUtil.handlePrice(p.original_price)}đ
			    </span>
			    <span class="sale-tag">-${p.sale_rate}%</span><br>
			    <strong class="price">
				${PriceUtil.handlePrice(p.promo_price)}đ
			    </strong><br>
			    <a class="detail" href="./product-detail?id=${p.id}">Chi tiết sản phẩm</a>
			</div>
		    </c:forEach>
		</div>
		<div>
		    <ul class="pagination">
			<c:set var="totalPages" value="${totalPages}"/>
			<c:set var="pageCur" value="${page + 0}"/>
			<c:set var="url" value=""/>
			<c:forEach var="entry" items="${paramValues}">
			    <c:if test="${entry.key ne 'page'}">
				<c:set var="url" value="${url}${entry.key}=${entry.value[0]}&"/>
			    </c:if>
			</c:forEach>
			<li>
			    <a href="./home?${url}page=${pageCur - 1}" class="${pageCur eq 1 ? "disabled" : ""}"><< Back</a>
			</li>
			
			<c:forEach var="i" begin="1" end="${totalPages}">
			    <li>
				<a href="./home?${url}page=${i}" class="${i eq pageCur ? "selected" : ""}">${i}</a>
			    </li>
			</c:forEach>
			
			<li>
			    <a href="./home?${url}page=${pageCur + 1}" class="${pageCur eq totalPages ? "disabled" : ""}">Next >></a>
			</li>
		    </ul>
		</div>
	    </main>
	</div>
    </body>
</html>
