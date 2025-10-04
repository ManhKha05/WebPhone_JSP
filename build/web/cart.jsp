<%-- 
    Document   : cart
    Created on : Aug 17, 2025, 10:29:20 PM
    Author     : Admin
--%>

<%@page import="model.CartItem"%>
<%@page import="model.User"%>
<%@page import="utils.PriceUtil"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
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
	    * {
		margin: 0;
		padding: 0;
	    }
	    header {
		color: #fff;
		height: 50px;
		width: 100vw;
		position: fixed;
		top: 0;
		background-color: #444343;
	    }
	    header span {
		font-size: 23px;
		display: inline-block;
		margin: 10px 40px;
	    }
	    header .log-out  {
		font-size: 20px;
		margin-left: 0px;
		border-radius: 5px;
		padding: 5px 20px;
		text-decoration: none;
		border: 1px solid #d2e4e6;
	    }
	    header a {
		color: #fff;
		font-size: 23px;
		text-decoration: none;
	    }
	    h2 {
		margin-top: 60px;
		margin-bottom: 10px;
		font-size: 40px;
		text-align: center;
	    }
	    header h3 {
		margin-left: 500px;
		display: inline;
	    }
	    .table-cart {
		margin: 0 auto;
		font-size: 25px;
		width: 80%;
		border-collapse: collapse;
	    }
	    thead {
		background-color: #b79c9c;
	    }
	    .table-cart th, td {
		padding: 10px;
		text-align: left;
		box-sizing: border-box;
	    }
	    .table-cart td {
		border-bottom: 2px solid #ece4e4;
	    }
	    .table-cart .product-name {
		width: 400px;
	    }
	    .table-cart td a:visited {
		color: blue;
	    }
	    .table-cart tr:last-child a:visited {
		color: #000;
	    }
	    .table-cart tr:last-child td{
		background-color: #fff;
		border: none;
		padding-top: 20px;
	    }
	    img {
		width: 60px;
	    }
	    a {
		text-decoration: none;
	    }
	    
	    .btnOrder {
		display: block;
		color: #000;
		background-color: rgb(168, 226, 226);
		text-decoration: none;
		width: 200px;
		height: 40px;
		text-align: center;
		border-radius: 10px;
	    }
	    .modal {
		top: 0;
		position: fixed;
		display: none;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,0.6);
	    }
	    .modal:target {
		display: flex;
	    }
	    .modal-content {
		background-color: #fff;
		width: 70%;
		height: 60%;
		border-radius: 20px;
		padding: 20px;
	    }
	    .modal-content h2 {
		font-size: 30px;
		margin: 0;
	    }
	    .inner-modal {
		font-size: 20px;
		display: flex;
		justify-content: space-around;
		padding: 30px;
	    }
	    .inner-modal .inner-main {
		width: 60%;
		padding-left: 50px;
		text-align: left;
	    }
	    .inner-modal .inner-main input {
		margin-bottom: 20px;
		border: none;
		border-bottom: 1px solid #d4cfcf;
		width: 450px;
		outline: none;
		font-size: 20px;
		margin-top: 10px;
	    }
	    .inner-modal .inner-main textarea {
		margin-top: 10px;
		border: 1px solid #d4cfcf;
		font-size: 20px;
	    }
	    .inner-modal .inner-main textarea:focus {
		outline: none;
	    }

	    .inner-modal .inner-desc {
		width: 40%;
		padding-left: 70px;
		border-left: 1px solid #9c8989;
	    }
	    .inner-modal .inner-desc table {
		display: block;
		max-height: 110px;
		overflow: auto;
	    }
	    .inner-modal td {
		padding: 5px 40px 5px 0;
	    }
	    .inner-modal .inner-title {
		font-size: 25px;
		margin-top: 5px;
	    }
	    .inner-modal button {
		font-size: 25px;
		width: 250px;
		height: 40px;
		margin-top: 30px;
		color: #000;
		background-color: #fff;
		border-radius: 8px;
	    }
	    .inner-modal button:hover {
		color: #fff;
		background-color: rgb(101, 130, 101);
	    }
	    .inner-modal .close {
		display: inline-block;
		width: 90px;
		height: 30px;
		background-color: #c2b5b5;
		border-radius: 8px;
		padding-top: 10px;
		text-align: center;
		color: #000;
		border: 2px solid #000;
	    }
	</style>
	<header>
	    
	    <span><a href="./home?page=1">Home</a></span>
	    <span>About</span>
	    <span>Services</span>
	    <span>Contact</span>
	    <h3>Xin chào : ${sessionScope.user.first_name} ${sessionScope.user.last_name}</h3>
	    <span>
		<a class="log-out" href="./log-out"></i> Đăng xuất</a>
	    </span>
	</header>
	<h2>Giỏ hàng của bạn</h2>
	<table class="table-cart">
	    <thead>
		<tr>
		    <th>STT</th>
		    <th></th>
		    <th>Tên sản phẩm</th>
		    <th>Số lượng</th>
		    <th>Giá</th>
		    <th>Hành động</th>
		</tr>
	    </thead>
	    <tbody>
		
		<c:set var="totalPrice" value="0"/>
		<c:forEach var="item" items="${cartItems}" varStatus="status">
		    <c:set var="totalPrice" value="${totalPrice + item.price}"/>
		    <tr>
			<td>${status.index + 1}</td>
			<td><img src="${item.img_url}" alt=""></td>
			<td class="product-name">${item.name}</td>
			<td>${item.quantity}</td>
			<td>${PriceUtil.handlePrice(item.price)}đ</td>
			<td>
			    <a href="./remove-from-cart?id=${item.product_id}">Xóa sản phẩm</a>
			</td>
		    </tr>
		</c:forEach>
		<tr>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td>Tổng tiền:</td>
		    <td>${PriceUtil.handlePrice(totalPrice)}đ</td>
		    <td>
			<a href="#modalView" class="btnOrder">Đặt hàng ngay</a>
		    </td>
		</tr>
	    </tbody>
	</table>
		    
	<div id="modalView" class="modal">
	    <div class="modal-content">
		<h2>Thông tin đơn hàng</h2><br><hr>
		<form action="./order" method="post" class="inner-modal" accept-charset="UTF-8">
		    <div class="inner-main">
			<label>Họ tên người nhận:</label><br>
			<input type="text" name="fullname"><br>

			<label>Số điện thoại:</label><br>
			<input type="text" name="phone"><br>

			<label>Địa chỉ nhận hàng:</label><br>
			<input type="text" name="address"><br>

			<label>Ghi chú (nếu có):</label><br>
			<textarea rows="3" cols="38" name="note"></textarea><br>
		    </div>
		    <div class="inner-desc">
			<h3>Đơn hàng</h3>
			<table>
			    <tbody>
				<c:forEach var="item" items="${cartItems}">
				    <tr>
					<td>${item.quantity}x</td>
					<td>${item.name}</td>
				    </tr>
				</c:forEach>
			    </tbody>
			</table>
			<div class="inner-title">Tiền hàng: ${PriceUtil.handlePrice(totalPrice)}đ</div>
			<div class="inner-title">Phí vận chuyển: 30.000đ</div><br>
			<hr>
			<div class="inner-title">Tổng tiền: ${PriceUtil.handlePrice(totalPrice + 30000)}đ</div>
			<input type="hidden" name="totalPrice" value="${totalPrice + 30000}">
			<button>Đặt hàng</button>
			<a href="#" class="close">Đóng</a>
		    </div>
		</form>
	    </div>
	</div>
    </body>
</html>
