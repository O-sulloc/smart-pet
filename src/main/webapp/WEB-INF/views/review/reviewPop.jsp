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

	<!-- 상품이름, 상품사진 필요 -->
	<!-- 별점(star), 좋았던점(contents), 사진첨부 -->
	<div class="wrapper_div">
		<div class="subject_div">
			리뷰 등록
		</div>
		
		<div class="input_wrap">			
			<div class="productName_div">
				<h2>${productInfo}</h2>
				<!-- 임시값 -->
				<input type="hidden" class="id" value="${id}">
				<input type="hidden" class="productInfo" value="${productInfo}">
				<!-- 여기까지 -->
			</div>
			
			<!-- 별점부여 -->
			<div class="mb-3" id="myform">
				<div>
					<span class="text-bold">상품을 사용해보셨나요?</span>
				</div>
				<fieldset class="clickStar">
					<input type="radio" name="reviewStar" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="reviewStar" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="reviewStar" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="reviewStar" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="reviewStar" value="1" id="rate5"><label
						for="rate5">★</label>
				</fieldset>	
				<div class="textStar">
					<span>선택해주세요</span><!-- 1점(별로에요) 빨간글씨 2점(그저그래요) 3점(괜찮아요) 4점(좋아요) 5점(최고에요)-->
				</div>
				
				<div class="content_div reviewComment">
					<!-- 동적으로 바뀌기 만족도 1점을 주셨네요. --> <!-- 만족도 3점을 주셨네요. --> <!-- 어떤점이 아쉬웠나요? --> <!-- 어떤점이 좋았나요? -->
					<h4 class="comment">어떤점이 좋았나요?</h4>
				</div>
				<br><br>
				<div class="row mb-3">
				   	<h6>한줄 리뷰를 작성해주세요!</h6>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="title" name="title"
				      placeholder="한줄 리뷰 (최소 10자 이상, 최대 20자 이하)">
				    </div>
				</div>
				
				<div class="content_div">
					<textarea class="col-auto form-control"  id="contents" name="contents"
					placeholder="만족도 리뷰 추가 작성 (추가 작성 및 사진 파일 첨부 필수 아님)"></textarea>
				</div>
			</div>			
			
		</div>
		
		<div>
			<button type="button" id="fileAdd" class="btn btn-info d-block my-4">사진 추가</button>
		</div>
		<div id="fileResult"></div>

	   	<div class="btn_wrap">
			<button class="cancel_btn">취소</button> <button class="add_btn" disabled="true">등록</button>
		</div>

	</div>
	
<c:import url="../temp/header_script.jsp"></c:import>	
<script type="text/javascript" src="/resources/js/reviewPop.js"></script>
<script type="text/javascript">
	check();
	fileAddInit(0);
</script>

</body>
</html>