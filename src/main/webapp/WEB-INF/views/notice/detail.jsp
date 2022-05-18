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
					<td><strong>${vo.noticeCateVO.cateName}</strong> <span>${vo.title}</span></td>
					<td>${vo.regDate}</td>
				</tr>
				<tr>
					<td>
						<div>${vo.contents}</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		
		<ul>
			<c:choose>
				<c:when test="${vo.nextTitle eq null}">
					<li>
						<button type="button" class="btn btn-warning mr-3 mb-3" disabled>다음글이 없습니다</button>
					</li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${not empty checkGrade}">
							<li>
								<button type="button" class="btn btn-warning mr-3 mb-3" onclick="location.href='./detail?num=${vo.nextNum}&grade=${vo.grade}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button>
								<a href="./detail?num=${vo.nextNum}&grade=${vo.grade}" style="color: black">${vo.nextTitle}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<button type="button" class="btn btn-warning mr-3 mb-3" onclick="location.href='./detail?num=${vo.nextNum}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button>
								<a href="./detail?num=${vo.nextNum}" style="color: black">${vo.nextTitle}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${vo.prevTitle eq null}">
					<li>
						<button type="button"  class="btn btn-info mr-3" disabled>이전글이 없습니다</button>
					</li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${not empty checkGrade}">
							<li>
								<button type="button" class="btn btn-info mr-3" onclick="location.href='./detail?num=${vo.prevNum}&grade=${vo.grade}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
								<a href="./detail?num=${vo.prevNum}&grade=${vo.grade}" style="color: black">${vo.prevTitle}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<button type="button" class="btn btn-info mr-3" onclick="location.href='./detail?num=${vo.prevNum}'"> 
								<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>이전글</button>
								<a href="./detail?num=${vo.prevNum}" style="color: black">${vo.prevTitle}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</ul>
		
		
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