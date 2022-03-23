<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qna/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
<h3>문의 내용</h3>
	<c:if test="${dto.prevNum ne 0 }">
		<a href="/qna/detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">
		<span class="badge bg-info text-dark">이전글</span>
		</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="/qna/detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">
		<span class="badge bg-info text-dark">다음글</span>
		</a>
	</c:if>
	<c:if test="${ not empty keyword }">
		<p>	
			<strong>${condition }</strong> 조건, 
			<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기 
		</p>
	</c:if>
	<table class="table table-bordered" style='width:800px;table-layout;auto'>
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
<ul class="pagination justify-content-center">
	<a href="list.do"><input class="btn btn-secondary" type="button" value="목록으로"></a>
	<c:if test="${adminNum eq 1 }">
		<a href="/qna/delete.do?num=${dto.num }"><input class="btn btn-secondary" type="button" value="삭제"></a>
		<a href="/qna/reply.do?num=${dto.num }"><input class="btn btn-secondary" type="button" value="답글 달기"></a>
		</c:if>	
	<c:if test="${adminNum ne 1 }">
			<a href="/qna/insertform.do?num=${dto.num }"><input class="btn btn-secondary" type="button" value="글쓰기"></a>
			<a href="/qna/updateform.do?num=${dto.num }"><input class="btn btn-secondary" type="button" value="수정"></a>
			<a href="/qna/delete.do?num=${dto.num }"><input class="btn btn-secondary" type="button" value="삭제"></a>
	</c:if> 
</ul>
</div>
</body>
</html>