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
<%--Carousel --%>
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
<%--콘텐트 --%>
<div class="container">
	<div class="row my-5">
		<div class="col-7">
			<h2>첫번째 제목입니다.</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime libero minima voluptate tempore quos fugiat repudiandae praesentium possimus blanditiis voluptatum. Error quam quo totam officiis debitis dolore porro sunt molestiae.</p>
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
			<h2>두번째 제목입니다.</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus ipsa obcaecati voluptas aspernatur quas veniam atque voluptatibus quis modi sequi expedita ut amet deleniti repellat optio asperiores est laudantium sed.</p>
		</div>
	</div>
	
	<hr />
	
	<div class="row my-5">
		<div class="col-7">
			<h2>세번째 제목입니다.</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio quisquam hic quidem repudiandae inventore quae voluptatum ad fuga eaque optio consequatur enim debitis rerum quos nihil quia nobis deleniti omnis.</p>
		</div>
		<div class="col-5">
			<img src="${pageContext.request.contextPath}/include/images/c.jpg" alt="" class="w-100" />
		</div>
	</div>
</div>
<div class="container">
<c:choose>
		<c:when test="${ empty sessionScope.id}">
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath}/users/signupform.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath}/users/private/info.do">${sessionScope.id }</a> 로그인중... 
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
				<c:if test="${dto.adminNum eq 0 }">
					<p>현재 포인트 : ${dto.point }</p>
					<button>충전</button>
				</c:if>
			</p>
		</c:otherwise>
	</c:choose>

	<h1>변경</h1>
	<br />
	<a href="${pageContext.request.contextPath}/movie/list.do">영화 목록</a>
	<br />
	<a href="">리뷰</a>
	<br />
	<a href="">문의사항</a>
	<br />
	<a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
	<br />
	<a href="${pageContext.request.contextPath}/users/private/info.do">마이페이지</a>

</div>
</body>
</html> 





