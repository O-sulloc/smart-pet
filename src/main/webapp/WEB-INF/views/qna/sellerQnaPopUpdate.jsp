<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/reviewPop.css">
	<c:import url="../temp/header_css.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
</head>
<body>

	
	<div class="wrapper_div">
		<div class="subject_div">
			상품Q&A수정하기
		</div>
		
		<div class="input_wrap">	
			<input type="hidden" class="id" value="${vo.id}">
			<input type="hidden" class="productNum" value="${vo.productNum}">
			<input type="hidden" class="num" value="${vo.num}">
			<div class="content_div">
				<textarea class="col-auto form-control contents" id="contents" name="contents"
				placeholder="문의하실 내용을 입력하세요">${vo.contents}</textarea>
			</div>	
			<br>
			<c:choose>
				<c:when test="${vo.secret == '1'}">
					<div class="form-check form-check-inline mt-3">
					    <input class="form-check-input" type="checkbox" name="secret" id="secret" checked="checked">
					    <label class="form-check-label">비공개</label>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-check form-check-inline mt-3">
					    <input class="form-check-input" type="checkbox" name="secret" id="secret">
					    <label class="form-check-label">비공개</label>
					</div>
				</c:otherwise>
			</c:choose>
			<hr>
			<div>
				<span style="font-style: inherit; font-size: small">문의하신 내용에 대한 답변은 해당 상품의 상세페이지에서 확인하실 수 있습니다.</span>
			</div>
			<br><br>

		   	<div class="btn_wrap" style="padding-bottom:0px">
				<button class="cancel_btn">취소</button> <button class="update_btn">수정</button>
			</div>
		</div>
		<div class="input_bottom">
			<hr>
			<div style="padding-left:20px">
				<h6><strong>상품 Q&A작성 유의사항</strong></h6>
			</div>
			<hr>
			<div style="padding-left:20px; padding-right: 20px">
				<span style="font-style: italic; font-size: small;">
				상품 Q&A는 상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 판매자에게 문의하는 게시판입니다.
				</span><br><br>
				<span style="font-style: italic; font-size: small;">
				상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.
				</span><br><br>
				<span style="font-style: italic; font-size: small;">
				전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.
				</span><br><br>
				<span style="font-style: italic; font-size: small;">
				상품에 대한 이용 후기는 리뷰에 남겨 주세요.
				</span><br><br>
			</div>
		</div>

	</div>


<script type="text/javascript" src="/resources/js/qnaPop.js"></script>
<script type="text/javascript">
	updateCheck();
</script>
</body>
</html>



