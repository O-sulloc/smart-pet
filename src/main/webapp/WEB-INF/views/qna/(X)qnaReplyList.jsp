<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>hi</h1>
<c:forEach items="${list}" var="vo" varStatus="i">
	<tr class="bg">
		<%-- <td id="up${i.index}">${dto.contents}</td> --%>
		<td id="up${vo.replyNum}">${vo.contents}</td>
		<td>${vo.id}</td>
		<td>
		<c:if test="${id eq vo.id}">
			<button class="update" type="button" data-num="${vo.replyNum}">Update</button>
			<button class="del" type="button" data-num="${vo.replyNum}">Delete</button>
		</c:if>
		</td>
	</tr>
</c:forEach>
	 	