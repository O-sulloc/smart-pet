<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="/service/list">병원/미용샵</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">상품조회</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            제품
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">카테고리</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">카테고리</a></li>
          </ul>
        </li>
      </ul>
    </div>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      	<c:if test="${empty user}">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/user/login">로그인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/user/join">회원가입</a>
	        </li>
        </c:if>
        <c:if test="${not empty user}">
			<li class="nav-item dropdown">
	        	<i class="nav-link dropdown fa-regular fa-circle-user fa-2x" onclick="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"></i>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="/user/myPage">내 프로필</a></li>
	            <li><a class="dropdown-item" href="/user/petList">반려동물 관리</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">장바구니</a></li>
	            <li><a class="dropdown-item" href="#">예약</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="/user/logout">로그아웃</a></li>
	          </ul>
	        </li>
        </c:if>
      </ul>
  </div>
</nav>

<script src="https://kit.fontawesome.com/c996879092.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>