<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액티비티 화면 보여주기</title>
</head>
<body>
	<c:forEach var="MapList" items="${mapVo}">
		<table border="1px">
			<tr>
				<td>번호</td>
				<td>${mapVo.map_idx}</td>
			</tr>
			<tr>
				<td>회사이름</td>
				<td>${mapVo.company_name}</td>
			</tr>
			<tr>
				<td>업체주소</td>
				<td>${mapVo.map_region}</td>
				<td>${mapVo.map_addr}</td>
			</tr>
			<tr>
				<td>게시일</td>
				<td>${mapVo.map_date}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>