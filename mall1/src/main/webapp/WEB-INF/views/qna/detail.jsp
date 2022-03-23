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
<br/>
<h3>문의 내용</h3>
<br/>
	<c:if test="${ not empty keyword }">
		<p>	
			<strong>${condition }</strong> 조건, 
			<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기 
		</p>
	</c:if>
	<table class="table table-striped table-border">
		<tr>
			<th class="table-light">글 번호</th>
			<td class="table-light">${dto.num }</td>
			
			<th>작성자</th>
			<td>${dto.writer }</td>
			
			<th class="table-light">조회수</th>
			<td class="table-light">${dto.viewCount }</td>
			
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="6">${dto.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="6">
				<div class="content" style="min-height: 200px; ">${dto.content }</div>
			</td>
		</tr>


</table>

	<div style="float:right">
	<ul>
	<a href="list.do"><input class="btn btn-secondary" type="button" value="목록"></a>
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
	
	<br/>

	<nav>
      <ul class="pagination justify-content-center">
         <c:choose>
         	<c:when test="${dto.prevNum ne 0 }">
         		<li class="page-item mr-3">
               		<a class="page-link" href="${pageContext.request.contextPath}/qna/detail.do?num=${dto.prevNum}">&larr; Prev</a>
            	</li>
         	</c:when>
         	<c:otherwise>
         		<li class="page-item disabled mr-3">
               		<a class="page-link" href="javascript:">Prev</a>
            	</li>
         	</c:otherwise>
         </c:choose>
         <c:choose>
         	<c:when test="${dto.nextNum ne 0 }">
         		<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/qna/detail.do?num=${dto.nextNum}">Next &rarr;</a>
            	</li>
         	</c:when>
         	<c:otherwise>
         		<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Next</a>
            	</li>
         	</c:otherwise>
         </c:choose>         
      </ul>
   </nav> 
</div>
</body>
</html>