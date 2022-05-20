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
  <style type="text/css">
  	/*  나중에 갖고와야함 */
	.reviewTable {
	    width:70%; 
	    margin:auto; /*마진 안먹음 */
	    border : 1px solid black;
	    border-collapse : collapse;
	}
	
	.reviewTable tr td{
	 	border : 1px solid black;
	    border-collapse : collapse;
	}    
  </style>
  
<title>Insert title here</title>
<!-- 상단으로 올림 5.20 -->
<c:import url="../temp/header_script.jsp"></c:import>
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

	<!-- 리뷰연습 지금 현재 리뷰번호 1번만 가지고 놀게 되어 있다-->
	<div class="container">
		<div class="row">
			<div class="reply_subject">
				<h2>리뷰</h2>
			</div>
			<div class="reply_button_wrap">
				<button>리뷰 쓰기</button>
			</div>
			<div class="update_reply_btn">
				<button>리뷰 수정</button>
			</div>
			<div class="delete_reply_btn">
				<button>X(리뷰삭제) 구현시 X만</button>
			</div>
		</div>
		<!-- 리뷰 리스트 ajax -->
		<div class="row" id="list">
			
		</div>
	</div>
	
	


<script type="text/javascript" src="../resources/js/notice_list.js"></script>

<script type="text/javascript">
	//마이페이지로 옮길것
	//리뷰 등록
	$(".reply_button_wrap").on("click", function(e){
		
		e.preventDefault();	
		//이것들은 마이페이지에서 갖고오는값임!
		let id = 'admin'; //멤버아이디랑
		let productNum = '1'; //상품번호 갖고와야함
					//임시로 notice이고 product로 바꿔야함 나중에 들어오면
		let popUrl = "/notice/reviewAdd/" + id + "?productNum=" + productNum;
		console.log(popUrl);
		let popOption = "width = 600px, height=800px, top=400px, left=400px, scrollbars=yes";
		
		window.open(popUrl,"리뷰 쓰기",popOption);

	});
	
	//리뷰 수정
	$(".update_reply_btn").on("click", function(e){

		e.preventDefault();
		
		let id = 'admin'; //멤버아이디랑
		let productNum = '1'; //상품번호 갖고와야함(상품 starAvg 변화)
		let replyNum = '1'; //리뷰 넘버(다 갖고오는거로 지금은 강제부여)	
		
		let popUrl = "/notice/reviewUpdate?replyNum=" + replyNum + "&productNum=" + productNum + "&id=" + id;	
		let popOption = "width = 600px, height=800px, top=400px, left=400px, scrollbars=yes"	
		
		window.open(popUrl,"리뷰 수정",popOption);			
		 
	 });
	
	//리뷰 삭제
	$(".delete_reply_btn").on("click", function(e){
		e.preventDefault();
		
		let replyNum = '1'; //리뷰 넘버(다 갖고오는거로 지금은 강제부여)	
		let productNum = '1'; //상품번호 갖고와야함(상품 starAvg 변화)
		
		let check = window.confirm("리뷰를 삭제 시 복구 및 재작성이 불가능합니다.\n정말 삭제하시겠습니까?"); //check에 boolean 담김
		
		if(!check){
			return;
		}
		
		$.ajax({
			data : {
				replyNum : replyNum,
				productNum : productNum
			},
			url : '/product/review/delete',//위에 add랑 update랑 다른점은 바로 reviewController 접속
			type : 'POST',
			success : function(result){
				alert('삭제가 완료 되었습니다.');
			},
			error : function(){
				alert('요청실패');
			}
		});		
		 
	 });
	//마이페이지로 옮길것 끝
	
	
	//상품페이지로 옮길것
	//add.jsp안에 paging 처리
	//전역변수로 먼저 선언해서 pn 오류 안생기게 만들기
	let pn = 1;
	
	$("#list").on("click", ".pager", function(){
		//console.log($(this).attr("data-pn"));
		let checkPn = $(this).attr("data-pn");
		if(checkPn > 0){
			pn = checkPn
			getList();	
			//getList(checkPn);			
		}else{
			//이전 블럭과 다음 블럭이 없다
			alert('마지막 페이지 입니다');
		}

	});
	
	

	//list ajax url: ajaxList, Get
	//매개변수로 쓸땐 먼저 1 선언해줘야함 pn 값 미리 넣어놓기
	getList();//1);

	function getList(){//pn){
		$.ajax({
			type: "GET",
			url: "./reviewList",
			data:{
				pn:pn,
				perPage:5,
				productNum:1//잘생각할것 이건 상품페이지에서 productNum 갖고오면 됨
			},
			success:function(data){
				$("#list").html(data.trim());
			}
		
		});
	}
	
	//상품페이지로 옮길것끝
	
	
</script>

</body>
</html>
