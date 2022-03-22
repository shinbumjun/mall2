<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/check.jsp</title>
</head>
<body>

<script>
	if(${vi } == 0){
		alert("요청되었습니다.");
		location.href="refund.do?num="+${num };
	}else{
		alert("이미 요청되었습니다.");
		location.href="purchasehistory.do";
	}

</script>
</body>
</html>