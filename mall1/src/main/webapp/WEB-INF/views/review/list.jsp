<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/list.jsp</title>
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
	<jsp:param value="review" name="thisPage"/>
</jsp:include>
<div class="container">
	<br/>	
	<div style="float:left">
	<h1>커뮤니티</h1>
	</div>
	<div style="float:right">
		<a href="private/insertform.do"><input class="btn btn-secondary" type="button" value="글 작성"></a>
	</div>
	<br/>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>
					<a href="detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}">${tmp.title }</a>
				</td>
				<td>${tmp.writer }</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div style="clear:both;"></div>
	<form class="row g-3 align-items-center" action="list.do" method="get"> 
	 	<div class="col-auto">
			<label class="col-form-label" for="condition">검색조건</label>
		</div>
		<div class="col-auto">
		<select class="form-select" name="condition" id="condition">
			<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		</div>
		<div class="col-auto">
			<input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
		</div>
		<div class="col-auto">
			<button class="btn btn-secondary" type="submit">검색</button>
		</div>

	</form>	
	<c:if test="${ not empty condition }">
		<p>
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
	</div>

	<br/>

	<nav>
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/notice/list.do?pageNum=${startPageNum - 1}">Prev</a>
            	</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Prev</a>
            	</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active">
                  		<a class="page-link" href="${pageContext.request.contextPath}/notice/list.do?pageNum=${i}">${i }</a>
               		</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
                  		<a class="page-link" href="${pageContext.request.contextPath}/notice/list.do?pageNum=${i}">${i}</a>
               		</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/notice/list.do?pageNum=${endPageNum + 1}">Next</a>
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