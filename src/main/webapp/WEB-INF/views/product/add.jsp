<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>
<!--  에디터 -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link href="../resources/css/productAdd.css" rel="styleSheet" />
<title>상품 등록 페이지</title>
</head>
<body>
	<div class="content_wrap">
		<div class="content_subject">
			<span>상품 등록</span>
		</div>
		<div class="content_main">
			<form action="add" method="post" id="enrollForm"
				enctype="multipart/form-data">
				<div class="form_section_title">
					<label>대표 사진</label>
				</div>
				<div id="fileResult"></div>
				<div>
					<button type="button" id="fileAdd"
						class="btn btn-danger d-block my-4" style="margin: 0 auto">대표사진
						추가</button>
				</div>
				<div class="form_section">

					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input class="form-control" name="productName"> <span
							class="ck_warn Name_warn">상품 이름을 입력해주세요.</span>
					</div>
					<div class="form_section_title">
						<label>판매자</label>
					</div>
					<div class="form_section_content">
						<input class="form-control mb-3" name="id" value="${user.id}">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label> 카테고리</label>
					</div>
					<div class="form_section_content ">
						<div class="cate_wrap ">

							<select name="pcategoryNum" class="form-control mb-3"
								id="pcategoryNum">
								<option value="">선택해주세요.</option>
								<option value="1">강아지</option>
								<option value="2">고양이</option>
							</select>
						</div>
						<div class="cate_wrap" id="cResult"></div>
						<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="productPrice" value="0" class="form-control">
						<span class="ck_warn Price_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="productCount" value="0" class="form-control">
						<span class="ck_warn Count_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input name="rate" value="0" class="form-control">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 설명</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="productDetail" class="form-control"
							id="productDetail"></textarea>
						<span class="ck_warn Detail_warn">상품 소개를 입력해주세요.</span>
					</div>
				</div>
				<div class="btn_section">
					<button type="submit" id="enrollBtn"
						class="btn btn-danger d-block my-4" style="margin: 0 auto">상품 등록</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../resources/js/category.js"></script>
	<script type="text/javascript" src="../resources/js/fileAdd.js"></script>
	<script type="text/javascript" src="../js/summernote.js"></script>

	<script type="text/javascript">
		selectCategory();
		fileAddInit(0);
		summernoteInit("productDetail", "");
	</script>

</body>
</html>