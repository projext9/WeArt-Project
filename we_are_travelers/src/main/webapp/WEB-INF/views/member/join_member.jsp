<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 회원가입 이용약관</title>
<link href="${pageContext.request.contextPath}/resources/css/Terms_of_service.css" rel="stylesheet" />
</head>
<body>
<div class="agree_box">
<label for="agree_all">
  <input type="checkbox" name="agree_all" id="agree_all">
  <span>모두 동의합니다</span>
</label>
<ul class="agree_list">
<li>
<label for="agree">
<input type="checkbox" name="agree" value="1">
  <span>이용약관 동의<strong>(필수)</strong></span>
</label>
</li>
 <li>
<label for="agree">
 <input type="checkbox" name="agree" value="2">
  <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
</label>
</li>
 <li>
 <label for="agree">
  <input type="checkbox" name="agree" value="3">
 <span>마케팅 정보 수신동의<strong class="select_disable">(선택)</strong></span>
</label>
</li>
</div>
</ul>
 <button class="join_agree" onclick="location.href='/travelers/join_Member_email.do'" type="button">동의</button>
</body>
</html>