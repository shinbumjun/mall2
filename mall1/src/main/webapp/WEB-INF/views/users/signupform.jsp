<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XXX 회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
	<div class="text-center mt-5 mb-4">	
	<h1>에이콘 영화 회원가입</h1>
	</div>
	<form action="${pageContext.request.contextPath}/users/signup.do" method="post">
	<%--부트스트랩 추가하기 --%>
		<div class="">
			<label for="id" class="form-label">아이디</label>
		</div>
		<div class="text-center mb-3">
			<input class="form-control" type="text" name="id" id="id"/>
		</div>
		<div class="">
			<label for="pwd" class="form-label">비밀번호</label>
		</div>
		<div class="text-center mb-3">
			<input class="form-control" type="password" name="pwd" id="pwd"/>
		</div>
		<div class="">
			<label for="pwd2" class="form-label">비밀번호 재확인</label>
		</div>
		<div class="text-center mb-3">
			<input class="form-control" type="password" name="pwd2" id="pwd2"/>
		</div>
		<div class="">
			<label for="email" class="form-label">이메일</label>
		</div>
		<div class="text-center mb-3">
			<input class="form-control" type="text" name="email" id="email"/>
		</div>
		<%-- 그 외 이름, 닉네임, 성별, 생년월일 추가? --%>
		<div class="d-grid gap-2">
			<button type="submit" class="btn btn-success">가입하기</button>
		</div>
	</form>
	<%-- 유효성 검사 추가 --%>
</div>
</body>
</html>