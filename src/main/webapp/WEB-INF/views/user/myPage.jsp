<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<c:import url="../temp/sidebar.jsp"></c:import>
			</div>
		
			<div class="col-9 container mt-3">
				<main>
					<div class="py-5 text-center">
						<h2>My Page</h2>
					</div>
					
					<div class="row justify-content-center">
						<div class="col-md-7 col-lg-8">
							<div class="row g-3">
								<div class="col-sm-6">
									<label for="name" class="form-label">Name</label>
									<input type="text" class="form-control" value="${vo.name}" id="name" readonly="readonly">
								</div>
								
								<div class="col-sm-6">
									<label for="id" class="form-label">Id</label>
									<input type="text" class="form-control" value="${vo.id}" id="id" readonly="readonly">
								</div>
								
								<div class="col-sm-6">
									<label for="email" class="form-label">Email</label>
									<input type="email" class="form-control" value="${vo.email}" id="email" readonly="readonly">
								</div>
								
								<div class="col-sm-6">
									<label for="phone" class="form-label">Phone</label>
									<input type="text" class="form-control" value="${vo.phone}" id="phone" readonly="readonly">
								</div>
								
								<div class="col-sm-6">
									<label for="address" class="form-label">Address</label>
									<input type="text" class="form-control" value="${vo.address}" id="address" readonly="readonly">
								</div>
								
								<hr class="my-4">
								<div class="container my-2">
									<div class="col-3 d-flex">
										<a href="update" role="button" class="btn btn-outline-success mx-1" onclick="location.href='/user/update'">수정</a>
										<a href="delete" role="button" class="btn btn-outline-danger mx-1" onclick="location.href='/user/delete'">탈퇴</a>
									</div>
						        </div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>