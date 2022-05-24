<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:import url="../temp/header_css.jsp"></c:import>
  <link href="../resources/css/notice_list.css" rel="styleSheet" /><!-- 나중수정 -->
  <link href="../resources/css/reviewList.css" rel="styleSheet" /><!-- 나중수정 -->
<title>Insert title here</title>
<!-- 상단으로 올림 5.20 -->
<c:import url="../temp/header_script.jsp"></c:import>
</head>
<body>
<!-- orderList에서 작성일듯? -->
	<div class="container">
		<div class="row">
			<div class="reply_subject">
				<h2>리뷰</h2>
			</div>
			
			<!-- 기본 뿌려주는값 -->
			<!-- 나중에는 foreach 반복문이 들어오게 -->
			<!-- 리뷰를 쓰게 되면 수정과 삭제만 조회 -->
			<div class="add_reply_wrap">
				<button>리뷰 쓰기</button>
			</div>
			<%-- <c:choose>
				<c:when test="${empty vo.replyNum}">
					<div class="add_reply_wrap">
						<button>리뷰 쓰기</button>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="update_reply_btn">
						<button>리뷰 수정</button>
					</div>
					<div class="delete_reply_btn">
						<button>X</button>
					</div>
				</c:otherwise>
			</c:choose> --%>
		</div>
	</div>
	
	

</body>

<script type="text/javascript">
	//마이페이지로 옮길것
	//리뷰 등록
	$(".add_reply_wrap").on("click", function(e){
		
		e.preventDefault();	
		//이것들은 마이페이지에서 갖고오는값임!
		let id = '${id}'; //멤버아이디랑
		let productNum = '1'; //상품번호 갖고와야함
					//임시로 notice이고 user로 바꿔야함 나중에 들어오면
		let popUrl = "/user/reviewAdd/" + id + "?productNum=" + productNum;
		console.log(popUrl);
		let popOption = "width = 600px, height=800px, top=400px, left=400px, scrollbars=yes";
		
		window.open(popUrl,"리뷰 쓰기",popOption);
	
	});
	
	//리뷰 수정
	$(".update_reply_btn").on("click", function(e){
	
		e.preventDefault();
		
		let id = '${id}'; //멤버아이디랑
		let productNum = '1'; //상품번호 갖고와야함(상품 starAvg 변화)
		let replyNum = '${vo.replyNum}'; //리뷰 넘버(다 갖고오는거로 지금은 강제부여) orderList 구현시 가능	
		
		let popUrl = "/user/reviewUpdate?replyNum=" + replyNum + "&productNum=" + productNum + "&id=" + id;	
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
			type : 'GET',
			success : function(result){
				alert('삭제가 완료 되었습니다.');
			},
			error : function(){
				alert('요청실패');
			}
		});		
		 
	 });
	//마이페이지로 옮길것 끝
</script>
</html>