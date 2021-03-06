<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/pwd_update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
<div class="container">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="movie" name="thisPage"/>
</jsp:include>
</br>
	<h1>비밀번호 수정 폼</h1>
	<div class="row">
	<div class="col-5 shadow p-3 mb-5 bg-body rounde">
	<form action="${pageContext.request.contextPath}/users/private/pwd_update.do" method="post" id="myForm">
		<div class="mb-3">
			<label for="pwd" class="form-label">기존 비밀 번호</label>
			<input type="password" name="pwd" id="pwd" class="form-control"/>
		</div>
		<div class="mb-3">
			<label for="newPwd" class="form-label">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd" class="form-control"/>
		</div>
		<div class="mb-3">
			<label for="newPwd2" class="form-label">새 비밀번호 확인</label>
			<input type="password" id="newPwd2" class="form-control"/>
		</div>
		<div class="btn-group d-grid gap-2 mb-3" role="group" aria-label="Basic example"">
			<button type="submit" class="btn btn-dark">수정하기</button>
			<button type="reset" class="btn btn-dark">리셋</button>
		</div>
	</form>
	</div>
		<div class="col-7 shadow p-3 mb-5 bg-body rounded">
			<p class="fs-1">광고문의</p>
		</div>
	</div>
</div>
<script>
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!");
			e.preventDefault();//폼 전송 막기 
		}
	});
</script>
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>