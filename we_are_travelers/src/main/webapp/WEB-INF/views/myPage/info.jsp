<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function() {
			
			let member_idx = $("#idx_val").val();
			let member_name = $("#name_val").val();
			let member_pwd = $("#pwd_val").val();
			let member_nick = $("#nick_val").val();
			let member_phone = $("#phone_val").val();
			let member_delyn = $("#delyn_val").val();
			//var password = prompt("삭제 입력","")
			
			//pwd
			$("#modify_member_pwd").click(function() {
				$("#pwd").css("display", "none");
				$("#mod_pwd").css("display", "");
				$("#modify_member_pwd").css("display", "none");
				$("#modify_pwd_submit").css("display", "");
				$("#modify_pwd_cancel").css("display", "");
			});
			$("#modify_pwd_cancel").click(function() {
				$("#pwd").css("display", "");
				$("#mod_pwd").css("display", "none");
				$("#modify_member_pwd").css("display", "");
				$("#modify_pwd_submit").css("display", "none");
				$("#modify_pwd_cancel").css("display", "none");
			});
			$("#modify_pwd_submit").click(function() {
				
				let member_pwd = $("#modify_pwd").val();
				modify_info(member_idx, member_name, member_pwd, member_nick, member_phone, member_delyn);
			});
			
			//name
			$("#modify_member_name").click(function(){
				$("#name").css("display", "none");
				$("#mod_name").css("display", "");
				$("#modify_member_name").css("display", "none");
				$("#modify_name_submit").css("display", "");
				$("#modify_name_cancel").css("display", "");
			});
			$("#modify_name_cancel").click(function() {
				$("#name").css("display", "");
				$("#mod_name").css("display", "none");
				$("#modify_member_name").css("display", "");
				$("#modify_name_submit").css("display", "none");
				$("#modify_name_cancel").css("display", "none");
			});
			$("#modify_name_submit").click(function() {
				
				let member_name = $("#modify_name").val();
				modify_info(member_idx, member_name, member_pwd, member_nick, member_phone, member_delyn);
			});
			
			//nick
			$("#modify_member_nick").click(function(){
				$("#nick").css("display", "none");
				$("#mod_nick").css("display", "");
				$("#modify_member_nick").css("display", "none");
				$("#modify_nick_submit").css("display", "");
				$("#modify_nick_cancel").css("display", "");
			});
			$("#modify_nick_cancel").click(function() {
				$("#nick").css("display", "");
				$("#mod_nick").css("display", "none");
				$("#modify_member_nick").css("display", "");
				$("#modify_nick_submit").css("display", "none");
				$("#modify_nick_cancel").css("display", "none");
			});
			$("#modify_nick_submit").click(function() {
				
				let member_nick = $("#modify_nick").val();
				modify_info(member_idx, member_name, member_pwd, member_nick, member_phone, member_delyn);
			});
			
			//phone
			$("#modify_member_phone").click(function(){
				$("#phone").css("display", "none");
				$("#mod_phone").css("display", "");
				$("#modify_member_phone").css("display", "none");
				$("#modify_phone_submit").css("display", "");
				$("#modify_phone_cancel").css("display", "");
			});
			$("#modify_phone_cancel").click(function() {
				$("#phone").css("display", "");
				$("#mod_phone").css("display", "none");
				$("#modify_member_phone").css("display", "");
				$("#modify_phone_submit").css("display", "none");
				$("#modify_phone_cancel").css("display", "none");
			});
			$("#modify_phone_submit").click(function() {
				
				let member_phone = $("#modify_phone").val();
				modify_info(member_idx, member_name, member_pwd, member_nick, member_phone, member_delyn);
			});
			
			//delyn
			$("#modify_member_delyn").click(function(){
				var password = prompt("회원 탈퇴를 원하시면 삭제를 입력하세요","")
				if(password == "삭제"){
					alert("회원탈퇴 완료");
					let member_delyn = 'Y';
					modify_info(member_idx, member_name, member_pwd, member_nick, member_phone, member_delyn);
					location.href = "${pageContext.request.contextPath}/login.do";
				}else{
					alert("취소");
				}
			});
			

			/* $("#modify_member_delyn").click(function(){
				alert("삭제를 입력하고 확인을 눌러주세요");
				if(password == null){
					alert("실행취소");
					location = "${pageContext.request.contextPath}/info.do"
				}
				else{
					
				}
			}); */
			
			
			function modify_info(member_idx, member_name, member_pwd, member_nick, member_phone, member_delyn) {
				
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/modify_info.do",
					data: {"member_idx":member_idx, "member_name":member_name, "member_pwd":member_pwd, "member_nick":member_nick, "member_phone":member_phone, "member_delyn":member_delyn},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: "json",
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/info.do?member_idx="+member_idx;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}
		});
	</script>
</head>
<body>
	<main style = "margin : 0% 20% 10% 20%;">
		<%@include file = "./navMy.jsp" %><br><br>
		<table class = "table">
			<tbody class = "table-group-divider">
				<c:forEach var="memberVo" items="${info}">
				<input type="hidden" id="idx_val" value="${memberVo.member_idx}" style="display:none;">
				<input type="hidden" id="name_val" value="${memberVo.member_name}" style="display:none;">
				<input type="hidden" id="pwd_val" value="${memberVo.member_pwd}" style="display:none;">
				<input type="hidden" id="nick_val" value="${memberVo.member_nick}" style="display:none;">
				<input type="hidden" id="phone_val" value="${memberVo.member_phone}" style="display:none;">
				<input type="hidden" id="delyn_val" value="${memberVo.member_delyn}" style="display:none;">
					<%-- <tr>
						<th>인덱스</th>
						<td colspan="2">${memberVo.member_idx}</td>
					</tr> --%>
					<tr>
						<th>아이디</th>
						<td colspan="2">${memberVo.member_id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td id="name">${memberVo.member_name}</td>
						<td id="mod_name" style="display:none;"><input type="text" id="modify_name" value="${memberVo.member_name}"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_name">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_name_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_name_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td id="pwd"></td>
						<td id="mod_pwd" style="display:none;"><input type="password" id="modify_pwd" value="${memberVo.member_pwd}"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_pwd">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td id="nick">${memberVo.member_nick}</td>
						<td id="mod_nick" style="display:none;"><input type="text" id="modify_nick" value="${memberVo.member_nick}"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_nick">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_nick_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_nick_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td id="phone">${memberVo.member_phone}</td>
						<td id="mod_phone" style="display:none;"><input type="text" id="modify_phone" value="${memberVo.member_phone}"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_phone">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_phone_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_phone_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<%-- <tr>
						<th>주소</th>
						<td></td>
						<td id="mod_pwd" style="display:none;"><input type="text" id="modify_pwd" value="${memberVo.member_pwd}"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_pwd">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_cancel" style="display:none;">취소</label>
						</td>
					</tr> --%>
					<tr>
						<th>ip</th>
						<td colspan="2">${memberVo.member_ip}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td colspan="2">${memberVo.member_regdate}</td>
					</tr>
					<tr>
						<th>등급</th>
						<td colspan = "2">
							<c:choose>
								<c:when test = "${memberVo.member_grade eq '0'}">일반회원</c:when>
								<c:otherwise>${memberVo.member_grade}</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>상태</th>
						<td>
							<c:choose>
								<c:when test="${fn:contains(memberVo.member_delyn, 'N')}">활성</c:when>
                                <c:when test = "${fn:contains(memberVo.member_delyn, 'S')}">정지</c:when>
							</c:choose>
						</td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_delyn">회원탈퇴</label>
						</td>
					</tr>
					<!-- <tr>
						<th>회원상태</th>
						<td>
					        <table style = "text-align:right">
					            <tr>
					                <td><input type = "hidden" value = "${memberVo.member_idx}" name="member_idx" id="member_idx">
					                    <select name = "updateDelyn" class="updateDelyn">
					                   		<option value = "N">활성</option>
					                        <option value = "S">정지</option>
					                        <option value = "Y">삭제</option>
					                    </select>
					                </td>
					                <td id ="updateMemberDelyn">
					                    <input type = "submit" name = "submit" value = "확인" id ="updateMemberDelyn">
					                </td>
					            </tr>
					        </table>
						</td>
					</tr>-->
				</c:forEach>
			</tbody>
		</table>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>