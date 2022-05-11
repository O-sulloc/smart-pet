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

<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>