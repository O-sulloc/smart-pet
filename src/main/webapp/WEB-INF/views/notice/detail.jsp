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
	
	<section class="section blog-single">
		<div class="container">
			<div class="row">				
				<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
					<!-- 관리자권한 글 수정/삭제 -->
					<div class="col-lg-6 col-md-6 col-12 p-0 my-3">
						<div class="appointment-btn button">
							<c:if test="${user.role eq 0}">
								<button class="btn" onclick="location.href='./update?num=${vo.num}'">Update</button>
								<button class="btn" onclick="location.href='./delete?num=${vo.num}'">Delete account</button>
							</c:if>
						</div>
					</div>
					<!-- 관리자 권한 끝 -->
					
					<div class="single-inner">
						<div class="post-details">
							<div class="detail-inner">
								<h2 class="post-title">
									<a href="#">${vo.title}</a>
								</h2>
								<ul class="meta-info">
									<li>
										<a>admin</a>
									</li>
									<li>
										<a>
											<i class="lni lni-timer"></i>
											${vo.regDate}
										</a>
									</li>
								</ul>
								<div class="my-2" style="white-space:pre;">${vo.contents}</div>
							</div>
							
							<!-- 이전/다음 글 보기 -->
							<div class="post-comments appointment-btn button">
								<ul class="comments-list">
									<c:choose>
										<c:when test="${vo.nextTitle eq null}">
											<li>
												<button type="button" class="btn my-3" disabled>다음글이 없습니다</button>
											</li>
										</c:when>
										
										<c:otherwise>
											<c:choose>
												<c:when test="${not empty checkGrade}">
													<li>
														<button type="button" class="btn" onclick="location.href='./detail?num=${vo.nextNum}&grade=${vo.grade}'"> 
														<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button>
														<a href="./detail?num=${vo.nextNum}&grade=${vo.grade}" style="color: black">${vo.nextTitle}</a>
													</li>
						
												</c:when>
												
												<c:otherwise>
													<li>
														<button type="button" class="btn my-3" onclick="location.href='./detail?num=${vo.nextNum}'"> 
														<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button>
														<a href="./detail?num=${vo.nextNum}" style="color: black">${vo.nextTitle}</a>
													</li>
												</c:otherwise>
												
											</c:choose>
										</c:otherwise>
										
									</c:choose>
									
									<c:choose>
										<c:when test="${vo.prevTitle eq null}">
											<li>
												<button type="button" class="btn" disabled>이전글이 없습니다</button>
											</li>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${not empty checkGrade}">
													<li>
														<button type="button" class="btn my-3" onclick="location.href='./detail?num=${vo.prevNum}&grade=${vo.grade}'"> 
														<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
														<a href="./detail?num=${vo.prevNum}&grade=${vo.grade}" style="color: black">${vo.prevTitle}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li>
														<button type="button" class="btn" onclick="location.href='./detail?num=${vo.prevNum}'"> 
														<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
														<a href="./detail?num=${vo.prevNum}" style="color: black">${vo.prevTitle}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<!-- 다음 이전글 보기 끝 -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>