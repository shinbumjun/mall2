<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/users_product.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<div class="container">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="movie" name="thisPage"/>
</jsp:include>
</br>
	<h1 class="text-center text-black-50">환불 요청 관리</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>아이디</th>
					<th>가격</th>
					<th>요청날짜</th>
					<th>환불</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.title }</td>
						<td>${tmp.id }</td>
						<td>${tmp.price }</td>
						<td>${tmp.regdate }</td>
						<td><a class="text-decoration-none badge bg-dark text-white text-wrap" href="javascript:refund(${tmp.num })">환불해주기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="page-ui clearfix">
		<ul class="pagination justify-content-center">
			<c:if test="${startPageNum ne 1 }">
				<li>
					<a href="users_product.do?pageNum=${startPageNum-1 }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li class="page-item ">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a class="page-link active text-dark active" href="users_product.do?pageNum=${i }">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="page-link active text-dark" href="users_product.do?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount}">
				<li>
					<a href="users_product.do?pageNum=${endPageNum+1 }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
		<div style="clear:both;"></div>
</div>
<script>
	function refund(num){
		const isRefund=confirm("환불을 진행하시겠습니까?");
		if(isRefund){
			alert("환불이 완료되었습니다");
			location.href="refund2.do?num="+num;
		}
	}
</script>
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>