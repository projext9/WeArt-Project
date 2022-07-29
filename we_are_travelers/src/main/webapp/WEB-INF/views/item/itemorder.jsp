<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
 		<link href="${pageContext.request.contextPath}/resources/css/weart_itemorder.css" rel="stylesheet" />
 		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
 		<script>
	 		function fn_itemPay() { //체크 된 항목 전송
	 			alert("결제진행 입력 실행");
	 			var frmData = $("#frm1, #frm2").serialize();
				var orderLast_num = "";
		 		$.ajax({
					method: 'post',
	 			    url: 'itemorderadd.do',
	 			    data: frmData,
	 			    dataType: 'html',
	 			    cache: false,
					success: function(data) {
						alert(data);
						orderLast_num = data;
						location.href = "${pageContext.request.contextPath}/itempay.do?idx="+orderLast_num;
						},
					error: function(error){ alert("에러!"); }
				})
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
	                        <div class="alert alert-primary bg-alert-bg" role="alert">
	                            2 . 배송지 입력
	                        </div>
	                    </div>
	                    <div class="col-sm col-12">
	                        <div class="alert alert-secondary" role="alert">
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
													<form name="frm1" id="frm1">
													<table class="product-details-table">
														<tr style="border-bottom-width: 2px; border-color: black;">
															<th style="text-align: left; width: 90%;">&nbsp;&nbsp;&nbsp;상품명</th>
															<th style="width: 10%;">수량</th>
														</tr>

														<c:forEach var="map1" items="${ItemOrderMap}">
															<tr>
																<td>${map1.item_name}<input type="hidden" name="cart_idx" value="${map1.cart_idx}" /></td>
																<td rowspan="2" style="text-align: center; border-left: 1px solid #eee; border-bottom-width: 1px; border-bottom-color: black;">${map1.cart_count}</td>
															</tr>
															<tr>
																<td style="border-bottom-width: 1px; border-bottom-color: black;">옵션 : ${map1.option_name}</td>
															</tr>
														</c:forEach>

													</table>
													</form>
												</div>
											</div>
                                            <br>
											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>결제 정보</h4>
													<table class="product-details-table">
														<tr>
															<th>총 가격</th>
															<td>&#8361;${requestScope.total_itemPrice}</td>
														</tr>
														<tr>
															<th>배송비</th>
															<td>&#8361;${requestScope.total_postPrice}</td>
														</tr>
														<tr>
															<th><span style="color: #ff0000; font-weight: bold;">결제금액</span></th>
															<td><span style="color: #000; font-weight: bold;">&#8361;${requestScope.total_price}</span></td>
														</tr>
													</table>
												</div>
											</div>
											<hr>

											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>구매자 정보</h4>
													<table class="product-details-table">
														<tr>
															<th>이름</th>
															<td><c:out value="${map2.member_name}" /></td>
														</tr>
														<tr>
															<th>이메일</th>
															<td><c:out value="${map2.member_id}" /></td>
														</tr>
														<tr>
															<th>휴대폰 번호</th>
															<td><c:out value="${map2.member_phone}" /></td>
														</tr>
													</table>
												</div>
											</div>

											<br>
											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>받는이 정보&nbsp&nbsp<button type="button" class="btn btn-outline-secondary btn-sm">구매자와 동일</button></h4>
													<form name="frm2" id="frm2">
													<table class="product-details-table">
														<tr>
															<th>이름</th>
															<td><button type="button" class="btn btn-outline-secondary btn-sm">변경</button>&nbsp<c:out value="${map2.member_name}" /><input type="hidden" name="orderLast_name" value="${map2.member_name}" /></td>
														</tr>
														<tr>
															<th>휴대폰 번호</th>
															<td><button type="button" class="btn btn-outline-secondary btn-sm">변경</button>&nbsp<c:out value="${map2.member_phone}" /><input type="hidden" name="orderLast_phone" value="${map2.member_phone}" /></td>
														</tr>
														<tr>
															<th>배송지</th>
															<td><button type="button" class="btn btn-outline-secondary btn-sm">변경</button>&nbsp
																<c:out value="${map2.address_input1}" />
																<c:out value="${map2.address_input2}" />
																<c:out value="${map2.address_input3}" />
																<c:out value="${map2.address_input4}" />
																<c:out value="${map2.address_input5}" />
																<input type="hidden" name="orderLast_address" value="<c:out value="${map2.address_input1}" />&nbsp<c:out value="${map2.address_input2}" />&nbsp<c:out value="${map2.address_input3}" />&nbsp<c:out value="${map2.address_input4}" />&nbsp<c:out value="${map2.address_input5}" />" />
															</td>
														</tr>
														<tr>
															<th>배송 요청사항</th>
															<td><button type="button" class="btn btn-outline-secondary btn-sm">변경</button>&nbsp부재시 경비실에 맡겨주세요<input type="hidden" name="orderLast_msg" value="부재시 경비실에 맡겨주세요" /></td>
														</tr>
													</table>
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
			</div>

			<div class="list-group mt-5 p-0 justify-content-center active" id="allList" role="tablist" style="flex-direction: row;">
				<a href="javascript:window.history.back();" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">돌아가기<i class="fal fa-arrow-circle-right"></i></a>
	           	&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab" onClick="fn_itemPay()">결제 방법 선택<i class="fal fa-arrow-circle-right"></i></div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
    </body>
</html>
