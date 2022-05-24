<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>

<style type="text/css">
div.products div.productsInfo {
	float: right;
	width: 550px;
	font-size: 22px;
}

div.products div.productsInfo p {
	margin: 0 0 20px 0;
}

div.products div.productsInfo p span {
	display: inline-block;
	width: 100px;
	margin-right: 15px;
}

td button {
	font-size: 26px;
	border: none;
	background: none;
}

input {
	font-size: 22px;
	width: 50px;
	padding: 5px;
	margin: 0;
	border: 1px solid #eee;
}

#inputnumbox {
	pointer-events: none;
}
</style>
<title>Cart list</title>
</head>
<body>

	<div class="container">
		<h1 class="display-3">장바구니</h1>
		<div style="padding-top: 50px;">
			<table class="table table-hover">
				<tr>
					<th><input type="checkbox" class="checkAll"></th>
					<th>이미지</th>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>총 가격</th>
					<th>비고</th>
				</tr>
				<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="7" align="center">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				<div class="row">
				<table>
					<tr>
						<td align="center"><a href="../product/list"
							class="btn btn-secondary"> 쇼핑 계속하기</a>
						</td>
					</tr>
				</table>
				</div>
				</c:when>
				<c:otherwise>

				<c:forEach items="${list}" var="vo">
					<tr>
						<td><input type="checkbox" class="check"
							data-check="${vo.cartNum}"></td>
						<td><img style="width: 50px; height: 50px;"
							src="../resources/upload/product/${vo.productFileVOs[0].fileName}"></td>
						<td>${vo.productVO.productName}</td>
						<td>${vo.productVO.totalPrice}</td>
						<td>
							<div class="countBtn" data-pNum="${vo.cartNum}">
								<button type="button" id="minus" data-num="${vo.cartNum}"
									class="minus">-</button>
								<!--히든  -->
								<input class="pCount${vo.cartNum}" type="hidden"
									value="${vo.productVO.productCount}"> <input
									class="pPrice${vo.cartNum}" type="hidden"
									value="${vo.productVO.totalPrice}">
								<!--히든 끝 -->
								<input type="number" id="inputnumbox"
									class="col-2 numBox${vo.cartNum}" value="${vo.productAmount}"
									readonly="readonly" />
								<button type="button" id="plus" data-num="${vo.cartNum}"
									class="plus">+</button>
							</div>
						</td>
						<td><input type="number" id="priceResult${vo.cartNum}"
							class="col-5 priceResult"
							value="${vo.productVO.totalPrice * vo.productAmount}"
							readonly="readonly" style="border: none" /></td>
						<td><button id="deleteBtn${vo.cartNum}"
								class="btn btn-danger">삭제</button></td>

					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th>총 상품갯수</th>
					<th style="text-align: right">총 액</th>
					<th><input type="number" id="totalResult" class="col-5"
						value="" readonly="readonly" style="border: none" /></th>
					<th></th>
				</tr>
			</table>
			<div class="row">
				<table>
					<tr>
						<td align="left">
							<button id="allBtn" class="btn btn-danger">선택상품 삭제</button>
						</td>
						<td align="right"><a href="../product/list"
							class="btn btn-secondary"> 쇼핑 계속하기</a>
							<button id="orderBtn" class="btn btn-secondary">주문하기</button></td>
					</tr>
				</table>
				
			</div>
				
				</c:otherwise>
				</c:choose>
		</div>
				
	</div>

	<script type="text/javascript" src="../resources/js/cart.js"></script>
</body>
</html>