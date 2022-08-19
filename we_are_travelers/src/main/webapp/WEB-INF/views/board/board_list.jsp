<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	* > h3 {display:block; overflow:hidden; text-overflow:ellipsis; width:500px;}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	window.onload = function() {
		document.getElementById('searchType').value = "${pm.scri.searchType}";
		$("input[id=${scri.order_by}]").prop("checked", true);
	}
	
	$(function() {
		$("div > img").addClass("img-fluid rounded mx-auto d-block");
		$("div > img").css("width", "100%");
		$("*").css("text-decoration-line", "none");
		$("a > *").css("color", "black");
		$("#view_list>*").css("display", "none");
		$("pre").css({"text-overflow":"ellipsis", "overflow":"hidden", "margin":"auto", "font-size":"1em"});
		
		if($("input[name=view]:checked").val() == "view_frame") {
			$("#view_frame>*").css("display", "");
			$("#view_list>*").css("display", "none");
		}else if($("input[name=view]:checked").val() == "view_list") {
			$("#view_list>*").css("display", "");
			$("p > img").css("display", "none");
			$("h6 > figure").css("display", "none");
			$("#view_frame>*").css("display", "none");
		}
		
		$("input:radio[name=order_by]").click(function() {
			
			let code = "${scri.board_code}";
			let my_board = "${scri.my_board}";
			let page = "${scri.page}";
			let keyword = "${scri.keyword}";
			let searchType = "${scri.searchType}";
			let order_by = $("input:radio[name=order_by]:checked").val();
			let view = $("input:radio[name=view]:checked").val();
			
			if(my_board!="") {
				$.ajax({
					url:"${pageContext.request.contextPath}/board_list.do",
					method:"get",
					data: {"code":code, "my_board":my_board, "page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/board_list.do?code="+code+"&my_board="+my_board+"&order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}else if(my_board=="") {
				$.ajax({
					url:"${pageContext.request.contextPath}/board_list.do",
					method:"get",
					data: {"code":code, "page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/board_list.do?code="+code+"&order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}
		});
			
		$("input:radio[name=view]").click(function() {
				
			let code = "${scri.board_code}";
			let my_board = "${scri.my_board}";
			let page = "${scri.page}";
			let keyword = "${scri.keyword}";
			let searchType = "${scri.searchType}";
			let order_by = $("input:radio[name=order_by]:checked").val();
			let view = $("input:radio[name=view]:checked").val();
				
			if(my_board!="") {
				$.ajax({
					url:"${pageContext.request.contextPath}/board_list.do",
					method:"get",
					data: {"code":code, "my_board":my_board, "page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/board_list.do?code="+code+"&my_board="+my_board+"&order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view+"&page="+page;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}else if(my_board=="") {
				$.ajax({
					url:"${pageContext.request.contextPath}/board_list.do",
					method:"get",
					data: {"code":code, "page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/board_list.do?code="+code+"&order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view+"&page="+page;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}
		});
	});
</script>
</head>
<main style="padding-top:115px;">
	
        <header>
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		    	<div class="carousel-indicators">
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    	</div>
		    	<div class="carousel-inner">
					<div class="carousel-item active">
					<c:if test="${scri.board_code=='b_fishing'}">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="${pageContext.request.contextPath}/resources/img/fishingshop/fishing2.png" aria-hidden="true"></img>
						<div class="container">
							<div class="carousel-caption text-start">
								<h1 style="text-shadow:5px 5px 5px #000;">이것은 낚시상품</h1>
								<p>우수한 품질의 중국산 낚시대</p>
							</div>
						</div>
						</c:if>
					</div>
					<div class="carousel-item">
					<c:if test="${scri.board_code=='b_fishing'}">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="${pageContext.request.contextPath}/resources/img/fishingshop/fishing3.png" aria-hidden="true"></img>
						<div class="container">
							<div class="carousel-caption">
								<h1 style="text-shadow:5px 5px 5px #000;">극강의 퀄리티</h1>
								<p style="text-shadow:5px 5px 5px #000;">믿을 수 있는 중국산 제품</p>
							</div>
						</div>
						</c:if>
					</div>
					<div class="carousel-item">
					<c:if test="${scri.board_code=='b_fishing'}">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="${pageContext.request.contextPath}/resources/img/fishingshop/fishing1.png" aria-hidden="true"></img>
						<div class="container">
							<div class="carousel-caption text-end">
								<h1 style="text-shadow:5px 5px 5px #000;">환상적인 중국산 제품</h1>
								<p style="text-shadow: -1px 0 #000, 0 1px 5px #000, 1px 0 5px #000, 0 -1px #000;">저렴하고 우수한 중국산</p>
							</div>
						</div>
						</c:if>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</header>
	
	<!-- 게시판 버튼 -->
	<div class="container g-3 row row-cols-2 mb-3" style="padding-right:0.3em; padding-left:0.3em; margin:auto;">
		<form class="col-12">
			<input type="hidden" name="code" value="${scri.board_code}">
			<input type="hidden" name="my_board" value="${scri.my_board}">
			<!-- 검색 -->
			<div class="btn-group col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 g-1">
				<select class="form-select" id="searchType" name="searchType" style="max-width:100px;">
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" class="form-control" placeholder="${scri.keyword}" name="keyword">
				<button class="btn btn-outline-primary" type="submit" onclick="location.href='${pageContext.request.contextPath}/board_list.do'"><i class="bi bi-search"></i></button>
			</div>
			<!-- 순서 정렬 -->
			<div class="btn-group g-1" role="group" style="float:left; width:250px; margin-top:0.5em;">
				<input type="radio" class="btn-check" name="order_by" id="order_new" value="order_new">
				<label class="btn btn-outline-primary" for="order_new">최신순</label>
				<input type="radio" class="btn-check" name="order_by" id="order_like" value="order_like">
				<label class="btn btn-outline-primary" for="order_like">추천순</label>
				<input type="radio" class="btn-check" name="order_by" id="order_reply" value="order_reply">
				<label class="btn btn-outline-primary" for="order_reply">댓글순</label>
			</div>
			<!-- 게시판 출력 방법 -->
			<div class="btn-group g-1" role="group" style="float:right; margin-top:0.5em;">
				<c:if test="${scri.view=='view_frame'}">
					<input type="radio" class="btn-check" name="view" id="view_list" value="view_list">
					<label class="btn btn-outline-primary" for="view_list"><i class="bi bi-view-stacked"></i></label>
					<input type="radio" class="btn-check" name="view" id="view_frame" value="view_frame" checked>
					<label class="btn btn-outline-primary" for="view_frame"><i class="bi bi-grid"></i></label>
				</c:if>
				<c:if test="${scri.view=='view_list'}">
					<input type="radio" class="btn-check" name="view" id="view_list" value="view_list" checked>
					<label class="btn btn-outline-primary" for="view_list"><i class="bi bi-view-stacked"></i></label>
					<input type="radio" class="btn-check" name="view" id="view_frame" value="view_frame">
					<label class="btn btn-outline-primary" for="view_frame"><i class="bi bi-grid"></i></label>
				</c:if>
			</div>
		</form>
		<div class="col-12" style="margin-top:0.5em;">
			<c:if test="${member_idx!=null}">
				<!-- 내 글 보기 -->
				<div class="btn-group g-1" style="width:105px;">
					<button type="button" name="my_board" id="my_board" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&my_board=${member_idx}'" value="">내 글 보기</button>
				</div>
				<!-- 글 작성 -->
				<div class="btn-group g-1" style="float:right; width:83px;">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board_write.do?code=${scri.board_code}'" style="float:right;">글 작성</button>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 이미지 형식 -->
	<div id="view_frame">
		<div class="album py-6">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 g-3">
					<c:forEach var="boardVo" items="${board_list}">
						<a href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}">
						<input type="hidden" id="board_content" value="${boardVo.board_idx}">
							<div class="col">
								<div class="card shadow-sm">
									<div class="ratio ratio-4x3">
										<c:choose>
											<c:when test="${boardVo.board_image != null}">
												${boardVo.board_image}
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/resources/img/no image.png">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<div class="d-flex">
											<h3 class="mb-0 col-12">${boardVo.board_subject}</h3>
										</div>
										<div>
											<small class="text-muted">${boardVo.board_writer} / <c:set var="date" value="${boardVo.board_date}"/>${fn:substring(date,2,11)}</small>
										</div>
										<div class="d-flex justify-content-between align-items-center">
											<small class="text-muted">
												<i class="bi bi-heart"></i> ${boardVo.board_like}
												<i class="bi bi-chat-dots"></i> ${boardVo.board_reply}
												<i class="bi bi-eye"></i> ${boardVo.board_hits}
											</small>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 리스트 형식 -->
	<div id="view_list">
		<c:forEach var="boardVo" items="${board_list}">
			<div class="list-group col-12" style="margin:auto; max-width:1320px; padding:0 0.7em 0.7em 0.7em; border-radius:1em;">
				<a href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}" class="list-group-item list-group-item-action">
					<table class="table table-borderless" style="margin-bottom:0;">
						<tr>
							<td>
								<div class="d-flex">
									<h3 class="mb-0 col-10">${boardVo.board_subject}</h3>
									<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
										<small class="text-muted">${boardVo.board_writer} / <c:set var="date" value="${boardVo.board_date}"/>${fn:substring(date,2,11)}</small>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<small class="text-muted">
									<i class="bi bi-heart"></i> ${boardVo.board_like}
									<i class="bi bi-chat-dots"></i> ${boardVo.board_reply}
									<i class="bi bi-eye"></i> ${boardVo.board_hits}
								</small>
							</td>
						</tr>
					</table>
				</a>
			</div>
		</c:forEach>
	</div>
	<div style="margin:auto; max-width:1320px; padding-right:0.7em; padding-left:0.7em; margin-top:1em;">
		<ul class="pagination justify-content-center">
			<c:if test="${pm.scri.my_board!=''}">
				<c:if test="${pm.prev==true}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.startPage-1}">Previous</a>
				    </li>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<c:choose>
						<c:when test="${i==scri.page}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			    <c:if test="${pm.next&&pm.endPage>0}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.endPage+1}">Next</a>
				    </li>
				</c:if>
			</c:if>
			<c:if test="${pm.scri.my_board==''}">
			    <c:if test="${pm.prev==true}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.startPage-1}">Previous</a>
				    </li>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<c:choose>
						<c:when test="${i==scri.page}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			    <c:if test="${pm.next&&pm.endPage>0}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?code=${pm.scri.board_code}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.endPage+1}">Next</a>
				    </li>
				</c:if>
			</c:if>
		</ul>
	</div>
</main>
</html>
<%@ include file="../footer.jsp"%>