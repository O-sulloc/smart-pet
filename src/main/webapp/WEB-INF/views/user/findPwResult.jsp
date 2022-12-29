<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>비밀번호 찾기</title>
	<meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->
	<link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	<c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>

	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	
	
	<div class="maill-success">
		<div class="d-table">
			<div class="d-table-cell">
				<div class="container">
					<div class="success-content">
						<i class="lni lni-thumbs-up"></i>
						<h1>짜잔!</h1>
						<h2>이메일로 임시 비밀번호를 발송했어요.</h2>
						<p>임시 비밀번호로 로그인 후 반드시 비밀번호를 바꿔주세요.</p>
						<div class="button">
							<a href="/user/login" class="btn">로그인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<c:import url="../temp/header_script.jsp"></c:import>
	<script>
	    window.onload = function () {
	      window.setTimeout(fadeout, 500);
	    }
	
	    function fadeout() {
	      document.querySelector('.preloader').style.opacity = '0';
	      document.querySelector('.preloader').style.display = 'none';
	    }
	  </script>
</body>
</html>