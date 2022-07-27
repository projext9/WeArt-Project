<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 리스트</title>
	<%@include file="../nav/navMain.jsp" %>
</head>
<body style = "margin : 5% 10% 0 10%;">
<h3>게시글 리스트</h3>
	<table class = "table">
		<thead>
			
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="boardVo" items="${boardContent}">
				<tr>
					<th>인덱스</th>
					<td>${boardVo.board_idx}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${boardVo.board_subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${boardVo.board_content}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${boardVo.board_date}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${boardVo.member_idx}</td>
				</tr>
				<tr>
					<th>ip</th>
					<td>${boardVo.board_ip}</td>
				</tr>
				<tr>
					<th>게시글 상태</th>
					<td>
						<form name = "frm" action = "${pageContext.request.contextPath}<%//=request.getContextPath() %>/admin/admin_memberList.do" method = "post">
					        <table style = "text-align:right">
					            <tr>
					                <td>
					                    <select name = "searchType">
					                   		<option value = "member_id">활성</option>
					                        <option value = "member_nickname">정지</option>
					                        <option value = "member_name">삭제</option>
					                    </select>
					                </td>
					                <td>
					                    <input type = "submit" name = "submit" value = "확인" onclick = "">
					                </td>
					            </tr>
					        </table>
					    </form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>