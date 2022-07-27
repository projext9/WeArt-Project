<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1문의(판매자)</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file ="../nav/navSellor3.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">
<h3>1:1문의(판매자)</h3>
<hr/>
	<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/admin/admin_memberList.do" method = "post">
        <table style = "text-align:right">
            <tr>
                <td>
                    <select name = "searchType">
                   		<option value = "member_id">아이디</option>
                        <option value = "member_nickname">닉네임</option>
                        <option value = "member_name">이름</option>
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
				<th>번호</th><th>제목</th><th>내용</th><th>ip</th>
				<th>작성일</th><th>작성자</th><th>삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="boardVo" items="${noticeSellor}">
				<tr>
					<td>${boardVo.board_idx}</td><td>${boardVo.board_subject}</td>
					<td>${boardVo.board_content}</td><td>${boardVo.board_ip}</td>
					<td>${boardVo.board_date}</td><td></td>
					<td>${boardVo.board_delyn}</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
</body>
</html>