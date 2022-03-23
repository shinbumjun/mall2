<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/purchasehistory.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="movie" name="thisPage"/>
</jsp:include>
</br>
	<h1 class="text-center text-black-50">구매내역입니다.</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제목</th>
				<th>가격</th>
				<th>리뷰점수</th>
				<th>개봉일</th>
				<th class="text-center">구매내역 삭제</th>
				<th class="text-center">환불요청</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${requestScope.list }">
				<tr>
					<td>${tmp.title }</td>
					<td>${tmp.price }</td>
					<td class="text-end">${tmp.score }</td>
					<td>${tmp.releaseDate }</td>
					<td class="text-center"><a class="text-decoration-none badge bg-dark text-white text-wrap" href="javascript:deleteConfirm('${tmp.num }')">삭제</a></td>
					<td class="text-center"><a class="text-decoration-none badge bg-dark text-white text-wrap" href="javascript:refund(${tmp.num })">환불요청</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div class="page-ui clearfix">
		<ul class="pagination justify-content-center">
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item">
					<a href="purchasehistory.do?pageNum=${startPageNum-1 }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li class="page-item ">
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a class="page-link active text-dark" href="purchasehistory.do?pageNum=${i }">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="page-link text-dark" href="purchasehistory.do?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount}">
				<li class="page-item">
					<a href="purchasehistory.do?pageNum=${endPageNum+1 }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
		<div style="clear:both;"></div>
		
<script>
	function deleteConfirm(num){
		const isDelete=confirm("삭제하시면 환불받을수 없습니다! \n 그래도 진행하시겠습니까?");
		if(isDelete){
			location.href="delete_list.do?num="+num;
		}
	}
	
	function refund(num) {
		const isRefund=confirm("환불요청 하시겠습니까?");
		if(isRefund){
			alert("환불요청 되었습니다.");
			location.href="check.do?num="+num;
		}
	}
</script>
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>