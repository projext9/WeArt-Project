<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>판매상품</title>
</head>
<body>
	<main style = "margin : 0% 20% 10% 20%;">
		<%@include file = "./navSeller2.jsp" %><br><br>	    
		<table class = "table">
			<thead>
				<tr style = "text-align:center;">
					<th>번호</th><th>코드</th><th>상품명</th>
					<th>삭제</th>
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="itemVo" items="${itemVoList}">
					<tr style="text-align:center;">
						<td>${itemVo.item_idx}</td>
						<td>${itemVo.item_code}</td>
						<td><a href = "${pageContext.request.contextPath}/itemdetail.do?iidx=${itemVo.item_idx}&itemCode=${itemVo.item_code}">${itemVo.item_name}</a></td>
						<td><button class ="btn btn-secondary btn-sm">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>