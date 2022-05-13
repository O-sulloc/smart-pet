<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<main>
			<div class="py-5 text-center">
				<h2>반려동물 관리 페이지</h2>
			</div>
			
			<div class="row mt-4">
				<c:forEach items="${list}" var="pet" >
					<div class="card me-3" style="width: 18rem;">
					  <div class="card-body">
					    <h5 class="card-title">이름: ${pet.petName}</h5>
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">${pet.petKind==0?'강아지':'고양이'}</li>
					    <li class="list-group-item">생년월일: ${pet.petBirth}</li>
					    <li class="list-group-item">성별: ${pet.petSex==0?'여아':'남아'}</li>
					  </ul>
					  <div class="card-body">
					    <a href="./petUpdate?petNum=${pet.petNum}" class="card-link">수정하기</a>
					    <a href="./petDelete?petNum=${pet.petNum}" class="card-link">삭제하기</a>
					  </div>
					</div>
				</c:forEach>
			</div>
			
			<div class="col-1 my-4">
				<a type="button" class="btn btn-outline-success" href="./petAdd">등록하기</a>
			</div>
		</main>
	</div>

	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>