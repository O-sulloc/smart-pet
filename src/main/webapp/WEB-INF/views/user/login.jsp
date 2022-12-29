<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>로그인</title>
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
						<h1 class="page-title">로그인</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">홈</a></li>
						<li>로그인</li>
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
					<h4 class="title">로그인</h4>
						<form action="login" method="post">
							<div class="form-group">
								<!-- <input name="email" type="email" placeholder="Email"> -->
								<input type="text" class="form-control" name="id" value="${cookie.remember.value }" placeholder="아이디">
							</div>
							<div class="form-group">
								<!-- <input name="password" type="password" placeholder="Password"> -->
								<input type="password" name="pw" class="form-control" placeholder="비밀번호">
							</div>
							<div class="check-and-pass">
								<div class="row align-items-center">
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-check">
											<input type="checkbox" class="form-check-input width-auto" id="exampleCheck1" value="1" name="remember">
											<label class="form-check-label">아이디 기억하기</label>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<span class="outer-link">
												<a href="findId">아이디 찾기</a>
												<span>|</span>
												<a href="findPw">비밀번호 찾기</a>
										</span>
									</div>
								</div>
							</div>
							<div class="button">
								<button type="submit" class="btn">로그인</button>
							</div>
							<p class="outer-link">아이디가 없으신가요?
								<a href="join">회원가입</a>
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