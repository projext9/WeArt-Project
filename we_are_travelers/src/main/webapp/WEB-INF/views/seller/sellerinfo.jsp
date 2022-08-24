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
</head>
<body>
	<main style = "margin : 0% 20% 10% 20%;">
		<%@include file = "./navSeller1.jsp" %><br><br>
		<table class = "table">
			<tbody class = "table-group-divider">
				<input type="hidden" id="idx_val" value="${companyVo.company_idx}" style="display:none;">
				<input type="hidden" id="name_val" value="${companyVo.company_name}" style="display:none;">
				<input type="hidden" id="pwd_val" value="" style="display:none;">
				<input type="hidden" id="phone_val" value="${companyVo.company_phone}" style="display:none;">
				<input type="hidden" id="address_val" value="${companyVo.company_buis_address}" style="display:none;">
				<input type="hidden" id="delyn_val" value="${companyVo.company_delyn}" style="display:none;">
					<%-- <tr>
						<th>인덱스</th>
						<td colspan="2">${memberVo.member_idx}</td>
					</tr> --%>
					<tr>
						<th>아이디</th>
						<td colspan="2">${companyVo.company_id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td id="name">${companyVo.company_name}</td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_company_name">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_name_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_name_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td id="pwd"></td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_pwd">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_pwd_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td id="phone">${companyVo.company_phone}</td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_member_phone">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_phone_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_phone_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td id="address">${companyVo.company_buis_address}</td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_company_buis_address">수정하기</label>
							<label class ="btn btn-outline-primary" id="modify_address_submit" style="display:none;">확인</label>
							<label class ="btn btn-outline-primary" id="modify_address_cancel" style="display:none;">취소</label>
						</td>
					</tr>
					<tr>
						<th>ip</th>
						<td colspan="2">${companyVo.company_ip}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td colspan="2">${companyVo.company_regdate}</td>
					</tr>
					<tr>
						<th>상태</th>
						<td>
							<c:choose>
								<c:when test="${fn:contains(companyVo.company_delyn, 'N')}">활성</c:when>
                                <c:when test = "${fn:contains(companyVo.company_delyn, 'S')}">정지</c:when>
							</c:choose>
						</td>
						<td style="text-align:right">
							<label class ="btn btn-outline-primary" id="modify_company_delyn">회원탈퇴</label>
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
			</tbody>
		</table>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>