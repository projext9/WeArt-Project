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
                    <select name = "searchType">
                   		<option value = "num">주문번호</option>
                        <option value = "date">주문일</option>
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
					<td>${orderLastVo.orderLast_state2}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table style="margin-left:auto; margin-right:auto;">
        <tr>
            <td style="width:200px; text-align:right;">
            	<c:if test = "${pm.prev == true}">
            		<a href = "${pageContext.request.contextPath}/orderList.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}">◀</a>
            	</c:if>
            </td>
            <td>
            	<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
            		<a href='${pageContext.request.contextPath}/orderList.do?page=${i}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>${i}</a>
            	</c:forEach>
            </td>
            <td style="width:200px; text-align:left;">
            	<c:if test="${pm.next&&pm.endPage > 0}">
            		<a href = '${pageContext.request.contextPath}/orderList.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>▶</a>
            	</c:if>
            </td>
        </tr>
    </table>
</body>
</html>