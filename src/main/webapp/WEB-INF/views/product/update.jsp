<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<c:import url="../temp/header_css.jsp"></c:import>
<title>상품 업데이트 페이지</title>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">상품 업데이트</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Product Update</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

		
	<div class="content_wrap">
		<div class="content_main">
			<form:form modelAttribute="productVO" method="post" id="enrollForm" enctype="multipart/form-data">
				<div class="form_section_title">
					<label>대표 사진</label>
				</div>
				<div id="fileResult"></div>
				<div>
					<button type="button" id="fileAdd" class="btn btn-danger d-block my-4" style="margin: 0 auto">대표사진 추가</button>
				</div>
				
				<div>
				<c:forEach items="${vo.productFileVOs}" var="fileVO">
				<h4>${fileVO.oriName}<button data-num="${fileVO.fileNum}" type="button" class="col-1 btn btn-danger del">DELETE</button></h4>
				</c:forEach>
				</div>
				<div id="fileResult"></div>
				
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<form:input path="productName" cssClass="form-control" value="${vo.productName}"/>
					</div>
					<div>
						<form:errors path="productName" cssStyle="color:red;"></form:errors>
					</div>

					<div class="form_section_title">
						<label>상품 소개</label>
					</div>
					<div class="form_section_content">
						<form:input path="productInfo" cssClass="form-control"  value="${vo.productInfo}"/>
					</div>
					<div>
						<form:errors path="productInfo" cssStyle="color:red;"></form:errors>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label> 카테고리</label>
					</div>
					<div class="form_section_content ">
						<div class="cate_wrap ">
							<form:select path="pcategoryNum" cssClass="form-control" id="pcategoryNum" value="${vo.pcategoryNum}">
								<form:option value="">선택해주세요.</form:option>
								<form:option value="1">강아지</form:option>
								<form:option value="2">고양이</form:option>
							</form:select>
						</div>
						<div>
							<form:errors path="pcategoryNum" cssStyle="color:red;"></form:errors>
						</div>
					<div class="cate_wrap" id="cResult"></div>			
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<form:input path="productPrice" cssClass="form-control" value="${vo.productPrice}" />
					</div>
					<div>
						<form:errors path="productPrice" cssStyle="color:red;"></form:errors>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<form:input path="productCount" cssClass="form-control" value="${vo.productCount}" />
					</div>
					<div>
						<form:errors path="productCount" cssStyle="color:red;"></form:errors>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input name="rate" value="0" class="form-control" value="${vo.rate}">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 설명</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="productDetail" class="form-control" id="productDetail"></textarea>
					</div>
				</div>
			</form:form>
			<div class="btn_section">
					<button type="submit" id="enrollBtn"
					class="btn btn-danger d-block my-4" style="margin: 0 auto">상품 업데이트</button>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/js/category.js"></script>
	<script type="text/javascript" src="../resources/js/fileAdd.js"></script>
	<script type="text/javascript" src="../js/summernote.js"></script>
	<c:import url="../temp/footer.jsp"></c:import> 
	
	

	<script type="text/javascript">
	$("#enrollBtn").click(function(){
		$("#enrollForm").submit();
	})
	
		selectCategory();
		fileAddInit(${vo.productFileVOs.size()})		//원래 있던 파일 갯수 매개변수로 넘겨줌
		fileDeleteInit();
		summernoteInit("productDetail", "${vo.productDetail}");
	</script>
</body>
</html>