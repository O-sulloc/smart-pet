<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="../temp/header_css.jsp"></c:import>
  <link href="../resources/css/notice_list.css" rel="styleSheet" />
  <link href="../resources/css/reviewList.css" rel="styleSheet" />
<title>Insert title here</title>
<!-- 상단으로 올림 5.20 -->
<c:import url="../temp/header_script.jsp"></c:import>

<style type="text/css">
.set-bg {
	background-repeat: no-repeat;
	/* background-size: cover; */
	/*상품리스트 이미지 들어오게 수정*/
	background-size: contain;
	background-position: top center;
}
.bg {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
	background-image: url("/resources/image/flower2.jpg")
}

.menu{
	position: relative;
	color: #5f6368;
	border: solid 1px #dadce0;
	border-radius: 1vw;
	display: inline-block;
	padding: 6px 8px 6px 8px; 
	/*padding: top right bottom left*/
	cursor: pointer;
}

.clicked_menu{
	color: ;border-color: #4285f4;
	color: #4285f4;
	background: #e9f1fe;
   }
   
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

	<div class="bg">
		<section class="breadcrumb-section set-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<br>
							<h1>고객센터</h1>
							<span>무엇을 도와드릴까요?</span>
							<br><br>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

<div class="container mt-4">
	
	<br>
	
	<div class="row row-cols-2 row-cols-md-4 mb-4 text-center link">
		<!-- 각각 링크를 걸어서 할꺼고 -->
		<!-- FAQ 페이지도 만들꺼임 -->
		<!-- 다른점은 FAQ는 카테고리 만들지 말고 가장 궁금한 질문만 답변 AJAX로 -->
		<!-- 다른점은 공지사항 카테고리 별로 만들고 AJAX안쓰고 페이지 넘어가게 구현 -->
		<div class="notice menu clicked_menu" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">공지사항</h4>
		</div>
		<div class="faq menu" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">FAQ</h4>
		</div>
	</div>
	
	<br>
	
	<div class="table_total">
		<ul style="margin:auto; width:1000px; padding-left: 0px">
			<li><a style="width:250px" class="btn btn-outline-primary" href="./list">전체</a></li>
			<li><a style="width:250px" class="btn btn-outline-primary" href="./list?grade=0">일반</a></li>
			<li><a style="width:250px" class="btn btn-outline-primary" href="./list?grade=1">매장</a></li>
			<li><a style="width:250px" class="btn btn-outline-primary" href="./list?grade=2">이벤트</a></li>
		</ul>
	
		<div class="table_down">
			<div class="row mt-4">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-align: center; width:150px">번호</th>
							<th style="width:70px">구분</th>
							<th style="width: 920px; text-align: center;">제목</th>
							<th style="text-align: center;">등록일/당첨발표일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td style="text-align: center">${vo.rowNum}</td>
							<td>${vo.noticeCateVO.cateName}</td>
							<c:choose>
								<c:when test="${not empty checkGrade}">
									<td><a class="link-dark text-decoration-none" href="./detail?num=${vo.num}&grade=${vo.grade}">${vo.title}</a></td>
								</c:when>
								<c:otherwise>
									<td><a class="link-dark text-decoration-none" href="./detail?num=${vo.num}">${vo.title}</a></td>
								</c:otherwise>
							</c:choose>
							<td style="text-align: center;">${vo.regDate}</td>
						</tr>
					</c:forEach>	
					</tbody>
					
				</table>
			</div>
		
			<div class="row justify-content-between">
				<c:if test="${user.role eq 0}">
					<div class="col-1">
						<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
					</div>
				</c:if>
			</div>
			
		</div>
	</div>
	
	<br><br>
	
	<div class="position-relative">
		<div class="position-absolute top-0 start-50 translate-middle">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<c:choose>
				  	<c:when test="${empty pager.grade}">
				    	<li class="page-item">
				    		<a class="page-link" aria-label="Previous" href="./list?pn=${pager.pre?pager.startNum-1:1}">
						 		<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					   
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					    	<li class="page-item"><a class="page-link" href="./list?pn=${i}">${i}</a></li>
					    </c:forEach>
		
				    	<li class="page-item">
				    		<a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}">
				    			<span aria-hidden="true">&raquo;</span>
				    		</a>
				    	</li>
			    	</c:when>
			    	<c:otherwise>
			    		<li class="page-item">
				    		<a class="page-link" aria-label="Previous" href="./list?pn=${pager.pre?pager.startNum-1:1}&grade=${pager.grade}">
						 		<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					   
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					    	<li class="page-item"><a class="page-link" href="./list?pn=${i}&grade=${pager.grade}">${i}</a></li>
					    </c:forEach>
		
				    	<li class="page-item">
				    		<a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&grade=${pager.grade}">
				    			<span aria-hidden="true">&raquo;</span>
				    		</a>
				    	</li>
			    	</c:otherwise>
		    	</c:choose>
			   
			  </ul>
			</nav>
		</div>
	</div>
	
</div>

	
	
	


<script type="text/javascript" src="../resources/js/notice_list.js"></script>

</body>
</html>
