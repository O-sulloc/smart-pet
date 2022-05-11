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
	  		<h4 style="text-transform: uppercase;">${board} Write</h4>
		</div>
	</div>
	
	
	<div class="row mt-4">
		<form action="./add" method="post">
			<div class="form_section">
				<div class="row">
					<div class="form_section_content col-lg-12" id="grade">
						<span>카테고리</span> 
						<select class="type1 col-lg-12" name="grade">
							<option selected value="none">선택</option>
							<option value="0">일반</option>
							<option value="1">상품</option>
							<option value="2">예약</option>
							<option value="3">이벤트</option>
						</select>
					</div>
				</div>
			</div>

		  <div class="row mb-3">
		    <label for="title" class="col-sm-2 col-form-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" name="title">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="id" class="col-sm-2 col-form-label">Writer</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="id" name="id">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="contents" class="col-sm-2 col-form-label">Contents</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="contents" name="contents"></textarea>
		    </div>
		  </div>
		  
		  <button type="submit" class="btn btn-primary my-4">Write</button>
		</form>
		
	</div>	
</div>	

<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>