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
    <title>weart_login</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/weart_login.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
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
  
 <body class="text-center"  id="login_body">
<main class="form-signin">
  <form class="login_form" action="/travelers/MemberloginProcess.do" method="POST">
  <div class="logo_login_box">
    <a href="${pageContext.request.contextPath}/home.do"><h1>We Are Travelers!</h1></a>
   <div class="login_wrap">
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
    <button class="w-100 btn btn-lg btn-primary" id="login_btn"type="submit">로그인</button>
 </div>
 </div>
 </form>
    <div class="checkbox mb-3">
    <label id="save_id"><input type="checkbox" value="remember-me">아이디 저장</label>
 </div>
    
 <div class="social_login">
     <div class="social_logoK">
     <a href="https://kauth.kakao.com/oauth/authorize?client_id=8a2ee7f6ccee51f630888d04e48e6d7b&redirect_uri=http://localhost:8080${pageContext.request.contextPath}/kakaoLogin.do&response_type=code">
    <img src="${pageContext.request.contextPath}/resources/images/kakao_login.png" width="200" height="50" alt="카카오 로그인">
    </a>
    </div>

    <div class="social_logoN" id="naver_id_login">
    <a href="${url}">
    <img src="${pageContext.request.contextPath}/resources/images/naver_login.png" width="200" height="50" alt="네이버 로그인">
    </a>
    </div>

 <div class="join_wrap">
   <div class="join_wrap_box">
    <button class="join_member" onclick="location.href='${pageContext.request.contextPath}/joinMember.do'" type="button">일반회원가입</button>
   </div>
     <div class="join_company">
     <button class="join_company"onclick="location.href='${pageContext.request.contextPath}/joinCompany.do'" type="button">기업회원가입</button>
   </div>
 </div>
    <p class="mt-5 mb-6 text-muted" id="footer_font">&copy; Copyright 2022. Team We-Art. all rights reserved.</p>
 </div>
</main>

  </body>
</html>
