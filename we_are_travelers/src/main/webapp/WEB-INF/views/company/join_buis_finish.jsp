<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 완료!</h1>
${idx }
${b_no }
${email }
${pwd }
${company_name }
${address }${detail_address }
${company_auth }
<form name="join_com_info" id="join_com_finish" method="post" action="/travelers/joinCompanyProcess.do">
<input type="hidden" name="company_idx" value=${idx }>
<input type="hidden" name="company_buis_number" value=${b_no }>
<input type="hidden" name="company_id"value=${email }>
<input type="hidden" name="company_pwd" value=${pwd }>
<input type="hidden" name="company_name" value=${company_name }>
<input type="hidden" name="company_ceo_name" value=${ceo }>
<input type="hidden" name="company_buis_address" value=${address }${detail_address }>
<input type="hidden" name="company_auth" value=${company_auth }>
<input type="submit" name=""value="회원가입 완료">
</form>
</body>
</html>