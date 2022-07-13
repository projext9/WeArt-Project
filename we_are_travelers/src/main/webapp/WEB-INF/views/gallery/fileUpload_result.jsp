<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 업로드 확인페이지</title>
</head>
<body>

	<h3>갤러리 업로드 확인페이지입니다...</h3>
	<a href="${pageContext.request.contextPath}/gallery_home.do">갤러리 홈</a>
	<hr/>
	 
	<div><img src="${pageContext.request.contextPath}/resources/upload/${fileName}"/></div>
	<div>${content}</div>
	
</body>
</html>