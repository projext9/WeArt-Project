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
	 var input = $('input[type="text"]');
		
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
			   $('.pwd_1_input').css({
				"outline":"none",
			    "border-bottom":"2px solid transparent",
			    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
			    "border-image-slice": "1"})
		  }else{
			   $('.pwd_input_check1').html('비밀번호는 8-16자리까지 가능하며 각각 1개 이상의 대/소문자, 숫자, 특수 문자(@$!%)를 포함해주세요');
			   $('.pwd_input_check1').css('color','red');
			   $('.pwd_1_input').css({
					"outline":"none",
				    "border-bottom":"",
				    "border-image":"",
				    "border-image-slice": ""})
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
	 			  $('.pwd_2_input').css({
	 					"outline":"none",
	 				    "border-bottom":"2px solid transparent",
	 				    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
	 				    "border-image-slice": "1"})
	 			   $(".next_pwd").attr('disabled' , false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white');
 		       }else{
	  		       $('.pwd_input_check2').html("비밀번호가 일치하지 않습니다.");
	  		       $('.pwd_input_check2').attr('color','red');
	  		     $('.pwd_2_input').css({
						"outline":"none",
					    "border-bottom":"",
					    "border-image":"",
					    "border-image-slice": ""})
	  		       $('.pwd_input_check2').val("").trigger("focus");
	  		       
	  		     return false;
 	    }
   });
 		  
 		 
});

	</script>
</head>
<body id="body">
<h1>We Are Travelers!</h1>
<main class="join_cont_pwd">
<form class="join_form_pwd" name="joinForm" action="/travelers/joinNext3.do" method="post">
    <input type="hidden" name="email" value="${email }">
    
    <div class="multi_box">
    <progress value="60" max="100"></progress>
    <br>
    <div class="guide_box">
      <p class="join_guide_2">위아트 계정에<p/>
      <p>사용할 비밀번호를 설정해주세요 </p>
    </div>
    </div>
      
    <!-- 비밀번호 입력-->
    <div class="pwd_input_area">
    <div class="pwd_input_box">
    <label>비밀번호
        <input type="password" class="pwd_1_input" id="pwd_1" name="pwd" value="">
    </label>
   </div>  
   <span class="pwd_input_check1"></span>  
   <!-- 비밀번호 확인-->
    <div class="pwd_check_wrap">
    <label id="pwd_check_id">비밀번호 확인
      <input type="password" class="pwd_2_input" id="pwd_2" name="pwd2" value="">
    </label>   
    </div>
    <span class="pwd_input_check2"></span>
    </div>
    <div class="next_wrap_pwd">
	<button type="submit" class="next_pwd" value="다음" disabled="disabled" style="font-size:1.3em">다음</button>
	</div>
	
</form> 
</main>
</body>
</html>        