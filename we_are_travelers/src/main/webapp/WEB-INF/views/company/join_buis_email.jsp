<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/weart_company_form.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	var code = "";
	var timer = null;
	var isRunning = false;
	
	$(function(){
		
		$("#mail_check_number_id").hide();
		/*인증번호 버튼 클릭시 유효성 및 중복 검사 후 통과 시 인증번호 발송*/
		$('.com_mail_check_button').on('click' , function(){
			
			var email = $(".com_mail_input").val(); //이메일 input 입력값
			var display = $('.time'); // 타이머 class
	    	var leftSec = 180; //3분      
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 알파벳+숫자@알파벳+숫자
			var company_id = $(".com_mail_input").val(); // 입력한 이메일     
			
			if(exptext.test(email)==false){
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

				$(".com_mail_input_check").html("이메일형식이 올바르지 않습니다.").css("color" , "red");
				
	            $(".com_mail_input").focus();

			     return false; // 함수 동작 중단
			     
	        }else{
	        	
			$.ajax({
				type:'post',
				url:"/travelers/checkComId.do",
				data: {"company_id":company_id},
				success: function(data){
					if(data == "N"){
						result = "사용 가능한 아이디입니다.";
						$(".com_mail_input_check").html(result).css("color", "green");
						$('.com_mail_input').css({
								"outline":"none",
							    "border-bottom":"2px solid transparent",
							    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
							    "border-image-slice": "1"})
					    $(".com_mail_check_input").attr('type' , 'text');
						$("#mail_check_number_id").show();	
						startTimer(leftSec, display);	
						
						$.ajax({
							
					        type:"GET",
					        url:"mailCheck?email=" + email,
					        success:function(data){
					     	
					            if(data != null)		
					                      
					            alert("인증번호가 전송되었습니다.")
					            
					            code = data;
					                 
					            console.log("data : " + data);
					        }
					        
					});
						
					}else{
						result = "이미 사용중인 아이디입니다.";
						$(".com_mail_input_check").html(result).css("color", "red");
						$(".com_mail_input").val("").trigger("focus");
						
						return false;
					}
				},
				error: function(error){alert(error);}
			});
			    
	
		/* 인증번호 비교 */
		$(".com_mail_check_input").on('keyup' , function(){
		    
		    var inputCode = $(".com_mail_check_input").val();        // 입력코드    
		    var checkResult = $(".com_mail_check_input_box_warn");    // 비교 결과     
		    
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.css("color", "green");
		        $('.com_mail_check_input').css({
					"outline":"none",
				    "border-bottom":"2px solid transparent",
				    "border-image":"linear-gradient(to right top, #5151E5, #72EDF2)",
				    "border-image-slice": "1"})
		        $(".next_email").attr('disabled' , false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white').css('border-radius', '10px');	       
		        $('.com_mail_check_button').attr('disabled' , true);
		        $(".com_mail_input").attr('readonly' , true);
		        $(".com_mail_check_input").attr('readonly' , true);
		        
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.css("color", "red");
		        $(".next_email").attr('disabled' , true);       
		        $('.com_mail_check_button').attr('disabled' , false);
		        $(".com_mail_input").attr('readonly' , false);
		        $(".com_mail_check_input").attr('readonly' , false);
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
		    	     display.html("유효시간초과");
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
<h1 style="text-align:center;">We Are Travelers!
<br>for Company
</h1>
<main class="join_cont_email">
<form class="join_form" name="joinForm" action="/travelers/join_com_next3.do" method="post">

	<input type="hidden" name="company_buis_number" value="${company_buis_number }">

    <br>
    <div class="multi_box1">
    <progress value="48" max="100"></progress>
    <br>
    <div class="guide_box">
      <h2 class="join_guide1">위아트 계정으로
      <br>      
      사용할 이메일(아이디)를 입력해주세요</h2>
    </div>
    </div>
     <br>
       
      <!-- 메일 입력 및 인증번호 발송 -->
     <div id="mail_input-area">
    <div class="mail_input_box">
    <label>이메일
        <input class="com_mail_input" id="com_mail_input_id" name="company_id">   
   </label> 
   <button type="button" class="com_mail_check_button">인증번호</button> 
    </div>
    <span class="com_mail_input_check"></span>
      </div>
       <div class="next_wrap_email">
	<button type="submit" class="next_email" value="다음" disabled="disabled" style="font-size:1.3em">다음</button>
	</div>
   </form> 
    
    <!-- 인증번호 입력 및 체크 -->
    <div class="mail_check_number_wrap"> 
    <label id="mail_check_number_id">인증번호
        <input type="hidden" class="com_mail_check_input">   
    </label>  
    
      <div class="time"></div>
   </div>
       <span class="com_mail_check_input_box_warn"></span>
 
    
   

</main>
</body>
</html>        