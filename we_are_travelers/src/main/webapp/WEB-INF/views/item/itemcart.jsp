<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
 		<link href="${pageContext.request.contextPath}/resources/css/weart_itemcart.css" rel="stylesheet" />
    </head>
    <script>
    	var itemTotal = 0;
    	var postTotal = 0;

		function selectAll(selectAll) { //전체 체크 합계
			const chkBox = document.getElementsByName('cart_idx');
			chkBox.forEach((checkbox) => {
				checkbox.checked = selectAll.checked;
    		  })
			sum_itemPrice(frm);
			sum_postPrice(frm);
    		}
    	
    	function sum_itemPrice(frm) { //개별 체크 합계
			var sum = 0;
			var count = frm.cart_idx.length;
			for(var i=0; i < count; i++ ) {
				if( frm.cart_idx[i].checked == true ) {
    		    sum += parseInt(frm.item_price[i].value);
				}
			}
			document.getElementById("total_itemPrice").value = sum;
			document.getElementById("total_itemPrice").innerHTML = "&#8361;"+sum;
		}
    	
    	function sum_postPrice(frm) { //개별 체크 택배비 합계
			var sum = 0;
			var count = frm.cart_idx.length;
			for(var i=0; i < count; i++ ) {
				if( frm.cart_idx[i].checked == true ) {
    		    sum += parseInt(frm.item_postPrice[i].value);
				}
			}
			document.getElementById("total_postPrice").value = sum;
			document.getElementById("total_postPrice").innerHTML = "&#8361;"+sum;
		}
    	
    	function sum_totalPrice(frm) { //개별 체크 최종 합계
			var sum = 0;
    		sum = document.getElementById("total_itemPrice").value + document.getElementById("total_postPrice").value;
			document.getElementById("total_price").innerHTML = "&#8361;"+sum;
    	}
    	
        function fn_itemOrder() { //체크 된 항목 전송
        	var fm = document.frm;
			alert("배송지 입력 실행");
			fm.action = "${pageContext.request.contextPath}/itemorder.do";
			fm.method = "post";
			fm.submit();
        }
    </script>
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
											<form name="frm">
											<table class="table table-sm">
												<thead>
                                                	<tr class="ml-3">
														<th class="text-center" width="5%"><input type="checkbox" onclick='selectAll(this)' checked="checked" /></th>
                                                        <th width="5%" style="text-align: left;">전체</th>
                                                        <th class="text-left" width="70%">상품명<input type="hidden"></th>
                                                        <th class="text-center" width="20%">소계<input type="hidden"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>

													<c:forEach var="map" items="${CartListMap}">
														<tr>
															<td class="align-middle text-center">
																<input type="checkbox" name="cart_idx" value="${map.cart_idx}" onClick="sum_itemPrice(this.form); sum_postPrice(this.form); sum_totalPrice(this.form); " checked="checked"/>
								                         	</td>
															<td>
																<div class="rounded" style="background-image: url(${pageContext.request.contextPath}/resources/upload/${map.item_img}); width: 60px; height: 60px; background-size: cover;"></div>
															</td>
															<td class="align-middle text-left"><a href="${pageContext.request.contextPath}/itemdetail.do?iidx=${map.item_idx}">${map.item_name}</a> | ${map.option_name}</td>
															<td class="align-middle text-center" rowspan="3" style="border-bottom-color: black; border-left-width: 1px; ">&#8361; ${map.option_price*map.cart_count}<input type="hidden" name="item_price" value="${map.option_price*map.cart_count}" /></td>
														</tr>                    
														<tr>
															<td class="align-middle text-left" colspan="3">가격 : &#8361;${map.option_price} | 수량 : ${map.cart_count} 개</td>
														</tr>
														<tr style="border-bottom-color: black;">
															<td class="align-middle text-left" colspan="3">배송비 : &#8361;${map.item_postPrice}<input type="hidden" name="item_postPrice" value="${map.item_postPrice}" /> | 묶음배송 : O</td>
														</tr>
														<script>
															itemTotal = itemTotal + ${map.option_price*map.cart_count};
															postTotal = postTotal + ${map.item_postPrice};
														</script>
													</c:forEach>

                                                </tbody>
                                            </table>
											</form>
                                            <br>
                                            <div style="clear: both; border: 3px solid #c8c8c8; text-align: center;">
                                            	<div style="display: inline-block; margin: 0 auto; vertical-align: top;"> 
                                            		<div style="padding: 20px 15px 18px; font-size: 16px; line-height: 25px; color: #555; text-align: center;">
														총 가격 : <span id="total_itemPrice" style="color: #000; font-weight: bold;">&#8361;<script>document.writeln(itemTotal)</script></span>&nbsp;<span style="background-color: #000; color: #fff; font-size: 20px; font-weight: bold;">+</span> 적용 배송비 : <span id="total_postPrice" style="color: #000; font-weight: bold;">&#8361;<script>document.writeln(postTotal)</script></span> <br><span style="color: #000; font-weight: bold;">=> 최종 결제 금액 : </span><span id="total_price" style="color: #ff0000; font-weight: bold;">&#8361;<script>document.writeln(itemTotal+postTotal)</script></span>
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
				<div class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab" onclick="fn_itemOrder()">배송지 입력<i class="fal fa-arrow-circle-right"></i></div>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
    </body>
</html>
