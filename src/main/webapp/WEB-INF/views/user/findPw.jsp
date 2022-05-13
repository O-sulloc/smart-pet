<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container mt-5 text-center">
		<main class="form-signin">
			<form:form modelAttribute="userVO" method="post">
				<h1 class="h3 mb-3 fw-normal">Find PW</h1>
				
				<div class="row justify-content-center">
					<div class="col-3">
						<div class="form-floating mt-2">
							<form:input path="id" cssClass="form-control" id="id"/>
							<div>
								<form:errors path="id"></form:errors>
							</div>
							<label for=floatingInput>ID</label>
						</div>
						
						<div class="form-floating mt-2">
							<form:input path="email" cssClass="form-control" id="email"/>
							<div>
								<form:errors path="email"></form:errors>
							</div>
							<label for=floatingInput>Email</label>
						</div>
						
						<button class="w-100 btn btn-success btn-lg mb-5 my-4" type="submit">임시 비밀번호 받기</button>
					</div>
				</div>
			</form:form>
		</main>
	</div>

	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>