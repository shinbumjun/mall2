<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xxx 회원가입 완료</title>
</head>
<body>
<div class="container">
	<h1>회원 가입 완료</h1>
	<p>환영합니다!<strong>${param.id }</strong>님 회원가입이 완료되었습니다. 이제부터 로그인이 가능합니다.</p>
	<a href="${pageContext.request.contextPath}/users/loginform.do">로그인 하러가기</a>
</div>
</body>
</html>