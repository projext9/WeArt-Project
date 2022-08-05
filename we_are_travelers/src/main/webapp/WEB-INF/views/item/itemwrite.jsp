<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav.jsp"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<style>
			.ck-editor__editable {min-height:500px;}
		</style>
		<link href="${pageContext.request.contextPath}/resources/css/weart_itemdetail.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
		<script>
			<!-- CKEditor5 코드 -->
			function MyCustomUploadAdapterPlugin(editor) {
			    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
			        return new UploadAdapter(loader);
			    }
			}
		
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
			
	 		function fn_itemwrite() {
	 			alert("게시글 작성 실행");
	 			var frmData = $("#frm1, #frm2, #frm3, #frm4, #frm5").serialize();
				var item_idx = "";
		 		$.ajax({
					method: 'post',
	 			    url: 'itemwriteaction.do',
	 			    data: frmData,
	 			    dataType: 'html',
	 			    cache: false,
					success: function(data) {
						alert(data);
						item_idx = data;
						location.href = "${pageContext.request.contextPath}/itemwrite2.do";
						},
					error: function(error){ alert("에러!"); }
				})
	 		}
		</script>
    </head>
	<body>
		<div class="container" style="padding-top: 80px;">
			<div class="row text-center">
				<div class="col-sm col-12">
					<div class="alert alert-primary bg-alert-bg" role="alert">
						1 . 상품 작성
					</div>
				</div>
				<div class="col-sm col-12">
					<div class="alert alert-secondary" role="alert">
						2 . 옵션 등록
					</div>
				</div>
				<div class="col-sm col-12">
					<div class="alert alert-secondary" role="alert">
						3 . 등록 완료
					</div>
				</div>
			</div>
		</div>

		<section class="item-details section">
			<div class="container">
				<div class="top-area">
					<div class="row align-items-center">
						<div class="col-lg-6 col-md-12 col-12">
							<div class="main-img">
								<div class="product-images" style="width: 500px; height: 500px; text-align: center; border: 1px solid black;">
									<div style="margin-top: 30%;"><p style="font-size: 40px; color: blue;">대표사진</p></div>
									<form name="frm1" id="frm1">
									<div style="margin-top: 30%;">
									카테고리 선택
									<br>
									<select id="item_code" name="item_code"> <!-- @아이템 코드 입력 -->
										<option value="1">문화</option>
										<option value="2">액티비티</option>
										<option value="3">낚시</option>
										<option value="4">캠핑</option>
										<option value="5">숙박</option>
									</select>
									</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-12">
							<div class="product-info">
								<form name="frm2" id="frm2">
								<h2 class="title"><input type="text" name="item_name" value="상품 이름(20자)" maxlength="20"></h2> <!-- @아이템 이름 -->
							    <hr class="featurette-divider">
								<h3 class="price">&#8361; <input type="text" name="item_price" value="1000" size="20" maxlength="10"></h3> <!-- @아이템 가격 -->
								<p class="info-text"><input type="text" name="item_input1" value="상품 간단 설명(40자)" size="40" maxlength="40"></p> <!-- @아이템 간단설명 -->
								<p class="info-text">판매자 : <br>택배회사 : <br>배송비 : 원</p>
								</form>

								<div class="row">
									<div class="col-lg-6 col-md-6 col-6">
										<div class="form-group">
											<label for="optionValue">옵션 선택</label>
											<select class="form-control">
											</select>
										</div>
									</div>
		
									<div class="col-lg-6 col-md-6 col-6">
										<div class="form-group quantity">
											<label for="color">수량</label>
											<select class="form-control">
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
									<form name="frm3" id="frm3">
									<p><textarea class="editor" name="item_content" id="validationCustom05" required placeholder="내용을 입력하세요"></textarea> <!-- @아이템 상세정보 -->
									</p>
									<input type="text" name="item_addr"> <!-- @아이템 지도 주소 -->
									</form>
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
									<form name="frm4" id="frm4">
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
									</form>
								</div>
							</div>
							
							<div class="col-lg-6 col-12">
								<div class="info-body">
									<h4>배송정보</h4>
									<form name="frm5" id="frm5">
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
												<input type="text" id="item_input2_text" name="item_input2_text" size="10" maxlength="10">
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
									</form>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<br>
			<div style="text-align: center;"><button type="button" class="btn btn-primary btn-lg" onClick="fn_itemwrite()">상품 게시(다음)</button></div>
		</section>

		<!-- CKEditor5 -->
		<script src="${pageContext.request.contextPath}/resources/ckeditor/build/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/resources/ckeditor/UploadAdapter.js"></script>
		<script>
			ClassicEditor
				.create( document.querySelector( '.editor' ), {
					extraPlugins: [MyCustomUploadAdapterPlugin],	// 이미지 업로드 어댑터
					licenseKey: '',
					mediaEmbed: {									// 동영상 업로드
					    previewsInData:true
					},
				} )
				.then( editor => {
					window.editor = editor;
				} )
				.catch( error => {
					console.error( 'Oops, something went wrong!' );
					console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
					console.warn( 'Build id: epob765mepsi-71uxdxxu3a3m' );
					console.error( error );
				} );
		</script>
		<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
		<!-- /CKEditor5 -->
		
		<%@ include file="../footer.jsp"%>
    </body>
</html>