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
});
</script>
</head>
<div class="checkbox_group">
  <ul class="agree_list">
  <li>
  <input type="checkbox" id="check_all" >
  <label for="check_all">전체 동의</label>
  </li>
  <li>
  <input type="checkbox" id="check_1" class="normal" >
  <label for="check_1">기업회원 이용약관에 동의합니다.(필수)</label><a target="_blank" href="/travelers/CompanyTermsOfService.do"> > </a>
   </li>
   <li>
  <input type="checkbox" id="check_2" class="normal" >
  <label for="check_2">기업회원 개인정보 처리방침에 동의합니다.(필수)</label><a target="_blank" href="/travelers/CompanyInfo.do">></a>
  </li>
  <li>
  <input type="checkbox" id="check_3" class="normal" >
  <label for="check_3">기업회원 개인정보의 제3자 제공동의.(필수)</label><a target="_blank" href="/travelers/CompanyInfo_other.do">></a>
  </li>
  <li>
  <input type="checkbox" id="check_3" class="normal" >
  <label for="check_3">기업회원 마케팅 수신에 동의합니다.(선택)</label><a target="_blank" href="/travelers/CompanyMarketing.do">></a>
  </li>
  <input type="button" class="join_agree" value="확인" onclick="location.href='/travelers/join_com_next.do'" >
  </ul>
</div>
 
</body>
</html>