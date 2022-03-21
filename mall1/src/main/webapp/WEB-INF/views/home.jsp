<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<%--
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="본인 페이지에 notice 혹은 info 혹은 movie 적용" name="thisPage"/>
</jsp:include>
 --%>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
<c:choose>
		<c:when test="${ empty sessionScope.id}">
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath}/users/signupform.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath}/users/private/info.do">${sessionScope.id }</a> 로그인중... 
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
				<c:if test="${dto.adminNum eq 0 }">
					<p>현재 포인트 : ${dto.point }</p>
					<form action="${pageContext.request.contextPath}/chargePoint.do" method="post" id="myForm">
					<input type="hidden" name="point" id="point"/>
					<button type="submit" id="chargeBtn">충전</button>
					</form>
				</c:if>
			</p>
		</c:otherwise>
	</c:choose>

	<h1>변경</h1>
	<br />
	<a href="${pageContext.request.contextPath}/movie/list.do">영화 목록</a>
	<br />
	<a href="">문의사항</a>
	<br />
	<a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
	<br />
	<a href="${pageContext.request.contextPath}/users/private/info.do">마이페이지</a>

</div>
<script>
	document.querySelector("#chargeBtn").addEventListener("click", function(e){
		let chargePoint = prompt("얼마를 충전하시겠습니까?","");
		document.querySelector("#point").value = chargePoint;
	});
</script>
</body>
</html> 





