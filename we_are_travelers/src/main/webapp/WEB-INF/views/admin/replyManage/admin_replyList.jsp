<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글 리스트</title>
	<%@include file="../nav/navMain.jsp" %>
</head>
<body style = "margin : 5% 20% 0 20%;">
<h3>댓글 리스트</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}/replyList.do" method = "get">
        <table style = "text-align:right">
            <tr><!-- 
                <td>
                	<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="code">
                   		<option value = "activity">액티비티</option>
                        <option value = "fishing">낚시</option>
                        <option value = "culture">문화</option>
                        <option value = "lodgment">숙박</option>
                        <option value = "camping">캠핑</option>
                    </select>
                </td> -->
                <td>
                   	<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                   		<option value = "content">내용</option>
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
				<th>번호</th><th>내용</th><th>작성자 / 작성일</th><th>삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="boardVo" items="${replyList}">
				<tr style="text-align:center;">
					<td><a href = "${pageContext.request.contextPath}/boardContent.do?board_idx=${boardVo.board_idx}">${boardVo.board_idx}</a></td>
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
				<a class="page-link" href="${pageContext.request.contextPath}/replyList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<c:choose>
				<c:when test="${i==scri.page}">
					<li class="page-item active">
						<a class="page-link" href="${pageContext.request.contextPath}/replyList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/replyList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${pm.next&&pm.endPage>0}">
			<li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/replyList.do?searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
		    </li>
		</c:if>
	</ul>
</body>
</html>