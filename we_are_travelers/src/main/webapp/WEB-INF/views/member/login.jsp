<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
   
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/weart_login.css" rel="stylesheet">
 </head>
  
 <body class="text-center">
    
<main class="form-signin">
  <form class="login_form" action="${pageContext.request.contextPath}/loginProcess.do" method="post">
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" >
      <label for="floatingInput">이메일(아이디)</label> 
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" >
      <label for="floatingPassword">비밀번호</label> 
    <div class="form-floating-btn">
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    </div>
     </div>
    <div class="checkbox mb-3">
    <label><input type="checkbox" value="remember-me"> 아이디 저장 </label>
     </div> 
    <img src="${pageContext.request.contextPath}/resources/images/kakao_login.png" width="200" height="50" alt="카카오 로그인">
    <img src="${pageContext.request.contextPath}/resources/images/naver_login.png" width="200" height="50" alt="네이버 로그인">
    <img src="${pageContext.request.contextPath}/resources/images/google_login.png" width="200" height="50" alt="구글 로그인">
    <img src="${pageContext.request.contextPath}/resources/images/facebook_login.png" width="200" height="50" alt="페이스북 로그인">
    <p class="mt-5 mb-6 text-muted">&copy; Copyright 2022. Team We-Art. all rights reserved.</p>
  </form>
</main>

  </body>
</html>
