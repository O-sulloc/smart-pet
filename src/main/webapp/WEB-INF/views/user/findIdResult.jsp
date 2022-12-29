<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>아이디 찾기</title>
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
						<i class="lni lni-magnifier"></i>
						<c:choose>
			              	<c:when test="${not empty idResult}">
								<h1>짜잔!</h1>
			              		<h2><spring:message code="user.info.findId" arguments="${idResult.id}"></spring:message></h2>
								<span class="outer-link"><a href="findPw">비밀번호</a>
								<span>찾으러 가기</span>
								</span>
								<div class="button my-4">
									<a href="/user/login" class="btn">로그인</a>
								</div>
			              	</c:when>
			              	<c:otherwise>
			              		<h1>음..</h1>
			              		<h2><spring:message code="user.info.noId"></spring:message></h2>
			              		<p>정보를 확인해주세요.</p>
			              		<div class="button my-4">
									<a href="/user/findId" class="btn">이전 페이지</a>
								</div>
			              	</c:otherwise>
						</c:choose>
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