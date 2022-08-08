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
    </head>
	<body>
		<div class="container" style="padding-top: 80px;">
			<div class="row text-center">
				<div class="col-sm col-12">
					<div class="alert alert-secondary" role="alert">
						1 . 상품 작성
					</div>
				</div>
				<div class="col-sm col-12">
					<div class="alert alert-secondary" role="alert">
						2 . 상세정보 등록
					</div>
				</div>
				<div class="col-sm col-12">
					<div class="alert alert-secondary" role="alert">
						3 . 옵션 등록
					</div>
				</div>
				<div class="col-sm col-12">
					<div class="alert alert-primary bg-alert-bg" role="alert">
						4 . 등록 완료
					</div>
				</div>
			</div>
		</div>

		<section class="item-details section">
			<div class="container">
				<div class="product-details-info">
					<div class="single-block">
						<div class="row">
						
							<div class="col-lg-12 col-12">
								<div class="info-body">
									<h4 style="text-align: center;">상품 등록 완료!</h4>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>

			<br>
			<div style="text-align: center;"><button type="button" class="btn btn-primary btn-lg"  onClick="location.href='${pageContext.request.contextPath}/itemdetail.do?iidx=${itemVo.item_idx}&itemCode=${itemVo.item_code}'">등록상품 보러가기</button></div>
		</section>
		<%@ include file="../footer.jsp"%>
    </body>
</html>
