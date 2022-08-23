<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="${pageContext.request.contextPath}/resources/css/weart_company_form.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(function() {
		
	$('.next_number').prop('disabled', true);
	
   $('#buis_number_input').on('keyup' , function(){
	  
	var company_buis_number = {
		    "b_no": [$('#buis_number_input').val()] // 사업자번호 "xxxxxxxxx" 로 조회 시,
		   };
	
		$.ajax({
		  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=5OCcftiK2BWuF05vmSimJ3TNjuhd1x25verVxMG30iwobpZDOnNM55UTbJ2jLjGqhk0niBb2PQTcKgj8DkHGKQ==", 
		  type: "POST",
		  data: JSON.stringify(company_buis_number), // json 을 string으로 변환하여 전송
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
				  $('.next_number').prop('disabled', false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color', 'white');
			  }else if(obj['data'][0].b_stt_cd == ""){
				  $('.no_b').html(check3).css('color','red');
				  $('.next_number').prop('disabled', true).css('background' , '').css('border-radius', '');
			  }else if(obj['data'][0].b_stt_cd == '02' || '03'){
				  $('.no_b').html(check2).css('color','red');
				  $('.next_number').prop('disabled', true).css('background' , '').css('border-radius', '');;
				  
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
<h1>WeAreTravelers!
<br>&nbsp;
for Company</h1>
<main class="join_cont_number">
<form name="joinCompanyForm" action="/travelers/join_com_next2.do" method="post">
      <div class="multi_box1">
    <progress value="32" max="100"></progress>
    <br>
    <div class="guide_box">
      <h2 class="join_guide1">위아트 기업계정
      <br>      
      사업자등록번호를 입력해주세요</h2>
    </div>
    </div>
    <br>
    <input type="text" id="buis_number_input" name="company_buis_number" maxlength="10" placeholder="사업자 등록번호를 입력해주세요" />
    <p class="no_b"></p>     
	 <div class="next_wrap_number">
	<button type="submit" class="next_number" >다음</button>
	</div>
</form> 
</main>
</body>
</html>        