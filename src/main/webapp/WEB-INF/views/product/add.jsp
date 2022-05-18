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

<title>Insert title here</title>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>상품 등록 페이지</h1>

	<form action="add" method="post" enctype="multipart/form-data">
		<div class="mb-3" style="width:200px">
			<label>카테고리</label> <select name="pcategoryNum" class="form-control empty" id="pcategoryNum">
				<option value="">선택해주세요.</option>
				<option value="1">강아지</option>
				<option value="2">고양이</option>
			</select>
		</div>
		<div class="mb-3" style="width:200px" id="cResult"></div>

		<div>
			<label>상품명</label> <input name="productName" class="form-control productId">
		</div>
		<div>
			<label>상품 가격</label> <input name="productPrice" class="form-control productId">
		</div>
		<div>
			<label>상품 설명</label> <input name="productDetail" class="form-control productId">
		</div>
		<div>
			<label>상품 수량</label> <input name="productCount" class="form-control productId">
		</div>
		<div>
			<label>할인율</label> <input name="rate" class="form-control productId">
		</div>
		<div>
			<label>판매자</label> <input name="writer" class="form-control productId">
		</div>

		<div id="fileResult"></div>
		<div>
		<button type="button" id="fileAdd" class="btn btn-danger d-block my-4">사진 추가</button>
		</div>
		<div>
		<button type="submit">등록</button>
		</div>
	</form>
</div>
<script type="text/javascript" src="../resources/js/category.js"></script> 
<script type="text/javascript" src="../resources/js/fileAdd.js"></script> 

<script type="text/javascript">
selectCategory();
fileAddInit(0);
</script>
	
</body>
</html>