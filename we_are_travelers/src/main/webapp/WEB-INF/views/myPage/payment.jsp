<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제내역</title>
</head>
<body>
	<main style = "margin : 0% 20% 10% 20%;">
		<%@include file = "./navMy2.jsp" %><br><br>
		<form class = "col-12">
			<div class="btn-group col-12 g-1">
				<select class="form-select" name="searchType" style="max-width:150px;">
                 	<option value = "num">주문번호</option>
               		<option value = "date">주문일자</option>
                </select>
				<input type="text" class="form-control" placeholder="${scri.keyword}" name="keyword">
				<button class="btn btn-outline-primary" type="submit"><i class="bi bi-search"></i></button>
			</div>
			<!-- <div>
				<select class="form-select" name = "searchType" style="max-width:100px;">
                 	<option value = "num">주문번호</option>
               		<option value = "date">주문일자</option>
                </select>
                <input type = "text" class="form-control" name = "keyword" size = "30">
				<button class="btn btn-outline-primary" type="submit"><i class="bi bi-search"></i></button>
			</div>
	        <table>
	            <tr>
	                <td>
	                    <select class="form-select" name = "searchType">
	                     	<option value = "num">주문번호</option>
	                   		<option value = "date">주문일자</option>
	                    </select>
	                </td>
	                <td>
	                    <input type = "text" class="form-control" name = "keyword" size = "30">
	                </td>
	                <td>
	                    <button class="btn btn-outline-primary" type="submit"><i class="bi bi-search"></i></button>
	                </td>
	            </tr>
	        </table> -->
	    </form>
	    
		<table class = "table">
			<thead>
				<tr style = "text-align:center;">
					<th>번호</th><th>주문번호</th><th>주문일자</th><th>받는사람</th>
					<th>전화번호</th><th>주문금액</th><th>주문상태</th>
				</tr>
			</thead>
			
			<tbody class = "table-group-divider">
				<c:forEach var="orderLastVo" items="${payment}">
					<tr style="text-align:center;">
						<td>${orderLastVo.orderLast_idx}</td>
						<td><a href = "${pageContext.request.contextPath}/paymentContent.do?orderLast_num=${orderLastVo.orderLast_num}">${orderLastVo.orderLast_num}</a></td>
						<td>${orderLastVo.orderLast_payDate}</td>
						<td>${orderLastVo.orderLast_name}</td>
						<td>${orderLastVo.orderLast_phone}</td>
						<td><fmt:formatNumber value="${orderLastVo.orderLast_totalPrice}" pattern="#,###,###"/>원</td>
						<td>
							<c:choose>
								<c:when test="${orderLastVo.orderLast_state2 eq 'A'}"><span style="color:red;">발송대기</span></c:when>
								<c:when test="${orderLastVo.orderLast_state2 eq 'B'}"><span style="color:green;">배송중</span></c:when>
								<c:when test="${orderLastVo.orderLast_state2 eq 'C'}"><span style="color:blue;">배송완료</span></c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev==true}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/payment.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<c:choose>
					<c:when test="${i==scri.page}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/payment.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/payment.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		    <c:if test="${pm.next&&pm.endPage>0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/payment.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
			    </li>
			</c:if>
		</ul>
	</main>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>