<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>
<!--  에디터 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>상품 수정 페이지</h1>

	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="productNum" value="${vo.productNum}">
	<div>
	<label>카테고리</label> <input name="categoryNum" value="${vo.categoryNum}" class="form-control productId">
	</div>
	<div>
	<label>상품명</label> <input name="productName" value="${vo.productName}" class="form-control productId">
	</div>
	<div>
	<label>상품 가격</label> <input name="productPrice" value="${vo.productPrice}" class="form-control productId">
	</div>
	<div>
	<label>상품 설명</label> <input name="productDetail" value="${vo.productDetail}" class="form-control productId">
	</div>
	<div>
	<label>상품 수량</label> <input name="productCount"  value="${vo.productCount}" class="form-control productId">
	</div>
	<div>
	<label>할인율</label> <input name="rate" value="${vo.rate}" class="form-control productId">
	</div>	
	
<div id="fileResult"></div>

<button type="button" id="fileAdd" class="btn btn-primary">사진 추가</button>

<div>
<c:forEach items="${vo.productFileVOs}" var="fileVO">
<h4>${fileVO.oriName}<button data-num="${fileVO.fileNum}" type="button" class="col-1 btn btn-danger del">사진 삭제</button></h4>
</c:forEach>
</div>

<div id="fileResult"></div>	
	
	<div class="row justify-content-end">
		<button type="submit" class="col-1 btn btn-primary ">수정하기</button>
	</div>
	</form>		
	
	
<script type="text/javascript" src="../resources/js/fileAdd.js"></script>

<script type="text/javascript">

fileAddInit(${vo.productFileVOs.size()})		//원래 있던 파일 갯수 매개변수로 넘겨줌
fileDeleteInit();

</script>		

</body>
</html>