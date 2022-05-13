<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:import url="../temp/header_css.jsp"></c:import>
	<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-light" role="alert">
	  		<h4 style="text-transform: uppercase;">${board} Update</h4>
		</div>
	</div>
	
	
	<div class="row mt-4">
		<form action="./update" method="post">
			<input type="hidden" name="num" value="${vo.num}">
			
			<!-- 카테고리 변경이 가능하게 할지 아니면 그냥 둘지 고민 -->
			<!-- <div>
				<h5>카테고리</h5>
				<div class="row">
					<div class="form_section_content col-lg-12" id="type">
						<div class="type_wrap checkout__input">
							<span>중분류</span> <select class="type1 col-lg-12">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="type_wrap checkout__input">
							<span>소분류</span> <select class="type2 col-lg-12" name="grade">
								<option selected value="none">선택</option>
							</select>
						</div>
					</div>
				</div>
			</div> -->
			
			<!-- 임시로 넣어놓음 -->
			<input type="hidden" name="grade" value="${vo.grade}">
			<h3>${vo.faqCateVO.cateName}</h3>
		
		  <div class="row mb-3">
		    <label for="title" class="col-sm-2 col-form-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" name="title" value="${vo.title}">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="id" class="col-sm-2 col-form-label">Writer</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="id" name="id" value="${vo.id}" readonly>
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="contents" class="col-sm-2 col-form-label">Contents</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="contents" name="contents">${vo.contents}</textarea>
		    </div>
		  </div>
		  
		  <button type="submit" class="btn btn-primary my-4">Update</button>
		</form>
		
	</div>	
</div>	

<script type="text/javascript" src="../resources/js/notice_update.js"></script>
<c:import url="../temp/header_script.jsp"></c:import>

<script type="text/javascript">
	takeList('${cateList}');
	makeList('${cateList}');
	totalCheck();
</script>

</body>
</html>