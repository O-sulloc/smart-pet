<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_css.jsp"></c:import>
<link href="../resources/css/serConfirm.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
   <div class="breadcrumbs overlay">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
               <div class="breadcrumbs-content">
                  <h1 class="page-title">Thank you</h1>
               </div>
               <ul class="breadcrumb-nav">
                  <li><a href="/">Home</a></li>
                  <li>Service</li>
                  <li>Information</li>
                  <li>confirmation of reservation</li>
               </ul>
            </div>
         </div>
      </div>
   </div>

<div class="container mt-4">
	
	
	
	<h2 class="wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
	<a href="../user/appointment">Please confirm your reservation</a>
</h2>
</div>



 <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <c:import url="../temp/header_script.jsp"></c:import>
   <c:import url="../temp/footer.jsp"></c:import>
</body>
</html>