<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:100px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>

</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<c:import url="../temp/sidebar.jsp"></c:import>
			</div>
			<div class="col-9 container mt-3">
				<main>

					<section id="content">

						<ul class="orderView">
							<c:forEach items="${plist}" var="pvo">
								<li>
									<div class="thumb">
										<img src="../resources/upload/product/${pvo.productFileVOs[0].fileName}" />
									</div>
									<div class="gdsInfo">
										<p>
											<span>상품명</span>${pvo.productVO.productName}</p>
										<p>
											<span>개당 가격</span>${pvo.productVO.totalPrice}원</p>
										<p>
											<span>구입 수량</span>${pvo.productAmount}개</p>
										<p>
											<span>최종 가격</span>${pvo.productVO.totalPrice * pvo.productAmount}원</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</section>
				</main>
			</div>
		</div>
	</div>


</body>
</html>