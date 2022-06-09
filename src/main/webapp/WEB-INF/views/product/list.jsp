<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Store home</title>
<link href="../resources/css/productList.css" rel="styleSheet" />
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Product List</h1>
					</div>
					<ul class="breadcrumb-nav">
						<c:if test="${pager.search eq 1}">
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=100">사료</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=200">간식</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=300">장난감</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=400">건강관리</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=500">용품</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=600">미용/목욕</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=700">하우스</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=1&subSearch=800">목줄</a></li>
						</c:if>

						<c:if test="${pager.search eq 2}">
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=100">사료</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=200">간식</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=300">장난감</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=400">건강관리</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=500">용품</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=600">미용/목욕</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=700">하우스</a></li>
							<li><a class="dropdown-item"
								href="./list?kind=pcate&search=2&subSearch=800">목줄</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container my-4">
		<div class="row">

			<div class="row serach">
				<div class="col-4">
					<form class="d-flex" action="./list" method="get">
						<div class="col-4 me-2">
							<select name="kind" class="form-select "
								aria-label="Default select example">
								<option value="col1">상품명</option>
								<option value="col2">가격</option>
								<option value="col3">설명</option>
							</select>
						</div>
						<div class="col-6 me-2">
							<input name="search" class="form-control" type="search"
								placeholder="Search" aria-label="Search">
						</div>
						<div class="col-2">
							<button class="btn btn-outline-success" type="submit">검색</button>
						</div>
					</form>
				</div>
			</div>

			<div id="pCount">전체 상품 ${count}개</div>

			<!--  베스트 상품 -->
			<div style="font-size: 40px; color:red; text-align: center;"> 베스트 상품 </div>
			<div class="card-group" style="border-top: 4px solid red; border-bottom: 4px solid red;">
				<c:forEach items="${best}" var="best">
					<div class="card pdetail" data-num="${best.productNum}">
						<img style="width: 100%; height: 200px;"
							src="../resources/upload/product/${best.productFileVOs[0].fileName}"
							class="card-img-top" alt="...">
						<div class="card-body">
							<ul class="list-info">
								<li>
									<div class="pInfo">
										<span>${best.productName}</span>
									</div>
									<div class="pInfo2">
										<span>${best.productInfo}</span>
									</div>
								</li>
								<li><i class="lni"></i>
									<div class="sale_price">
										정가 :
										<fmt:formatNumber value="${best.productPrice}"
											pattern="#,### 원" />
									</div> <c:if test="${best.rate ne '0'}">
										<div class="discount_price">
											판매가 : <span class="discount_price_number"><fmt:formatNumber
													value="${best.totalPrice}" pattern="#,### 원" /></span> [
											<fmt:formatNumber value="${best.rate}" pattern="###" />
											% 할인 중]
										</div>
									</c:if> <c:if test="${best.rate eq '0'}">
										<div class="discount_price">
											판매가 : <span class="discount_price_number"><fmt:formatNumber
													value="${best.totalPrice}" pattern="#,### 원" /></span>
										</div>
									</c:if></li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>


			<!--  베스트 상품끝 -->

			<c:forEach items="${list}" var="vo">
				<div class="col-lg-4 col-md-4 col-4 my-2">
					<div class="portfolio-sidebar">
						<div class="single-widget pdetail" data-num="${vo.productNum}">
							<img
								src="../resources/upload/product/${vo.productFileVOs[0].fileName}"
								class="card-img-top" alt="...">
							<ul class="list-info">
								<li>
									<div class="pInfo">
										<span>${vo.productName}</span>
									</div>
									<div class="pInfo2">
										<span>${vo.productInfo}</span>
									</div>
								</li>
								<li><i class="lni"></i>
									<div class="sale_price">
										정가 :
										<fmt:formatNumber value="${vo.productPrice}" pattern="#,### 원" />
									</div> <c:if test="${vo.rate ne '0'}">
										<div class="discount_price">
											판매가 : <span class="discount_price_number"><fmt:formatNumber
													value="${vo.totalPrice}" pattern="#,### 원" /></span> [
											<fmt:formatNumber value="${vo.rate}" pattern="###" />
											% 할인 중]
										</div>
									</c:if> <c:if test="${vo.rate eq '0'}">
										<div class="discount_price">
											판매가 : <span class="discount_price_number"><fmt:formatNumber
													value="${vo.totalPrice}" pattern="#,### 원" /></span>
										</div>
									</c:if></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 페이징 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center" style="display: flex">
					<li class="page-item disabled"><a class="page-link"
						style="color: #88C250"
						href="./list?pn=${pager.pre?pager.startNum-1:1}&kind=${pager.kind}&search=${pager.search}">이전</a>
					</li>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><a class="page-link"
							style="color: #88C250"
							href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						style="color: #88C250"
						href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&kind=${pager.kind}&search=${pager.search}">다음</a>
					</li>
				</ul>
			</nav>
			<!-- 페이징 끝 -->
		</div>

	</div>


	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
	<script type="text/javascript" src="../resources/js/productList.js"></script>
</body>
</html>