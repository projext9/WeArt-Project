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
	$('#mail-Check-Btn').click(function() {
		const eamil = $('#member_id1').val() + $('#member_id2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/user/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil
	
	$('.mail-check').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
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
	<input type="email" name="member_id1" id="member_id1" value="" maxlength="80" placeholder="아이디(이메일)" />
	<select class="form-control" name="member_id2" id="member_id2" >
	<option>@naver.com</option>
	<option>@daum.net</option>
	<option>@gmail.com</option>
	<option>@hanmail.com</option>
	 <option>@yahoo.co.kr</option>
	</select>
<div class="input-group-addon">
	<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
</div>
<div class="mail-check-box">
      <input class="form-control mail-check" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
</div>
    <span id="mail-check-warn"></span>
</div>
	<input type="submit" value="다음">
	<input type="reset"  value="취소하기">
</form> 
</main>
</div>
</body>
</html>        