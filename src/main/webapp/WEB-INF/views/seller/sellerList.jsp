<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>

<title>seller page </title>
</head>
<body>


<!--  카테고리 정렬 끝 -->
<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<c:import url="../temp/sellerSidebar.jsp"></c:import>
			</div>
			<div class="col-9 container mt-3">
				<main>
<div class="container">

<div class="row justify-content-between">
		<div class="col-5">
			<form class="d-flex" action="./list" method="get">
				<div class="col-4 me-2">
				<select name="kind" class="form-select " aria-label="Default select example">
				  <option value="col1">상품명</option>
				  <option value="col2">가격</option>
				  <option value="col3">설명</option>
				</select>
				</div>
				<div class="col-6 me-2">
	        	<input name="search" class="form-control" type="search" placeholder="Search" aria-label="Search">
	        	</div>
	        	<div class="col-2">
	        	<button class="btn btn-outline-success" type="submit">Search</button>
	        	</div>
	      </form>
		</div> 
</div>

    <div class="container">
        전체 상품 ${count}개
    </div>

<div class="row row-cols-1 row-cols-md-3 g-4">
<c:forEach items="${list}" var="vo">
  <div class="col">
    <div class="card h-100 detail" data-num="${vo.productNum}">
      <img src="../resources/upload/product/${vo.productFileVOs[0].fileName}" class="card-img-top" alt="...">
      <div class="card-body">
		
       <h5 class="card-title">${vo.productName}</h5>
       <p class="card-text">${vo.productDetail}</p>
       <p class="card-text">${vo.id}</p>
      </div>
      <div class="card-footer">
        <small class="text-muted">${vo.productPrice}원</small>
        <small class="text-muted">${vo.rate}%할인중</small>
      </div>
    </div>
  </div>
</c:forEach>
</div>
	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="./list?pn=${pager.pre?pager.startNum-1:1}&kind=${pager.kind}&search=${pager.search}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&kind=${pager.kind}&search=${pager.search}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
</main>
</div>
</div>
</div>


<script type="text/javascript" src="../resources/js/productList.js"></script>

</body>
</html>