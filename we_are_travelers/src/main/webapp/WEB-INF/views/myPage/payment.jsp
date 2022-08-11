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
		<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/payment.do" method = "get">
	        <table>
	            <tr>
	                <td>
	                    <select name = "searchType">
	                     	<option value = "num">주문번호</option>
	                   		<option value = "date">주문일자</option>
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
					<th>번호</th><th>주문번호</th><th>주문일자</th><th>받는사람</th>
					<th>전화번호</th><th>주문금액</th><th>배송지</th><th>주문상태</th>
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="orderLastVo" items="${payment}">
					<tr>
						<td>${orderLastVo.orderLast_idx}</td>
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
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev==true}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/payment.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<c:choose>
					<c:when test="${i==scri.page}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/payment.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/payment.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		    <c:if test="${pm.next&&pm.endPage>0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/payment.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
			    </li>
			</c:if>
		</ul>
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