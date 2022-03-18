<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/upload_form.jsp</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>
	<div class="container">
	   	<h1>영화 업로드 폼</h1>
	   	<form action="${pageContext.request.contextPath}/movie/upload.do" method="post" enctype="multipart/form-data">
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
	      	<div>
	         	<label class="form-label" for="image">영화 이미지</label>
	         	<input type="file" name="image" id="image"
	            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
	      	</div>
	      	<button class="btn btn-primary" type="submit" onclick="submitContents(this);">업로드</button>
	   	</form>
	</div>

<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
</body>

</html>