<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액티비티 화면 보여주기</title>
</head>
<body>
	<table border="1px">
		<tr style="color: green;">
			<td>번호</td>
			<td>회사이름</td>
			<td>업체지역</td>
			<td>업체주소</td>
			<td>게시일</td>

		</tr>
		<c:forEach var="mapVo" items="${mapList}">

			<c:if test="${mapVo.map_code == 4}">
				<tr>
					<td>${mapVo.map_idx}</td>
					<td>${mapVo.company_name}</td>
					<td>${mapVo.map_region}</td>
					<td><a href="${pageContext.request.contextPath}/activityMap.do?map_idx=${mapVo.map_idx}">${mapVo.map_addr}</a></td>
					<td>${mapVo.map_date}</td>
				</tr>

			</c:if>
		</c:forEach>
	</table>
</body>
</html>