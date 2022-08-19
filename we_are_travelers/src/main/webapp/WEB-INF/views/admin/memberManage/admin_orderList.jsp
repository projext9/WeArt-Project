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
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/orderList.do" method = "get">
        <table style = "text-align:right">
            <tr style="text-align:center;">
                <td>
                	<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                   		<option value = "num">주문번호</option>
                        <option value = "date">주문일</option>
                    </select>
                </td>
                <td>
                    <input type = "text" name = "keyword" size = "30">
                </td>
                <td>
                    <button class="btn btn-outline-secondary" type="submit" name="submit">검색</button>
                </td>
            </tr>
        </table>
    </form>
	<table class = "table">
		<thead>
			<tr style="text-align:center;">
				<th>번호</th><th>	주문번호</th><th>주문일자</th><th>주문금액</th><th>주문상태</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="orderLastVo" items="${orderList}">
				<tr style="text-align:center;">
					<td>${orderLastVo.orderLast_idx}</td>
					<td><a href = "${pageContext.request.contextPath}/orderListContent.do?orderLast_num=${orderLastVo.orderLast_num}">${orderLastVo.orderLast_num}</a></td>
					<td>${orderLastVo.orderLast_payDate}</td>
					<td>${orderLastVo.orderLast_totalPrice}</td>
					<td>
						<c:choose>
							<c:when test="${orderLastVo.orderLast_state2 eq 'A'}">발송대기</c:when>
							<c:when test="${orderLastVo.orderLast_state2 eq 'B'}">배송중</c:when>
							<c:when test="${orderLastVo.orderLast_state2 eq 'C'}">배송완료</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev==true}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/orderList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<c:choose>
				<c:when test="${i==scri.page}">
					<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/orderList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/orderList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${pm.next&&pm.endPage>0}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/orderList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
		    </li>
		</c:if>
	</ul>
</body>
</html>