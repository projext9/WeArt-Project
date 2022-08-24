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
<main class="find_id_main">
<form class="find_form_id" name="joinForm" action="/travelers/result_id.do" method="post">

    <div class="multi_box">
    <div class="guide_box">
      <p class="join_guide_2">찾으실 아이디(이메일)에 해당하는<p/>
      <p>이름과 생년월일을 입력해주세요</p>
    </div>
    </div>
      
  <div class="info_input_box">
    
       <div class="name_wrap">
    <label>이름
        <input class="name_input" id="name_input_id" name="member_name" placeholder="이름을 입력해주세요">
    </label>
        <div class="name_input_check"></div>
     </div>  
 
    <div class="birth_wrap">
    <label>생년월일
        <input class="birth_input" id="birth_input_id" name="member_birth" maxlength=8 placeholder="생년월일  8자리 입력해주세요">
     </label>  
        <div class="birth_input_check"></div>
     </div>  
     
 </div>
     <br><br>
    <div class="next_wrap_find">
	<button type="submit" class="next_find" value="다음" style="font-size:1.3em">찾기</button>
	</div>
</form>  
</main>
</body>
</html>