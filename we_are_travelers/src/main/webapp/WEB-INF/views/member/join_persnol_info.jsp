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
			        result = "닉네임은 2~10자리 까지이며 한글,영문,숫자로 조합가능합니다";
				    $(".nick_input_check").html(result).css("color", "red");
				    $(".next_info").attr('disabled' , true)	
				
			  }else if(data == "N"){
					result = "사용 가능한 닉네임입니다.";
					$(".nick_input_check").html(result).css("color", "green");
					
			  }else{
				  result = "이미 사용중인 닉네임입니다.";
					$(".nick_input_check").html(result).css("color", "red");
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

			 }else{
				 $(".name_input_check").html("")
			 }
	
        });
		
		$('.birth_input').on('focusout' , function(){
			
			     var birth = $('.birth_input').val();
		         var b_RegExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		         
             if(b_RegExp.test(birth)==false){
				 
				 $(".birth_input_check").html("생년월일 8자리를 입력해주세요").css("color" , "red");		 
				     
			 }else{
				 $(".birth_input_check").html("")
				 $(".next").attr('disabled' , false);       
				 return false; // 함수 동작 중단
				 
			 }
		});
			
		$('.next').on('click' , function(){
			if(member_nick == ""){
				 result = "닉네임을 입력해주세요";
				 $(".nick_input_check").html(result).css("color", "red");
				 $(".nick_input").trigger("focus");
				 return false;
			}
			if(name == ""){
				 result = "닉네임을 입력해주세요";
				 $(".nick_input_check").html(result).css("color", "red");
				 $(".nick_input").trigger("focus");
				 return false;
			}
			if(birth == ""){
				 result = "생년월일을 입력해주세요";
				 $(".nick_input_check").html(result).css("color", "red");
				 $(".nick_input").trigger("focus");
				 
				 return false;
			}
		});
	});
	</script>
</head>

<body id=body>
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
      
    <div class="info_wrap">
    <div class="info_input_box">
    <div>
    <label>닉네임
        <input class="nick_input" id="nick_input_id" name="nick">
    </label>    
        <span class="nick_input_check"></span>
     </div>
   <div>
    <label>이름
        <input class="name_input" id="name_input_id" name="name">
    </label>
        <span class="name_input_check"></span>  
     </div>   
    <div>
    <label>생년월일
        <input class="birth_input" id="birth_input_id" name="birth">
     </label>  
        <span class="birth_input_check"></span>
     </div>  
    </div>
    </div>
   <br><br>
    <div class="next_wrap_info">
	<button type="submit" class="next_info" value="다음" disabled="disabled" style="font-size:1.3em">다음</button>
	</div>
</form> 
</main>
</body>
</html>        