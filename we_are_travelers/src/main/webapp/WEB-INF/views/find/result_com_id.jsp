<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 아이디 비밀번호찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet" />
</head>
<body>
<a href="${pageContext.request.contextPath}/login.do"><h1>We Are <br>
Travelers!
</h1></a>
<main class="find_id_main">
<div class="result_id_box" style="font-size:25px; position:relative; top:-10%;">
<c:out value='"${company_name }"'/>님의 아이디는 <c:out value='"${company_id }"'/> 입니다.

   <div class="next_wrap_result">
	<button type="button" class="next_find" value="다음" style="font-size:1em" onclick='location.href="${pageContext.request.contextPath}/login.do"'>로그인 이동</button>
   </div>
</div>

</main>
</body>
</html>