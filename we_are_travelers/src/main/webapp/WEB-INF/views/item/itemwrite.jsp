<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav.jsp"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/weart_itemdetail.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
		<script>
			$(function(){
			$("#item_input2_text").hide();
			$("#item_input2").change(function() {
					if($("#item_input2").val() == "write") {
						$("#item_input2_text").show();
					}  else {
						$("#item_input2_text").hide();
					}
				}) 
			});
		</script>
    </head>
	<body>
		<header class="header navbar-area">
			<div class="header-middle">
			</div>
		</header>
		
		<section class="item-details section">
			<div class="container">
				<div class="top-area">
					<div class="row align-items-center">
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-images">
								<main id="gallery">
									<div class="main-img">
										<input type="image" name="item_originImg"> <!-- @아이템 이미지 -->
									</div>
								</main>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-info">
								<h2 class="title"><input type="text" name="item_name" value="상품이름" maxlength="20"></h2> <!-- @아이템 이름 -->
							    <hr class="featurette-divider">
								<h3 class="price">&#8361; <input type="text" name="item_price" maxlength="10"></h3> <!-- @아이템 가격 -->
								<p class="info-text"><input type="text" name="item_input1" maxlength="40"></p> <!-- @아이템 간단설명 -->
								<p class="info-text">판매자 : <br>택배회사 : <br>배송비 : 원</p>

								<div class="row">
									<div class="col-lg-6 col-md-6 col-6">
										<div class="form-group">
											<label for="optionValue">옵션 선택</label>
											<select class="form-control" id="optionValue" onchange="optionSelect(this)">
												<c:forEach var="optionVo" items="${optionList}">
													<c:if test="${optionVo.option_delyn == 'N'}">
														<option value="${optionVo.option_idx}">${optionVo.option_name}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
		
									<div class="col-lg-6 col-md-6 col-6">
										<div class="form-group quantity">
											<label for="color">수량</label>
											<select class="form-control" id="pieceValue" onchange="pieceSelect(this)">
												<option value="1">1개</option>
												<option value="2">2개</option>
												<option value="3">3개</option>
												<option value="4">4개</option>
												<option value="5">5개</option>
											</select>
										</div>
									</div>
								</div> <!-- row -->
		
								<div class="bottom-content">
									<div class="row align-items-end">
										<div class="col-lg-6 col-md-6 col-12" style="margin-top: 20px;">
											<div class="button cart-button">
												<button class="btn" style="width: 100%;">장바구니 담기</button>
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-12" style="margin-top: 20px;">
											<div class="wish-button">
												<button class="btn">바로구매</button>
											</div>
										</div>
									</div>
								</div>
							</div><!-- product-info -->
						</div>
		
					</div>
				</div>
			</div>
	
			<div class="container">
				<div class="product-details-info">
					<div class="single-block">
						<div class="row">
						
							<div class="col-lg-12 col-12">
								<div class="info-body">
									<h4>상품상세 정보</h4>
									<p><input type="text" name="item_content" value="상품설명입니다."> <!-- @아이템 상세정보 -->
									</p>
									<input type="text" name="item_addr"> <!-- @아이템 지도 주소 -->
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
	
			<div class="container">
				<div class="product-details-info">
					<div class="single-block">
						<div class="row">
						
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>기본 표기정보</h4>
									<table class="product-details-table">
										<tr>
											<th>품명 및 모델명</th>
											<td><input type="text" name="item_input3" value="상품이름" maxlength="20"></td> <!-- @아이템 품명 및 모델명 -->
											<th>인증/허가 사항</th>
											<td><input type="text" name="item_input4" value="KS인증(KSA0000)" maxlength="20"></td> <!-- @아이템 인증/허가사항 -->
										</tr>
										<tr>
											<th>제조국</th>
											<td><input type="text" name="item_input5" value="대한민국" maxlength="10"></td> <!-- @아이템 제조국 -->
											<th>제조자/수입자</th>
											<td><input type="text" name="item_input6" value="한국물산" maxlength="10"></td> <!-- @아이템 제조자/수입자 -->
										</tr>
										<tr>
											<th colspan="2">소비자상담 관련 전화번호</th>
											<td colspan="2"><input type="text" name="item_input7" value="05012345678" maxlength="20"></td> <!-- @아이템 소비자상담 관련 전화번호 -->
										</tr>
									</table>
								</div>
							</div>
							
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>배송정보</h4>
									<table class="product-details-table">
										<tr>
											<th>배송방법</th>
											<td>
												<select id="item_input8" name="item_input8"> <!-- @아이템 배송방법 -->
													<option value="택배">택배</option>
													<option value="온라인발송">온라인발송</option>
													<option value="GS택배">GS택배</option>
													<option value="write">직접입력</option>
												</select>
											</td>
											<th rowspan="2">배송비</th>
											<td rowspan="2">기본 : 
												<select id="item_postPrice" name="item_postPrice"> <!-- @아이템 배송비 -->
													<option value="0">무료배송</option>
													<option value="2000">2000원</option>
													<option value="2500">2500원</option>
													<option value="3000">3000원</option>
													<option value="3500">3500원</option>
													<option value="4000">4000원</option>
													<option value="4500">4500원</option>
													<option value="5000">5000원</option>
												</select>
											<br>-기타배송비-
											<br>제주도 :
												<select id="item_input9" name="item_input9"> <!-- @아이템 배송비(제주도) -->
													<option value="0">무료배송</option>
													<option value="2000">2000원</option>
													<option value="2500">2500원</option>
													<option value="3000">3000원</option>
													<option value="3500">3500원</option>
													<option value="4000">4000원</option>
													<option value="4500">4500원</option>
													<option value="5000">5000원</option>
													<option value="5500">5500원</option>
													<option value="6000">6000원</option>
													<option value="6500">6500원</option>
													<option value="7000">7000원</option>
													<option value="7500">7500원</option>
													<option value="8000">8000원</option>
													<option value="8500">8500원</option>
													<option value="9000">9000원</option>
													<option value="9500">9500원</option>
													<option value="10000">10000원</option>
												</select>
											<br>도서산간 :
												<select id="item_input10" name="item_input10"> <!-- @아이템 배송비(도서산간) -->
													<option value="0">무료배송</option>
													<option value="2000">2000원</option>
													<option value="2500">2500원</option>
													<option value="3000">3000원</option>
													<option value="3500">3500원</option>
													<option value="4000">4000원</option>
													<option value="4500">4500원</option>
													<option value="5000">5000원</option>
													<option value="5500">5500원</option>
													<option value="6000">6000원</option>
													<option value="6500">6500원</option>
													<option value="7000">7000원</option>
													<option value="7500">7500원</option>
													<option value="8000">8000원</option>
													<option value="8500">8500원</option>
													<option value="9000">9000원</option>
													<option value="9500">9500원</option>
													<option value="10000">10000원</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>택배회사</th>
											<td>
												<select id="item_input2" name="item_input2"> <!-- @아이템 택배회사 -->
													<option value="CJ대한통운">CJ대한통운</option>
													<option value="롯데택배">롯데택배</option>
													<option value="우체국택배">우체국택배</option>
													<option value="로젠택배">로젠택배</option>
													<option value="한진택배">한진택배</option>
													<option value="경동택배">경동택배</option>
													<option value="현대택배">현대택배</option>
													<option value="CU택배">CU택배</option>
													<option value="GS택배">GS택배</option>
													<option value="write">직접입력</option>
												</select>
												<input type="text" id="item_input2_text" name="item_input2_text" maxlength="10">
											</td>
										</tr>
										<tr>
											<th colspan="2">묶음배송 여부</th>
											<td colspan="2">
												<select id="item_input11" name="item_input11"> <!-- @아이템 묶음배송 여부 선택 -->
													<option value="1">가능</option>
													<option value="2">불가능</option>
												</select>
											</td>
										</tr>
									</table>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<br>
			<div style="text-align: center;"><button type="button" class="btn btn-primary btn-lg" onClick="">상품 게시</button></div>
		</section>
		<a href="javascript:window.history.back();" class="scroll-back" style="display: flex;"><i class="bi bi-arrow-return-left"></i></a>
		<a href="#" class="scroll-top" style="display: flex;"><i class="bi bi-arrow-up"></i></a>
		<%@ include file="../footer.jsp"%>
    </body>
</html>
