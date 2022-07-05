<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>관리자페이지</title>
</head>
<body>

	<%@include file="./nav.jsp" %>
	<h2>Hello, Administrator!</h2>
	
	<h3>관리자 페이지입니다</h3>
	
	<hr/>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="/travelers/memberList.do">회원리스트</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">구매내역</a>
	  </li>
	</ul>
	<a href="/travelers/memberList.do">회원목록보기</a><p/>
	<a href="/travelers/home.do">메인페이지2</a>
</body>
</html>
