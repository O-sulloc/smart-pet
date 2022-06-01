<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
			상품Q&A답변하기
		</div>
		
		<div class="input_wrap">	
			<input type="hidden" class="id" value="${id}">
			<input type="hidden" class="num" value="${num}">
			<input type="hidden" class="productNum" value="${productNum}">
			<div class="content_div">
				<textarea class="col-auto form-control contents" id="contents" name="contents"
				placeholder="답변하실 내용을 입력하세요"></textarea>
			</div>	
			<div>
				<span style="font-style: inherit; font-size: small">답변내용은 해당 상품의 상세페이지에서 확인하실 수 있습니다.</span>
			</div>
			<br><br>

		   	<div class="btn_wrap" style="padding-bottom:0px">
				<button class="cancel_btn">취소</button> <button class="seller_add_btn" disabled="true">등록</button>
			</div>
		</div>
	</div>
	
<c:import url="../temp/header_script.jsp"></c:import>	
<script type="text/javascript" src="/resources/js/qnaPop.js"></script>
<script type="text/javascript">
	check();
</script>

</body>
</html>