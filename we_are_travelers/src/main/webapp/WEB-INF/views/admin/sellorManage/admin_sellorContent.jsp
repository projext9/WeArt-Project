<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
	<%@include file="../nav/navMain.jsp" %>
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
<body style = "margin : 5% 10% 0 10%;">
<h3>회원목록</h3>
	<table class = "table">
		<thead>
			
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="companyVo" items="${sellorContent}">
				<tr>
					<th>인덱스</th>
					<td>${companyVo.company_idx}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${companyVo.company_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${companyVo.company_name}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${companyVo.company_phone}</td>
				</tr>
				<tr>
					<th>ip</th>
					<td>${companyVo.company_ip}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${companyVo.company_regdate}</td>
				</tr>
				<tr>
					<th>회원상태</th>
					<td>
				        <table style = "text-align:right">
				            <tr>
				                <td><input type = "hidden" value = "${companyVo.company_idx}" name="company_idx" id="company_idx">
				                    <select name = "updateDelyn" class="updateDelyn">
				                   		<option value = "N">활성</option>
				                        <option value = "S">정지</option>
				                        <option value = "Y">삭제</option>
				                    </select>
				                </td>
				                <td id ="updatecompanyDelyn">
				                    <input type = "submit" name = "submit" value = "확인" id ="updatecompanyDelyn">
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