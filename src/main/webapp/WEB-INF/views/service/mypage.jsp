<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
  
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">Registration</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>Registration</li>
               </ul>
            </div>
         </div>
      </div>
   </div>

<div class="container">
	<h1>Mypage</h1>
	
	<!-- side bar -->
	<c:import url="../service/sellerSidebar.jsp"></c:import>

	
	<div class="row col-md-auto" >
	
		<div class="card">
		
			    	
				<ul class="list-group list-group-flush">
				   	<li class="list-group-item">
				   		<h5>대표이미지</h5>
				   		<img alt="" src="../resources/upload/service/${vo.serviceFileVO.fileName}">
				   	</li>
				</ul>
		
			<ul class="list-group list-group-flush">
			
			
				<li class="list-group-item">
				<c:choose>
					<c:when test="${vo.serKind==1}">
					병원명:
					</c:when>
					<c:when test="${vo.serKind==2}">
					미용샵 이름:
					</c:when>
				</c:choose>
				${vo.serName}</li>
				
		   		<li class="list-group-item">${vo.serAddress} </li>
		   		
		   		<c:choose>
					<c:when test="${vo.serKind==1}">
						<li class="list-group-item">${vo.hospitalField} </li>
					</c:when>
				</c:choose>
		   		
		   		<li class="list-group-item">${vo.serTel} </li>
			   	<li class="list-group-item">${vo.homepage}</li>
			   	
			   	<div class="container my-4">
					<div class="col-2 d-flex">
						<a href="update" role="button" class="btn btn-success mx-1">Update</a>
						<a href="delete?serNum=${vo.serNum}" role="button" class="btn btn-danger mx-1" id="delete">delete</a>
					</div>
				</div>
			</ul>
		  
		

    	 
		</div>
	
	</div>
	
</div>
</div>
	
	
	
	



<!-- <img alt="" src="../resources/upload/service/$"> -->
<!-- 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 -->
 <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <c:import url="../temp/header_script.jsp"></c:import>
   <c:import url="../temp/footer.jsp"></c:import>
 <script type="text/javascript" src="../js/mypage.js"></script>
</body>
</html>