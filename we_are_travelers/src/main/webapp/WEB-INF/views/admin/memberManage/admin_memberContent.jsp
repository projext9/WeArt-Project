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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			
			$("#updateMemberDelyn").on('click',function(){
				
				var member_idx = $('#member_idx').val();
				var member_delyn = $('.updateDelyn').val();
				
				 $.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/updateMemberDelyn.do",
					data: {
						"member_idx":member_idx,
						"member_delyn":member_delyn
					},
					success:function(data){
						if(data == "N"){
							alert("상태 수정 실패");
						}else{
							location.href="${pageContext.request.contextPath}/memberList.do";
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
<body style = "margin : 5% 20% 0 20%;">
<h3>회원목록</h3>
	<table class = "table">
		<thead>
			
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="memberVo" items="${memberContent}">
				<tr>
					<th>인덱스</th>
					<td>${memberVo.member_idx}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${memberVo.member_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${memberVo.member_name}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${memberVo.member_nick}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${memberVo.member_birth}</td>
				</tr>
				<!-- 수정 -->
				<tr>
					<th>수정사항</th>
					<td>${memberVo.member_regCode}</td>
				</tr>
				<!--  -->
				<tr>
					<th>전화번호</th>
					<td>${memberVo.member_phone}</td>
				</tr>
				<tr>
					<th>휴대폰 인증</th>
					<td>
						<c:choose>
							<c:when test="${memberVo.member_phone_auth == 1}">O</c:when>
							<c:otherwise>X</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>ip</th>
					<td>${memberVo.member_ip}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${memberVo.member_regdate}</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<c:choose>
							<c:when test = "${memberVo.member_grade eq 0}">일반회원</c:when>
							<c:otherwise>${memberVo.member_grade}</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>회원상태</th>
					<td>
				        <table style = "text-align:right">
				            <tr>
				                <td><input type = "hidden" value = "${memberVo.member_idx}" name="member_idx" id="member_idx">
				                    <select name = "updateDelyn" class="updateDelyn" aria-label="Default select example">
				                   		<option value = "N">활성</option>
				                        <option value = "S">정지</option>
				                        <option value = "Y">삭제</option>
				                    </select>
				                </td>
				                <td id ="updateMemberDelyn">
				                    <button class="btn btn-outline-primary" type="submit" name="submit" id="updateMemberDelyn">확인</button>
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