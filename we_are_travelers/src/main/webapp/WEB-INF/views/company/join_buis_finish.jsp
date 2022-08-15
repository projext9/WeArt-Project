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
<form name="join_form_info" id="join_com_finish" method="post" action="/travelers/joinCompanyProcess.do">
<input type="hidden" name="company_idx" value=${company_idx }>
<input type="hidden" name="company_buis_number" value=${company_buis_number }>
<input type="hidden" name="company_id"value=${company_id }>
<input type="hidden" name="company_pwd" value=${company_pwd }>
<input type="hidden" name="company_name" value=${company_name }>
<input type="hidden" name="company_ceo_name" value=${company_ceo_name }>
<input type="hidden" name="company_buis_address" value=${address }${detail_address }>
<input type="hidden" name="company_auth_origin_file" value=${company_auth_origin_file }>
<input type="hidden" name="company_auth_system_file" value=${company_auth_system_file }>
<input type="hidden" name="company_ip" value=${company_ip }>
<div class="next_finish_wrap">
<button type="submit" class="next_finish" style="font-size:1.3em">로그인 페이지 이동</button>
</div>
</form>
</main>
</body>
</html>