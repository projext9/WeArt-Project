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
<body style = "margin : 5% 10% 0 10%;">
<h3>회원목록</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/memberList.do" method = "get">
        <table>
            <tr>
                <td>
                    <select name = "searchType">
                   		<option value = "member_id">아이디</option>
                        <option value = "member_nickname">닉네임</option>
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
			<tr style = "text-align:center;">
				<th>회원번호</th><th>sns</th><th>닉네임</th><th>아이디</th><th>ip</th>
				<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제일</th><th>db삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="memberVo" items="${memberList}">
				<tr>
					<td>${memberVo.member_idx}</td>
					<td>
						<c:choose>
							<c:when test = "${memberVo.social_sns_token eq null}">일반</c:when>
							<c:otherwise>${memberVo.social_sns_token}</c:otherwise>
						</c:choose>
					</td>
					<td>${memberVo.member_nickname}</td>
					<td><a href = "${pageContext.request.contextPath}/memberContent.do?member_idx=${memberVo.member_idx}">${memberVo.member_id}</a></td>
					<td>${memberVo.member_ip}</td>
					<td>${memberVo.member_phone}</td><td>${memberVo.member_regdate}</td>
					<td>${memberVo.member_delyn}</td><td>${memberVo.member_deldate}</td>
					<td>삭제<input type="checkbox" value="${memberVo.member_idx}" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan = "10"></td>
				<td><button id = "adminDeleteInfo">삭제하기</button></td>
			</tr>
		</tbody>
	</table>
	
	<table>
        <tr>
            <td style="width:200px; text-align:right;">
                <% 
                //String keyword = pm.getScri().getKeyword();
                //String searchType = pm.getScri().getSearchType();
                //if(pm.isPrev() == true) out.println("<a href = '"+request.getContextPath()+"/board/boardList.do?page="+(pm.getStartPage()-1)+"&keyword="+keyword+"&searchType="+searchType+"'>◀</a>"); %>
            	<c:if test = "${pm.prev == true}">
            		<a href = "${pageContext.request.contextPath}/board/boardList.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}">◀</a>
            	</c:if>
            </td>
            <td>
            	<c:forEach var = "i" begin = "${pm.startPage}" end = "${pm.endPage}" step = "1">
            		<a href='${pageContext.request.contextPath}/board/boardList.do?page=${i}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>${i}</a>
            	</c:forEach>
                <%
                   //for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
                   //    out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+i+"&keyword="+keyword+"&searchType="+searchType+"'>"+i+"</a>");
                   //}
                %>
            </td>
            <td style="width:200px; text-align:left;">
            	<c:if test="${pm.next&&pm.endPage > 0}">
            		<a href = '${pageContext.request.contextPath}/board/boardList.do?page=${pm.endPage + 1}&keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}'>▶</a>
            	</c:if>
                <%// if(pm.isNext() && pm.getEndPage() > 0) out.println("<a href = '"+request.getContextPath()+"/board/boardList.do?page="+(pm.getEndPage()+1)+"&keyword="+keyword+"&searchType="+searchType+"'>▶</a>"); %>
            </td>
        </tr>
    </table>
</body>
</html>