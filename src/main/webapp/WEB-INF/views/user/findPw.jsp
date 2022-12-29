<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>비밀번호 찾기</title>
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
						<h1 class="page-title">비밀번호 찾기</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">홈</a></li>
						<li>비밀번호 찾기</li>
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
					<h4 class="title">비밀번호 찾기</h4>
						<form:form modelAttribute="userVO" method="post" id="frm">
							<div class="form-group">
								<form:input path="id" cssClass="form-control" id="id" placeholder="아이디"/>
								<form:errors path="id"></form:errors>
								<div id="idResult"></div>
							</div>
							<div class="form-group">
								<form:input path="email" cssClass="form-control" id="email" placeholder="이메일"/>
								<form:errors path="email"></form:errors>
								<div id="emailResult"></div>
							</div>
							<div class="check-and-pass">
								<div class="row align-items-start">
									<div class="col-lg-3 col-md-3 col-3">
											<a href="findId" style="color: #006838">아이디 찾기</a>
									</div>
								</div>
							</div>
							<div class="button">
								<button type="button" class="btn" id="btn">비밀번호 찾기</button>
							</div>
							
							<p class="outer-link">아이디가 없으신가요?
								<a href="join">회원가입</a>
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