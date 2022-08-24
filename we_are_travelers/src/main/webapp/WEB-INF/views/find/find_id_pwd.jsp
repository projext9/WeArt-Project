<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 아이디 비밀번호찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet" />
</head>
<body>
<a href="${pageContext.request.contextPath}/login.do"><h1>We Are <br>
Travelers!
</h1></a>

<main class="find_main">

<div class="find_wrap1">
   <h2 style="text-align:center;">일반 회원</h2>

      <div class="find_id_box">
         <button class="find_id" onclick='location.href="${pageContext.request.contextPath}/find_id.do"'>아이디 찾기</button>
      </div>
   
     <div class=find_pwd_box>
         <button class="find_pwd" onclick='location.href="${pageContext.request.contextPath}/find_pwd.do"'>비밀번호 찾기</button>
     </div>
   </div>  
   
 <div class="find_wrap2">
<h2 style="text-align:center;">기업 회원</h2>

   <div class="find_com_id_box">
    <button class="find_id" onclick='location.href="${pageContext.request.contextPath}/find_com_id.do"'>아이디 찾기</button>
   </div>
   
     <div class=find_com_pwd_box>
     <button class="find_pwd" onclick='location.href="${pageContext.request.contextPath}/find_com_pwd.do"'>비밀번호 찾기</button>
     
   </div>  
 </div>
 </main>
</body>
</html>