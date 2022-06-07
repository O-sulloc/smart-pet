<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/userUpdate.css" rel="styleSheet" />
<c:import url="../temp/header_script.jsp"></c:import>
</head>
<body>
	<div class="container">

		<div class="row">

			<h1>유저 업데이트 페이지</h1>

			<div class="divTable minimalistBlack">
				<div class="divTableHeading">
					<div class="divTableRow">
						<div class="divTableHead">UserID</div>
						<div class="divTableHead">UserName</div>
						<div class="divTableHead">UserPhone</div>
						<div class="divTableHead">UserEmail</div>
						<div class="divTableHead">UserAddress</div>
						<div class="divTableHead">JoinDate</div>
						<div class="divTableHead">UpdateRole</div>
						<div class="divTableHead">UserPoint</div>
						<div class="divTableHead">Update</div>
					</div>
				</div>
				<div class="divTableBody">
					<!-- 여기서 반복 -->
					<c:forEach items="${list}" var="user">
						<form class="divTableRow frm" action="userUpdate" method="post">
							<input type="hidden" value="${user.id}" name="id">
							<div class="divTableCell">${user.id}</div>
							<div class="divTableCell">${user.name}</div>
							<div class="divTableCell">${user.phone}</div>
							<div class="divTableCell">${user.email}</div>
							<div class="divTableCell">${user.address}</div>
							<div class="divTableCell">${user.joinDate}</div>
							<div class="divTableCell">
								<select name="role" id="role${user.id}">
									<c:choose>
										<c:when test="${user.role == 1}">
											<option value="2">ROLE_USER</option>
											<option value="1" selected>ROLE_PRODUCT_SELLER</option>
											<option value="3">ROLE_RESERVE_SELLER</option>
										</c:when>
										<c:when test="${user.role == 2}">
											<option value="2" selected>ROLE_USER</option>
											<option value="1">ROLE_PRODUCT_SELLER</option>
											<option value="3">ROLE_RESERVE_SELLER</option>
										</c:when>
										<c:otherwise>
											<option value="2">ROLE_USER</option>
											<option value="1">ROLE_PRODUCT_SELLER</option>
											<option value="3" selected>ROLE_RESERVE_SELLER</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
							<div class="divTableCell">${user.point}</div>
							<div class="divTableCell">
								<button class="btn btn-outline-dark flex-shrink-0" type="button" data-num="${user.id}">
									업데이트
								</button>
							</div>
						</form>
					</c:forEach>
					<!-- 반복끝 -->
				</div>
			</div>

		</div>
	</div>

</body>

<script type="text/javascript">

$(".frm").on("click", ".btn", function(){
	let id = $(this).attr("data-num");
	console.log(id);
	
	let role = $("#role"+id).val();
	console.log(role);
	
	$.ajax({
		
		type:"POST",
		url:"./userUpdate",
		data:{
			id:id,
			role:role
		},
		success:function(data){
 			if(data.trim() == 1){
 				alert("업데이트 성공!!");
			}else{
				alert("업데이트 실패!!");
			} 
		},
		error:function(){
			alret("서버 오류");
		}
		
	})
})
</script>


</html>