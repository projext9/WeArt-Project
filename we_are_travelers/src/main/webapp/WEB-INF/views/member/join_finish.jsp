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
${email }
${pwd }
${nick }
${name }
${birth }
<form name="join_info" id="join_finish" method="post" action="/travelers/joinMemberProcess.do">
<input type="hidden" name="member_id"value=${email }>
<input type="hidden" name="member_pwd" value=${pwd }>
<input type="hidden" name="member_nick" value=${nick }>
<input type="hidden" name="member_name"value=${name }>
<input type="hidden" name="member_birth"value=${birth }>
<input type="submit" name=""value="회원가입 완료">
</form>
</body>
</html>