<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
 		<link href="${pageContext.request.contextPath}/resources/css/weart_itemorder.css" rel="stylesheet" />
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
														<tr>
															<th style="text-align: left; width: 90%;">&nbsp;&nbsp;&nbsp;상품명</th>
															<th style="width: 10%;">수량</th>
														</tr>
														
														<tr>
															<td>상품명 가나다라마바사</td>
															<td style="text-align: center;">1</td>
														</tr>

														<tr>
															<td>할렐루야 중국산 낚시대</td>
															<td style="text-align: center;">1</td>
														</tr>
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
															<td>&#8361;5000</td>
														</tr>
														<tr>
															<th>배송비</th>
															<td>&#8361;5000</td>
														</tr>
														<tr>
															<th><span style="color: #ff0000; font-weight: bold;">결제예정금액</span></th>
															<td><span style="color: #000; font-weight: bold;">&#8361;2222</span></td>
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
															<td>상품명 가나다라마바사</td>
														</tr>
														<tr>
															<td>상품명 가나다라마바사</td>
														</tr>
													</table>
												</div>
											</div>
											<br>

											<div class="col-lg-12 col-12">
												<div class="info-body">
													<h4>현금영수증(소득공제)</h4>
		                                            <div style="clear: both; border: 2px solid #c8c8c8; text-align: left; padding: 20px 15px 18px; font-size: 16px; line-height: 4px; color: #555;">
														<button type="button" class="btn btn-outline-info btn-sm">변경</button>&nbsp;&nbsp;휴대폰 번호 : <span style="color: #000; font-weight: bold;">010-4760-3511</span><br><br>
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
			</div>

			<div class="list-group mt-5 p-0 justify-content-center active" id="allList" role="tablist" style="flex-direction: row;">
				<a href="${pageContext.request.contextPath}/itemcart.do" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">결제 취소<i class="fal fa-arrow-circle-right"></i></a>
	           	&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/itempay.do" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">결제 진행<i class="fal fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
    </body>
</html>
