<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/management.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="movie" name="thisPage"/>
</jsp:include>
</br>
	<h1 class="text-center text-black-50">회원목록입니다.</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>등록일</th>
				<th>구분</th>
				<th>보유포인트</th>
				<th>회원탈퇴</th>
				<th>권한부여</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${requestScope.list }">
				<tr>
					<td>${tmp.id }</td>
					<td>${tmp.email }</td>
					<td>${tmp.regdate }</td>
					<td>
						<c:if test="${tmp.adminNum eq 0}">
							회원
						</c:if>
						<c:if test="${tmp.adminNum eq 1}">
							관리자
						</c:if>
					</td>					
					<td>${tmp.point }</td>
					<td class="text-center">
					<c:if test="${tmp.id ne 'manager' }">
						<a class="text-decoration-none badge bg-dark text-white text-wrap" href="javascript:deleteConfirm('${tmp.id }')">탈퇴</a>
					</c:if>
					</td>
					<td class="text-center">
						<c:if test="${tmp.adminNum eq 0 }">
							<a class="text-decoration-none badge bg-dark text-white text-wrap" href="javascript:upgrade('${tmp.id }')">등업</a>
						</c:if>
						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div class="page-ui clearfix">
		<ul class="pagination justify-content-center">
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item">
					<a href="management.do?pageNum=${startPageNum-1 }&idWord=${encodedK }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li class="page-item">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a class="page-link active text-dark active" href="management.do?pageNum=${i }&idWord=${encodedK}">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="page-link active text-dark" href="management.do?pageNum=${i }&idWord=${encodedK}">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount}">
				<li class="page-item">
					<a href="management.do?pageNum=${endPageNum+1 }&idWord=${encodedK }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
		<div style="clear:both;"></div>

	<form action="management.do" method="get"> 
		<label for="idWord">아이디 검색</label>
		<input type="text" id="idWord" name="idWord" placeholder="검색어..." value="${idWord }"/>
		<button type="submit">검색</button>
	</form>	
	<c:if test="${not empty idWord}">
		<p>
			<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
		</p>
	</c:if>
</div>
</div>
<script>
	function deleteConfirm(id){
		const isDelete=confirm(id+"님을 탈퇴시키겠습니까?");
		if(isDelete){
			location.href="delete2.do?id="+id;
		}
	}
	
	function upgrade(id){
		const isUpgrade=confirm("관리자로 등업하시겠습니까?");
		if(isUpgrade){
			location.href="upgrade.do?id="+id;
		}
	}
</script>
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>