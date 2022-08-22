<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 회원가입 완료</title>
    <link href="${pageContext.request.contextPath}/resources/css/weart_join_finish.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<main class="join_cont_finish">
<div>
<progress value="100" max="100"></progress>
</div>
<h1 id="finish_title">회원가입 완료!</h1>
<form class="join_form_info" name="join_info" id="join_finish" method="post" action="/travelers/joinMemberProcess.do">
<input type="hidden" name="member_idx"value=${idx }>
<input type="hidden" name="member_id"value=${email }>
<input type="hidden" name="member_pwd" value=${member_pwd }>
<input type="hidden" name="member_nick" value=${nick }>
<input type="hidden" name="member_name"value=${name }>
<input type="hidden" name="member_birth"value=${birth }>
<div class="next_finish_wrap">
<button type="submit" class="next_finish" style="font-size:1.3em">로그인 페이지 이동</button>
</div>
</form>
</main>
</body>
</html>