<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
 		<link href="${pageContext.request.contextPath}/resources/css/weart_itemcart.css" rel="stylesheet" />
    </head>

	<body>
		<div class="container">
			<div style="padding-top:100px;"></div>
	        <div class="tab-content">
	            <div class="tab-pane active" id="step1">
	                <div class="row text-center">
	                    <div class="col-sm col-12">
	                        <div class="alert alert-primary bg-alert-bg" role="alert">
	                            1 . 장바구니
	                        </div>
	                    </div>
	                    <div class="col-sm col-12">
	                        <div class="alert alert-secondary" role="alert">
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
											<table class="table table-sm">
												<thead>
                                                	<tr class="ml-3">
														<th class="text-center" width="5%"></th>
                                                        <th width="5%"></th>
                                                        <th class="text-left" width="70%">상품명</th>
                                                        <th class="text-center" width="20%">소계</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="align-middle text-center">
                                                            <a href="#delete" data-toggle="modal" data-title="Delete your product ?">
                                                                <i class="fal fa-trash-alt"></i>X
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <div class="rounded" style="background-image: url(https://unsplash.com/photos/ZBwQ2bCbJjw/download?force=true&w=640); width: 60px; height: 60px; background-size: cover;"></div>
                                                        </td>
														<td class="align-middle text-left">상품명 아바다 카다브라 훌랄라 챠챠</td>
														<td class="align-middle text-center" rowspan="3" style="border-left-width: 1px;">&#8361;50,000,000</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="align-middle text-left" colspan="3">가격 : &#8361;50,000,000 | 수량 : 5 개</td>
                                                    </tr>
                                                    <tr style="border-bottom-width: 2px; border-color: black;">
                                                        <td class="align-middle text-left" colspan="3">배송비 : &#8361;3,000 | 묶음배송 : O</td>
                                                    </tr>

                                                    <tr>
                                                        <td class="align-middle text-center">
                                                            <a href="#delete" data-toggle="modal" data-title="Delete your product ?">
                                                                <i class="fal fa-trash-alt"></i>X
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <div class="rounded" style="background-image: url(https://unsplash.com/photos/ZBwQ2bCbJjw/download?force=true&w=640); width: 60px; height: 60px; background-size: cover;"></div>
                                                        </td>
														<td class="align-middle text-left">상품명 아바다 카다브라 훌랄라 챠챠</td>
														<td class="align-middle text-center" rowspan="3" style="border-left-width: 1px;">&#8361;50,000,000</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="align-middle text-left" colspan="3">가격 : &#8361;50,000,000 | 수량 : 5 개</td>
                                                    </tr>
                                                    <tr style="border-bottom-width: 2px; border-color: black;">
                                                        <td class="align-middle text-left" colspan="3">배송비 : &#8361;3,000 | 묶음배송 : O</td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                            <br>
                                            <div style="clear: both; border: 3px solid #c8c8c8; text-align: center;">
                                            	<div style="display: inline-block; margin: 0 auto; vertical-align: top;">
                                            		<div style="padding: 20px 15px 18px; font-size: 16px; line-height: 25px; color: #555; text-align: center;">
														총 가격 : <span style="color: #000; font-weight: bold;">&#8361;2222</span> + 적용 배송비 : <span style="color: #000; font-weight: bold;">&#8361;2222</span> <br><span style="color: #000; font-weight: bold;">=> 최종 결제 금액 : </span><span style="color: #ff0000; font-weight: bold;">&#8361;2222</span>
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
				<a href="javascript:window.history.back();" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">돌아가기<i class="fal fa-arrow-circle-right"></i></a>
	           	&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/itemorder.do" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">배송지 입력<i class="fal fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
    </body>
</html>
