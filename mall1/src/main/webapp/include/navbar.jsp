<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--네비 바--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">에이콘 무비</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link ${param.thisPage eq 'notice' ? 'active' : '' }" aria-current="page" href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" ${param.thisPage eq 'info' ? 'active' : '' } href="${pageContext.request.contextPath}/users/private/info.do">마이페이지</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${param.thisPage eq 'movie' ? 'active' : '' }" href="${pageContext.request.contextPath}/movie/list.do" tabindex="-1" aria-disabled="true">영화 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">문의사항</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="영화 검색" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>