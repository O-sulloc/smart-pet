<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>회원가입</title>
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
						<h1 class="page-title">회원가입</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">홈</a></li>
						<li>회원가입</li>
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
					<h4 class="title">회원가입</h4>
					<form:form modelAttribute="userVO" method="post" id="frm">
						<div class="form-group">
							<form:input path="name" cssClass="form-control" id="name" placeholder="이름"/>
							<form:errors path="name"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="id" cssClass="form-control" id="id" placeholder="아이디"/>
								<div>
									<form:errors path="id"></form:errors>
								</div>
						</div>
						<div class="form-group">
							<form:password path="pw" cssClass="form-control" id="pw" placeholder="비밀번호"/>
							<form:errors path="pw"></form:errors>
						</div>
						<div class="form-group">
							<form:password path="checkPw" cssClass="form-control" id="checkPw" placeholder="비밀번호 확인"/>
							<form:errors path="checkPw"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="email" cssClass="form-control" id="email" placeholder="이메일" />
	              			<form:errors path="email"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="phone" cssClass="form-control" placeholder="휴대폰"/>
							<form:errors path="phone"></form:errors>
						</div>
						<div class="form-group">
							<form:input path="address" cssClass="form-control" placeholder="주소" id="address"/>
							<form:errors path="address"></form:errors>
						</div>
						
						<div class="check-and-pass">
							<div class="row align-items-center">
								<div class="col-12">
									<div class="form-check">
										<input type="checkbox" class="form-check-input width-auto checkAll" id="all">
										<label class="form-check-label" for="all">전체 동의</label>
									</div>
									<div class="form-check col-12">
										<input type="checkbox" class="form-check-input width-auto ch" id="check1">
										<label class="form-check-label" for="check1">이용약관 동의 <a href="javascript:void(0)">(필수)</a></label>
									</div>
									<div class="form-check col-12">
										<input type="checkbox" class="form-check-input width-auto ch" id="check2">
										<label class="form-check-label" for="check2">개인정보 수집 및 이용 동의 <a href="javascript:void(0)">(필수)</a></label>
									</div>
									<div class="form-check">
										<input type="checkbox" class="form-check-input width-auto ch" id="check3">
										<label class="form-check-label" for="check3">위치기반서비스 이용약관 동의</label>
									</div>
								</div>
							</div>
						</div>
						<div class="button">
							<button type="button" class="btn" id="btn">가입하기</button>
						</div>
						
						<p class="outer-link">이미 가입하셨나입?<a href="/user/login">로그인</a>
						</p>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/join.js"></script>
	
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>