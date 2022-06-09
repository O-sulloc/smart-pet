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
<c:import url="../temp/header_css.jsp"></c:import>
<c:import url="../temp/header_script.jsp"></c:import>


<style type="text/css">
input {
	font-size: 22px;
	width: 50px;
	padding: 5px;
	margin: 0;
	border: 1px solid #eee;
}

.info {
	padding-top: 50px;
}

#inputnumbox {
	pointer-events: none;
}
</style>
<title>Order/Payment</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">Order/Payment</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>Order/Payment</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
	<div class="container">
		<h1 class="display-3">Order/Payment</h1>
		<div style="padding-top: 50px; margin-bottom: 50px">
			<table class="table table-hover">
				<tr>
					<th colspan="3"></th>
					<th>상품 정보</th>
					<th></th>
					<th class="col-3">수량</th>
					<th class="col-3">상품 가격</th>
				</tr>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td colspan="3"><img style="width: 50px; height: 50px;"
							src="../resources/upload/product/${vo.productFileVOs[0].fileName}"></td>
						<td>${vo.productVO.productName}</td>
						<td></td>
						<td>
							<div class="countBtn" data-pNum="${vo.cartNum}">
								<!--히든  -->
								<input class="pName${vo.cartNum}" type="hidden" value="${vo.productVO.productName}">
								<input class="pCount${vo.cartNum}" type="hidden" value="${vo.productVO.productCount}"> 
								<input class="pPrice${vo.cartNum}" type="hidden" value="${vo.productVO.totalPrice}">
								<!--히든 끝 -->
								<input type="number" id="inputnumbox" data-check="${vo.cartNum}"
									class="col-2 numBox${vo.cartNum}" value="${vo.productAmount}"
									readonly="readonly" />
							</div>
						</td>
						<td><input type="number" id="priceResult${vo.cartNum}" class="col-4 priceResult"
							value="${vo.productVO.totalPrice * vo.productAmount}" readonly="readonly" style="border: none" /></td>
					</tr>
					<!-- 히든 -->
					<input type="hidden" value="${vo.cartNum}" class="cartNum">
				</c:forEach>
				<tr>
					<th colspan="3"></th>
					<th></th>
					<th></th>
					<th></th>
					<th>총 결제금액:<input type="number" id="totalResult" class="col-4"
						value="" readonly="readonly" style="border: none" /></th>
				</tr>
			</table>

			<!-- 결제 폼 -->
			<input type="hidden" id="countResult">
			<input type="hidden" id="userName" data-name="${user.name}">
			<input type="hidden" id="userAddress" data-address="${user.address}">
			<input type="hidden" id="userPhone" data-phone="${user.phone}">
			
			<div class="row" style="text-align: center">
				<button class="btn btn-success">배송 정보</button>
				<div style="margin-top: 50px">
					<div style="margin-top: 50px;  font-size: 20px;">배송지 선택</div>

					<select id="selectBox" class="col-mt-3" style="text-align: center">
						<option value="">배송지 선택해주세요.</option>
						<option value="0">${user.id}님의배송지</option>
						<option value="1">신규 배송지</option>
					</select>
				</div>
				<div id="payFrm"></div>
			</div >
			<c:forEach items="${list}" var="vo">
			<c:if test="${vo.payCheck eq 2}">
			<div class="row" style="text-align: center">
			<p style="padding-top: 50px;"><h2>오늘 안에 결제를 안하시면 결제가 취소됩니다.</h2></p>
			</div>
			</c:if>
			</c:forEach>
			<div class="d-grid gap-2 col-4 mx-auto" style="padding-top: 50px;">
				<button type="button" id="payBtn" data-id="${user.id}" class="btn btn-primary">결제</button>
				<button type="button" id="kakaoBtn" data-id="${user.id}"  data-name="${user.name}" class="btn btn-warning">카카오 페이</button>
			</div>
	
		</div>
			<!-- 결제 폼 끝 -->
	</div>	
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
	
	
	<!-- 결제 api -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 결제 api 끝 -->
	<!-- 주소 api  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 주소 api 끝 -->
	<script type="text/javascript" src="../resources/js/pay.js"></script>
</body>
</html>