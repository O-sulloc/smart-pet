<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>update page</h1>

<h1>mypage</h1>
<h3>홈페이지:${vo.homepage}</h3>
<h3>진료과목:${vo.hospitalField}</h3>
<h3>전화번호:${vo.serTel}</h3>


	<div class="container mt-4">
		<div class="row mt-4">
			<div class="alert alert-light" role="alert">
				<h4 style="text-transform: uppercase;">${board} Update</h4>
			</div>
		</div>


		<div class="row mt-4">
			<form action="update" method="post" enctype="multipart/form-data">
				
				<div class="row mb-3">
					<label for="name" class="col-sm-2 col-form-label">Name</label>
					<div class="col-sm-10">
						<input type="text" value="${vo.serName}" name="name" class="form-control" id="name">
					</div>
				</div>

				<div class="row mb-3">
					<label for="text" class="col-sm-2 col-form-label">Hompage</label>
					<div class="col-sm-10">
						<input type="email" value="${vo.homepage}" name="email" class="form-control" id="email">
					</div>
				</div>
				
				<div class="row mb-3">
					<label for="phone" class="col-sm-2 col-form-label">Phone</label>
					<div class="col-sm-10">
						<input type="text" value="${vo.serTel}" name="phone" class="form-control" id="phone">
					</div>
				</div>				

				<div class="row mb-3">
					<label for="files" class="col-sm-2 col-form-label">File</label>
					<div class="col-sm-10">
						<input type="file" name="files" class="form-control" id="files">
					</div>
				</div>

				<button type="submit" class="btn btn-primary">Join</button>
			</form>

		</div>


	</div>
</body>
</html>