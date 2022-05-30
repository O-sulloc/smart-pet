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
						<h1 class="page-title">Registration</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Registration</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<section class="login registration section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
					<div class="form-head">
					<h4 class="title">Registration</h4>
					<form:form modelAttribute="userVO" method="post" id="frm">
						<div class="socila-login">
							<div class="row">
							<div class="col-lg-6 col-md-6 col-12">
								<ul>
									<li><a href="javascript:void(0)" class="facebook"><i class="lni lni-facebook-original"></i>Import From
									Facebook</a></li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<ul>
									<li><a href="javascript:void(0)" class="google"><i class="lni lni-google"></i>Import From Google
									Plus</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<ul>
									<li><a href="javascript:void(0)" class="instagram"><i class="lni lni-instagram"></i>Import From
									Instagram</a></li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-6 col-12">
								<ul>
									<li><a href="javascript:void(0)" class="linkedin"><i class="lni lni-linkedin-original"></i>Import From Linkedin</a>
									</li>
								</ul>
							</div>
							</div>
						</div>
						
						<div class="alt-option">
							<span>Or</span>
						</div>
						
						<div class="form-group">
							<form:input path="name" cssClass="form-control" id="name" placeholder="Name"/>
							<form:errors path="name"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="id" cssClass="form-control" id="id" placeholder="ID"/>
								<div>
									<form:errors path="id"></form:errors>
								</div>
						</div>
						<div class="form-group">
							<form:password path="pw" cssClass="form-control" id="pw" placeholder="Password"/>
							<form:errors path="pw"></form:errors>
						</div>
						<div class="form-group">
							<form:password path="checkPw" cssClass="form-control" id="checkPw" placeholder="Confirm Password"/>
							<form:errors path="checkPw"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="email" cssClass="form-control" id="email" placeholder="Email" />
	              			<form:errors path="email"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="phone" cssClass="form-control" placeholder="Phone"/>
							<form:errors path="phone"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="address" cssClass="form-control" placeholder="Address"/>
							<form:errors path="address"></form:errors>
						</div>
						
						<div class="check-and-pass">
							<div class="row align-items-center">
								<div class="col-12">
									<div class="form-check">
										<input type="checkbox" class="form-check-input width-auto checkAll" id="all">
										<label class="form-check-label" for="all">Agree to All our <a href="javascript:void(0)">Terms and
										Conditions</a></label>
									</div>
									<div class="form-check col-12">
										<input type="checkbox" class="form-check-input width-auto ch" id="check1">
										<label class="form-check-label" for="check1">Agree to our <a href="javascript:void(0)">Terms and
										Conditions</a></label>
									</div>
									<div class="form-check col-12">
										<input type="checkbox" class="form-check-input width-auto ch" id="check2">
										<label class="form-check-label" for="check2">Agree to our <a href="javascript:void(0)">Terms and
										Conditions</a></label>
									</div>
									<div class="form-check">
										<input type="checkbox" class="form-check-input width-auto ch" id="check3">
										<label class="form-check-label" for="check3">Agree to our <a href="javascript:void(0)">Terms and
										Conditions</a></label>
									</div>
								</div>
							</div>
						</div>
						<div class="button">
							<button type="submit" class="btn" id="btn">Registration</button>
						</div>
						
						<p class="outer-link">Already have an account? <a href="/user/login"> Login Now</a>
						</p>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
	
	<!-- jquery -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/join.js"></script> -->
	<!-- bootstrap -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</body>
</html>