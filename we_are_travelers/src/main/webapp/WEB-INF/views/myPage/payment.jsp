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
	<main style = "margin : 10% 10% 10% 10%;">
		
		<!-- 수정해야함 -->
		<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/memberList.do" method = "get">
	        <table>
	            <tr>
	                <td>
	                    <select name = "searchType">
	                   		<option value = "id">아이디</option>
	                        <option value = "nickname">닉네임</option>
	                    </select>
	                </td>
	                <td>
	                    <input type = "text" name = "keyword" size = "30">
	                </td>
	                <td>
	                    <input type = "submit" name = "submit" value = "검색">
	                </td>
	            </tr>
	        </table>
	    </form>
	    
		<table class = "table">
			<thead>
				<tr style = "text-align:center;">
					<th>주문번호</th><th>주문일자</th><th>받는사람</th><th>전화번호</th>
					<th>주문금액</th><th>배송지</th><th>주문상태</th>
					
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="orderLastVo" items="${payment}">
					<tr>
						<td><a href = "${pageContext.request.contextPath}/paymentContent.do?orderLast_num=${orderLastVo.orderLast_num}">${orderLastVo.orderLast_num}</a></td>
						<td>${orderLastVo.orderLast_payDate}</td>
						<td>${orderLastVo.orderLast_name}</td>
						<td>${orderLastVo.orderLast_phone}</td>
						<td>${orderLastVo.orderLast_totalPrice}</td>
						<td>${orderLastVo.orderLast_address}</td>
						<td>${orderLastVo.orderLast_state2}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table>
	        <tr>
	            <td style="width:200px; text-align:right;">
	            	<c:if test = "${pm.prev == true}">
	            		<a href = "${pageContext.request.contextPath}/payment.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}">◀</a>
	            	</c:if>
	            </td>
	            <td>
	            	<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
	            		<a href='${pageContext.request.contextPath}/payment.do?page=${i}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>${i}</a>
	            	</c:forEach>
	            </td>
	            <td style="width:200px; text-align:left;">
	            	<c:if test="${pm.next&&pm.endPage > 0}">
	            		<a href = '${pageContext.request.contextPath}/payment.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>▶</a>
	            	</c:if>
	            </td>
	        </tr>
	    </table>
	</main>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>