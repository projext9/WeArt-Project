<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 리스트</title>
	<%@include file="../nav/navMain.jsp" %>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			
			$("#updateBoardDelyn").on('click',function(){
				
				var board_idx = $('#board_idx').val();
				var board_delyn = $('.updateDelyn').val();
				
				 $.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/updateBoardDelyn.do",
					data: {
						"board_idx":board_idx,
						"board_delyn":board_delyn
					},
					success:function(data){
						if(data == "N"){
							alert("상태 수정 실패");
						}else{
							location.href="${pageContext.request.contextPath}/replyList.do";
							alert("상태 수정 성공");
							$(in_input).attr("disabled", true);
						}
					},
					error: function(error){alert("에러");}
				});
			});
		});
	</script>
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
					<th>종류</th>
					<td>
						<c:choose>
							<c:when test="${boardVo.board_code eq 'b_activity'}">액티비티</c:when>
							<c:when test="${boardVo.board_code eq 'b_fishing'}">낚시</c:when>
							<c:when test="${boardVo.board_code eq 'b_camping'}">캠핑</c:when>
							<c:when test="${boardVo.board_code eq 'b_lodgment'}">숙박</c:when>
							<c:when test="${boardVo.board_code eq 'b_culture'}">문화</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${boardVo.board_content}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${boardVo.board_writer}</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>${boardVo.board_image}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${boardVo.board_hits}</td>
				</tr>
				<tr>
					<th>좋아요수</th>
					<td>${boardVo.board_like}</td>
				</tr>
				<%-- <tr>
					<th>댓글수</th>
					<td>${boardVo.board_reply}</td>
				</tr> --%>
				<tr>
					<th>작성일</th>
					<td>${boardVo.board_date}</td>
				</tr>
				<tr>
					<th>ip</th>
					<td>${boardVo.board_ip}</td>
				</tr>
				<tr>
					<th>게시글 상태</th>
					<td>
				        <table style = "text-align:right">
				            <tr>
				                <td><input type="hidden" value="${boardVo.board_idx}" name="board_idx" id="board_idx">
				                    <select name = "updateDelyn" class="updateDelyn">
				                   		<option value = "N">활성</option>
				                        <option value = "S">정지</option>
				                        <option value = "Y">삭제</option>
				                    </select>
				                </td>
				                <td>
				                    <input type = "submit" name = "submit" value = "확인" id="updateBoardDelyn">
				                </td>
				            </tr>
				        </table>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>