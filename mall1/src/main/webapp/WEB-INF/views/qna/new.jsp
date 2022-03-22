<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qna/new.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<div class="container">
	<h1>문의사항 작성</h1>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="w-px160">제목</th>
				<td><input type="text" name="title" class="need" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${login_info.id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="need"></textarea></td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td class="left">
					<label>
						<input type="file" name="file" id="attach-file" />
						<img src="img/select.png" class="file-img" />
					</label>
					<span id="file-name"></span>
					<span id="delete-file" style="color: red; margin-lefT: 20px;"><i class="fas fa-times font-img" ></i></span>
	 			</td>
			</tr>
		</table>
	</form>
	<div class="btnSet">
		<button type="submit" class="btn btn-primary" onclick="if(necessary()) $('form').submit()">저장</button>
		<button type="reset" class="btn btn-secondary" onclick="${pageContext.request.contextPath }/qna/list.do">취소</button>
	</div>
</div>
	<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
	<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>