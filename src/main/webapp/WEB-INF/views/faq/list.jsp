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
  <!-- modal 되는지 보려고 위로 올림 -->
  <c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>

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
   
.search_bac{
	background: #e9f1fe;
}   

#sform {
	display: inline-block;
	text-align: center;
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
		<div class="notice menu" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">공지사항</h4>
		</div>
		<div class="faq menu clicked_menu" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">FAQ</h4>
		</div>
	</div>
		
	<div class="row search_bac" style="height: 150px;">
		<div>
			<div style="margin-left:400px; padding-top: 40px" >
				<form class="d-flex searchFrm" action="./list" method="get" style="">
					<div class="col-6 me-2"> 
						<input type="hidden" name="kind" value="col1">
			        	<input value="${pager.search}" id="search" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
			        </div>
			        <div class="col-2">
			        	<button class="btn btn-outline-primary searchBtn" type="button">Search</button>
			        </div>
		        </form>
	        </div>
	        <div style="display: flex; padding-top: 20px">
	        	<span style="margin-left: 100px; margin-right: 50px" id="keyWord"><strong>인기키워드</strong></span>
	        	<div>
	        	<c:forEach items="${key}" var="key">
	        		<span style="color: #9932CC">#</span><a href="javascript:void(0);" style="text-decoration:none; color: #9932CC; padding-right: 20px" onclick="searchKey(this);">${key.keyName}</a>
	        	</c:forEach>
	        	</div>
	        </div>
		</div>
	</div>
	
	<div class="table_total">
		<!-- search로 검색할땐 안보이게 -->
		<c:choose>
			<c:when test="${empty search}">
				<br>
				<br>
				<ul>
					<li style="padding-left: 10px"><a class="btn btn-outline-primary" href="./list?gradeRef=400">가장 궁금해 하시는 질문 10개</a></li>
					<li style="padding-left: 10px"><a class="btn btn-outline-primary" href="./list?gradeRef=100">홈페이지</a></li>
					<li style="padding-left: 10px"><a class="btn btn-outline-primary" href="./list?gradeRef=200">상품</a></li>
					<li style="padding-left: 10px"><a class="btn btn-outline-primary" href="./list?gradeRef=300">예약서비스</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<br><br>
				<h3><span class="text-blue">${search}</span> 검색결과 총 <span class="text-blue">${pager.totalCountC}</span>개</h3>
			</c:otherwise>
		</c:choose>
		<!-- gradeRef=99이면 미출력, total empty면 미출력 -->
		<c:if test="${total ne 400 && not empty total}">
			<ul>			
				<!-- 그냥 controller에서 바로 받아와버림 -->	
				<li style="padding-left: 5px"><a class="btn" href="./list?gradeRef=${total}">전체</a></li>
				<c:forEach items="${cate}" var="cate">
					<li style="padding-left: 5px"><a class="btn" href="./list?gradeRef=${cate.gradeRef}&grade=${cate.grade}">${cate.cateName}</a></li>
				</c:forEach>
			</ul>
		</c:if>

		<hr>

		<div class="accordion accordion-flush" id="accordionFlushExample">
		  <div class="accordion-item">
			<c:forEach items="${list}" var="vo">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed numCatch" data-num="${vo.num}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.rowNum}" aria-controls="flush-collapse${vo.rowNum}" aria-expanded="false" >
		      
		        <i class="bi bi-award" style="padding-right: 20px"></i>
		        <div style="width:150px; margin-right: 100px">
					<strong>${vo.faqCateVO.cateName}</strong>
				</div>
				<div class="title">${vo.title}</div>
		     
		      </button>
		    </h2>
		    <div id="flush-collapse${vo.rowNum}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		    
		      <div style="overflow: auto; height: 150px; background-color: #F8F8FF; margin-top: 5px; white-space:pre;" class="accordion-body" ><c:out value="${vo.contents}"/></div>
		      	
				<c:if test="${user.role eq 0}">
					<div class="modalTotal" style="text-align: center">
						<!-- modal  테스트 -->
						<br>
						<button class="btn btn-outline-success mx-1" id="modifyTotal${vo.num}">수정하기</button>
					
						<input type="hidden" name="num" value="${vo.num}" id="num${vo.num}">
						<input type="hidden" name="grade" value="${vo.grade}" id="grade${vo.num}">
						<!-- FAQ 수정 Modal-->
						<div class="modal fade" id="modify${vo.num}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
										<input type="text" class="form-control title_check" data-title="${vo.title}" id="title${vo.num}" name="title" value="${vo.title}">
									</div>
									<div class="modal-body">
										<label for="contents" class="col-sm-2 col-form-label">Contents</label>
										<textarea style="height:300px;" class="form-control" id="contents${vo.num}" name="contents">${vo.contents}</textarea>
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-outline-success close" data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-success" id="modifyBtn${vo.num}"">수정</button>
									</div>
								</div>
							</div>
						</div>	
						<%-- <a href="./delete?num=${vo.num}" role="button" class="btn btn-danger mx-1">삭제하기</a> --%>
						<button type="button" class="btn btn-outline-danger mx-1 deleteBtn" data-num="${vo.num}">삭제하기</button>
						<br>
					</div>
					
				</c:if>
		    </div>
		    <hr>
			</c:forEach>
		  </div>
		</div>
		
		<c:if test="${user.role eq 0}">
			<div class="row justify-content-between">
				<div class="col-1">
					<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
				</div>
			</div>
		</c:if>
	
		<div class="position-relative" style="margin-top: 50px;">
			<div class="position-absolute top-0 start-50 translate-middle">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				  	<c:choose>
				  		<c:when test="${empty pager.grade}">
					    	<li class="page-item">
					    		<a class="page-link" aria-label="Previous" href="./list?pn=${pager.pre?pager.startNum-1:1}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
							 		<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						    	<li class="page-item"><a class="page-link" href="./list?pn=${i}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						    </c:forEach>
			
					    	<li class="page-item">
					    		<a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
					    			<span aria-hidden="true">&raquo;</span>
					    		</a>
					    	</li>
				    	</c:when>
				    	<c:otherwise>
				    		<li class="page-item">
					    		<a class="page-link" aria-label="Previous" href="./list?pn=${pager.pre?pager.startNum-1:1}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
							 		<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						    	<li class="page-item"><a class="page-link" href="./list?pn=${i}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						    </c:forEach>
			
					    	<li class="page-item">
					    		<a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&grade=${pager.grade}&gradeRef=${pager.gradeRef}&kind=${pager.kind}&search=${pager.search}">
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
	<br><br>
	<p style="text-align: center">찾으시는 질문이 없다면?</p>
	<div class="area1sButton" style="text-align: center">
		<button type="button" class="btn btn-outline-primary faqList">FAQ 전체보기</button>
		<!-- 링크 미구현 구현시 js로 -->
		<button type="button" class="btn btn-primary">1:1 문의하기</button>
		<!-- 밑에껀 함수호출하는 javascript -->
		<!-- <a href="javascript:common.link.moveQnaForm();" class="btnGreen">1:1 문의하기</a> -->
	</div>
</div>



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


</body>
</html>
