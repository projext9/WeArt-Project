<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/weart_join_form.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	  
	$(function() {
	
	 $('.pwd_1_input').on('blur' , function(){
		 var pwd = $('.pwd_1_input').val();
		 var regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
		  if(pwd == "" ) {
			   $('.pwd_input_check1').html('비밀번호를 입력해주세요.');
			   $('.pwd_input_check1').css('color','red');
		  }else if(regPwd.test(pwd)){
			   $('.pwd_input_check1').html('사용가능한 비밀번호 입니다.');
			   $('.pwd_input_check1').css('color','green');
			   $('.pwd_input_check1').attr('readonly' , true);
		  }else{
			   $('.pwd_input_check1').html('비밀번호는 8-16자리까지 가능하며 각각 1개 이상의 대/소문자, 숫자, 특수 문자(@$!%)를 포함해주세요');
			   $('.pwd_input_check1').css('color','red');
			   $('.pwd_1_input').val("").trigger("focus");
			   return false;
		  }
   });
	 
 		 $('.pwd_2_input').on('blur' , function() {
 			 
 			 var pwd2 = $(".pwd_2_input").val();
 			 
 		  if(pwd2 == "" ) {
			   $('.pwd_input_check2').html('비밀번호 확인을 입력해주세요.');
			   $('.pwd_input_check2').css('color','red');
			   
 		  }else if(pwd2 == $('.pwd_1_input').val()){
	 			   $('.pwd_input_check2').html('비밀번호가 일치합니다.');
	 			   $('.pwd_input_check2').css('color','green');
	 			  $('.pwd_input_check2').attr('readonly' , true);
	 			   $(".next").attr('disabled' , false);
 		       }else{
	  		       $('.pwd_input_check2').html("비밀번호가 일치하지 않습니다.");
	  		       $('.pwd_input_check2').attr('color','red');
	  		       $('.pwd_input_check2').val("").trigger("focus");
	  		       
	  		     return false;
 	    }
   });
 		  
 		 
});

	</script>
</head>
<body class="join_pwd">
<div class="join_container">
<main class="join_cont">
<form class="join_form" name="joinForm" action="/travelers/joinNext3.do" method="post">
    <input type="hidden" name="email" value="${email }">
    <h1>We Are Travelers!</h1>
    <br>
    <div>
    <progress value="60" max="100"></progress>
    </div>
    <br>
      <p class="join_guide_1">위아트 계정의 비밀번호를 입력해주세요  <p/>
    <div class="pwd_wrap">
    <div class="pwd_name">비밀번호</div>
    <div class="pwd_input_box">
        <input type="password" class="pwd_1_input" id="pwd_1" name="pwd">
        <span class="pwd_input_check1"></span>
    <div class="pwd_name">비밀번호 확인</div>
         <input type="password" class="pwd_2_input" id="pwd_2" name="pwd2">
          <span class="pwd_input_check2"></span>
   </div> 
   </div>
    <div class="mail_check_wrap">
    <div class="mail_check_input_box">
        <input type="hidden" class="mail_check_input">
      </div> 
   <div class="clearfix">
    </div>
    </div>
    <br>
    <div>
	<input type="submit" class="next" value="다음" disabled="disabled">
	</div>
</form> 
</main>
</div>
</body>
</html>        