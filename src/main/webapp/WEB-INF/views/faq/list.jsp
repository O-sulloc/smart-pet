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
  
<title>Insert title here</title>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>


<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-primary" role="alert">
	  		<h1>고객센터</h1>
			<span>무엇을 도와드릴까요?</span>
		</div>
	</div>
		
	<br>
	<hr>
	<br>
	
	<div class="row row-cols-2 row-cols-md-4 mb-4 text-center link">
		<!-- 각각 링크를 걸어서 할꺼고 -->
		<!-- FAQ 페이지도 만들꺼임 -->
		<!-- 다른점은 FAQ는 카테고리 만들지 말고 가장 궁금한 질문만 답변 AJAX로 -->
		<!-- 다른점은 공지사항 카테고리 별로 만들고 AJAX안쓰고 페이지 넘어가게 구현 -->
		<div class="alert alert-primary col notice" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">공지사항</h4>
		</div>
		<div class="alert alert-primary col faq" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">FAQ</h4>
		</div>
	</div>
		
	<br>
	<hr>
	<br>
	
	<div class="col-5">
		<form class="d-flex" action="./list" method="get">
			<div class="col-6 me-2"> 
				<input type="hidden" name="kind" value="col1">
	        	<input value="${pager.search}" name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
	        </div>
	        <div class="col-2">
	        	<button class="btn btn-outline-success" type="submit">Search</button>
	        </div>
        </form>
        <div>
        	<span>인기키워드</span>
        	<div>
        		<a>sadfs</a>
        		<a>sadfs</a>
        		<a>sadfs</a>
        		<a>sadfs</a>
        		<a>sadfs</a>
        		<a>sadfs</a>
        		
        	</div>
        </div>
	</div>
		
	<br>
	<hr>
	<br>
	
	<div class="table_total">
		<ul>
			<li><a class="btn btn-primary" href="./list?gradeRef=90">가장 궁금해 하시는 질문 10개</a></li>
			<li><a class="btn btn-primary" href="./list?gradeRef=100">홈페이지</a></li>
			<li><a class="btn btn-primary" href="./list?gradeRef=200">상품</a></li>
			<li><a class="btn btn-primary" href="./list?gradeRef=300">예약서비스</a></li>
		</ul>
		
		<!-- gradeRef=99이면 미출력, total empty면 미출력 -->
		<c:if test="${total ne 90 && not empty total}">
			<ul>			
				<!-- 그냥 controller에서 바로 받아와버림 -->	
				<li><a class="btn btn-primary" href="./list?gradeRef=${total}">전체</a></li>
				<c:forEach items="${cate}" var="cate">
					<li><a class="btn btn-primary" href="./list?gradeRef=${cate.gradeRef}&grade=${cate.grade}">${cate.cateName}</a></li>
				</c:forEach>
			</ul>
		</c:if>

		<hr>

		<div class="accordion accordion-flush" id="accordionFlushExample">
		  <div class="accordion-item">
			<c:forEach items="${list}" var="vo">
		    <h2 class="accordion-header" id="flush-headingOne">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.rowNum}" aria-controls="flush-collapse${vo.rowNum}" aria-expanded="false" >
		      
		        <i class="bi bi-award"></i>
		        
				<strong>${vo.faqCateVO.cateName}</strong>
				
				${vo.title}
		     
		      </button>
		    </h2>
		    <div id="flush-collapse${vo.rowNum}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">${vo.contents}</div>
		      	<p class="faq_txt_good">
					답변이 도움이 되었나요?
					<button class="btn_faq_good" id="btn_faq_good_13" onclick="faq.list.setFaqTagList('13'); return false;">
						<span>도움이 되었어요</span>
					</button>
				</p>
		    </div>
			</c:forEach>
		  </div>
		</div>
		
			
		<br>
		<hr>
		<br>
		
		<div class="row justify-content-between">
			<!-- 위치 수정 필요 -->
			<div class="col-1">
				<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
			</div>
		</div>
		<div class="position-relative">
			<div class="position-absolute top-0 start-50 translate-middle">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				  
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
				   
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<br><br>
	<p>찾으시는 질문이 없다면?</p>
	<div class="area1sButton">
		<button type="button" class="btn btn-outline-success faqList">FAQ 전체보기</button>
		<!-- 링크 미구현 구현시 js로 -->
		<button type="button" class="btn btn-success">1:1 문의하기</button>
		<!-- 밑에껀 함수호출하는 javascript -->
		<!-- <a href="javascript:common.link.moveQnaForm();" class="btnGreen">1:1 문의하기</a> -->
	</div>
</div>


<br><br>

<c:import url="../temp/header_script.jsp"></c:import>
<script type="text/javascript" src="../resources/js/notice_list.js"></script>

</body>
</html>
