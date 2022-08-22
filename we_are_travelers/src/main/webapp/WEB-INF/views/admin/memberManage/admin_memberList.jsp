<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file = "../nav/navMember.jsp" %>
</head>
<body style = "margin : 5% 20% 0 20%;">
<h3>회원목록</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/memberList.do" method = "get">
        <table>
            <tr>
                <td>
                	<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                   		<option value = "id">아이디</option>
                        <option value = "nickname">닉네임</option>
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
			<tr style = "text-align:center;">
				<th>sns</th><th>닉네임</th><th>id</th>
				<th>전화번호</th><th>삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="memberVo" items="${memberList}">
				<tr style="text-align:center;">
					<td>
						<c:choose>
							<c:when test="${memberVo.member_regCode == 0}">일반</c:when>
							<c:otherwise>소셜</c:otherwise>
						</c:choose>
					</td>
					<td>${memberVo.member_nick}</td>
					<td><a href = "${pageContext.request.contextPath}/memberContent.do?member_idx=${memberVo.member_idx}">${memberVo.member_id}</a></td>
					<td>${memberVo.member_phone}</td>
					<td>${memberVo.member_delyn}</td>
				</tr>
			</c:forEach>
			<!-- <tr>
				<td colspan = "10"></td>
				<td><button id = "adminDeleteInfo">삭제하기</button></td>
			</tr>-->
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev==true}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/memberList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<c:choose>
				<c:when test="${i==scri.page}">
					<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/memberList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/memberList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${pm.next&&pm.endPage>0}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/memberList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
		    </li>
		</c:if>
	</ul>
</body>
</html>