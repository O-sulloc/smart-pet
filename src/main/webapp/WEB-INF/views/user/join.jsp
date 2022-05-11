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
	
	<div class="container mt-3">
		<main>
			<div class="py-5 text-center">
				<h2>Welcome to join us!</h2>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-8">
					<div class="alert alert-success align-items-center" role="alert">
						Enter your information
					</div>
					
					<form:form modelAttribute="userVO" method="post">
						<div class="row g-3 justify-content-center">
							<div>
								<div class="col-sm-6">
									<label for="id" class="form-label">ID</label>
	              					<form:input path="id" cssClass="form-control" id="id"/>
	              					<div>
										<form:errors path="id"></form:errors>
									</div>
								</div>
							</div>
							
							<div>
								<div class="col-sm-6">
									<label for="pw" class="form-label">Password</label>
									<form:password path="pw" cssClass="form-control" id="pw"/>
									<form:errors path="pw"></form:errors>
								</div>
							</div>
							
							<div>
								<div class="col-sm-6">
									<label for="checkPw" class="form-label">Password Check</label>
									<form:password path="checkPw" cssClass="form-control" id="checkPw"/>
									<form:errors path="checkPw"></form:errors>
								</div>
							</div>
							
							<div>
								<div class="col-sm-6">
									<label for="name" class="form-label">Name</label>
									<form:input path="name" cssClass="form-control" id="name"/>
									<form:errors path="name"></form:errors>
								</div>
							</div>
							
							<div>
								<div class="col-sm-6">
									<label for="email" class="form-label">Email <span class="text-muted"></label>
	              					<form:input path="email" cssClass="form-control" id="email"/>
	              					<form:errors path="email"></form:errors>
								</div>
							</div>
							
							<div>
								<div class="col-sm-6">
									<label for="phone" class="form-label">Phone<span class="text-muted"></label>
									<form:input path="phone" cssClass="form-control"/>
									<form:errors path="phone"></form:errors>
								</div>
							</div>
							
							<div>
								<div class="col-sm-6">
									<label for="address" class="form-label">address<span class="text-muted"></label>
									<form:input path="address" cssClass="form-control"/>
									<form:errors path="address"></form:errors>
								</div>
							</div>
							
							<hr class="my-4">
								<div class="form-check">
						            <input type="checkbox" class="form-check-input checkAll" id="all">
									<label class="form-check-label" for="all">ACCEPT ALL TERMS AND CONDITIONS</label>
								</div>
								
								<div class="form-check">
						            <input type="checkbox" class="form-check-input ch" id="check1">
						            <label class="form-check-label" for="check1">terms and conditions</label>
								</div>
								
								<div class="form-check">
						            <input type="checkbox" class="form-check-input ch" id="check2">
						            <label class="form-check-label" for="check2">terms and conditions</label>
								</div>
								
								<div class="form-check">
						            <input type="checkbox" class="form-check-input ch" id="check3">
						            <label class="form-check-label" for="check3">terms and conditions</label>
								</div>
							<hr class="my-4">
							
							<button class="w-100 btn btn-success btn-lg mb-5" type="submit">Join!</button>
						</div>
					</form:form>
				</div>
			</div>
		</main>
	</div>
	
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/join.js"></script>
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>