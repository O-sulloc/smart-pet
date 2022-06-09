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
<c:import url="../temp/header_css.jsp"></c:import>
<link href="../resources/css/cart.css" rel="styleSheet" />
<title> Cart </title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">Cart</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="../user/myPage">My page</a></li>
                  <li>Cart</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
	<div class="container">
		<h1 class="display-3" id="uName">${user.id}님의 장바구니</h1>
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
							<td colspan="7" align="center"><h3>장바구니에 담긴 상품이 없습니다.</h3></td>
						</tr>
						<div class="row">
							<table>
								<tr>
									<td align="center"><a href="../product/list"
										class="btn btn-secondary"> 쇼핑 계속하기</a></td>
								</tr>
							</table>
						</div>
					</c:when>
					<c:otherwise>

						<c:forEach items="${list}" var="vo">
							<tr>
								<td><input type="checkbox" class="check"
									data-check="${vo.cartNum}"></td>
								<td class="detail" data-num="${vo.productVO.productNum}"><img style="width: 50px; height: 50px;"
									src="../resources/upload/product/${vo.productFileVOs[0].fileName}"></td>
								<td class="detail" data-num="${vo.productVO.productNum}">${vo.productVO.productName}</td>
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
											data-check="${vo.cartNum}" class="col-2 numBox${vo.cartNum}"
											value="${vo.productAmount}" readonly="readonly" />
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
							<th class="Th">총 상품수량:<input type="number" id="amountResult" value="" readonly="readonly" style="border: none" /></th>
							<th class="Th" style="text-align: right">총 상품금액:</th>
							<th><input type="number" id="totalResult" class="col-5" value="" readonly="readonly" style="border: none" /></th>
							<th></th>
						</tr>
			</table>
			<div class="row">
				<table>
					<tr>
						<td align="left">
							<button id="allBtn" class="btn btn-danger">선택상품 삭제</button>
						</td>
						<td align="right"><button class="btn btn-success" id="shopping">쇼핑 계속하기</button>
						<button id="orderBtn" data-id="${user.id}" class="btn btn-success">주문하기</button></td>
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