<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Notice - MediGrids</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
<!-- modal 되는지 보려고 위로 올림 -->
<c:import url="../temp/header_script.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Place favicon.ico in the root directory -->

<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Notice</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Notice</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class="appointment page section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12 col-12">
					<!-- 목록뿌려주는 -->
					<div class="appointment-form">
						<div class="row">
							<div class="col-12">
								<div>
								<table class="table">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Category</th>
											<th scope="col">Title</th>
											<th scope="col">RegDate</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="vo">
											<tr>
												<th scope="row">${vo.rowNum}</th>
												<td>${vo.noticeCateVO.cateName}</td>
												<c:choose>
													<c:when test="${not empty checkGrade}">
														<td><a class="link-dark text-decoration-none" href="./detail?num=${vo.num}&grade=${vo.grade}">${vo.title}</a></td>
													</c:when>
													<c:otherwise>
														<td><a class="link-dark text-decoration-none" href="./detail?num=${vo.num}">${vo.title}</a></td>
													</c:otherwise>
												</c:choose>
												<td>${vo.regDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</div>
								
								<!-- 관리자권한 글쓰기 -->
								<div class="appointment-btn button">
									<c:if test="${user.role eq 0}">
										<div class="col-1">
											<a href="./add" type="button" class="btn">WRITE</a>
										</div>
									</c:if>
								</div>
								<!-- 관리자 권한 끝 -->
								
							</div>
						</div>
						<div class="row"></div>
					</div>					
					<!-- 공지사항 목록 뿌려주기 끝 -->
					
					<!-- Start of pagination -->
					<div class="pagination left blog-grid-page">
						<ul class="pagination-list">
							<c:choose>
								<c:when test="${empty pager.grade}">
									<li><a class="page-link" href="./list?pn=${pager.pre?pager.startNum-1:1}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Prev</a></li>
									
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li>
											<a class="page-link" href="./list?pn=${i}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
											${i}</a>
										</li>
									</c:forEach>
									
									<li><a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Next</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a class="page-link" href="./list?pn=${pager.pre?pager.startNum-1:1}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Prev</a></li>
									
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<li>
											<a class="page-link" href="./list?pn=${i}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
											${i}</a>
										</li>
									</c:forEach>
									
									<li><a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
									Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- End of pagination -->
					
				</div>
				
				<aside class="col-lg-4 col-md-12 col-12">
					<div class="sidebar blog-grid-page">
						<div class="widget popular-tag-widget">
							<h5 class="widget-title">Popular Tags</h5>
							<div class="tags">
								<a href="./list">All</a>
								<a href="./list?grade=0">General</a>
								<a href="./list?grade=1">Stores</a>
								<a href="./list?grade=2">Event</a>
							</div>
						</div>										
					</div>
				</aside>
			</div>
		</div>
		
	</section>
	
	<script type="text/javascript" src="../resources/js/notice_list.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>