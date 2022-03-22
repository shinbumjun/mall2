<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qna/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui a:hover{
		text-decoration: underline;
	}
	
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}
</style> 
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="notice" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>문의사항 게시판입니다</h1>
	<a href="${pageContext.request.contextPath }/">Home</a>
	<form method="post" action="list.do" id="list">
		<input type="hidden" name="curPage" value="1" />
	</form>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach items="${page.list }" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td class="left">
					<c:forEach var="i" begin="1" end="${vo.indent }">
						${i eq vo.indent ? "<img src='img/re.gif' />" : "&nbsp;&nbsp;" }
					</c:forEach>
					<a href="detail.do?id=${vo.id }" >${vo.title }</a>
				</td>
				<td>${vo.writer }</td>
				<td>${vo.writedate }</td>
				<td>
					<c:if test="${!empty vo.filename }">
						<a href="download.do?id=${vo.id }">
							<img title="${vo.filename }" class="file-img" src="img/attach.png" />
						</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
</table>
</div>
<div class="page-ui clearfix">
		<ul>
			<c:if test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li>
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a  class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:when>
						<c:otherwise>
							<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
				</li>
			</c:if>
		</ul>
</div>
	<div style="clear:both;"></div>
	<form action="list.do" method="get"> 
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form>	
	<c:if test="${ not empty condition }">
		<p>
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
	<ul>
		<c:if test="${adminNum eq 0 }">
			<li><a href="${pageContext.request.contextPath }/qna/new.do">글쓰기</a></li>
			<li><a href="${pageContext.request.contextPath }/qna/modify.do">수정</a></li>
			<li><a href="${pageContext.request.contextPath }/qna/delete.do">삭제</a></li>
		</c:if> 
		<c:if test="${adminNum eq 1 }">
			<li><a href="${pageContext.request.contextPath }/qna/reply.do">답변 달기</a></li>
		</c:if>	
	</ul>		
<!-- footer -->
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>