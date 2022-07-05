<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(function() {
		
   $('#b_no').on('focusout' , function(){
	   alert("테스트입니다")
	var data = {
		    "b_no": [""] // 사업자번호 "xxxxxxxxx" 로 조회 시,
		   };
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=5OCcftiK2BWuF05vmSimJ3TNjuhd1x25verVxMG30iwobpZDOnNM55UTbJ2jLjGqhk0niBb2PQTcKgj8DkHGKQ==", 
		  type: "POST",
		  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
		  dataType: "JSON",
		  contentType: "application/json",
		  accept: "application/json",
		  async : false,
		  success: function(result) {
			  if("b_stt_cd" , "01") {
				   $('#no_b').html('유효한 등록번호입니다.');
				   $('#no_b').attr('color','green');
			  }else if("b_stt_cd" , "03"){
				  $('#no_b').html('폐업 처리된 사업자번호입니다 회원가입을 진행하실수없습니다.');
				  $('#no_b').attr('color','red');
			  }else if("b_stt_cd" , ""){
				  $('#no_b').html('유효하지 않은 등록번호입니다.');
				   $('#no_b').attr('color','red');
		  }
		      console.log(result);
		  },
		  error: function(result) {
		      console.log(result.responseText); //responseText의 에러메세지 확인
		  }
		});
	
	});
});
	
	</script>

</head>

<body>

<h3>회원정보를 입력해주세요</h3>

<form name="joinCompanyForm" action="/travelers/joinProcess.do" method="post">
    <input type="text" name="b_no" id="b_no" maxlength="10" placeholder="사업자 등록번호" />
    <font id="no_b" size ="2"></font>
    
	<input type="email" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)" />
	<input type="button" id="checkId" value="중복검사"/><br/>
	<div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div>
	<input type="password" name="member_pw"  value="" maxlength="20" placeholder="비밀번호"><p/>            
	<input type="submit" value="가입하기">
	<input type="reset"  value="취소하기">
</form> 

</body></html>        