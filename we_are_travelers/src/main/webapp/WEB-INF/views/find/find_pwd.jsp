<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 아이디 비밀번호찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    var code = "";
	var timer = null;
	var isRunning = false;
	
	$(function(){
	
		  /* 인증번호 숨기기 */
		$("#mail_check_number_id").hide();
		 
		/*인증번호 버튼 클릭시 유효성 및 중복 검사 후 통과 시 인증번호 발송*/
		$('.mail_check_button').on('click' , function(){
			
			var email = $(".mail_input").val(); //이메일 input 입력값
			var display = $('.time'); // 타이머 class
	    	var leftSec = 180; //3분      
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 알파벳+숫자@알파벳+숫자   
			
			if(exptext.test(email)==false || email == null){
				
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
				$(".mail_input_check").html("이메일형식이 올바르지 않습니다.").css("color" , "red");
				
	            $(".mail_input").focus();

			     return false; // 함수 동작 중단
			     
			
			   }else{		        	
							            
								$.ajax({
									
							        type:"GET",
							        url:"mailCheck?email=" + email,
							        success:function(data){
							        	
							        if(data != null) 			          
							            alert("인증번호가 전송되었습니다.")
							            
							            $('.mail_input').css({
										"outline":"none",
									    "border-bottom":"2px solid transparent",
									    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
									    "border-image-slice": "1"})
							            $("#mail_check_number_id").show();
							            $(".mail_check_input").attr('type' , 'text');
							            startTimer(leftSec, display);
							            code = data;
							        
							        
							            console.log("data : " + data);
							        }    
							          
								});
		
				
		/* 인증번호 비교 */
		$(".mail_check_input").on('keyup' , function(){
		    
		    var inputCode = $(".mail_check_input").val();         // 입력코드값  
		    var checkResult = $(".mail_check_input_box_warn");    // 비교 결과값     
		    $(".next_find_pwd").prop('disabled' , true)  
		    
		    if(inputCode == code){                                // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.css("color", "green");
		        $('.mail_check_input').css({
					"outline":"none",
				    "border-bottom":"2px solid transparent",
				    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
				    "border-image-slice": "1"})
		        $(".next_find_pwd").prop('disabled' , false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white').css('border-radius', '10px');
		        $("#mail_check_input_id").attr('disabled' , true)
		        $('.mail_check_button').attr('disabled' , true);
		        $(".mail_input").attr('readonly' , true);
		        $(".mail_check_input").attr('readonly' , true);
		        
		     }else{                                              // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.css("color", "red");
		        $(".next_find_pwd").prop('disabled' , true)
		        $('.mail_check_button').attr('disabled' , false)
		        $(".mail_input").attr('readonly' , false);
		        $(".mail_check_input").attr('readonly' , false);
		    }    
		    
		});
				    
		function startTimer(count, display){
		            
		    		var minutes, seconds;
		            timer = setInterval(function () {
		            minutes = parseInt(count / 60, 10);
		            seconds = parseInt(count % 60, 10);
		     
		            minutes = minutes < 10 ? "0" + minutes : minutes;
		            seconds = seconds < 10 ? "0" + seconds : seconds;
		     
		            display.html(minutes + ":" + seconds);
		     
		            // 타이머 끝
		            if (--count < 0) {
		    	     clearInterval(timer);
		    	     alert("유효시간초과");
		    	     location.reload();
		    	     isRunning = false;
		            }
		        }, 1000);
		             isRunning = true;
		}
	}
        });
	});
		
	</script>
</head>
<body>
<a href="${pageContext.request.contextPath}/login.do"><h1>We Are <br>
Travelers!
</h1></a>
<main class="find_pwd_main">
<form class="find_form_id" name="joinForm" action="${pageContext.request.contextPath}/result_pwd.do" method="post">

    <div class="guide_box">
      <p class="join_guide_2">찾으실 아이디(이메일)의<p/>
      <p>새로운 비밀번호 발급을 위해 인증을 진행해 주세요</p>
    </div>
    
   <div id="mail_input-area">
    <div class="mail_input_box">
    <label>이메일
        <input class="mail_input" id="mail_input_id" name="member_id">
    </label>
    
   <div class="mail_check_button_wrap">   
      <button type="button" class="mail_check_button">인증번호</button> 
   </div>
   </div>  
   <span class="mail_input_check"></span>  
   <br><br>
   
   <!-- 인증번호 입력 및 체크 -->
    <div class="mail_check_number_wrap">
    <label id="mail_check_number_id">인증번호
        <input type="hidden" class="mail_check_input" id="mail_check_input_id">
    </label>   
    
    <div class="time"></div>
    </div>  
    <span class="mail_check_input_box_warn"></span>
    </div>
    
    <div class="next_wrap_find">
	<button type="submit" class="next_find_pwd" value="다음" style="font-size:1.3em">비밀번호 재설정</button>
	</div>
	
</form>  
</main>
</body>
</html>