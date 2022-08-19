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
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                   		<option value = "id">아이디</option>
                        <option value = "name">기업명</option>
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
				<th>기업명</th><th>id</th>
				<th>전화번호</th><th>대표명</th><th>상태</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="companyVo" items="${outstanding}">
				<tr style="text-align:center;">
					<td>${companyVo.company_name}</td>
					<td><a href = "${pageContext.request.contextPath}/sellorContent.do?company_idx=${companyVo.company_idx}">${companyVo.company_id}</a></td>
					<td>${companyVo.company_phone}</td>
					<td>${companyVo.company_ceo_name}</td>
					<td>${companyVo.company_delyn}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev==true}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/outstanding.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<c:choose>
				<c:when test="${i==scri.page}">
					<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/outstanding.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/outstanding.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${pm.next&&pm.endPage>0}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/outstanding.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
		    </li>
		</c:if>
	</ul>
</body>
</html>