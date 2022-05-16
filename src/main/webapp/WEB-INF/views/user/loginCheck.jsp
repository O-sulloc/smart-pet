<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="container mt-5 text-center">
		<main class="form-signin">
			<form action="loginCheck" method="post">
				<h1 class="h3 mb-3 fw-normal">개인 정보 수정</h1>
				<h5>비밀번호 재확인</h3>
				<h6>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</h6>
				
				<div class="row justify-content-center">
					<div class="col-3">
						<div class="form-floating mt-2">
							<input type="text" name="id" value="${vo.id}" hidden="">
						</div>
						
						<div class="form-floating mt-2">
							<input type="password" name="pw" class="form-control">
							<label for=floatingInput>PW</label>
						</div>
						
						<button class="w-100 btn btn-lg btn-success mb-2 my-4" type="submit">확인</button>
					</div>
				</div>
			</form>
		</main>
	</div>
		
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>