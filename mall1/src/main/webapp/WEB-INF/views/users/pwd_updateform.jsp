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
	<nav class="nav justify-content-end" style="--bs-breadcrumb-divider: ''; background-color: #e3f2fd;">
      <ul class="breadcrumb">
         <li class="breadcrumb-item">
            <a class="nav-link active" href="${pageContext.request.contextPath }/">Home</a>
         </li>
         <li class="breadcrumb-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/users/private/info.do">마이페이지</a>
         </li>
         <li class="breadcrumb-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/users/private/mypage.do">내정보관리</a>
         </li>
         <li class="breadcrumb-item active">
			<a class="nav-link disabled" href="">비밀번호변경</a>
		</li>
      </ul>
   </nav>
	<h1>비밀번호 수정 폼</h1>
	<form action="${pageContext.request.contextPath}/users/private/pwd_update.do" method="post" id="myForm">
		<div>
			<label for="pwd">기존 비밀 번호</label>
			<input type="password" name="pwd" id="pwd"/>
		</div>
		<div>
			<label for="newPwd">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd"/>
		</div>
		<div>
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="password" id="newPwd2"/>
		</div>
		<button type="submit">수정하기</button>
		<button type="reset">리셋</button>
	</form>
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
</body>
</html>