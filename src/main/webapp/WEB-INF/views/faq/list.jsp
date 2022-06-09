<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>FAQ - MediGrids</title>
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
						<h1 class="page-title">Frequently Asked Questions1111</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>FAQ</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class=" section latest-news-area blog-list">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-12 col-12">
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<c:forEach items="${list}" var="faq">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button collapsed numCatch" type="button" data-bs-toggle="collapse" data-num="${faq.num}" data-bs-target="#collapseOne${faq.rowNum}" aria-expanded="false" aria-controls="collapseOne${faq.rowNum}">
										<span class="title"><span class="serial">${faq.faqCateVO.cateName}</span>
										${faq.title}</span><i class="lni lni-plus"></i>
									</button>
								</h2>
								
								<div id="collapseOne${faq.rowNum}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<p>${faq.contents}</p>
									</div>
								</div>
								
								<!-- 관리자 권한인듯 -->
								<c:if test="${user.role eq 0}">
									<div class="modalTotal" style="text-align: center">
										<!-- modal  테스트 -->
										<br>
										<button class="btn btn-outline-success mx-1" id="modifyTotal${vo.num}">수정하기</button>
									
										<input type="hidden" name="num" value="${vo.num}" id="num${vo.num}">
										<input type="hidden" name="grade" value="${vo.grade}" id="grade${vo.num}">
										<!-- FAQ 수정 Modal-->
										<div class="modal fade" id="modify${vo.num}" tabindex="-1" role="dialog" 
										aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">FAQ 수정하기</h5>
														<button class="close" type="button" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">X</span>
														</button>
													</div>
													
													<!-- CSS 넣기 -->
													<h3>${vo.faqCateVO.cateName}</h3>
													
													
													<div class="modal-body">
														<label for="title" class="col-sm-2 col-form-label">Title</label>
														<input type="text" class="form-control title_check" data-title="${vo.title}" 
														id="title${vo.num}" name="title" value="${vo.title}">
													</div>
													<div class="modal-body">
														<label for="contents" class="col-sm-2 col-form-label">Contents</label>
														<textarea style="height:300px;" class="form-control" id="contents${vo.num}" 
														name="contents">${vo.contents}</textarea>
													</div>
													
													<div class="modal-footer">
														<button type="button" class="btn btn-outline-success close" 
														data-dismiss="modal">취소</button>
														<button type="button" class="btn btn-success" id="modifyBtn${vo.num}">
														수정</button>
													</div>
												</div>
											</div>
										</div>	
										<button type="button" class="btn btn-outline-danger mx-1 deleteBtn" data-num="${vo.num}">삭제하기</button>
										<br>
									</div>
								</c:if>
								<!-- 관리자 글수정삭제 권한 여기까지 -->
											
							</c:forEach>
						</div>
					</div>
					
					<!-- 관리자 글쓰기 권한 -->
					<c:if test="${user.role eq 0}">
						<div class="row justify-content-between">
							<div class="col-1">
								<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
							</div>
						</div>
					</c:if>
					<!-- 여기까지 -->
					
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
					
						<div class="widget search-widget popular-tag-widget">
							<h5 class="widget-title">Search This Page</h5>
							<form class="searchFrm" action="./list" method="get">
								<input type="hidden" name="kind" value="col1">
								<input value="${pager.search}" id="search" name="search" type="search" placeholder="Search Here..." aria-label="Search">
								<button type="button" class="searchBtn">
									<i class="lni lni-search-alt"></i>
								</button>
								
								<!-- 인기 키워드 밑에 뿌려줌 -->
								<div class="tags my-2" id="keyWord">
									<c:forEach items="${key}" var="key">
										<a onclick="searchKey(this);">${key.keyName}</a>
									</c:forEach>
								</div>
							</form>
						</div>

					<!-- 검색어로 search할 때는 tags 안보이게 -->
					<c:choose>
						<c:when test="${empty search}">
							<div class="widget popular-tag-widget">
								<h5 class="widget-title">Popular Tags</h5>
								<div class="tags">
									<a href="./list?gradeRef=400">Top most asked questions</a>
									<a href="./list?gradeRef=100">HomePage</a>
									<a href="./list?gradeRef=200">Product</a>
									<a href="./list?gradeRef=300">Reservation Service</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<br><br>
							<h3><span class="text-blue">${search}</span> 검색결과 총 <span class="text-blue">${pager.totalCountC}</span>개</h3>
						</c:otherwise>
					</c:choose>
					
					<!-- popular tag 눌렀을 때, 관련 하위 카테고리를 나열한다. ex)product 누르면 결제/매장문의/이벤트라는 subCategory가 나열됨-->
					<!-- gradeRef=99이면 미출력, total empty면 미출력 -->
					<c:if test="${total ne 400 && not empty total}">
						<div class="widget categories-widget">
							<h5 class="widget-title">Categories</h5>
							<ul class="custom">
								<li><a class="btn" href="./list?gradeRef=${total}">All</a></li>
								<c:forEach items="${cate}" var="cate">
									<li><a class="btn" href="./list?gradeRef=${cate.gradeRef}&grade=${cate.grade}">${cate.cateName}</a></li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
					
					</div>
				</aside>
			</div>
		</div>
		
		<div class="form-head">
			<p class="outer-link">찾으시는 질문이 없나요? Can't find what you looking for? 
				<div class="col-lg-12 col-md-12 col-12 p-0 my-2" style="text-align-last: center;">
					<div class="appointment-btn button">
						<button class="btn faqList" >FAQ 전체보기</button>
						<button class="btn" >1:1 문의하기</button>
					</div>
				</div>
			</p>
		</div>
	</section>
	
	<script type="text/javascript" src="../resources/js/notice_list.js"></script>
	<script type="text/javascript" src="../resources/js/notice_ajax.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('.menu').each(function(index){
			$(this).attr('menu-index', index);
		}).click(function(){
			var index = $(this).attr('menu-index');
			$('.menu[menu-index=' + index + ']').addClass('clicked_menu');
			$('.menu[menu-index!=' + index + ']').removeClass('clicked_menu');
		});
	
	
	});
	</script>
	
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>