<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
			<h1>update</h1>
	<!-- side bar -->
	<c:import url="../service/sellerSidebar.jsp"></c:import>

	

		<div class="row col-md-auto">
			<form action="./update" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="id" value="${user.id}">
				<input type="hidden" name="serNum" value="${vo.serNum}">
				
				<img alt="" src="../resources/upload/service/${vo.serviceFileVO.fileName}">
			
 				<div class="row mb-3">
					<label for="files" class="col-sm-2 col-form-label">File</label>
					<div class="col-sm-10">
						<input type="file" name="file" class="form-control">
					</div>
				</div> 
				
				<div class="row mb-3">
					<label for="name" class="col-sm-2 col-form-label">Name</label>
					<div class="col-sm-10">
						<input type="text" value="${vo.serName}" name="serName" class="form-control" readonly>
					</div>
				</div>

				<div class="row mb-3">
					<label for="serAddress" class="col-sm-2 col-form-label">Address</label>
					<div class="col-sm-10">
						<input type="text" value="${vo.serAddress}" name="serAddress" class="form-control" >
					</div>
				</div>
				
				<c:if test="${vo.serKind==1}">
				<div class="row mb-3">
					<label for="hospitalField" class="col-sm-2 col-form-label">진료과목 </label>
					<div class="col-sm-10">
						<input type="text" value="${vo.hospitalField}" name="hospitalField" class="form-control" >
					</div>
				</div>
				</c:if>

				<div class="row mb-3">
					<label for="Email" class="col-sm-2 col-form-label">homepage</label>
					<div class="col-sm-10">
						<input type="text" value="${vo.homepage}" name="homepage" class="form-control" >
					</div>
				</div>
				
				<div class="row mb-3">
					<label for="phone" class="col-sm-2 col-form-label">Phone</label>
					<div class="col-sm-10">
						<input type="text" value="${vo.serTel}" name="serTel" class="form-control">
					</div>
				</div>				


				<button type="submit" class="btn btn-primary">수정</button>
			</form>

		</div>


	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>