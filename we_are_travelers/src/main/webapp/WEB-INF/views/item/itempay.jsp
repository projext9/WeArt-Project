<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
 		<link href="${pageContext.request.contextPath}/resources/css/weart_itemorder.css" rel="stylesheet" />
 		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
 		<script>
	 		function fn_modalCashReceiptChange() {
	 			document.getElementById("CashReceipt").innerHTML = document.getElementById("modalCashReceiptChange").value;
	 			document.getElementById("orderLast_cashReceipt").value = document.getElementById("modalCashReceiptChange").value;
	 			$('#modalCashReceipt').modal('hide');
	 		}
	 		
	 		function fn_callpayapi() { //결제창 호출
	 			var fm = document.frm;
	 			alert("결제창 호출");
	 			fm.action = "itempayapi.do";
	 			fm.method = "post";
	 			fm.submit();
	 		}
 		</script>
    </head>
	<body>
		<div class="container">
			<div style="padding-top:100px;"></div>
	        <div class="tab-content">
	            <div class="tab-pane active" id="step1">
	                <div class="row text-center">
	                    <div class="col-sm col-12">
	                        <div class="alert alert-secondary" role="alert">
	                            1 . 장바구니
	                        </div>
	                    </div>
	                    <div class="col-sm col-12">
	                        <div class="alert alert-secondary" role="alert">
	                            2 . 배송지 입력
	                        </div>
	                    </div>
	                    <div class="col-sm col-12">
	                        <div class="alert alert-primary bg-alert-bg" role="alert">
	                            3 . 결제 진행
	                        </div>
	                    </div>
	                </div>
	                <div class="container">
	                    <div class="row justify-content-center">
	                        <div class="col-md-10">
	                            <div class="row">
									<div class="card border-0">
										<div>

											<br>
											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>구매예정 상품</h4>

													<table class="product-details-table">
														<tr style="border-bottom-width: 2px; border-color: black;">
															<th style="text-align: left; width: 90%;">&nbsp;&nbsp;&nbsp;상품명</th>
															<th style="width: 10%;">수량</th>
														</tr>

														<c:forEach var="orderVo" items="${orderVo}">
															<tr>
																<td>${orderVo.order_itemName}</td>
																<td rowspan="2" style="text-align: center; border-left: 1px solid #eee; border-bottom-width: 1px; border-bottom-color: black;">${orderVo.order_count}</td>
															</tr>
															<tr>
																<td style="border-bottom-width: 1px; border-bottom-color: black;">옵션 : ${orderVo.order_optionName}</td>
															</tr>
														</c:forEach>
														
													</table>
												</div>
											</div>

                                            <br>
											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>결제 정보</h4>
													<table class="product-details-table">
														<tr>
															<th>총 가격</th>
															<td>&#8361;${orderLastVo.orderLast_itemPrice}</td>
														</tr>
														<tr>
															<th>배송비</th>
															<td>&#8361;${orderLastVo.orderLast_postPrice}</td>
														</tr>
														<tr>
															<th><span style="color: #ff0000; font-weight: bold;">결제금액</span></th>
															<td><span style="color: #000; font-weight: bold;">&#8361;${orderLastVo.orderLast_totalPrice}</span></td>
														</tr>
													</table>
												</div>
											</div>
											
											<br>
											<div class="col-lg-12 col-12">
												<div class="info-body" id="info-body2">
													<h4>받는이 정보</h4>
													<table class="product-details-table">
														<tr>
															<th>이름</th>
															<td><c:out value="${orderLastVo.orderLast_name}" /></td>
														</tr>
														<tr>
															<th>휴대폰 번호</th>
															<td><c:out value="${orderLastVo.orderLast_phone}" /></td>
														</tr>
														<tr>
															<th>배송지</th>
															<td><c:out value="${orderLastVo.orderLast_address}" /></td>
														</tr>
														<tr>
															<th>배송 요청사항</th>
															<td><c:out value="${orderLastVo.orderLast_msg}" /></td>
														</tr>
													</table>
												</div>
											</div>
											<hr>

											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>결제 진행</h4>
													<table class="product-details-table">
														<tr>
															<th style="text-align: left;">&nbsp;&nbsp;&nbsp;결제방법</th>
														</tr>
														<tr>
															<td><input type="radio" checked="checked" name="radio" id="payModule" value="payModule">&nbsp;&nbsp;PG결제모듈</td>
														</tr>
														<tr>
															<td></td>
														</tr>
													</table>
												</div>
											</div>
											<br>

											<div class="col-lg-12 col-12">
												<form name="frm" id="frm">
												<div class="info-body">
													<h4>현금영수증(소득공제)</h4>
													<input type="hidden" name="orderLast_num" id="orderLast_num" value="${orderLastVo.orderLast_num}" />
													<input type="hidden" name="orderLast_cashReceipt" id="orderLast_cashReceipt" value="" />
		                                            <div style="clear: both; border: 2px solid #c8c8c8; text-align: left; padding: 20px 15px 18px; font-size: 16px; line-height: 4px; color: #555;">
														<button type="button" class="btn btn-outline-info btn-sm" data-bs-toggle="modal" data-bs-target="#modalCashReceipt">변경</button>&nbsp;&nbsp;휴대폰 번호 : <span id="CashReceipt" style="color: #000; font-weight: bold;">010-0000-0000</span><br><br>
													</div>
												</div>
												</form>
											</div>

	                                  	</div>
									</div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		
			<!-- 현금영수증 변경 Modal Start -->
			<div class="modal fade" id="modalCashReceipt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">현금영수증 변경</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<input type="text" id="modalCashReceiptChange" value="" maxlength="15">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" onClick="fn_modalCashReceiptChange();">변경</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal End -->

			<div class="list-group mt-5 p-0 justify-content-center active" id="allList" role="tablist" style="flex-direction: row;">
				<a href="${pageContext.request.contextPath}/itemcart.do" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">결제 취소<i class="fal fa-arrow-circle-right"></i></a>
	           	&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab" onClick="fn_callpayapi();">결제 진행<i class="fal fa-arrow-circle-right"></i></div>
			</div>
		</div>
		
		<%@ include file="../footer.jsp"%>
    </body>
</html>
