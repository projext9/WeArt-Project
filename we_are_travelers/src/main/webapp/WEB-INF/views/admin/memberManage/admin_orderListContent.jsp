<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구매목록</title>
	<%@include file="../nav/navMain.jsp" %>
	<%@include file = "../nav/navMember2.jsp" %>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			$("#updateOrderState2").on('click',function(){
				var order_idx = $('#order_idx').val();
				var order_state2 = $('.updateState2').val();
				
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/updateOrderState2.do",
					data:{
						"order_idx":order_idx,
						"order_state2":order_state2
					},
					success:function(data){
						if(data == "N"){
							alert("수정실패");
						}else{
							location.href="${pageContext.request.contextPath}/orderList.do";
							alert("수정성공");
							($in_input).attr("disabled",true);
						}
					},
					error:function(error){alert("error");}
				});
			});
		});
	</script>
</head>
<body style = "margin : 5% 20% 0 20%;">
	<h3>구매목록</h3>
	<hr/>
	<table class = "table">
		<thead>
			<tr style="text-align:center;">
				<th>번호</th><th>	주문번호</th><th>주문금액</th><th>주문상태</th><th></th>
			</tr>
		</thead>
		
		<tbody class = "table-group-divider">
			<c:forEach var="orderVo" items="${orderListContent}">
				<tr style="text-align:center;">
					<td>${orderVo.order_idx}</td>
					<td>${orderVo.order_itemName}</td>
					<td>${orderVo.order_totalPrice}</td>
					<td>
						<c:choose>
							<c:when test="${orderVo.order_state2 eq 'A'}"><span style="color:red;">발송대기</span></c:when>
							<c:when test="${orderVo.order_state2 eq 'B'}"><span style="color:green;">배송중</span></c:when>
							<c:when test="${orderVo.order_state2 eq 'C'}"><span style="color:blue;">배송완료</span></c:when>
						</c:choose>
					</td>
	                <td>
	                	<input type = "hidden" value = "${orderVo.order_idx}" name="order_idx" id="order_idx">
	                    <select name = "updateState2" class="updateState2">
	                   		<option value = "A">발송대기</option>
	                        <option value = "B">배송중</option>
	                        <option value = "C">배송완료</option>
	                    </select>
	                    <button class="btn btn-outline-primary" type="submit" name="submit" id="updateOrderState2">확인</button>
	                </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>