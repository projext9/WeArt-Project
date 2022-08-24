<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 아이디 비밀번호찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	  
	$(function() {
		
	 $('.next_change').prop('disabled' , true)
	 
	 $('.pwd1_input').on('keyup' , function(){
		 
		 var pwd = $('.pwd1_input').val();		 
		 var regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
		 
		  if(pwd == "" ) {
			   $('.pwd_input_check1').html('비밀번호를 입력해주세요.');
			   $('.pwd_input_check1').css('color','red');
			   $('.pwd1_input').val("").trigger("focus");
		  }else if(regPwd.test(pwd)){
			   $('.pwd_input_check1').html('사용가능한 비밀번호 입니다.');
			   $('.pwd_input_check1').css('color','green');
			   $('.pwd1_input').css({
				"outline":"none",
			    "border-bottom":"2px solid transparent",
			    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
			    "border-image-slice": "1"})
		  }else{
			   $('.pwd_input_check1').html('비밀번호(8-16)자리 각 1개 이상의'+ '<br>'
					   +'대/소문자, 숫자, 특수 문자(@$!%)를 포함해주세요');
			   $('.pwd_input_check1').css('color','red');
			   $('.pwd1_input').css({
					"outline":"none",
				    "border-bottom":"",
				    "border-image":"",
				    "border-image-slice": ""})
			   $('.pwd_1_input').val("").trigger("focus");
			   return false;
		  }
   });
	 
 		 $('.pwd2_input').on('keyup' , function() {
 			 
 			 var pwd2 = $(".pwd2_input").val();
 			 
 		  if(pwd2 == "" ) {
			   $('.pwd_input_check2').html('비밀번호 확인을 입력해주세요.');
			   $('.pwd_input_check2').css('color','red');
			   
 		  }else if(pwd2 == $('.pwd1_input').val()){
	 			   $('.pwd_input_check2').html('비밀번호가 일치합니다.');
	 			   $('.pwd_input_check2').css('color','green');
	 			  $('.pwd2_input').css({
	 					"outline":"none",
	 				    "border-bottom":"2px solid transparent",
	 				    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
	 				    "border-image-slice": "1"})
	 			   $('.next_change').prop('disabled' , false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css( 'color' , 'white');
 		       }else{
	  		       $('.pwd_input_check2').html("비밀번호가 일치하지 않습니다.").css('color' , 'red');
	  		       $('.pwd2_input').css({
						"outline":"none",
					    "border-bottom":"",
					    "border-image":"",
					    "border-image-slice": ""})
					    $('.next_change').prop('disabled' , true).css('background','').css('color' ,'');
	  		       $('.pwd_input_check2').val("").trigger("focus");
	  		       
	  		     return false;
 	    }
   });
 		$('.next_pwd').on('click' , function(){

 			 var pwd = $('.pwd1_input').val();
 			 var pwd2 = $('.pwd2_input').val();
			 
 			 if(pwd == "" ) {
 				   $('.pwd_input_check1').html('비밀번호를 입력해주세요.');
 				   $('.pwd_input_check1').css('color','red');
 				   $('.next_change').prop('disabled' , true).css('background','white').css('color' ,'white');
 				   $('.pwd1_input').css({
 						"outline":"none",
 					    "border-bottom":"",
 					    "border-image":"",
 					    "border-image-slice": ""})
 				   $('.pwd1_input').val("").trigger("focus");
 				   
				 
				 return false;
			}
 			  if(pwd2 == "" ) {
 				   $('.pwd_input_check2').html('비밀번호 확인을 입력해주세요.');
 				   $('.pwd_input_check2').css('color','red'); 				   
 				   $('.pwd2_input').css({
						"outline":"none",
					    "border-bottom":"",
					    "border-image":"",
					    "border-image-slice": ""})
				   $('.next_change').prop('disabled' , true);
				   $('.pwd2_input').val("").trigger("focus");
 				 
				 return false;
			}
     }); 
});
	</script>
</head>
<body>
<a href="${pageContext.request.contextPath}/login.do"><h1>We Are <br>
Travelers!
</h1></a>
<main class="find_id_main">
<form class="find_form_pwd" name="find_Form" action="${pageContext.request.contextPath}/change_pwd.do" method="post">
    <input type="hidden" name="member_id" value="${member_id }">
    
    <div class="guide_box">
      <p class="join_guide2">아이디(이메일)의 새로운 비밀번호를 설정해주세요</p>
    </div>
      
    <!-- 비밀번호 입력-->
    <div class="pwd_input_area">
    <div class="pwd_input_wrap">
    <label>비밀번호
        <input type="password" class="pwd1_input" id="pwd_1" name="member_pwd">
    </label>
   </div>  
   <span class="pwd_input_check1"></span>  
   <!-- 비밀번호 확인-->
    <div class="pwd_check_wrap">
    <label id="pwd_check_id">비밀번호 확인
      <input type="password" class="pwd2_input" id="pwd_2" name="member_pwd2" value="">
    </label>   
    </div>
    <span class="pwd_input_check2"></span>
    </div>
    <div class="next_wrap_pwd">
	<button type="submit" class="next_change" value="다음" style="font-size:1.3em">완료</button>
	</div>
	
</form> 
</main>
</body>
</html>