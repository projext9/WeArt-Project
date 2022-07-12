<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/join_member.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			
			$("#member_id").on('focusout' , function(){
				
				let member_id = $("#member_id").val();
				
				$.ajax({
					type:'post',
					url:"/travelers/checkId.do",
					data: {"member_id":member_id},
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 아이디입니다.";
							$("#result_checkId").html(result).css("color", "green");
							$("#member_pw").trigger("focus");
						}else{
							result = "이미 사용중인 아이디입니다.";
							$("#result_checkId").html(result).css("color", "red");
							$("#member_id").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
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
	<input type="email" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)" />
	<div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div>
	<input type="submit" value="다음">
	<input type="reset"  value="취소하기">
</form> 
</main>
</div>
</body>
</html>        