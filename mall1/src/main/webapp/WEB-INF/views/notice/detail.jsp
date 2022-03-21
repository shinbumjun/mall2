<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/detail.jsp</title>

</head>
<body>
<div class="container">
<h3>공지사항 상세페이지</h3>
	<c:if test="${dto.prevNum ne 0 }">
		<a href="/notice/detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="/notice/detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a>
	</c:if>
	<c:if test="${ not empty keyword }">
		<p>	
			<strong>${condition }</strong> 조건, 
			<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기 
		</p>
	</c:if>
	<table>
		<tr>
			<th>번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="2">
				<div class="content">${dto.content }</div>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
		
	</table>
	<ul>
		<li><a href="list.do">목록보기</a></li>
		<c:if test="${adminNum eq 1 }">
			<li><a href="/notice/updateform.do?num=${dto.num }">수정</a></li>
			<li><a href="/notice/delete.do?num=${dto.num }">삭제</a></li>
			<li><a href="${pageContext.request.contextPath }/">Home</a></li>
		</c:if> 
	</ul>

</div>
</body>
</html>
	