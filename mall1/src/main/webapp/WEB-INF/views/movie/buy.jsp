<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/buy.jsp</title>
</head>
<body>
<script>
	if(${point}>=${price}){
		alert("구매 되었습니다! \n 잔여포인트 : ${newpoint}");
		location.href="${pageContext.request.contextPath}/users/private/purchasehistory.do"
	}else{
		alert("구매에 실패하였습니다 . \n 포인트가 부족합니다.");
		location.href="${pageContext.request.contextPath}/movie/detail.do?num=${num}"
	}

</script>
</body>
</html>