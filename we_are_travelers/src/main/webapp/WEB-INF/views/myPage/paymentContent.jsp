<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제내역</title>
</head>
<body>
	<main style = "margin : 0% 20% 10% 20%;">
		<%@include file = "./navMy2.jsp" %><br><br>
		<table class = "table">
			<thead>
				<tr style = "text-align:center;">
					<th>상품정보</th><th>주문일자</th><th>주문번호</th><th>주문금액</th><th>주문상태</th>
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="orderVo" items="${paymentContent}">
					<tr style="text-align:center;">
						<td>${orderVo.order_idx}</td>
						<td>${orderVo.order_itemName}</td>
						<td>${orderVo.order_price}</td>
						<td>${orderVo.order_totalPrice}</td>
						<td>
							<c:choose>
								<c:when test="${orderVo.order_state2 eq 'A'}"><span style="color:red;">발송대기</span></c:when>
								<c:when test="${orderVo.order_state2 eq 'B'}"><span style="color:green;">배송중</span></c:when>
								<c:when test="${orderVo.order_state2 eq 'C'}"><span style="color:blue;">배송완료</span></c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>