<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/weart_itemdetail.css" rel="stylesheet" />
		    <script type="text/javascript">
			    var optionSelect = (target) => {
					var optionValue = target.options[target.selectedIndex].value;
					alert("선택된 옵션 value 값=" + optionValue);
				}
			    var pieceSelect = (target) => {
					var pieceValue = target.options[target.selectedIndex].value;
					alert("선택된 수량 value 값=" + pieceValue);
				}
	</script>
    </head>
	<body>
		<header class="header navbar-area">
			<div class="header-middle">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-8 col-md-8 col-10" style="float: none; margin:0 auto;">
							<div class="main-menu-search">
								<div class="navbar-search search-style-5">
									<div class="search-select">
										<div class="select-position">
											<select id="select1">
												<option selected="">All</option>
												<option value="1">option 01</option>
												<option value="2">option 02</option>
												<option value="3">option 03</option>
												<option value="4">option 04</option>
												<option value="5">option 05</option>
											</select>
										</div>
									</div>
									<div class="search-input">
										<input type="text" placeholder="Search">
									</div>
									<div class="search-btn">
										<button><i class="bi bi-search"></i></button>
									</div>
									&nbsp
									&nbsp
									<a href="#"><img class="img-icon" src="${pageContext.request.contextPath}/resources/img/icon/icon_person.png" alt="..." /></a>
									&nbsp
									&nbsp
									<a href="#"><img class="img-icon" src="${pageContext.request.contextPath}/resources/img/icon/icon_cart.png" alt="..." /></a>
								</div>
							</div>
						</div>
					</div>
				</div>
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
										<img src="${pageContext.request.contextPath}/resources/upload/${itemVo.item_img}" style="max-width: 500px; max-height: 500px;" alt="#">
									</div>
								</main>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-info">
								<h2 class="title">${itemVo.item_name}</h2>
							    <hr class="featurette-divider">
								<h3 class="price">&#8361; ${itemVo.item_price}</h3>
								<p class="info-text">${itemVo.item_input1}</p>
								<p class="info-text">판매자 : ㅇㅇ컴퍼니<br>택배회사 : ${itemVo.item_input2}<br>배송비 : ${itemVo.item_postPrice}원</p>
		
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
												<button class="btn" style="width: 100%;" onclick="location.href='${pageContext.request.contextPath}/itemcart.do'">장바구니 담기</button>
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
									<p>${itemVo.item_content}
									</p>
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
											<td>${itemVo.item_input3}</td>
											<th>인증/허가 사항</th>
											<td>${itemVo.item_input4}</td>
										</tr>
										<tr>
											<th>제조국</th>
											<td>${itemVo.item_input5}</td>
											<th>제조자/수입자</th>
											<td>${itemVo.item_input6}</td>
										</tr>
										<tr>
											<th colspan="2">소비자상담 관련 전화번호</th>
											<td colspan="2">${itemVo.item_input7}</td>
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
											<td>${itemVo.item_input8}</td>
											<th rowspan="2">배송비</th>
											<td rowspan="2">기본 : ${itemVo.item_postPrice}원<br>-추가배송비-<br>제주도 : ${itemVo.item_input9}원<br>도서산간 : ${itemVo.item_input10}원</td>
										</tr>
										<tr>
											<th>택배회사</th>
											<td>${itemVo.item_input2}</td>
										</tr>
										<tr>
											<th colspan="2">묶음배송 여부</th>
											<td colspan="2">${itemVo.item_input11}</td>
										</tr>
									</table>
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
									<h4>교환/반품/취소 안내</h4>
									<table class="product-details-table">
										<tr>
											<th>교환/반품 비용</th>
										</tr>
										<tr>
											<td>19,800원 미만인 경우 반품비 5,000원
											<br>19,800원 이상인 경우 반품비 2,500원
											</td>
										</tr>
										<tr>
											<th>교환/반품 기준일</th>
										</tr>
										<tr>
											<td>ㆍ단순변심에 의한 상품의 교환/반품은 제품 수령 후 30일 이내까지, 교환/반품 제한사항에 해당하지 않는 경우에만 가능
											<br>(교환/반품 비용 고객부담)
											<br>ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능</td>
										</tr>
									</table>

									<table class="product-details-table">
										<tr>
											<th>취소 기준일</th>
											<td>${itemVo.item_input12}</td>
										</tr>
									</table>
								</div>
							</div>
							
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>교환/반품 제한사항</h4>
									<ul class="normal-list">
										<li>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
										<li>ㆍ상품 포장을 개봉 후 사용 또는 설치 완료하여 상품 가치가 훼손된 경우</li>
										<li>(예외 : 내용 확인을 위한 포장 개봉의 경우)</li>
										<li>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
										<li>ㆍ상품 일부 사용, 구성품을 분실 및 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
										<li>ㆍ화면 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</li>
										<li>ㆍ제조사의 사정 (신제품 출시 등) 및 부품 가격 변동 등에 의해 무상 교환/반품을 요청하는 경우</li>
									</ul>
									<h4>상품별 취소/반품 제한 세부사항&nbsp;&nbsp;<button type="button" class="btn btn-outline-info btn-sm">팝업으로 확인</button></h4>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		<a href="javascript:window.history.back();" class="scroll-back" style="display: flex;"><i class="bi bi-arrow-return-left"></i></a>
		<a href="#" class="scroll-top" style="display: flex;"><i class="bi bi-arrow-up"></i></a>
        <%@ include file="footer.jsp"%>
    </body>
</html>
