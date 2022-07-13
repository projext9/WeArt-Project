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
	$(function() {
	$(".mail_check_button").click(function() {
		
		var email = $(".member_id").val();
		
		$.ajax({
			
			type:"GET",
			url:"mailCheck?member_id=" + member_id
		});
		
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
	<input type="email" class="member_id" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)" />

<div class="mail_check_button">
	<span>본인인증</span>
</div>

<div class="mail-check-wrap">
      <input class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
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