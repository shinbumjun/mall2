<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#title{
      width:auto;
      height:150px;
	}
</style>
<meta charset="UTF-8">
<title>XXX 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<%-- 부트스트랩 추가해서 가운데 정렬시키기 필요--%>
	<div class="container">
		<%--사이트 이름 넣기 --%>
		<div class="text-center mt-5 mb-4">
		<a href="${pageContext.request.contextPath}/">
		<img src="${pageContext.request.contextPath}/include/images/title.png" alt="" id="title"/>
		</a>
		</div>
		<form action="${pageContext.request.contextPath }/users/login.do" method="post">
			<c:choose>
				<c:when test="${ empty param.url }">
					<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="url" value="${param.url }"/>
				</c:otherwise>
			</c:choose>
			<%-- 부트스트랩 추가해서 x표시 지우기, 유효성 검사 추가하기--%>
			<div class="text-center my-3">
				<input class="form-control" type="text" name="id" placeholder="아이디"/>
			</div>
			<div class="text-center my-3">
				<input class="form-control" type="password" name="pwd" placeholder="비밀번호"/>
			</div>
			<c:if test="${ not empty param.nid }">
			<p class="text-danger"> 아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.</p>
			</c:if>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-dark">로그인</button>
			</div>
		</form>
		<%--아이디 저장하기 넣을지  --%>
	</div>
	<%-- footer? 넣을지 --%>
<!-- footer -->
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>