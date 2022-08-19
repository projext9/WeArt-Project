<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시글 리스트</title>
	<%@include file="../nav/navMain.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">

<h3>게시글 리스트</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}/boardList.do" method = "get">
        <table style = "text-align:right">
            <tr>
            	<td>
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" name = "board_code">
                   		<option value = "activity">액티비티</option>
                        <option value = "fishing">낚시</option>
                        <option value = "culture">문화</option>
                        <option value = "lodgment">숙박</option>
                        <option value = "camping">캠핑</option>
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
				<th>번호</th><th>종류</th><th>제목</th><th>내용</th>
				<th>작성자 / 작성일</th><th>삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="boardVo" items="${boardList}">
				<tr style="text-align:center;">
					<td>${boardVo.board_idx}</td>
					<td>
						<c:choose>
							<c:when test="${boardVo.board_code == 'b_activity'}">액티비티</c:when>
							<c:when test="${boardVo.board_code == 'b_culture'}">문화</c:when>
							<c:when test="${boardVo.board_code == 'b_lodgment'}">숙박</c:when>
							<c:when test="${boardVo.board_code == 'b_fishing'}">낚시</c:when>
							<c:when test="${boardVo.board_code == 'b_camping'}">캠핑</c:when>
						</c:choose>
					</td>					
					<td><a href = "${pageContext.request.contextPath}/admin_board_content.do?board_idx=${boardVo.board_idx}">${boardVo.board_subject}</a></td>
					<td>${boardVo.board_content}</td>
					<td>${boardVo.board_writer} / <c:set var="date" value="${boardVo.board_date}"/>${fn:substring(date,2,11)}</td>
					<td>${boardVo.board_delyn}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev==true}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/boardList.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<c:choose>
				<c:when test="${i==scri.page}">
					<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/boardList.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/boardList.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${pm.next&&pm.endPage>0}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/boardList.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
		    </li>
		</c:if>
	</ul>
</body>
</html>