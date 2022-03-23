<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qna/update.jsp</title>
</head>
<body>
	<script>
		alert("글이 수정되었습니다.");
		location.href="${pageContext.request.contextPath}/qna/detail.do?num=${param.num}";
	</script>
</body>
</html> 
