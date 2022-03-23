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
<h3>공지사항 상세페이지</h3>
	<c:if test="${dto.prevNum ne 0 }">
		<a href="/qna/detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a>
	</c:if>
	<c:if test="${dto.nextNum ne 0 }">
		<a href="/qna/detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a>
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
		<th>첨부 파일</th>
		<td colspan="5" class="left">
			${vo.filename }
			<c:if test="${!empty vo.filename }">
				<a href="download.do?id=${vo.id }" style="margin-left: 15px"><i class="fas fa-download font-img"></i></a>
			</c:if>
		</td>
	</tr>
</table>
</div>
<div class="btnSet">
	<a class="btn-fill" href="list.do">목록으로</a>
	<c:if test="${adminNum eq 1 }">
		<a class="btn-fill" onclick="if(confirm('정말 삭제하시겠습니까?')) { href='delete.do?id=${vo.id }' }">삭제</a>
		<a class="btn-fill" href="reply.do?id=${vo.id }">답글 쓰기</a>
	</c:if>
	<c:if test="${adminNum ne 1 }">
			<li><a href="${pageContext.request.contextPath }/qna/insertform.do">글쓰기</a></li>
			<li><a href="${pageContext.request.contextPath }/qna/updateform.do">수정</a></li>
			<li><a href="${pageContext.request.contextPath }/qna/delete.do">삭제</a></li>
	</c:if> 
</div>
</body>
</html>