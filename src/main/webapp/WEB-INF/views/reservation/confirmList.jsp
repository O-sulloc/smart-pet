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
	<input type="hidden" name="serNum" value="${confirmList.serNum}">
	
	<div class="row mt-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상호명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>영업시간</th>
					<th>얘약일</th>
					<th>얘약시간</th>
					<th>상태</th>
					
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${confirmList}" var="cl">
				<tr>
					<td><a class="link-success text-decoration-none" href="../service/detail?serNum=${cl.serNum}">${cl.serviceVO.serName}</a></td>
					<td>${cl.serviceVO.serTel}</td>
					<td>${cl.serviceVO.serAddress}</td>
					<td>${cl.serviceVO.serTime}</td>
					<td>${cl.resDate}</td>
					<td>${cl.resTime}</td>
					<td>${cl.resState}</td>
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
		
	</div>
	
	




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>