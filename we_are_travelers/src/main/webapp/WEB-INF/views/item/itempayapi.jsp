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
				var IMP = window.IMP; // 생략가능
				IMP.init('imp54123202');  // 가맹점 식별 코드
		        // IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({ // param
					pg: "html5_inicis",
					pay_method: "card",
					merchant_uid: "${orderLastVo.orderLast_num}",
					name: "We-Art 상품",
					amount: "${orderLastVo.orderLast_totalPrice}",
					buyer_email: "${memberVo.member_id}",
					buyer_name: "${memberVo.member_name}",
					buyer_tel: "${memberVo.member_phone}"
				}, function (rsp) { // callback
					if (rsp.success) {
						$.ajax({
							method: "post",
							url: "${pageContext.request.contextPath}/itempaycheck.do",
							data: {	"imp_uid": rsp.imp_uid, "merchant_uid": rsp.merchant_uid},
							success: function(data) {
								if(data == "Y") {
									location.href="${pageContext.request.contextPath}/home.do";
								} else if (data == "N") {
									alert("결제 내역 검증 실패. 관리자에게 문의하세요.");
								}
							},
							error: function(error){ alert("에러!"); }
						})
					} else {
						alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
					}
				});
			});
 		</script>
    </head>
	<body>
    </body>
</html>