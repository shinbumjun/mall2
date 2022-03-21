<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/mypage</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm{
		display: none;
	}
</style>
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
         <li class="breadcrumb-item active">
			<a class="nav-link disabled" href="">내정보 관리</a>
		</li>
      </ul>
   </nav>
	<h1 class="text-center text-black-50">내정보보기 페이지입니다.</h1>
		<div class="row">
			<div class="col-5 shadow p-3 mb-5 bg-body rounde">
		<c:choose>
			<c:when test="${dto.id eq 'manager' }">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
					<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
				</svg>
				
			</c:when>
			<c:when test="${empty dto.profile }">
				<a id="profileLink" href="javascript:">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			</c:when>
			<c:otherwise>
				<a id="profileLink" href="javascript:">
				<img id="profileImage" 
					src="${pageContext.request.contextPath}${dto.profile}" />
			</c:otherwise>
		</c:choose>
	</a>
	<div class="border-bottom mb-3">
	<form action="${pageContext.request.contextPath}/users/mypageupdate.do" method="post">
		<input type="hidden" name="profile" 
			value="${ empty dto.profile ? 'empty' : dto.profile}"/>
		<div class="mb-3">
			<label for="id" class="form-label">아이디</label>
			<input type="text" id="id" value="${id }" disabled class="form-control"/>
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label>
			<input type="text" name="email" id="email" value="${dto.email }" class="form-control"/>
		</div>
		<div class="d-grid gap-2 mb-3" >
			<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off">수정</button>
		</div>
	</div>
		<p class="fw-bolder">비밀번호 수정하기</p>
		<div class="d-grid gap-2 mb-3">
		<a class="btn btn-success" data-bs-toggle="button" autocomplete="off"
		href="${pageContext.request.contextPath}/users/private/pwd_updateform.do">수정하기</a>
		</div>
	</form>
	
	<form action="${pageContext.request.contextPath}/users/private/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
		<input type="file" name="image" id="image" 
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
		</div>
		<div class="col-7 shadow p-3 mb-5 bg-body rounded">
			<p class="fs-1">광고문의</p>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
	
</script>
</body>
</html>