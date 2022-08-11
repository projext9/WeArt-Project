<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구매목록</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file = "../nav/navMember2.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">
	<h3>구매목록</h3>
	<hr/>
	<table class = "table">
		<thead>
			<tr style="text-align:center;">
				<th>번호</th><th>	주문번호</th><th>주문일자</th><th>주문금액</th><th>주문상태</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="orderVo" items="${orderListContent}">
				<tr style="text-align:center;">
					<td>${orderVo.order_idx}</td>
					<td>${orderVo.order_itemName}</td>
					<td>${orderVo.order_price}</td>
					<td>${orderVo.order_totalPrice}</td>
					<td>${orderVo.order_state1}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>