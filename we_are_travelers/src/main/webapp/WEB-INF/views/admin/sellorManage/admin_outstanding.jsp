<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>승인대기목록</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file="../nav/navSellor2.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">
	<h3>승인대기목록</h3>
	<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/outstanding.do" method = "get">
        <table style = "text-align:right">
            <tr>
                <td>
                    <select name = "searchType">
                   		<option value = "id">아이디</option>
                        <option value = "name">기업명</option>
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
				<th>기업번호</th><th>기업명</th><th>id</th><th>기업인증</th>
				<th>전화번호</th><th>대표명</th><th>상태</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="companyVo" items="${outstanding}">
				<tr style="text-align:center;">
					<td>${companyVo.company_idx}</td>
					<td>${companyVo.company_name}</td>
					<td><a href = "${pageContext.request.contextPath}/sellorContent.do?company_idx=${companyVo.company_idx}">${companyVo.company_id}</a></td>
					<td>
						<c:choose>
							<c:when test="${companyVo.company_auth == 1}">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose>
					</td>
					<td>${companyVo.company_phone}</td>
					<td>${companyVo.company_ceo_name}</td>
					<td>${companyVo.company_delyn}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table style="margin-left:auto; margin-right:auto;">
        <tr>
            <td style="width:200px; text-align:right;">
                <c:if test = "${pm.prev == true}">
            		<a href = "${pageContext.request.contextPath}/outstanding.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}">◀</a>
            	</c:if>
            </td>
            <td>
            	<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
            		<a href='${pageContext.request.contextPath}/outstanding.do?page=${i}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>${i}</a>
            	</c:forEach>
            </td>
            <td style="width:200px; text-align:left;">
            	<c:if test="${pm.next&&pm.endPage > 0}">
            		<a href = '${pageContext.request.contextPath}/outstanding.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>▶</a>
            	</c:if>
            </td>
        </tr>
    </table>
</body>
</html>