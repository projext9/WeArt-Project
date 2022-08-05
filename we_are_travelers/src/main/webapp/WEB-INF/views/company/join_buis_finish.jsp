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
<div>idx:${idx }</div>
<div>b_no:${b_no }</div>
<div>email:${email }</div>
<div>pwd:${company_pwd }</div>
<div>company name:${company_name }</div>
<div>address:${address }${detail_address }</div>
<div>auth_name:${company_auth_file }</div>
<div>auth_system_name:${company_auth_system_file }</div>
<div>ip${company_ip }</div>
<div style="text-align : center;">
<form name="join_com_info" id="join_com_finish" method="post" action="/travelers/joinCompanyProcess.do">
<input type="hidden" name="company_idx" value=${idx }>
<input type="hidden" name="company_buis_number" value=${b_no }>
<input type="hidden" name="company_id"value=${email }>
<input type="hidden" name="company_pwd" value=${pwd }>
<input type="hidden" name="company_name" value=${company_name }>
<input type="hidden" name="company_ceo_name" value=${ceo }>
<input type="hidden" name="company_buis_address" value=${address }${detail_address }>
<input type="hidden" name="company_auth_file" value=${company_auth_file }>
<input type="hidden" name="company_auth_system_file" value=${company_auth_system_file }>
<input type="hidden" name="company_ip" value=${company_ip }>
<input type="submit" name=""value="회원가입 완료">
</form>
</div>
</body>
</html>