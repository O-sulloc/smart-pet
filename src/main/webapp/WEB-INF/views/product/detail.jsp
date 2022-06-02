<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 재석추가 -->
  <c:import url="../temp/header_css.jsp"></c:import>
  <link href="../resources/css/notice_list.css" rel="styleSheet" />
  <link href="../resources/css/reviewList.css" rel="styleSheet" />
  <link href="../resources/css/qnaList.css" rel="styleSheet" />
  <!-- 재석추가 끝 -->
<style type="text/css">

 div.products div.productsInfo { float:right; width:550px; font-size:22px; }
 div.products div.productsInfo p { margin:0 0 20px 0; }
 div.products div.productsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 div.productsInfo p.cartCount button { font-size:26px; border:none; background:none; }
 div.productsInfo p.cartCount input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }


 input { pointer-events: none; }
 
</style>

  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>

<title>Insert title here</title>
</head>
<body>

<!-- 히든 -->
<input class="pCount_hidden" type="hidden" name=productCount value="${vo.productCount}">
<input class="tPrice_hidden" type="hidden" name=totalPrice value="${vo.totalPrice}">

<!-- 히든 끝 -->

<div class="container">
<div id="carouselExampleControls" class="carousel slide" style="width: 50%;"
             data-bs-ride="carousel">
            <div class="carousel-inner " style="width: 50%;">
               <c:forEach items="${vo.productFileVOs}" var="i" varStatus="status">

                  <c:if test="${status.first}">
                     <div class="carousel-item active">
                        <img src="/resources/upload/product/${i.fileName}"
                           class="d-block w-100" alt="...">
                     </div>
                  </c:if>
                  <c:if test="${not status.first}">
                     <div class="carousel-item">
                        <img src="/resources/upload/product/${i.fileName}"
                           class="d-block w-100" alt="...">
                     </div>
                  </c:if>

               </c:forEach>

               <button class="carousel-control-prev" type="button"
                  data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
               </button>
               <button class="carousel-control-next" type="button"
                  data-bs-target="#carouselExampleControls" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
               </button>
            </div>      
         </div>

<div class="productsInfo float-end">
<p class="cName"><span>카테고리</span>
<c:choose>
<c:when test="${vo.pcategoryNum eq 1}">강아지>>${cvo.categoryName}</c:when>
<c:otherwise>고양이>>${cvo.categoryName}</c:otherwise>
</c:choose></p>

<p class="pName"><span>상품명</span>${vo.productName}</p>
<p class="pDetail"><span>상품 설명</span>${vo.productDetail}</p>
<p class="pCount"><span>상품 재고</span>${vo.productCount}개</p>

<!--  가격 할인  -->
<div>
<c:if test="${vo.rate ne '0'}">
<span class="product_selling_header_price_discount-deal">
<span
class="number">${vo.rate}</span><span class="percent">% 할인 중</span>
</span>

<span style="text-decoration:line-through">
<fmt:formatNumber type="currency" value="${vo.productPrice}"/>
<span class="won">원</span></span> → </c:if>
<span>
<fmt:formatNumber type="currency" value="${vo.totalPrice}" />
<span class="won">원</span></span>
<!--  가격 할인 끝 -->

<!-- 특가 뱃지  -->
<c:if test="${vo.rate ne '0'}">
<span class="product_selling_header_price_badge">
<svg class="icon" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
<rect width="30" height="20" fill="#F77" rx="4"></rect>
<path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path>
</svg>
</span>										
</c:if>
<!-- 특가 뱃지 끝 -->
</div>
<!--  구매 수량 -->
	<p class="cartCount">
   <span>구입 수량</span>
   <button type="button" class="minus">-</button>  
   <input type="number" class="numBox" value="1" readonly="readonly" />
   <button type="button" class="plus">+</button>
	</p>
   총 상품금액:<input type="number" class="priceResult" value="${vo.totalPrice}" readonly="readonly" style="border:none" />
	<p>
   	<button type="button" class="addToCart" data-id="${user.id}" data-pNum="${vo.productNum}">장바구니</button>
	
	<p>
   	<button type="button" class="addBuy" data-id="${user.id}" data-pNum="${vo.productNum}">바로결제</button>
	</p>
	
</div>
</div>

	
	<!-- 재석추가 -->
	<!-- 리뷰 지금 현재 상품번호 1번만 가지고 -->
	<!-- container 때문인지 옆으로 나옴 --><!-- common폴더 reviewList, reviewTest로 하는중 -->
	<!-- productNum 사용때문에 가지고옴! -->
	<input type="hidden" id="productNum" value="${vo.productNum}">
	<input type="hidden" id="starAvg" value="${vo.starAvg}">
	<input type="hidden" id="starCount" value="${starCount}">
	<c:if test="${not empty id}">
		<input type="hidden" id="id" value="${id}">
	</c:if>
	<div class="container">
		<!-- 리뷰 리스트 ajax -->
		<div class="row" id="list">
			
		</div>
	</div>
	
	<!-- QNA 지금 현재 상품번호 1번만 가지고 -->
	
	<div class="container">
		<!-- 리뷰 리스트 ajax -->
		<div class="row" id="qnaList">
			
		</div>
	</div>

<script type="text/javascript" src="../resources/js/productDetail.js"></script>
<script type="text/javascript" src="../resources/js/detailReview.js"></script>
<script type="text/javascript" src="../resources/js/detailQna.js"></script>
<script type="text/javascript" src="../resources/js/qnaPop.js"></script>
</body>
</html>
