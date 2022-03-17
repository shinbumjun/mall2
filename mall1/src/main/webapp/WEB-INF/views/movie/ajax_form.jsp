<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/movie/ajax_form.jsp</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

</head>
<body>
	<div class="container">
		<h1>영화 업로드 폼 ajax</h1>
   		<form action="${pageContext.request.contextPath}/movie/insert.do" method="post" id="insertForm">
      		<input type="hidden" name="imagePath" id="imagePath"/>
      		<div>
	         	<label class="form-label" for="title">영화 제목</label>
	         	<input class="form-control" type="text" name="title" id="title"/>
	      	</div>
	      	<div>
	      	<label class="form-label" for="category">카테고리</label>
	      	<select class="form-control" name="category">
	      	<option value="" selected disabled hidden>===선택===</option>
			<option value="액션" />액션</option>
			<option value="코미디">코미디</option>
			<option value="멜로">멜로</option>
			<option value="공포/스릴러" />공포/스릴러</option>
			<option value="애니메이션">애니메이션</option>
			<option value="SF/판타지">SF/판타지</option>
			<option value="다큐멘터리">다큐멘터리</option>
			</select>
			</div>
	      	<div>
	         	<label class="form-label" for="price">영화 가격</label>
	         	<input class="form-control" type="text" name="price" id="price"/>
	      	</div>
	      	<div>
	         	<label class="form-label" for="releaseDate">개봉연도</label>
	         	<input class="form-control" type="text" name="releaseDate" id="releaseDate"/>
	      	</div>
	      	<div>
	         	<label class="form-label" for="content">설명</label>
	         	<textarea class="form-control"  name="content" id="content" rows="10"></textarea>
	      	</div>
   		</form>
   		<form action="${pageContext.request.contextPath}/movie/ajax_upload.do" method="post" id="ajaxForm" enctype="multipart/form-data">
      		<div>
         		<label for="image">이미지</label>
         		<input type="file" name="image" id="image" 
            		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
      		</div>
   		</form>
   		<button id="submitBtn" onclick="submitContents(this);">등록</button>
   		<div class="img-wrapper">
      		<img />
   		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		//이미지를 선택했을 때, 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			//id 가 ajaxForm 인 form 을 ajax 전송 시킨다.
			const form = document.querySelector("#ajaxForm");
			//util 함수를 이용해서 ajax 전송
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//data : {imagePath:"/upload/xxx.jpg"} 형식의 obj
				console.log(data);
				//이미지 경로에 context Path 추가하기
				const path = "${pageContext.request.contextPath}" + data.imagePath;
				//img 태그에 경로 추가
				document.querySelector(".img-wrapper img").setAttribute("src", path);
				//위의 form 의 input hidden 요소에 value 로 넣어서 db 에 저장
				document.querySelector("#imagePath").value = data.imagePath;
			});
		});
		
		document.querySelector("#submitBtn").addEventListener("click", function(){
			document.querySelector("#insertForm").submit();
		});
	</script>
</body>
</html>