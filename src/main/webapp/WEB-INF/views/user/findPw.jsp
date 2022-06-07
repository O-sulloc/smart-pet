<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Find Pw - MediGrids</title>
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
						<h1 class="page-title">Find Pw</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Find Pw</li>
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
					<h4 class="title">Enter Your Id And Email</h4>
						<form:form modelAttribute="userVO" method="post" id="frm">
							<div class="form-group">
								<form:input path="id" cssClass="form-control" id="id" placeholder="Id"/>
								<form:errors path="id"></form:errors>
								<div id="idResult"></div>
							</div>
							<div class="form-group">
								<form:input path="email" cssClass="form-control" id="email" placeholder="Email"/>
								<form:errors path="email"></form:errors>
								<div id="emailResult"></div>
							</div>
							<div class="check-and-pass">
								<div class="row align-items-start">
									<div class="col-lg-3 col-md-3 col-3">
										<span class="outer-link">Lost your
											<a href="findId">id</a>
											<span>?</span>
										</span>
									</div>
								</div>
							</div>
							<div class="button">
								<button type="button" class="btn" id="btn">Find Pw</button>
							</div>
							
							<p class="outer-link">Don't have an account? 
								<a href="join">Register here</a>
							</p>
						</form:form>
					</div>
				</div>
			</div>	
		</div>
	</section>
	
	<script src="../resources/js/findPw.js"></script>
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>