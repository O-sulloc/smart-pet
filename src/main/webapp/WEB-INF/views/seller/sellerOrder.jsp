<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header_script.jsp"></c:import>
<style>

 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:100px; height:100px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 .deliveryChange { text-align:right; }
 .delivery1_btn,
 .delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
</style>

</head>
<body>

	<c:import url="../temp/header.jsp"></c:import>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<c:import url="../temp/sellerSidebar.jsp"></c:import>
			</div>
			<div class="col-9 container mt-3">
				<main>
					<c:forEach items="${olist}" var="ovo">
						<section id="content">
							<div class="orderInfo" data-oNum="${ovo.orderNum}">
								<p>
									<span>주문자 </span>${ovo.id}</p>
								<p>
									<span>수령인</span>${ovo.payVO.recipient}</p>
								<p>
									<span>주소</span>${ovo.payVO.arrive}</p>
								<p>
									<span>전화번호</span>${ovo.payVO.recipientPhone}</p>
								<p>
									<span>결제가격</span>${ovo.payVO.totalPrice}원</p>
								<p>
									<span>환불</span>
								</p>
								<p>
									<span>배송상태</span>
									<c:choose>
									<c:when test="${ovo.shipState eq 0 }">배송 준비</c:when>
									<c:when test="${ovo.shipState eq 1 }">배송 중</c:when>
									<c:otherwise>배송 완료</c:otherwise>
									</c:choose>
								</p>
								<p>
									<span>주문날짜</span>${ovo.orderDate}</p>
								<c:choose>
								<c:when test="${ovo.shipState eq 2 }"></c:when>
								<c:otherwise>
								<div id="ship" class="deliveryChange">
   								<button type="button" data-oNum="${ovo.orderNum}" id="ship1btn${ovo.orderNum}" class="delivery1_btn">배송 중</button>
   								<button type="button" data-oNum="${ovo.orderNum}" id="ship2btn${ovo.orderNum}" class="delivery2_btn">배송 완료</button>
 								</div>
 								</c:otherwise>
 								</c:choose>	
							</div>
	
						</section>
					</c:forEach>
				</main>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/js/order.js"></script>
</body>
</html>