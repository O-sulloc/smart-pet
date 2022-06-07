<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>MediGrids</title>
	<meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->

    <c:import url="../temp/header_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div class="breadcrumbs overlay">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 offset-lg-2 col-md-12 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Verify</h1>
					</div>
					<ul class="breadcrumb-nav">
						<li><a href="/">Home</a></li>
						<li>Verify</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<section class="login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
					<div class="form-head">
					<h4 class="title">Enter Your Password</h4>
						<form action="loginCheck" method="post" id="frm">
							<div class="form-group">
								<input type="text" name="id" value="${vo.id}" hidden="">
							</div>
							<div class="form-group">
								<input type="password" id="pw" name="pw" class="form-control" placeholder="Password">
								<div id="pwResult"></div>
							</div>
							<div class="button">
								<button type="button" class="btn" id="btn">access</button>
							</div>
						</form>
					</div>
				</div>
			</div>	
		</div>
	</section>
	
	<script type="text/javascript">
	const btn = document.getElementById("btn");
	const frm = document.getElementById("frm");
	const pw = document.getElementById("pw");
	const pwResult = document.getElementById("pwResult");
	let pwCheck = false;
	
	pw.addEventListener("blur", function(){
	       let result = pw.value;
	       if(result ==''){
	           pwResult.innerHTML='Please Enter Your Password';
	           pwCheck=false;
	       }else{
	           pwResult.innerHTML='';
	           pwCheck=true;
	       }
	});
	
	btn.addEventListener("click", function(){
		if(pwCheck){
			frm.submit();
		}else{
	        alert("Please Enter Your Password");
		}
	});
	</script>
	<c:import url="../temp/header_script.jsp"></c:import>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>