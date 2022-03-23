<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qna/insert.jsp</title>

</head>
<body>
	<script>
		alert("문의사항이 등록되었습니다.");
		location.href="${pageContext.request.contextPath}/qna/list.do";
	</script>
</body>
</html>