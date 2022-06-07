<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<link href="../resources/css/serviceList.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Beauty Shop</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Beauty Shop</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="container mt-4">


		<div class="row mt-4">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><p class="text-center">글번호</p></th>
						<th><p class="text-center">상호명</p></th>
						<th><p class="text-center">전화번호</p></th>
						<th><p class="text-center">주소</p></th>
						<th><p class="text-center">영업시간</p></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td><p class="text-center">${vo.serNum}</p></td>
							<td><p class="text-center">
									<a class="link-success text-decoration-none"
										href="./detail?serNum=${vo.serNum}">${vo.serName}</a>
								</p></td>
							<td><p class="text-center">${vo.serTel}</p></td>
							<td><p class="text-center">${vo.serAddress}</p></td>
							<td><p class="text-center">${vo.serTime}</p></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<!-- serKind 2 미용샵 -->

		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="./shopList?pn=${pager.pre?pager.startNum-1:1}&kind=${pager.kind}&search=${pager.search}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./shopList?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./shopList?pn=${pager.next?pager.lastNum+1:pager.lastNum}&kind=${pager.kind}&search=${pager.search}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>

			</ul>
		</nav>

		<div class="row justify-content-between">
			<div class="col-5">
				<form class="d-flex" action="./shopList" method="get">

					<div class="col-2 me-2">
						<select name="kind" class="searchoption"
							aria-label="Default select example">
							<option value="col1">상호명</option>
							<option value="col2">지역</option>
							<option value="col3">전화번호</option>
						</select>
					</div>
					<div class="col-6 me-2 searchdiv">
						<input name="search" class="searchform" type="search"
							placeholder="Search" aria-label="Search">
					</div>
					<div class="col-2">
						<button class="btn btn-outline-success btn-sm" type="submit">Search</button>
					</div>
				</form>
			</div>


		</div>

	</div>




	<!-- jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>