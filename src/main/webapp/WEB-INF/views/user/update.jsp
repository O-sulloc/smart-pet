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
	<div class="container mt-3">
		<main>
			<div class="py-5 text-center">
				<h2>My Page Update</h2>
			</div>
		<form action="update" method="post">
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-8">
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="name" class="form-label">Name</label>
							<input type="text" class="form-control" value="${vo.name}" id="name" name="name" readonly="readonly">
						</div>
						
						<div class="col-sm-6">
							<label for="id" class="form-label">Id</label>
							<input type="text" class="form-control" value="${vo.id}" id="id" name="id" readonly="readonly">
						</div>
						
						<div class="col-sm-6">
							<label for="email" class="form-label">Email</label>
							<input type="email" class="form-control" value="${vo.email}" id="email" name="email">
						</div>
						
						<div class="col-sm-6">
							<label for="phone" class="form-label">Phone</label>
							<input type="text" class="form-control" value="${vo.phone}" id="phone" name="phone">
						</div>
						
						<div class="col-sm-6">
							<label for="address" class="form-label">Address</label>
							<input type="text" class="form-control" value="${vo.address}" id="address" name="address">
						</div>
						
						<hr class="my-4">
						<div class="container my-2">
							<div class="col-3 d-flex">
								<button type="submit" class="btn btn-outline-success mx-1">수정</button>
							</div>
				        </div>
					</div>
				</div>
			</div>
		</form>
		</main>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>