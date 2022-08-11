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
	
	var code = "";
	var timer = null;
	var isRunning = false;
	
	$(function(){
		 $("#mail_check_number_id").hide();
		/*인증번호 버튼 클릭시 유효성 및 중복 검사 후 통과 시 인증번호 발송*/
		$('.mail_check_button').on('click' , function(){
			
			var email = $(".mail_input").val(); //이메일 input 입력값
			var display = $('.time'); // 타이머 class
	    	var leftSec = 180; //3분      
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 알파벳+숫자@알파벳+숫자
			var member_id = $(".mail_input").val(); // 입력한 이메일     
			
			if(exptext.test(email)==false){
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

				$(".mail_input_check").html("이메일형식이 올바르지 않습니다.").css("color" , "red");
				
	            $(".mail_input").focus();

			     return false; // 함수 동작 중단
			     
	        }else{
	        	
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/checkId.do",
				data: {"member_id":member_id},
				success: function(data){
					if(data == 'N'){
						result = "사용 가능한 아이디입니다.";
						$(".mail_input_check").html(result).css("color", "green");
						
						$.ajax({
							
					        type:"GET",
					        url:"mailCheck?email=" + email,
					        success:function(data){
					        	
					        	
					            $(".mail_check_input").attr('type' , 'text');
					            if(isRunning){
						    		clearInterval(timer);
						    		display.html("");
						    		startTimer(leftSec, display);
						    		
					            }else{	
					            $("#mail_check_number_id").show();
					            startTimer(leftSec, display);	          
					            alert("인증번호가 전송되었습니다.")
					            code = data;
					            }
					            
					            console.log("data : " + data);
					        }
					        
					});
					}else{
						result = "이미 사용중인 아이디입니다.";
						$(".mail_input_check").html(result).css("color", "red");
						$(".mail_input").val("").trigger("focus");
						
						return false;
					}
				},
				error: function(error){alert(error);}
			});
			
			
			    
			 
		/* 인증번호 비교 */
		$(".mail_check_input").on('blur' , function(){
		    
		    var inputCode = $(".mail_check_input").val();         // 입력코드값  
		    var checkResult = $(".mail_check_input_box_warn");    // 비교 결과     
		   
		    
		    if(inputCode == code){                                // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.css("color", "green");
		        $(".next").attr('disabled' , false).css('background' , '#0DCAF0').css('color' , 'white').css('border', '1px solid white');
		        
		        $("#mail_check_input_id").attr('disabled' , true)
		        $('.mail_check_button').attr('disabled' , true);
		        $(".mail_input").attr('readonly' , true);
		        $(".mail_check_input").attr('readonly' , true);
		        
		    } else {                                              // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.css("color", "red");
		        $(".next").attr('disabled' , true)
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
<h1 style="text-align:center;">We Are Travelers!</h1>
<main class="join_cont_email">
<form class="join_form" name="joinForm" action="/travelers/joinNext2.do" method="post">
  <div class="join_container_email">
    
    <br>
    <div>
    <progress value="20" max="100"></progress>
    
    </div>
    <br>
      <p class="join_guide_1">위아트 계정으로 사용할 이메일(아이디)를 입력해주세요 <p/>
    <br>  
     <!-- 메일 입력 및 인증번호 발송 -->
     <div id="mail_input-area">
    <div class="mail_input_box">
    <label>이메일
        <input class="mail_input" id="mail_input_id" name="email">
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
    
    </div>
    <div class="next_wrap_email">
	<button type="submit" class="next_email" value="다음" disabled="disabled" style="font-size:1.3em">다음</button>
	</div>
</form> 
</main>
</body>
</html>        