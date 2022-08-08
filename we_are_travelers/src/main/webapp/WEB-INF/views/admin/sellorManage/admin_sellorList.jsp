<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>판매자목록</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file="../nav/navSellor.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">
	<h3>판매자목록</h3>
	<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/sellorList.do" method = "get">
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
			<tr>
				<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>회원등급</th><th>등급수정</th>
				<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제일</th><th>db삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="companyVo" items="${sellorList}">
				<tr>
					<td>${companyVo.company_idx}</td><td>${companyVo.company_id}</td>
					<td><a href = "${pageContext.request.contextPath}/sellorContent.do?company_idx=${companyVo.company_idx}">${companyVo.company_id}</a></td>
					<td>${companyVo.company_id}</td>
					<td>${companyVo.company_buis_number}</td><td>${companyVo.company_ceoName}</td>
					<td>${companyVo.company_phone}</td>
					<td>삭제<input type="checkbox" value="${memberVo.member_idx}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table>
        <tr>
            <td style="width:200px; text-align:right;">
                <c:if test = "${pm.prev == true}">
            		<a href = "${pageContext.request.contextPath}/sellorList.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}">◀</a>
            	</c:if>
            </td>
            <td>
            	<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
            		<a href='${pageContext.request.contextPath}/sellorList.do?page=${i}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>${i}</a>
            	</c:forEach>
            </td>
            <td style="width:200px; text-align:left;">
            	<c:if test="${pm.next&&pm.endPage > 0}">
            		<a href = '${pageContext.request.contextPath}/sellorList.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>▶</a>
            	</c:if>
            </td>
        </tr>
    </table>
</body>
</html>