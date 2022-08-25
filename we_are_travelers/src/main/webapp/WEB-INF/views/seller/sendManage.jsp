<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송관리</title>
</head>
<body>
	<main style = "margin : 0% 20% 10% 20%;">
		<%@include file = "./navSeller3.jsp" %><br><br>	    
		<table class = "table">
			<thead>
				<tr style = "text-align:center;">
					<th>주문번호</th>
					<th>상품이름</th>
					<th>갯수</th>
					<th>주문금액</th>
					<th>받는이</th>
					<th>주소</th>
					<th>폰번호</th>
					<th>주문상태</th>
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="map" items="${ItemOrderMap}">
					<tr style="text-align:center;">
						<td>${map.orderLast_num}</td>
						<td>${map.order_itemName}&nbsp;${map.order_optionName}</td>
						<td>${map.order_count}</td>
						<td>${map.order_price}</td>
						<td>${map.orderLast_name}</td>
						<td>${map.orderLast_address}</td>
						<td>${map.orderLast_phone}</td>
						<td>
							<select id="orderLast_state2" name="orderLast_state2">
								<option value="1">발송대기</option>
								<option value="2">배송중</option>
								<option value="3">배송완료</option>
							</select>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>