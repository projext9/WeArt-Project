<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>위아트 회원 가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/weart_join_form.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$('.nick_input').on('focusout' , function(){
			var nn_RegExp = /^[가-힣|a-z|A-Z|0-9|]{2,10}$/;
			var member_nick = $(".nick_input").val();
		  
		$.ajax({
			type:'post',
			url:"/travelers/checkNick.do",
			data: {"member_nick":member_nick},
			success: function(data){
				
				if(nn_RegExp.test(member_nick)==false){
			        result = "닉네임 (2~10)자리 까지 한글,영문,숫자조합 가능";
				    $(".nick_input_check").html(result).css("color", "red");
				    $(".next_info").attr('disabled' , true);	
				
			  }else if(data == "N"){
					result = "사용 가능한 닉네임입니다.";
					$(".nick_input_check").html(result).css("color", "green");
					$('.nick_input').css({
						"outline":"none",
					    "border-bottom":"2px solid transparent",
					    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
					    "border-image-slice": "1"})
					
			  }else{
				  result = "이미 사용중인 닉네임입니다.";
					$(".nick_input_check").html(result).css("color", "red");
					 $('.nick_input').css({
							"outline":"none",
						    "border-bottom":"",
						    "border-image":"",
						    "border-image-slice": ""})
					$(".nick_input").val("").trigger("focus");
					
					return false;
			  }	        
		  }
	  });
	   
   });
		$('.name_input').on('focusout' , function(){
			
		     var name = $('.name_input').val();
			 var n_RegExp = /^[가-힣]{2,5}$/; //이름 유효성검사 정규식
			 
			 if(n_RegExp.test(name)==false){
				 
				 $(".name_input_check").html("이름은 5자 이하의 한글로 작성 해주세요.").css("color" , "red");	
				 $('.name_input').css({
						"outline":"none",
					    "border-bottom":"",
					    "border-image":"",
					    "border-image-slice": ""})
				 $(".name_input").val("").trigger("focus");
				

			 }else{
				 $(".name_input_check").html("")
				 $('.name_input').css({
						"outline":"none",
					    "border-bottom":"2px solid transparent",
					    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
					    "border-image-slice": "1"})
			 }
	
        });
		
		$('.birth_input').on('focusout' , function(){
			
			     var birth = $('.birth_input').val();
		         var b_RegExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		         
             if(b_RegExp.test(birth)==false){
				 
				 $(".birth_input_check").html("생년월일 8자리를 입력해주세요").css("color" , "red");
				 $('.brith_input').css({
						"outline":"none",
					    "border-bottom":"",
					    "border-image":"",
					    "border-image-slice": ""})
				     
			 }else{
				 $(".birth_input_check").html("")	 
				  $('.birth_input').css({
						"outline":"none",
					    "border-bottom":"2px solid transparent",
					    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
					    "border-image-slice": "1"})					    
				 $(".next_info").attr('disabled' , false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white'); 
			 }
		});
			
		$('.next_info').on('click' , function(){
			
			 var member_nick = $(".nick_input").val();
			 var name = $('.name_input').val();
			 var birth = $('.birth_input').val();	
			 
			if(name == ""){
				 result = "이름을 입력해주세요";
				 $(".name_input_check").html(result).css("color", "red");
				 $(".next_info").attr('disabled' , true);
				 $(".name_input").trigger("focus");
				 
				 return false;
			}
			if(member_nick == ""){
				 result = "닉네임을 입력해주세요";
				 $(".nick_input_check").html(result).css("color", "red");
				 $(".next_info").attr('disabled' , true);
				 $(".nick_input").trigger("focus");	 
				 return false;
			}
			if(birth == ""){
				 result = "생년월일을 입력해주세요";
				 $(".birth_input_check").html(result).css("color", "red");
				 $(".next_info").attr('disabled' , true);
				 $(".birth_input").trigger("focus");
				 
				 return false;
			}
		});
	});
	</script>
</head>

<body id="body">
<h1>We Are Travelers!</h1>
<main class="join_cont_info">
<form class="join_form_info" name="joinForm" action="/travelers/joinfinish.do" method="post">

    <input type="hidden" name="email" value="${email }">
    <input type="hidden" name="pwd" value="${pwd }">
    
    <div class="multi_box">
    <progress value="80" max="100"></progress>
    <br>
    <div class="guide_box">
      <p class="join_guide_2">위아트 계정<p/>
      <p>프로필 내용을 작성해주세요</p>
    </div>
    </div>
      
  <div class="info_input_box">
    
       <div class="name_wrap">
    <label>이름
        <input class="name_input" id="name_input_id" name="name">
    </label>
        <div class="name_input_check"></div>
     </div>  
     
   <div class="nick_wrap">
    <label>닉네임
        <input class="nick_input" id="nick_input_id" name="nick">
    </label>    
        <div class="nick_input_check"></div>
     </div>
 
    <div class="birth_wrap">
    <label>생년월일
        <input class="birth_input" id="birth_input_id" name="birth">
     </label>  
        <div class="birth_input_check"></div>
     </div>  
     
</div>
   
    <div class="next_wrap_info">
	<button type="submit" class="next_info" value="다음" disabled="disabled" style="font-size:1.3em">다음</button>
	</div>
</form>  
</main>
</body>
</html>        