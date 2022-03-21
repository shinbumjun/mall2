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
<title>xxx 회원가입 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<div class="text-center mt-5 mb-4">
		<a href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/include/images/title.png" alt="" id="title"/>
		</a>
	</div>
	<div class="text-center my-3">
		<h1>회원 가입 완료</h1>
	</div>
	<div class="text-center my-3">
		<p>환영합니다 ! <strong>${param.id }</strong>님 회원가입이 완료되었습니다. 이제부터 로그인이 가능합니다.</p>
		<a href="${pageContext.request.contextPath}/users/loginform.do">로그인 하러가기</a>
	</div>
</div>
</body>
</html>