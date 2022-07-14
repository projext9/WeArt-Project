<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/join_member.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	
	$(function(){
		
		var code = "";
		
		/*인증번호 이메일 전송*/
		$('.mail_check_button').click(function(){
			
			var email = $(".mail_input").val();           // 입력한 이메일
			var checkBox = $(".mail_check_input");        // 인증번호 입력란
		    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
			
			$.ajax({
				
			        type:"GET",
			        url:"mailCheck?email=" + email,
			        success:function(data){
			            
			            console.log("data : " + data);
			            checkBox.attr('disabled' , false);
			            boxWrap.attr("id", "mail_check_input_box_true");
			            code = data;
			            alert("인증번호가 전송되었습니다.")
			        }   
			
			});
		    
			alert("ajax controller 전송")
			
		});
		
		/* 인증번호 비교 */
		$(".mail_check_input").blur(function(){
		    
		    var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
		    
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");        
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    }    
		    
		});
	});
		
	</script>
</head>

<body class="join_member">
<h1>We Are Travelers!</h1>
<div class="join_container">
<main class="join_cont">
<form class="join_form" name="joinForm" action="/travelers/joinProcess.do" method="post">

    <progress value="20" max="100"></progress>
    
      <p class="join_guide_1">위아트 계정으로 사용할 이메일(아이디)를 입력해주세요 <p/>
    <div class="mail_wrap">
    <div class="mail_name">이메일</div>
    <div class="mail_input_box">
        <input class="mail_input" name="member_id">
    </div>
    </div>
    <div class="mail_check_wrap">
    <div class="mail_check_input_box" id="mail_check_input_box_false">
        <input class="mail-check_input" disabled="disabled">
      </div>
      
   <div class="mail_check_button">
     <span>인증번호</span>
   </div> 
   
   <div class="clearfix">
    <span id="mail_check_input_box_warn"></span>
    </div>
    </div>

	<input type="submit" value="다음">
	<input type="reset"  value="취소하기">
</form> 
</main>
</div>
</body>
</html>        