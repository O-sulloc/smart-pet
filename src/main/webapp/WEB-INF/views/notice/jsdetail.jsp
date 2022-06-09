<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>

<title>Insert title here</title>
<style type="text/css">
.set-bg {
	background-repeat: no-repeat;
	/* background-size: cover; */
	/*상품리스트 이미지 들어오게 수정*/
	background-size: contain;
	background-position: top center;
}
.bg {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
	background-image: url("/resources/image/flower2.jpg")
}
.menu{
	position: relative;
	color: #5f6368;
	border: solid 1px #dadce0;
	border-radius: 1vw;
	display: inline-block;
	padding: 6px 8px 6px 8px; 
	/*padding: top right bottom left*/
	cursor: pointer;
}

.clicked_menu{
	color: ;border-color: #4285f4;
	color: #4285f4;
	background: #e9f1fe;
}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<div class="bg">
		<section class="breadcrumb-section set-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="breadcrumb__text">
							<br>
							<h1>고객센터</h1>
							<span>무엇을 도와드릴까요?</span>
							<br><br>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

<div class="container mt-4">

	<br>
	
	<div class="row row-cols-2 row-cols-md-4 mb-4 text-center link">
		<div class="notice menu clicked_menu" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">공지사항</h4>
		</div>
		<div class="faq menu" role="alert">
	  		<h4 class="text-center" style="text-transform: uppercase;">FAQ</h4>
		</div>
	</div>
	
	<br>
	
		<table style="border-top: 1px solid #444444;">
			<colgroup>
				<col style="width: 80%;">
				<col style="width: 20%;">
			</colgroup>
	
			<tbody>
				<tr style="border-bottom: 1px dashed #444444;">
					<td style="padding-left:20px; width: 1050px; height: 100px;"><strong>${vo.noticeCateVO.cateName}</strong> <span>&nbsp;&nbsp;${vo.title}</span></td>
					<td style="text-align: right; padding-right: 30px">${vo.regDate}</td>
				</tr>
				<tr>
					<td colspan="10" style="padding-top: 30px">
						<div style="white-space:pre;">${vo.contents}</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<hr>
		<ul style="list-style:none; padding: 0px;">
			<c:choose>
				<c:when test="${vo.nextTitle eq null}">
					<li style="border-bottom: 1px solid #efefef; padding-bottom: 15px">
						<button type="button" class="btn btn-outline-warning" disabled>다음글이 없습니다</button>
					</li>

				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${not empty checkGrade}">
							<li style="border-bottom: 1px solid #efefef; padding-bottom: 15px">
								<button type="button" class="btn btn-outline-warning" onclick="location.href='./detail?num=${vo.nextNum}&grade=${vo.grade}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button>
								<a href="./detail?num=${vo.nextNum}&grade=${vo.grade}" style="color: black">${vo.nextTitle}</a>
							</li>

						</c:when>
						<c:otherwise>
							<li style="border-bottom: 1px solid #efefef; padding-bottom: 15px">
								<button type="button" class="btn btn-outline-warning" onclick="location.href='./detail?num=${vo.nextNum}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button>
								<a href="./detail?num=${vo.nextNum}" style="color: black">${vo.nextTitle}</a>
							</li>

						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${vo.prevTitle eq null}">
					<li style="padding-top: 15px">
						<button type="button"  class="btn btn-info mr-3" disabled>이전글이 없습니다</button>
					</li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${not empty checkGrade}">
							<li style="padding-top: 15px">
								<button type="button" class="btn btn-outline-info mr-3" onclick="location.href='./detail?num=${vo.prevNum}&grade=${vo.grade}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
								<a href="./detail?num=${vo.prevNum}&grade=${vo.grade}" style="color: black">${vo.prevTitle}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li style="padding-top: 15px">
								<button type="button" class="btn btn-outline-info mr-3" onclick="location.href='./detail?num=${vo.prevNum}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
								<a href="./detail?num=${vo.prevNum}" style="color: black">${vo.prevTitle}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</ul>
		<hr>
		
		<div style="text-align: center;">
			<a href="./list" role="button" class="btn btn-primary mx-1">목록보기</a>
			<c:if test="${user.role eq 0}">
				<a href="./update?num=${vo.num}" role="button" class="btn btn-success mx-1">수정하기</a>	
				<a href="./delete?num=${vo.num}" role="button" class="btn btn-danger mx-1">삭제하기</a>
			</c:if>
		</div>
		
	</div>



	
<c:import url="../temp/header_script.jsp"></c:import>
<script type="text/javascript" src="../resources/js/notice_list.js"></script>
</body>
</html>