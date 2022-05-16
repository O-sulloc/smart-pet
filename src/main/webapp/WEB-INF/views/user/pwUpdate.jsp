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
				<h2>PW Update</h2>
			</div>
		<form action="pwUpdate" method="post">
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-8">
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="pw" class="form-label">PW</label>
							<input type="password" class="form-control" id="pw" name="pw">
						</div>
						
						<hr class="my-4">
						<div class="container my-2">
							<div class="col-3 d-flex">
								<button type="submit" class="btn btn-outline-success mx-1">수정완료</button>
							</div>
				        </div>
					</div>
				</div>
			</div>
		</form>
		</main>
	</div>
	
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>