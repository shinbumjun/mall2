<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#title{
      width:auto;
      height:150px;
	}
</style>
<meta charset="UTF-8">
<title>XXX 회원가입</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
   <div class="text-center mt-5 mb-4">  
	<a href="${pageContext.request.contextPath}/">
		<img src="${pageContext.request.contextPath}/include/images/title.png" alt="" id="title"/>
	</a> 
   </div>
   <form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="signform">
   <%--부트스트랩 추가하기 --%>
      <div class="">
         <label for="id" class="form-label">아이디</label>
      </div>
      <div class="text-center mb-3">
         <input class="form-control" type="text" name="id" id="id" placeholder="영문 소문자로 시작하여 5~10자 이내로 입력하세요."/>
         <div class="valid-feedback">멋진 아이디네요!</div>
         <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
      </div>
      <div class="">
         <label for="pwd" class="form-label">비밀번호</label>
      </div>
      <div class="text-center mb-3">
         <input class="form-control" type="password" name="pwd" id="pwd"/>
         <div class="valid-feedback">잘 입력하셨어요!</div>
         <div class="invalid-feedback">5~10자 이내로 입력하세요.</div>
      </div>
      <div class="">
         <label for="pwd2" class="form-label">비밀번호 재확인</label>
      </div>
      <div class="text-center mb-3">
         <input class="form-control" type="password" name="pwd2" id="pwd2"/>
         <div class="valid-feedback">잘 입력하셨어요!</div>
         <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
      </div>
      <div class="">
         <label for="email" class="form-label">이메일</label>
      </div>
      <div class="text-center mb-3">
         <input class="form-control" type="text" name="email" id="email"/>
         <div class="valid-feedback">잘 입력하셨어요!</div>
         <div class="invalid-feedback">이메일 주소를 다시 확인해주세요.</div>
      </div>
      <%-- 그 외 이름, 닉네임, 성별, 생년월일 추가? --%>
      <div class="d-grid gap-2">
         <button type="submit" class="btn btn-dark animate__animated" id="btn1">가입하기</button>
      </div>
   </form>
   <%-- 유효성 검사 추가 --%>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
   //아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수 만들고 초기값 대입
   let isIdValid=false;
   let isPwdValid=false;
   let isEmailValid=false;

   //아이디를 입력했을때(input) 실행할 함수 등록 
   document.querySelector("#id").addEventListener("input", function(){
      //일단 is-valid,  is-invalid 클래스를 제거한다.
      document.querySelector("#id").classList.remove("is-valid");
      document.querySelector("#id").classList.remove("is-invalid");
      
      //1. 입력한 아이디 value 값 읽어오기  
      let inputId=this.value;
      //입력한 아이디를 검증할 정규 표현식
      const reg_id=/^[a-z].{4,9}$/;
      //만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
      if(!reg_id.test(inputId)){
         isIdValid=false; //아이디가 매칭되지 않는다고 표시하고 
         // is-invalid 클래스를 추가한다. 
         document.querySelector("#id").classList.add("is-invalid");
         return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
      }
      
      //2. util 에 있는 함수를 이용해서 ajax 요청하기
      ajaxPromise("${pageContext.request.contextPath}/users/checkid.do", "get", "inputId="+inputId)
      .then(function(response){
         return response.json();
      })
      .then(function(data){
         console.log(data);
         //data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
         if(data.isExist){//만일 존재한다면
            //사용할수 없는 아이디라는 피드백을 보이게 한다. 
            isIdValid=false;
            // is-invalid 클래스를 추가한다. 
            document.querySelector("#id").classList.add("is-invalid");
         }else{
            isIdValid=true;
            document.querySelector("#id").classList.add("is-valid");
         }
      });
   });
   
   //비밀 번호를 확인 하는 함수 
   function checkPwd(){
      document.querySelector("#pwd").classList.remove("is-valid");
      document.querySelector("#pwd").classList.remove("is-invalid");
      document.querySelector("#pwd2").classList.remove("is-valid");
      document.querySelector("#pwd2").classList.remove("is-invalid");
      
      const pwd=document.querySelector("#pwd").value;
      const pwd2=document.querySelector("#pwd2").value;
      
      // 최소5글자 최대 10글자인지를 검증할 정규표현식
      const reg_pwd=/^.{5,10}$/;
      if(!reg_pwd.test(pwd)){
         isPwdValid=false;
         document.querySelector("#pwd").classList.add("is-invalid");
         return; //함수를 여기서 종료
      }
      
      if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
         //비밀번호를 잘못 입력한것이다.
         isPwdValid=false;
         document.querySelector("#pwd2").classList.add("is-invalid");
      }else{
         isPwdValid=true;
         document.querySelector("#pwd2").classList.add("is-valid");
      }
   }
   
   //비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
   document.querySelector("#pwd").addEventListener("input", checkPwd);
   document.querySelector("#pwd2").addEventListener("input", checkPwd);
   
   //이메일을 입력했을때 실행할 함수 등록
   document.querySelector("#email").addEventListener("input", function(){
      document.querySelector("#email").classList.remove("is-valid");
      document.querySelector("#email").classList.remove("is-invalid");
      
      //1. 입력한 이메일을 읽어와서
      const inputEmail=this.value;
      //2. 이메일을 검증할 정규 표현식 객체를 만들어서
      const reg_email=/@/;
      //3. 정규표현식 매칭 여부에 따라 분기하기
      if(reg_email.test(inputEmail)){//만일 매칭된다면
         isEmailValid=true;
         document.querySelector("#email").classList.add("is-valid");
      }else{
         isEmailValid=false;
         document.querySelector("#email").classList.add("is-invalid");
      }
   });
   
   
   //폼에 submit 이벤트가 발생했을때 실행할 함수 등록
   document.querySelector("#signform").addEventListener("submit", function(e){
      //console.log(e);
      /*
         입력한 아이디, 비밀번호, 이메일의 유효성 여부를 확인해서 하나라도 유효 하지 않으면
         e.preventDefault(); 
         가 수행 되도록 해서 폼의 제출을 막아야 한다. 
      */
      //폼 전체의 유효성 여부 알아내기 
      let isFormValid = isIdValid && isPwdValid && isEmailValid;
      if(!isFormValid){//폼이 유효하지 않으면
         //폼 전송 막기 
         e.preventDefault();
      document.querySelector("#btn1").classList.add("animate__shakeX");
      }   
   });
	document.querySelector("#btn1").addEventListener("animationend", function(){
		this.classList.remove("animate__shakeX");
	});
</script>
<!-- footer -->
<div class="text-center">
	<hr />
	<p>© 2019-2021 Company, Inc. · Privacy · Terms</p>
</div>
</body>
</html>