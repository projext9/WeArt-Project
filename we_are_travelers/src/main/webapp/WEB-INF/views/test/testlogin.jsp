<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>

<h3>로그인</h3>

<form name="loginForm" action="${pageContext.request.contextPath}/testloginProcess.do" method="post">
	<input type="text" name="member_id" value="" maxlength="80" placeholder="아이디(이메일)" /><br/>
	<input type="text" name="member_pw"  value="" maxlength="20" placeholder="비밀번호"><br/>            
	<input type="submit" value="로그인">
	<input type="reset"  value="취소">
</form> 

</body>
</html>        