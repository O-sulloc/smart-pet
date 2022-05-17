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
		<div class="alert alert-primary" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">${board} List</h4>
		</div>
	</div>
	
	<div class="row mt-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>상호명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>영업시간</th>
				</tr>
			</thead>
			<tbody>
		
				<tr>
					<td>${vo.serNum}</td>
					<td><a class="link-success text-decoration-none" href="./detail?serNum=${vo.serNum}">${vo.serName}</a></td>
					<td>${vo.serTel}</td>
					<td>${vo.serAddress}</td>
					<td>${vo.serTime}</td>
				</tr>
			</tbody>
			
		</table>
	</div>
	
	




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>