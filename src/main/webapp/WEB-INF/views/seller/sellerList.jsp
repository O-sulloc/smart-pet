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
<c:import url="../temp/header_css.jsp"></c:import>
<title>판매자 상품목록 페이지 </title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">Seller Product List</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="./sellerList">Seller Page</a></li>
                  <li>Seller Product List</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <!-- Start Of SideBar -->
   	<div class="service-details">
		<div class="container">
				<div class="row">
					
					<c:import url="../temp/sellerSidebar.jsp"></c:import>
					<!-- End Of SideBar -->
					

<div class="col-lg-9 col-md-12 col-12">
	<div class="row mt-4">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>상품 이름</th>
					<th>상품 가격</th>
					<th>할인율</th>
					<th>상품 재고</th>
					<th>판매량</th>
					<th>상품 등록일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.productNum}</td>
					<td><img style="width: 50px; height: 50px;" src="../resources/upload/product/${vo.productFileVOs[0].fileName}"></td>
					<td><a class="link-success text-decoration-none" href="./sellerDetail?productNum=${vo.productNum}">${vo.productName}</a></td>
					<td>${vo.totalPrice}</td>
					<td>${vo.rate}</td>
					<td>${vo.productCount}</td>
					<td>${vo.sales}</td>
					<td>${vo.regDate}</td>
				</tr>
			</c:forEach>	
			</tbody>	
		</table>
	
	
	</div>
	<div class="row">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center" style="display: flex">
				<li class="page-item"><a class="page-link"
					href="./sellerList?pn=${pager.pre?pager.startNum-1:1}&kind=${pager.kind}&search=${pager.search}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./sellerList?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="./sellerList?pn=${pager.next?pager.lastNum+1:pager.lastNum}&kind=${pager.kind}&search=${pager.search}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
</div></div></div>
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript" src="../resources/js/productList.js"></script>

</body>
</html>