<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<script>
	if("${id}"){
		location.href ="${requestScope.url }";
	} else{
		location.href ="loginform.do?url=${requestScope.encodedUrl }&nid=1";
	}
</script>
</body>
</html>