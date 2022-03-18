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
</head>
<body>
<div class="container">
	<h1>회원 정보입니다.</h1>
	<table>
		<tr>
			<th>프로필</th>
			<td>
			<c:choose>
				<c:when test="${empty dto.profile }">
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  	<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  	<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				</c:when>
				<c:otherwise>
					<img id="profileImage" 
						src="${pageContext.request.contextPath}${dto.profile}"/>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</table>
	<div>
		<ul>
			<c:if test="${dto.adminNum eq 0 }">
				<li><a href="${pageContext.request.contextPath}/users/private/mypage.do">내 정보 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/purchasehistory.do">구매내역</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/mywirte.do">내가 쓴 글 확인</a></li>
				<li><a href="javascript:deleteConfirm()">회원탈퇴</a></li>
			</c:if>
			<c:if test="${dto.adminNum eq 1 }">
				<li><a href="${pageContext.request.contextPath}/users/private/mypage.do">내 정보 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/management.do">유저관리</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/users_product">상품구매관리</a></li>
				<li><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
			</c:if>
		</ul>
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