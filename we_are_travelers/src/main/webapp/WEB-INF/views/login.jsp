<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <meta name="google-signin-client_id" content="917082913901-5alh4m7o4lq42fsvo2k4jnfdcrdaqraq.apps.googleusercontent.com">
    <title>weart_login</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/weart_login.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
   <script>
      $(document).ready(function() {
    	  $("#member_form").keydown(function(){
    	        $('#company_form').val($(this).val());
    	  });
    	  
    	  $("#member_form").change(function(){
    	        $('#company_form').val($(this).val());
    	  });
    	  
    	  $("#member_form_pwd").keydown(function(){
  	           $('#company_form_pwd').val($(this).val());
  	    });
  	  
  	      $("#member_form_pwd").change(function(){
  	          $('#company_form_pwd').val($(this).val());
  	    });	  
    	  
      });
   </script>
   <script>
   function onSignIn(googleUser) {
   	  

   </script>
   
   <script>
    function onSuccess(googleUser) {
    	  var profile = googleUser.getBasicProfile();
     	  var id_token = googleUser.getAuthResponse().id_token;
     	  $("#googleBtn").click(function(){
     		  $.ajax({
     			  url: '승인된 리디렉션 URI',
     			  type: 'POST',
     			  data: 'idtoken=' + id_token, 
     			  dataType: 'JSON',
     			  beforeSend : function(xhr){
     				  xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
     			  },
     			  success: function(json) {
     				  if (json.login_result == "success"){
     					  location.href = "/travelers/home.do";
     				  }//end if
     	          }//success
     		  });//ajax
     	  });//click
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 200,
        'height': 50,
        'longtitle': true,
        'theme': 'white',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
 </head>
  
 <body class="text-center"> 
<main class="form-signin">
  <form class="login_form" action="/travelers/MemberloginProcess.do" method="POST">
  <div class="logo_login_box">
    <a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="로고" width="72" height="57">
    </a>
   <div class="login_wrap">
   <div class="login_member_box">
    <button class="all_member_login_btn" onclick="location.href='${pageContext.request.contextPath}/login.do'" type="button">통합로그인</button>
   </div>
   </div>
   </div>
<br>
 <div class="form-floating">
      <input type="text" class="form-control"  id="member_form"  name="member_id">
      <input type="hidden" class="form-control"  id='company_form' name="company_id">
      <label for="floatingInput">이메일(아이디)</label> 
    </div>
 <div class="form-floating">
      <input type="password" class="form-control"  id="member_form_pwd" name="member_pwd">
       <input type="hidden" class="form-control"  id="company_form_pwd" name="company_pwd">
      <label for="floatingPassword">비밀번호</label> 
    <div class="form-floating-btn">
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
 </div>
 </div>
 </form>
    <div class="checkbox mb-3">
    <label><input type="checkbox" value="remember-me"> 아이디 저장 </label>
 </div>
    
 <div class="social_login">
     <div class="social_logoK">
     <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=8a2ee7f6ccee51f630888d04e48e6d7b&redirect_uri=http://localhost:8090${pageContext.request.contextPath}/kakaoLogin.do&response_type=code">
    <img src="${pageContext.request.contextPath}/resources/images/kakao_login.png" width="200" height="50" alt="카카오 로그인">
    </a>
    </div>

    <div class="social_logoN" id="naver_id_login">
    <a href="${url}">
    <img src="${pageContext.request.contextPath}/resources/images/naver_login.png" width="200" height="50" alt="네이버 로그인">
    </a>
    </div>

  <div id="my-signin2"></div>
  
    <!--<div class="social_logoG" >
    <img src="${pageContext.request.contextPath}/resources/images/google_login.png" width="200" height="50" alt="네이버 로그인">
   </div>-->
   
     <div class="socia_LogoF">
    <img src="${pageContext.request.contextPath}/resources/images/facebook_login.png" width="200" height="50" alt="페이스북 로그인">
     </div>
 </div>

 
 <div class="join_wrap">
   <div class="join_wrap_box">
    <button class="join_member" onclick="location.href='${pageContext.request.contextPath}/joinMember.do'" type="button">일반회원가입</button>
   </div>
     <div class="join_company">
     <button class="join_company"onclick="location.href='${pageContext.request.contextPath}/joinCompany.do'" type="button">기업회원가입</button>
   </div>
 </div>
    <p class="mt-5 mb-6 text-muted">&copy; Copyright 2022. Team We-Art. all rights reserved.</p>
 
</main>

  </body>
</html>
