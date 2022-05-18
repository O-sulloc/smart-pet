<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container">
	<h1>Mypage</h1>

	
	<div class="row">
		<div class="card">
			    	
	    	<hr class="my-6">
	    		<h6>Photo</h6>
	    	
				<ul class="list-group list-group-flush">
				   	<li class="list-group-item">
				   		<img alt="" src="../resources/upload/service/${vo.serviceFileVO.fileName}">
				   	</li>
				</ul>
		
			<ul class="list-group list-group-flush">
				<li class="list-group-item">${vo.serName}</li>
		   		<li class="list-group-item">${vo.serAddress} </li>
		   		<li class="list-group-item">${vo.hospitalField} </li>
		   		<li class="list-group-item">${vo.serTel} </li>
			   	<li class="list-group-item">${vo.homepage}</li>
			</ul>
		  
		

    	 
		</div>
	
	</div>
	
</div>
	<div class="container my-4">
		<div class="col-2 d-flex">
			<a href="update" role="button" class="btn btn-success mx-1">Update</a>
			<a href="delete?serNum=${vo.serNum}" role="button" class="btn btn-danger mx-1" id="delete">delete</a>
		
		</div>
		<a href="../service/manage"  class="btn btn-success mx-1">예약 관리 페이지</a>
	</div>
	
	
	
	



<!-- <img alt="" src="../resources/upload/service/$"> -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
</body>
</html>