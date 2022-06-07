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
<!--   <link href="../resources/css/notice_list.css" rel="styleSheet" />
  <link href="../resources/css/reviewList.css" rel="styleSheet" />
  <link href="../resources/css/qnaList.css" rel="styleSheet" /> -->
  <link href="../resources/css/productDetail.css" rel="styleSheet" />
  <!-- 재석추가 끝 -->

  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<c:import url="../temp/header_script.jsp"></c:import>

<title>${vo.productName }</title>
</head>
<body>

<!-- 히든 -->
<input class="pCount_hidden" type="hidden" name=productCount value="${vo.productCount}">
<input class="tPrice_hidden" type="hidden" name=totalPrice value="${vo.totalPrice}">
<!-- 히든 끝 -->

    <div class="line">
    </div>			
    <div class="content_top">
        <div class="ct_left_area">
            <div class="image_wrap">
                <!-- 이미지-->
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
               <div class="carousel-inner">
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
            </div> <!-- 이미지 끝-->
            </div>				
        </div>
        <div class="ct_right_area">
            <div class="title">
                <h1>
                    ${vo.productName}
                </h1>
            </div>
            <div class="line">
            </div>
            <div class="catergory" style="text-align:center;">
                 <span>
                    <c:choose>
                        <c:when test="${vo.pcategoryNum eq 1}">강아지</c:when>
                        <c:otherwise>고양이</c:otherwise>
                    </c:choose>
                 </span>
                 <span>|</span>
                 <span>
                    ${cvo.categoryName}
                 </span>
            </div>
            <div class="line">
            </div>	
            <div class="price">
                <!-- 할인-->
                <c:if test="${vo.rate ne '0'}">
                <div class="sale_price">정가 : <fmt:formatNumber value="${vo.productPrice}" pattern="#,### 원" /></div>
                <div class="discount_price">
                    판매가 : <span class="discount_price_number"><fmt:formatNumber value="${vo.totalPrice}" pattern="#,### 원" /></span> 
                    [<fmt:formatNumber value="${vo.rate}" pattern="###" />% 
                    <fmt:formatNumber value="${vo.productPrice*vo.rate*0.01}" pattern="#,### 원" /> 할인 중]</div>
                </c:if>
                <!-- 할인 x-->
                <c:if test="${vo.rate eq '0'}">
                    판매가 : <span class="discount_price_number"><fmt:formatNumber value="${vo.totalPrice}" pattern="#,### 원" /></span>
            	</c:if>
            </div>			
            <div class="line">
            </div>	
            <div class="button">						
                <div class="button_quantity">
                    주문수량
                    <span>
                        <button type="button" class="minus">-</button>
                        <input type="number" class="numBox" value="1" readonly="readonly" />
                        <button type="button" class="plus">+</button>
                    </span></div>
                    <div class="total">
                    총 상품금액:<input type="number" class="priceResult" value="${vo.totalPrice}" readonly="readonly" style="border:none" />
                	</div>
          
                <div class="button_set" style="margin-top:50px;">
                    <button class="addToCart" data-id="${user.id}" data-pNum="${vo.productNum}">장바구니 담기</button>
                    <button class="addBuy" data-id="${user.id}" data-pNum="${vo.productNum}">바로구매</button>
                </div>
            </div>
        </div>
    </div>	
    <div class="line">
    </div>		
	
        <div class="content">
            ${vo.productDetail}
        </div>

	
<%-- 	<!-- 재석추가 -->
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
	</div> --%>

<script type="text/javascript" src="../resources/js/productDetail.js"></script>
<script type="text/javascript" src="../resources/js/detailReview.js"></script>
<script type="text/javascript" src="../resources/js/detailQna.js"></script>
<script type="text/javascript" src="../resources/js/qnaPop.js"></script>
</body>
</html>
