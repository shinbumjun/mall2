<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/detail.jsp</title>
<%-- bootstrap --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >

</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="movie" name="thisPage"/>
</jsp:include>
</br>
<div class="container">
   <div class="row">
   		<img class="col-sm-5" src="${pageContext.request.contextPath}${dto.imagePath}"/>
 		<div class="col-sm-7">
 		<table class="table">
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>장르</th>
			<td>${dto.category }</td>
		</tr>
		<tr>
			<th>평점</th>
			<c:choose>
			<c:when test="${dto.score eq 0.0 }">
			<td>없음</td>
			</c:when>
			<c:otherwise>
			<td>★${dto.score }</td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>개봉연도</th>
			<td>${dto.releaseDate }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.price } ⓟ</td>
		</tr>
		<c:if test="${userdto.adminNum eq '1' }">
		<tr>
			<th>구매수</th>
			<td>${dto.buyNum }</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2">
				<div class="content">${dto.content }</div>
			</td>
		</tr>
	</table>
   	<ul>

   		<a href="${pageContext.request.contextPath}/review/detail.do?num=${dto.num }"><input class="btn btn-secondary" type="button"  value="이 영화 리뷰 보기"></a>
   		<c:if test="${userdto.adminNum eq '0' }">
   			<a href="buy.do?num=${dto.num }"><input class="btn btn-secondary" type="button" value="구매"></a>
   		</c:if>
   		<c:if test="${userdto.adminNum eq '1' }">
			<a href="updateform.do?num=${dto.num }"><input class="btn btn-secondary" type="button"  value="수정"></a>
			<a href="delete.do?num=${dto.num}" onclick="return confirm('삭제하시겠습니까?');"><input class="btn btn-secondary" type="button" value="삭제"></a>
		</c:if>
		<a href="list.do"><input class="btn btn-secondary" type="button" value="목록"></a>
   	</ul>
      
   </div>
   
   <nav>
      <ul class="pagination justify-content-center">
         <c:choose>
         	<c:when test="${dto.prevNum ne 0 }">
         		<li class="page-item mr-3">
               		<a class="page-link" href="${pageContext.request.contextPath}/movie/detail.do?num=${dto.prevNum}">&larr; Prev</a>
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
               		<a class="page-link" href="${pageContext.request.contextPath}/movie/detail.do?num=${dto.nextNum}">Next &rarr;</a>
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

