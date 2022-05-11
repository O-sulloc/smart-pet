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
	
	
	<div class="table_total">
		<ul>
			<li><a class="btn btn-primary" href="./list">전체</a></li>
			<li><a class="btn btn-primary" href="./list?grade=0">일반</a></li>
			<li><a class="btn btn-primary" href="./list?grade=1">매장</a></li>
			<li><a class="btn btn-primary" href="./list?grade=2">이벤트</a></li>
		</ul>
	
		<div class="table_down">
			<div class="row mt-4">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>   </th>
							<th>제목</th>
							<th>등록일/당첨발표일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.rowNum}</td>
							<td>${vo.noticeCateVO.cateName}</td>
							<td><a class="link-dark text-decoration-none" href="./detail?num=${vo.num}">${vo.title}</a></td>
							<td>${vo.regDate}</td>
						</tr>
					</c:forEach>	
					</tbody>
					
				</table>
			</div>
		
			<div class="row justify-content-between">
				<!-- 위치 수정 필요 -->
				<div class="col-1">
					<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
				</div>
			</div>
			
		</div>
	</div>
	<br><br>
	<div class="position-relative">
		<div class="position-absolute top-0 start-50 translate-middle">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  
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
			   
			  </ul>
			</nav>
		</div>
	</div>

</div>

<c:import url="../temp/header_script.jsp"></c:import>


<script type="text/javascript">
	$(".notice").click(function(){
		location.href="/notice/list;
	})
	
	$(".faq").click(function(){
		location.href="/faq/list;
	})
	
</script>
</body>
</html>