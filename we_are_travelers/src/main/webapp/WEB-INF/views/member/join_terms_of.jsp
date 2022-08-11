<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 회원가입 이용약관</title>
<link href="${pageContext.request.contextPath}/resources/css/weart_join_terms_of.css" rel="stylesheet" />
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
$(document).ready(function() {
	
	$('.next_terms_of').prop('disabled', true);
	
	$('input[type=checkbox]').on("input", function() {
		var is_checked = true;
		var agree_1 =$("#check_1").prop("checked");
		var agree_2 =$("#check_2").prop("checked");
		
	if(agree_1 && agree_2 == is_checked) {
		$('.next_terms_of').prop('disabled', false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white');
	}else{
		$('.next_terms_of').prop('disabled', true);
	}  
	});
});
});
</script>
</head>
<body>
<h1>We Are Travelers!</h1>
<main class="join_cont_terms_of">
<div class="multi_box">
    <progress value="20" max="100"></progress>
    <br>
    <div class="guide_box">
      <h2 class="join_guide">위아트 계정
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
  <hr style="border:none; border-bottom: 2px solid #5151E5;" >
  <li class="list_1">
  <input type="checkbox" id="check_1" class="normal" >
  <label for="check_1"><strong>일반회원 이용약관에 동의합니다.(필수)</strong></label><a target="_blank" href="/travelers/WeArtTermsOfService.do">&nbsp;&nbsp;&nbsp;&#10140;</a>
   </li>
   <li class="list_2">
  <input type="checkbox" id="check_2" class="normal" >
  <label for="check_2"><strong>일반회원 개인정보 처리방침에 동의합니다.(필수)</strong></label><a target="_blank" href="/travelers/WeArtPersnolInfo.do">&nbsp;&nbsp;&nbsp;&#10140;</a>
  </li>
  <li class="list_3">
  <input type="checkbox" id="check_3" class="normal" >
  <label for="check_3"><strong>일반회원 마케팅 수신에 동의합니다.(선택)</strong></label><a target="_blank" href="/travelers/WeArtMarketing.do">&nbsp;&nbsp;&nbsp;&#10140;</a>
  </li>
  </ul>
</div>
<div class="next_terms_of_wrap">
<button class="next_terms_of" type="button" style="font-size:1.3em" onclick="location.href='/travelers/joinNext.do'">확인</button>
</div>
</main>
</body>
</html>