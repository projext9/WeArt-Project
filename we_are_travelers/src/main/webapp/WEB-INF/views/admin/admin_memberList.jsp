<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		//수정하기 버튼 클릭시 이벤트 처리
		$(".adminUpdateInfo").click(function(){
			
			let member_idx = $(this).attr("name");
			let id_input = "#member_grade"+member_idx;
			let member_grade = $(id_input).val();
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/adminUpdateInfo.do",
				data: {
					"member_idx": member_idx,
					"member_grade": member_grade
				},
				success: function(data){
					if(data == "N"){
						alert("회원등급 수정 실패!");
					}else{
						alert("회원등급 수정 성공!");
						$(id_input).attr("disabled", true);
					}
				},
				error: function(error){ alert("회원등급 수정 중 에러발생"); }
			});
			
		});//end of 수정하기 버튼 클릭시 이벤트 처리
		
		//삭제하기 버튼 클릭시 이벤트 처리
		$("#adminDeleteInfo").click(function(){
			
			let member_idx_arr = new Array();
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 member_idx값을 배열에 저장
			$("input:checked").each(function(index, item){
				member_idx_arr[index] = $(item).val();
			});
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/adminDeleteInfo.do",
				data: {
					"member_idx_arr": member_idx_arr
				},
				success: function(data){
					if(data == "N"){
						alert("회원삭제 실패!");
					}else{
						//회원목록에서 삭제 체크된 회원정보를 테이블에서 삭제하기
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){ alert("회원삭제 중 에러발생"); }
			});
			
		});//end of 삭제하기 버튼 클릭시 이벤트 처리
		
		
		
		
	});



</script>

</head>
<body>

<h3>회원목록</h3>
<hr/>

<table border="1px">
	<tr>
		<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>회원등급</th><th>등급수정</th>
		<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제요청일</th><th>DB삭제여부</th>
	</tr>
	
	<c:forEach var="memberVo" items="${memberList}">
		<tr>
			<td>${memberVo.member_idx}</td><td>${memberVo.member_name}</td>
			<td>${memberVo.member_id}</td><td>${memberVo.member_pw}</td>
			<td><input type="text" id="member_grade${memberVo.member_idx}" value="${memberVo.member_grade}" size="5" /></td>
			<td><button class="adminUpdateInfo" name="${memberVo.member_idx}">수정하기</button></td>
			<td>${memberVo.member_phone}</td><td>${memberVo.member_regdate}</td>
			<td>${memberVo.member_delyn}</td><td>${memberVo.member_deldate}</td>
			<td>삭제<input type="checkbox" value="${memberVo.member_idx}" /></td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="10"></td>
			<td><button id="adminDeleteInfo">삭제하기</button></td>
		</tr>
</table>
	<a href="${pageContext.request.contextPath}/admin.do">관리자 메인페이지</a>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>