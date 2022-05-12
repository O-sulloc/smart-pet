<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/header_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container">
	<div class="contents">
		<div class="sub_title_area customer">
			<h1>고객센터</h1>
			<span>무엇을 도와드릴까요?</span>
		</div>
		<ul>
			<li><a href="#">FAQ</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">1:1문의</a></li>
		</ul>
		<table>
			<colgroup>
				<col style="width: 80%;">
				<col style="width: 20%;">
			</colgroup>
	
			<tbody>
				<tr>
					<td><strong>${vo.faqCateVO.cateName}</strong> <span>${vo.title}</span></td>
					<td>${vo.regDate}</td>
				</tr>
				<tr>
					<td>
						<div>${vo.contents}</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		

		<div>
			<a href="./list" role="button" class="btn btn-primary mx-1">목록보기</a>
			<a href="./update?num=${vo.num}" role="button" class="btn btn-success mx-1">수정하기</a>	
			<a href="./delete?num=${vo.num}" role="button" class="btn btn-danger mx-1">삭제하기</a>
		</div>
		
	</div>
</div>


	
<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>