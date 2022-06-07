<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
<style type="text/css">
<style>
 .pImg { width:350px; height:auto; }
 
 div.products div.productsInfo { float:right; width:550px; font-size:22px; }
 div.products div.productsInfo p { margin:0 0 20px 0; }
 div.products div.productsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 div.products div.productsInfo p.cartCount button { font-size:26px; border:none; background:none; }
 div.products div.productsInfo p.cartCount input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }

</style>

  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>

<title>Insert title here</title>
</head>
<body>
<!--  -->
<input class="pCount_hidden" type="hidden" name=productCount value="${vo.productCount}">
<input class="oPrice_hidden" type="hidden" name=productPrice value="${vo.productPrice}">
<input class="tPrice_hidden" type="hidden" name=totalPrice value="${vo.totalPrice}">
<input class="rate_hidden" type="hidden" name=rate value="${vo.rate}">
<!--  -->
<div class="products">
<c:forEach items="${vo.productFileVOs}" var="fileVO">
		<img class="pImg" src="../resources/upload/product/${fileVO.fileName}">
		
</c:forEach>

<div class="productsInfo row float-end">

<p class="cName"><span>카테고리</span>${cvo.categoryName}</p>
<p class="pName"><span>상품명</span>${vo.productName}</p>
<p class="pDetail"><span>상품 설명</span>${vo.productDetail}</p>
<p class="pCount"><span>상품 재고</span>${vo.productCount}개</p>

<!--  가격 할인  -->
<c:if test="${vo.rate ne '0'}">
<span class="product_selling_header_price_discount-deal">
<span
class="number">${vo.rate}</span><span class="percent">%</span>
</span>
<span>
<fmt:formatNumber type="currency" value="${vo.productPrice}" />
<span class="won">원</span></span></c:if>
<span>
<fmt:formatNumber type="currency" value="${vo.totalPrice}" />
<span class="won">원</span></span>
<!--  가격 할인 끝 -->

<!-- 특가뱃지  -->
<c:if test="${vo.rate ne '0'}">
<span class="product_selling_header_price_badge">
<svg class="icon" width="30" height="20" viewBox="0 0 30 20" preserveAspectRatio="xMidYMid meet">
<rect width="30" height="20" fill="#F77" rx="4"></rect>
<path fill="#fff" d="M12.83 7.93v-.97H7.93v-.555h5.228v-.991H6.655v4.063h6.59v-.992H7.928V7.93h4.901zm-6.295 3.747v1.002h5.326v2.037h1.274v-3.04h-6.6zm7.733-.588v-1.024H5.5v1.024h8.768zM23.91 9.782V8.725h-1.405V5H21.24v9.705h1.264V9.782h1.405zm-3.954-3.79h-4.53v1.056h3.147c-.174 1.938-1.623 3.975-3.736 4.945l.773.958c2.974-1.612 4.259-4.03 4.346-6.96z"></path>
</svg>
</span>										
</c:if>
<!-- 특가뱃지 끝 -->

<!--  구매 수량 -->
	<p class="cartCount">
   <span>구입 수량</span>
   <button type="button" class="plus">+</button>
   <input type="number" class="numBox"  min="1" max="${vo.productCount}" value="1" readonly="readonly" />
   <button type="button" class="minus">-</button>  
	</p>
총 상품금액:<input type="number" class="priceResult" value="${vo.totalPrice}" readonly="readonly" style="border:none"/>


<a href="./update?productNum=${vo.productNum}">수정</a>
<a href="./delete?productNum=${vo.productNum}">삭제</a>
</div>
</div>

<script type="text/javascript" src="../resources/js/productDetail.js"></script>
</body>
</html>
