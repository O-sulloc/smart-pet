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

<title>Store home </title>
</head>
<body>

<!--  카테고리 정렬  -->
<nav class="navbar navbar-expand-lg navbar-light bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="./list">HOME</a>
    <div class="collapse navbar-collapse" id="allMenu">
      <div class="navbar-nav">
      <ul class="mainMenu1">
        <li><a class="nav-link" href="./list?kind=pcate&search=1">DOG</a>
        </li>
      </ul>
      <ul class="subMenu1">  
        	<li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=100">사료</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=200">간식</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=300">장난감</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=400">건강관리</a></li>   
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=500">용품</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=600">미용/목욕</a></li>   
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=700">하우스</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=1&subSearch=800">목줄</a></li> 
      </ul> 
      
      <ul class="mainMenu2">
        <li><a class="nav-link" href="./list?kind=pcate&search=2">CAT</a>
        </li>
      </ul>
      <ul class="subMenu2">  
        	<li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=100">사료</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=200">간식</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=300">장난감</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=400">건강관리</a></li>   
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=500">용품</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=600">미용/목욕</a></li>   
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=700">하우스</a></li>
            <li><a class="dropdown-item" href="./list?kind=pcate&search=2&subSearch=800">목줄</a></li> 
      </ul> 
      </div>
    </div>
     <div class="collapse navbar-collapse" id="allMenu2"></div>
  </div>
</nav>

<!--  카테고리 정렬 끝 -->

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
   
    <div class="float-end">
        <p>
		<button class="regdate">최신순 |</button>
		<button class="lowprice">낮은가격 |</button>
		<button class="highprice">높은가격</button>
		</p>
	</div>
     </div>

<div class="row row-cols-1 row-cols-md-3 g-4">
<c:forEach items="${list}" var="vo">
  <div class="col">
    <div class="card h-100 detail" data-num="${vo.productNum}">
      <img src="../resources/upload/product/${vo.productFileVOs[0].fileName}" class="card-img-top" alt="...">
      <div class="card-body">

       <h5 class="card-title">${vo.productName}</h5>
       <p class="card-text">${vo.productDetail}</p>
       <p class="card-text">${vo.writer}</p>
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
	


<a href="./add">상품 등록</a>
</div>


<script type="text/javascript" src="../resources/js/productList.js"></script>

</body>
</html>