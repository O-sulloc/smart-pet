<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>	
	<div class="container mt-5 text-center">
		<main>
			<h1 class="h3 mb-3 fw-normal">PW</h1>
	
			<div class="row justify-content-center">
				<div class="col-3">
					<h2>입력하신 이메일로 임시 비밀번호를 발송했습니다. 해당 임시 비밀번호로 로그인해주시기 바랍니다.</h2>
	
						<button class="w-100 btn btn-lg btn-success mb-2 my-4" onclick="location.href='/user/login'" type="button">Login</button>
						<button class="w-100 btn btn-lg btn btn-outline-danger" onclick="location.href='/user/join'" type="button">Join!</button>
							    
						<div class="checkbox mb-3 mt-2">
							<button type="button" class="btn btn-outline-info" onclick="location.href='/user/findId'">ID찾기</button>
							<button type="button" class="btn btn-outline-info" onclick="location.href='/user/findPw'">PW찾기</button>
						</div>
				</div>
			</div>
		</main>
    </div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>