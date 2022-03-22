<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
     <style>
     /* 캐러셀(이미지슬라이드) 이미지 크기변경 */
      .carousel-inner{
        width:auto;
        height:500px; /* 이미지 높이 변경 */
      }
      .carousel-item{
        width: auto;
        height:100%;
      }
      .d-block {
        display:block;
        width: auto;
        height: 100%;
      }
      </style>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<%--
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="본인 페이지에 notice 혹은 info 혹은 movie 적용" name="thisPage"/>
</jsp:include>
 --%>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
	<c:choose>
		<c:when test="${ empty sessionScope.id}">
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath}/users/signupform.do">회원가입</a>
		</c:when>
		<c:otherwise>
		<div class="row">
			<div class="col-8">
				<a href="${pageContext.request.contextPath}/users/private/info.do">${sessionScope.id }</a> 로그인중... 
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
			</div>
			<div class="col-2">
				<c:if test="${dto.adminNum eq 0 }">
					<p>현재 포인트 : ${dto.point }<p>
				</c:if>
			</div>
			<div class="col-2 " >
				<c:if test="${dto.adminNum eq 0 }">
					<form action="${pageContext.request.contextPath}/chargePoint.do" method="post" id="myForm">
						<input type="hidden" name="point" id="point"/>
						<button type="submit" id="chargeBtn" class="btn btn-outline-primary btn-sm">충전</button>
					</form>
				</c:if>
			</div>
		</div>
		</c:otherwise>
	</c:choose>


	<h1>변경</h1>
	<br />
	<a href="${pageContext.request.contextPath}/movie/list.do">영화 목록</a>
	<br />
	<a href="${pageContext.request.contextPath}/qna/list.do">문의사항</a>
	<br />
	<a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
	<br />
	<a href="${pageContext.request.contextPath}/users/private/info.do">마이페이지</a>


	<!-- carousel -->
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/include/images/1_2.png" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>모든 영화를 빠르게</h5>
	        <p>세상의 모든 영화를 빠르게 구매할 수 있도록.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/include/images/6.png" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>스파이더맨 노 웨이 홈 3/28일 출시 예정!</h5>
	        <p>에이콘 무비에서 곧 출시됩니다!</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/include/images/3_5.jpg" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>디즈니 픽사의 인기작! 소울</h5>
	        <p>지금 바로 시청 가능합니다!</p>
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<!-- 콘텐트 -->
	<div class="row my-5">
		<div class="col-7">
			<h2>Acorn MOVIE는 앱 서비스를 지원합니다.</h2>
			<p>Acorn MOVIE는 고객의 편의성과 이동 중에도 영화 감상을 할 수 있도록 휴대폰과 태블릿의 앱 서비스를 지원합니다. IOS의 App Store와 Android의 Google Play에서 Acorn MOVIE를 검색하시고 실치를 받어 Acorn MOVIE를 이용하실 수 있습니다.</p>
		</div>
		<div class="col-5">
			<img src="${pageContext.request.contextPath}/include/images/a.jpg" alt="" class="w-100"/>
		</div>
	</div>
	
	<hr />
	
	<div class="row my-5">
		<div class="col-5">
			<img src="${pageContext.request.contextPath}/include/images/b.jpg" alt="" class="w-100" />
		</div>
		<div class="col-7">
			<h2>Acorn MOVIE는 고객 지향 서비스를 최우선으로 합니다.</h2>
			<p>Acorn MOVIE는 고객의 니즈에 부응하여 최신의 영화부터 독립 영화까지 다양한 장르의 영화를 구축하기 위해 최선을 다하고 있습니다. 최적의 서비스로 최고의 고객만족을 이끌기 위해 고객 여러분의 말씀에 귀를 기울이고 있습니다. 불편하신 점이나 Acorn MOVIE의 개선 사항이 필요하다고 느끼시면 Q&A 게시판 혹은 acornmovie@gmail.com으로 연락 주시면 Acorn MOVIE의 개선에 적극 반영하도록 하겠습니다.</p>
		</div>
	</div>
	
	<hr />
	
	<div class="row my-5">
		<div class="col-7">
			<h2>직원들을 위한 최선의 환경을 제공합니다.</h2>
			<p>서비스 제공에 있어서 주체가 되는 직원들의 만족에 대해 많은 관심을 기울이고 있습니다. 업무에 대해서만 신경을 쓸 수 있도록 근무 환경을 조성하고 있으며, 창의적인 아이디어가 나올 수 있도록 수평적인 조직 구조를  채택하고 있습니다. 또한 전문성 향상과 최신 트렌드를 반영하도록 교육 및 연수를 제공하고 있습니다. 저희 Acorn MOVIE와 같이 성장을 원하시는 인재분들은 공지사항 확인 혹은 acornmovie@gamil.com에 문의 바랍니다.</p>
		</div>
		<div class="col-5">
			<img src="${pageContext.request.contextPath}/include/images/c.jpg" alt="" class="w-100" />
		</div>
	</div>

</div>
<!-- footer -->
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
<script>
	document.querySelector("#chargeBtn").addEventListener("click", function(e){
		let chargePoint = prompt("얼마를 충전하시겠습니까?","");
		document.querySelector("#point").value = chargePoint;
	});
</script>
</body>
</html> 





