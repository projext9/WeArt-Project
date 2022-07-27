<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/weart_login.css" rel="stylesheet">
 </head>
  
 <body class="text-center">
    
<main class="form-signin">
  <form class="login_form" action="/travelers/loginProcess.do" method="POST">
    <a href="${pageContext.request.contextPath}/home.do">
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="로고" width="72" height="57">
    </a>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

 <div class="form-floating">
      <input type="text" class="form-control" id="member_id" name="member_id" >
      <label for="floatingInput">이메일(아이디)</label> 
    </div>
 <div class="form-floating">
      <input type="password" class="form-control" id="member_pwd" name="member_pwd" >
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
    <img src="${pageContext.request.contextPath}/resources/images/kakao_login.png" width="200" height="50" alt="카카오 로그인">
    </div>
    <div class="social_logoN">
    <img src="${pageContext.request.contextPath}/resources/images/naver_login.png" width="200" height="50" alt="네이버 로그인">
    </div>
    <br />
     <div class="social_logoG">
    <img src="${pageContext.request.contextPath}/resources/images/google_login.png" width="200" height="50" alt="구글 로그인">
    </div>
     <div class="social_logoF">
    <img src="${pageContext.request.contextPath}/resources/images/facebook_login.png" width="200" height="50" alt="페이스북 로그인">
     </div>
 </div>

 
 <div class="join_wrap">
   <div class="join_wrap_box">
    <button class="join_member" onclick="location.href='/travelers/joinMember.do'" type="button">일반회원가입</button>
   </div>
     <div class="join_company">
     <button class="join_company"onclick="location.href='/travelers/joinCompany.do'" type="button">기업회원가입</button>
   </div>
 </div>
    <p class="mt-5 mb-6 text-muted">&copy; Copyright 2022. Team We-Art. all rights reserved.</p>
 
</main>

  </body>
</html>
