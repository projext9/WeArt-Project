<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 홈페이지</title>
</head>
<body>

	<h3>갤러리 홈입니다...</h3>
	<a href="${pageContext.request.contextPath}/home.do">메인페이지</a>
	<hr/>
	
	<c:forEach var="galleryVo" items="${galleryList}">
		<div style="float:left;margin-left:10px;margin-top:7px;height:230px;">
			<img src="${pageContext.request.contextPath}/resources/upload/${galleryVo.system_filename}" 
				style="width:300px;height:200px;"/><br/>
			${galleryVo.gallery_content}				
		</div>
	</c:forEach>
	
</body>
</html>