<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<main style = "margin : 20%">
		<h3 style = "text-align : center;">비밀번호 입력</h3>
	    <form class="login_form" action="/travelers/info_checkPwd.do" method="POST">
			<div>
				<input type="password" class="form-control" id="member_pwd" name="member_pwd" maxlength="20" placeholder="비밀번호입력">
				<button class="w-100 btn btn-lg btn-primary" type="submit">비밀번호 확인</button>
			</div>
		</form>
	</main>
	<main style = "margin : 10% 10% 10% 10%;">
		<table class = "table">
			<tbody class = "table-group-divider">
				<c:forEach var="memberVo" items="${info}">
				<input type="hidden" id="idx_val" value="${memberVo.member_idx}" style="display:none;">
				<input type="hidden" id="name_val" value="${memberVo.member_name}" style="display:none;">
				<input type="hidden" id="pwd_val" value="${memberVo.member_pwd}" style="display:none;">
				<input type="hidden" id="nick_val" value="${memberVo.member_nick}" style="display:none;">
				<input type="hidden" id="phone_val" value="${memberVo.member_phone}" style="display:none;">
					<tr>
						<th>인덱스</th>
						<td colspan="2">${memberVo.member_idx}</td>
					</tr>
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
					<tr>
						<th>주소</th>
						<td></td>
						<td id="mod_pwd" style="display:none;"><input type="text" id="modify_pwd" value="${memberVo.member_pwd}"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_pwd">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_cancel" style="display:none;">취소</label>
						</td>
					</tr>
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
								<c:when test = "${memberVo.member_grade eq 0}">일반회원</c:when>
								<c:otherwise>${memberVo.member_grade}</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>상태</th>
						<td colspan ="2">
							<c:choose>
								<c:when test = "${memberVo.member_delyn eq 'N'}">활성</c:when>
								<c:when test = "${memberVo.member_delyn eq 'S'}">정지</c:when>
							</c:choose>
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