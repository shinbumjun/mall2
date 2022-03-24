<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/list.jsp</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<style>
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
      height: 250px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
   }
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.05);
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
   	.img-wrapper img{
	   	width: 100%;
	   	height: 100%;
	   	/* fill | contain | cover | scale-down | none(default) */
	   	/*	
	   		cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
	   		contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
	   		fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
	   		scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
	   	*/
		object-fit: contain;	
   	}
  
	a { 
	text-decoration:none;
	color:black;
	 } 
</style> 
</style>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="movie" name="thisPage"/>
</jsp:include>
</br>
<div class="container">
   	
   	<div style="clear:both;"></div>

	<form action="list.do" method="get">
		<button class="btn btn-secondary" name="category" value="" >전체</button>
		<button class="btn btn-secondary" name="category" value="액션" >액션</button>
		<button class="btn btn-secondary" name="category" value="코미디">코미디</button>
		<button class="btn btn-secondary" name="category" value="멜로">멜로</button>
		<button class="btn btn-secondary" name="category" value="공포/스릴러">공포/스릴러</button>
		<button class="btn btn-secondary" name="category" value="애니메이션">애니메이션</button>
		<button class="btn btn-secondary" name="category" value="SF/판타지">SF/판타지</button>
		<button class="btn btn-secondary" name="category" value="다큐멘터리">다큐멘터리</button>
		
		<div style="float:right">
		<c:if test="${adminNum eq '1' }">
   			<a href="${pageContext.request.contextPath}/movie/upload_form.do"><input class="btn btn-primary" type="button" value="영화 업로드"></a><br/>
   		</c:if>
   		</div>
	</form>

	</br>
   	<div class="row">
		<c:forEach var="tmp" items="${list }">
			<div class="col-6 col-md-4 col-lg-3">
         		<div class="card mb-3">
            		<a href="${pageContext.request.contextPath}/movie/detail.do?num=${tmp.num}">
	               		<div class="img-wrapper">
	                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
	               		</div>
            		</a>
            		<div class="card-body">
            			<a href="${pageContext.request.contextPath}/movie/detail.do?num=${tmp.num}">
							<p class="card-text" align="center" style="border: 5px double #DCDCDC; padding: 0.4em; border-radius: 5em; margin-bottom:1em"><strong>${tmp.title }</strong></p>
						</a>
						<c:choose>
							<c:when test="${tmp.score eq 0.0 }">
								<p class="card-text"><strong>★</strong> 별점 없음</p>
							</c:when>
							<c:otherwise>
								<p class="card-text"><strong>★${tmp.score }</strong></p>
							</c:otherwise>
						</c:choose>
               			<p class="card-text">구매 <strong>${tmp.price }</strong> ⓟ	</p>
               
            		</div>
         		</div>
      		</div>
		</c:forEach>
   	</div>
   
   	
   	<nav>
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/movie/list.do?pageNum=${startPageNum - 1}">Prev</a>
            	</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Prev</a>
            	</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active">
                  		<a class="page-link" href="${pageContext.request.contextPath}/movie/list.do?pageNum=${i}">${i }</a>
               		</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
                  		<a class="page-link" href="${pageContext.request.contextPath}/movie/list.do?pageNum=${i}">${i}</a>
               		</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/movie/list.do?pageNum=${endPageNum + 1}">Next</a>
            	</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Next</a>
            	</li>
			</c:otherwise>
		</c:choose>
      </ul>
   </nav> 
   

	  
</div>
<%-- <script>
   // card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
   $(".img-wrapper").imgLiquid();
</script> --%>
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




