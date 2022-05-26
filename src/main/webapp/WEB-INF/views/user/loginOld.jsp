<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>MediGrids 회원가입</title>
	<meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->
    
    <c:import url="../temp/header_css.jsp"></c:import>
    
</head>
<body>
	
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Login</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Login</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container mt-5 text-center">
		<main class="form-signin">
			<form action="login" method="post">
				<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
				
				<div class="row justify-content-center">
					<div class="col-3">
						<div class="form-floating mt-2">
							<input type="text" class="form-control" name="id" value="${cookie.remember.value }">
							<label for=floatingInput>ID</label>
						</div>
						
						<div class="form-floating mt-2">
							<input type="password" name="pw" class="form-control">
							<label for=floatingInput>PW</label>
						</div>
					
						<div class="checkbox mb-3 mt-2">
							<label>
								<input type="checkbox" value="1" name="remember"> Remember
							</label>
						</div>
						
						<button class="w-100 btn btn-lg btn-success mb-2" type="submit">Sign In</button>
						<button class="w-100 btn btn-lg btn btn-outline-danger" onclick="location.href='/user/join'" type="button">Join Now!</button>
							    
						<div class="checkbox mb-3 mt-2">
							<button type="button" class="btn btn-outline-info" onclick="location.href='/user/findId'">ID찾기</button>
							<button type="button" class="btn btn-outline-info" onclick="location.href='/user/findPw'">PW찾기</button>
						</div>
					</div>
				</div>
			</form>
		</main>
	</div>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>