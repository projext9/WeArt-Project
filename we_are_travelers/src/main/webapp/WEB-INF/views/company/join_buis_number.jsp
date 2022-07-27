<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="${pageContext.request.contextPath}/resources/css/weart_join_form.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(function() {
		
   $('#b_no').on('focusout' , function(){
	var b_no = {
		    "b_no": [$('#b_no').val()] // 사업자번호 "xxxxxxxxx" 로 조회 시,
		   };
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=5OCcftiK2BWuF05vmSimJ3TNjuhd1x25verVxMG30iwobpZDOnNM55UTbJ2jLjGqhk0niBb2PQTcKgj8DkHGKQ==", 
		  type: "POST",
		  data: JSON.stringify(b_no), // json 을 string으로 변환하여 전송
		  dataType: "text",
		  contentType: "application/json",
		  accept: "application/json",
		  async : false,
		  success: function(data) {
			  var check1 ="유효한 사업자 등록번호입니다."
			  var check2 ="휴.폐업처리된 사업자입니다. 회원가입을 진행 하실 수 없습니다."
			  var check3 ="유효하지 않은 사업자 등록번호입니다."
					  
			  var obj = JSON.parse(data);
			  
			  if(obj['data'][0].b_stt_cd == '01') {
				  $('.no_b').html(check1).css('color','green');
			  }else if(obj['data'][0].b_stt_cd == ""){
				  $('.no_b').html(check3).css('color','red');
			  }else if(obj['data'][0].b_stt_cd == '02' || '03'){
				  $('.no_b').html(check2).css('color','red');
				  
		  }
		      console.log(data);
		  },
		  error: function(data) {
		      console.log(data.responseText); //responseText의 에러메세지 확인
		  }
		});
	
	});
   
});
	
	</script>

</head>

<body>

<h3>회원정보를 입력해주세요</h3>

<form name="joinCompanyForm" action="/travelers/join_com_next2.do" method="post">
    <input type="text" name="b_no" id="b_no" maxlength="10" placeholder="사업자 등록번호" />
    <span class="no_b"></span>     
	<input type="submit" value="다음">
</form> 

</body></html>        