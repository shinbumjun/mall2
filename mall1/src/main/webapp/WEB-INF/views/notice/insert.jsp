<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/notice/insert.jsp</title>

</head>
<body>
	<script>
		alert("새 공지사항이 추가 되었습니다.");
		location.href="${pageContext.request.contextPath}/notice/list.do";
	</script>
</body>
</html>