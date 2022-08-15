<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 기업회원 이용약관</title>
<link href="${pageContext.request.contextPath}/resources/css/company_join_terms_of.css" rel="stylesheet"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function() {
// 체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
		
	$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));	  
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
});

//필수체크 만족하면 버튼 활성화
$(document).ready(function() {
	
	$('.next_terms_of').prop('disabled', true);
	
	$('input[type=checkbox]').on("input", function() {
		var is_checked = true;
		var agree_1 =$("#check_1").prop("checked");
		var agree_2 =$("#check_2").prop("checked");
		var agree_3 =$("#check_3").prop("checked");
		
	if(agree_1 && agree_2 && agree_3 == is_checked) {
		$('.next_terms_of').prop('disabled', false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white');
	}else{
		$('.join_agree').prop('disabled', true);
	}  
	});
  });
});
</script>
</head>
<body>
<h1>We Are Travelers!
<br>&nbsp;
for Company</h1>
<main class="join_cont_terms_of_company">
<div class="multi_box">
    <progress value="16" max="100"></progress>
    <br>
    <div class="guide_box">
      <h2 class="join_guide">위아트 기업계정
      <br>
       이용약관에 동의해주세요</h2>
    </div>
    </div>
<div class="checkbox_group">
  <ul class="agree_list">
  <li>
  <input type="checkbox" id="check_all" >
  <label for="check_all"><strong>모두 동의합니다.</strong></label>
  <p>모두 동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며,
  개별적으로도 동의를 선택하실 수 있습니다.
  선택항목에 대한 동의를 거부하시는 경우에도 서비스는 이용이 가능합니다.</p>
  </li>
<li class="list_1">
  <input type="checkbox" id="check_1" class="normal" >
  <label for="check_1">기업회원 이용약관에 동의합니다.(필수)</label><a target="_blank" href="/travelers/CompanyTermsOfService.do"> > </a>
   </li>
   <hr style="border:none; border-bottom: 2px solid #5151E5;" >
     <li class="list_2">
  <input type="checkbox" id="check_2" class="normal" >
  <label for="check_3">기업회원 개인정보 처리방침에 동의합니다.(필수)</label><a target="_blank" href="/travelers/CompanyInfo.do">></a>
  </li>
   <li class="list_3">
  <input type="checkbox" id="check_3" class="normal" >
  <label for="check_3">기업회원 개인정보의 제3자 제공동의.(필수)</label><a target="_blank" href="/travelers/CompanyInfo_other.do">></a>
  </li>
    <li class="list_4">
  <input type="checkbox" id="check_4" class="normal" >
  <label for="check_3">기업회원 마케팅 수신에 동의합니다.(선택)</label><a target="_blank" href="/travelers/CompanyMarketing.do">></a>
  </li>
  </ul>
</div>
<div class="next_terms_of_wrap">
<button class="next_terms_of" onclick="location.href='${pageContext.request.contextPath}/join_com_next.do'">확인</button>
 </div>
 </main>
</body>
</html>