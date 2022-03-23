<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--네비바--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">Acorn MOVIE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link ${param.thisPage eq 'notice' ? 'active' : '' }" aria-current="page" href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.thisPage eq 'movie' ? 'active' : '' }" href="${pageContext.request.contextPath}/movie/list.do" tabindex="-1" aria-disabled="true">영화 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" ${param.thisPage eq 'review' ? 'active' : '' }" href="${pageContext.request.contextPath}/review/list.do" tabindex="-1" aria-disabled="true">커뮤니티</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.thisPage eq 'info' ? 'active' : '' }" href="${pageContext.request.contextPath}/users/private/info.do">마이페이지</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" ${param.thisPage eq 'movie' ? 'active' : '' }" href="${pageContext.request.contextPath}/qna/list.do" tabindex="-1" aria-disabled="true">문의사항</a>
        </li>
   
      </ul>
      
      <ul id="nav3" class="navbar-nav justify-content-end me-auto mb-2 mb-lg-0"> 
      
      <c:choose>
		<c:when test="${ empty sessionScope.id}">
      		<li class="nav-item"> 
      			<a class="nav-link" href="${pageContext.request.contextPath}/users/loginform.do">로그인</a> 
      		</li> 
      		<li class="nav-item"> 
      			<a class="nav-link" href="${pageContext.request.contextPath}/users/signupform.do">회원가입</a> 
      		</li>
		</c:when>
		
		<c:otherwise>
			<li class="nav-item"> 
      			<a class="nav-link" href="${pageContext.request.contextPath}/users/private/info.do">${sessionScope.id }님 로그인 중</a>
      		</li> 
      		<li class="nav-item"> 
      			<a class="nav-link" href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a> 
      		</li>

			<c:if test="${adminNum eq 0 }">
				<li class="nav-item"> 
      				<a class="nav-link" href="#">내 포인트 : ${point }</a>
      			</li>
				<form class="d-flex" action="${pageContext.request.contextPath}/chargePoint.do" method="post" id="myForm">
					<input class="form-control me-2" type="hidden" name="point" id="point"/>
					<button class="btn btn-outline-light" type="submit" id="chargeBtn">충전</button>
				</form>
			</c:if>
		</c:otherwise>
	</c:choose>
      

      </ul>

      <form class="d-flex" action="${path }/movie/list.do"  method="get">
        <input class="form-control me-2" type="search" id="keyword" name="keyword" placeholder="영화 검색" aria-label="Search" value="${keyword }">
        <button class="btn btn-outline-light" type="submit">Search</button>

      </form>
    </div>
  </div>
</nav>