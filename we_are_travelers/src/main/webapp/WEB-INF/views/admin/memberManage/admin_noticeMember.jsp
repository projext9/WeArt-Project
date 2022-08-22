<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1문의(일반)</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file="../nav/navMember3.jsp" %>
</head>
<body style = "margin : 5% 20% 0 20%;">
<h3>1:1문의(일반)</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/noticeMember.do" method = "get">
        <table style = "text-align:right">
            <tr>
                <td>
            		<select class="form-select form-select-sm" aria-label=".form-select-sm example" id="code" name="code">
						<option value="" selected disabled hidden>문의 유형</option>
						<option value="mp_inquiry">결제</option>
						<option value="ml_inquiry">로그인</option>
						<option value="md_inquiry">배송</option>
						<option value="mc_inquiry">환불</option>
						<option value="me_inquiry">기타</option>
					</select>
				</td>
				<td>
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                   		<option value = "subject">제목</option>
                        <option value = "writer">작성자</option>
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
				<th>문의유형</th><th>제목</th><th>작성자 / 작성일</th><th>상태</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var = "boardVo" items = "${noticeMember}">
				<tr style="text-align:center;">
					<td>
						<c:choose>
							<c:when test="${boardVo.board_code eq 'mp_inquiry'}">결제</c:when>
							<c:when test="${boardVo.board_code eq 'ml_inquiry'}">로그인</c:when>
							<c:when test="${boardVo.board_code eq 'md_inquiry'}">배송</c:when>
							<c:when test="${boardVo.board_code eq 'mc_inquiry'}">환불</c:when>
							<c:when test="${boardVo.board_code eq 'me_inquiry'}">기타</c:when>
						</c:choose>
					</td>
					<td><a href = "${pageContext.request.contextPath}/inquiry_content.do?board_idx=${boardVo.board_idx}">${boardVo.board_subject}</a></td>
					<td>${boardVo.board_writer} / <c:set var="date" value="${boardVo.board_date}"/>${fn:substring(date,2,11)}</td>
					<td>
						<c:choose>
							<c:when test="${boardVo.board_reply == 1}"><span style="color:blue;">처리완료</span></c:when>
							<c:otherwise><span style="color:red;">처리중</span></c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev==true}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/noticeMember.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<c:choose>
				<c:when test="${i==scri.page}">
					<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/noticeMember.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/noticeMember.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${pm.next&&pm.endPage>0}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/noticeMember.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
		    </li>
		</c:if>
	</ul>
</body>
</html>