<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Login - MediGrids</title>
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
	
	<section class="login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
					<div class="form-head">
					<h4 class="title">Login To Your Account</h4>
						<form action="login" method="post">
							<div class="form-group">
								<!-- <input name="email" type="email" placeholder="Email"> -->
								<input type="text" class="form-control" name="id" value="${cookie.remember.value }" placeholder="ID">
							</div>
							<div class="form-group">
								<!-- <input name="password" type="password" placeholder="Password"> -->
								<input type="password" name="pw" class="form-control" placeholder="Password">
							</div>
							<div class="check-and-pass">
								<div class="row align-items-center">
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-check">
											<input type="checkbox" class="form-check-input width-auto" id="exampleCheck1" value="1" name="remember">
											<label class="form-check-label">Remember me</label>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<span class="outer-link">Lost your
												<a href="findId">id</a>
												<span>or</span>
												<a href="findPw">password</a>
												<span>?</span>
										</span>
									</div>
								</div>
							</div>
							<div class="button">
								<button type="submit" class="btn">Login Now</button>
							</div>
							<div class="alt-option">
								<span>Or</span>
							</div>
							<div class="socila-login">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
											 <li><a href="javascript:void(0)" class="facebook"><i class="lni lni-facebook-original"></i>Login With
											Facebook</a></li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
											<li><a href="javascript:void(0)" class="google"><i class="lni lni-google"></i>Login With Google
											Plus</a>
											</li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
											<li><a href="javascript:void(0)" class="instagram"><i class="lni lni-instagram"></i>Login With
											Instagram</a></li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
											<li><a href="javascript:void(0)" class="linkedin"><i class="lni lni-linkedin-original"></i>Login With Linkedin</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<p class="outer-link">Don't have an account? 
								<a href="join">Register here</a>
							</p>
						</form>
					</div>
				</div>
			</div>	
		</div>
	</section>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>