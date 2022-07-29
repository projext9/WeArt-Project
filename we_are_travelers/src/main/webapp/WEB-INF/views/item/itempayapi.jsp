<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<!-- jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 		<script>
			$(function requestPay() {
				alert("${orderLastVo.orderLast_num}");
				alert("${requestScope.order_itemName}");
				alert("${orderLastVo.orderLast_totalPrice}");
				alert("${memberVo.member_id}");
				alert("${memberVo.member_name}");
				alert("${memberVo.member_phone}");
				
				var IMP = window.IMP; // 생략가능
				IMP.init('imp54123202');  // 가맹점 식별 코드
		        // IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({ // param
					pg: "html5_inicis",
					pay_method: "card",
					merchant_uid: "${orderLastVo.orderLast_num}",
					amount: "${orderLastVo.orderLast_totalPrice}",
					buyer_email: "${memberVo.member_id}",
					buyer_name: "${memberVo.member_name}",
					buyer_tel: "${memberVo.member_phone}"
				}, function (rsp) { // callback
					if (rsp.success) {
						jQuery.ajax({
							url: "${pageContext.request.contextPath}/itempaycheck.do", // 예: https://www.myservice.com/payments/complete
							method: "POST",
							headers: { "Content-Type": "application/json" },
							data: {
								imp_uid: rsp.imp_uid,
								merchant_uid: rsp.merchant_uid
							}
						}).done(function (data) {
							alert("성공");
						})
					} else {
						alert("실패");
					}
				});
			});
 		</script>
    </head>
	<body>
    </body>
</html>