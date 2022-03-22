<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/info.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
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
         <li class="breadcrumb-item active">
			<a class="nav-link disabled" href="">마이페이지</a>
		</li>
      </ul>
   </nav>
	<h1 class="text-center text-black-50">회원 정보입니다.</h1>
	<div class="row">
	<div class="col-5 shadow p-3 mb-5 bg-body rounded">
		<table class="table-info">
			<tr>
				<td>
				
				<c:choose>
					<c:when test="${dto.id eq 'manager' }">
						<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
						  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
						</svg>
						<p>${dto.id } 님 반갑습니다.</p>
					</c:when>
					<c:when test="${empty dto.profile }">
						<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  	<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  	<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
						<p>${dto.id } 님 반갑습니다.</p>
					</c:when>

					<c:otherwise>
						<img id="profileImage" 
							src="${pageContext.request.contextPath}${dto.profile}"/>
							<p>${dto.id } 님 반갑습니다.</p>
					</c:otherwise>
					
				</c:choose>
				</td>
			</tr>
		</table>
		<div>
			<ul class="list-group list-group-flush">
				<c:if test="${dto.adminNum eq 0 }">
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/users/private/mypage.do">내 정보 관리</a></li>
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/users/private/purchasehistory.do">구매내역</a></li>
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/users/private/mywirte.do">내가 쓴 글 확인</a></li>
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="javascript:deleteConfirm()">회원탈퇴</a></li>
				</c:if>
				<c:if test="${dto.adminNum eq 1 }">
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/users/private/mypage.do">내 정보 관리</a></li>
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/users/private/management.do">유저관리</a></li>
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/users/private/users_product">상품구매관리</a></li>
					<li class="list-group-item"><a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/notice/list.do">공지사항관리</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<div class="col-7 shadow p-3 mb-5 bg-body rounded">
	<p class="fs-1">광고문의</p>
	</div>
	</div>
</div>
<script>
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
</script>
</body>
</html>