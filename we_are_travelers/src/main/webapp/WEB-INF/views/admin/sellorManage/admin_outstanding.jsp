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
				<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>회원등급</th><th>등급수정</th>
				<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제일</th><th>db삭제여부</th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="memberVo" items="${memberList}">
				<tr>
					<td>${memberVo.member_idx}</td><td>${memberVo.member_name}</td>
					<td>${memberVo.member_id}</td><td>${memberVo.member_pw}</td>
					<td>${memberVo.member_phone}</td><td>${memberVo.member_regdate}</td>
					<td>${memberVo.member_delyn}</td><td>${memberVo.member_deldate}</td>
					<td>삭제<input type="checkbox" value="${memberVo.member_idx}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>