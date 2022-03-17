<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/update.jsp</title>
</head>
<body>
	<script>
		alert("${id} 글을 수정 했습니다.");
		location.href="${pageContext.request.contextPath}/notice/detail.do?num=${param.num}";
	</script>
</body>
</html> 
