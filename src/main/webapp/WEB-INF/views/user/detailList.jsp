<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List Detail</title>

<style>

 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:100px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title"> Order List Detail</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="./myPage">My Page</a></li>
                  <li> Order List Detail</li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <!-- Start Of SideBar -->
   	<div class="service-details">
		<div class="container">
				<div class="row">
					<c:import url="../temp/sidebar.jsp"></c:import>
<div class="col-lg-8 col-md-12 col-12" >	
<div class="container-fluid" style="border-top: 4px solid #006838;">
<button class="btn btn-success col-12">구매한 상품</button>
		<div class="row" >
					<section id="content" >

						<ul class="orderView">
							<c:forEach items="${plist}" var="pvo">
								<li style="margin-top: 20px">
									<div class="thumb">
										<img src="../resources/upload/product/${pvo.productFileVOs[0].fileName}" />
									</div>
									<div class="gdsInfo">
										<p>
											<span>상품명</span>${pvo.productVO.productName}</p>
										<p>
										 	<span>개당 가격</span>${pvo.productVO.totalPrice}원</p> 
										<p>
											<span>구입 수량</span>${pvo.productAmount}개</p>
										<p>
											<span>최종 가격</span>${pvo.productVO.totalPrice * pvo.productAmount}원</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</section>
			</div>
		</div>
	</div>
</div>
		</div></div>
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>

</body>
</html>