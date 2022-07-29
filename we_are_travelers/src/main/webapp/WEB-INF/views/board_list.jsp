<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="./nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://kit.fontawesome.com/51dc5b459d.js" crossorigin="anonymous"></script>
	<style>
		* > h3 {display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; width:500px;}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function() {
			$("div > img").addClass("img-fluid rounded mx-auto d-block");
			$("*").css("text-decoration-line", "none");
			$("a > *").css("color", "black");
			$("#view_list>*").css("display", "none");
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
						data: {"my_board":my_board, "page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
						success: function(data) {
							location.href = "${pageContext.request.contextPath}/board_list.do?my_board="+my_board+"&order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view+"&page="+page;
						},
						error: function(error) {
							alert("실패");
						}
					});
				}else if(my_board=="") {
					$.ajax({
						url:"${pageContext.request.contextPath}/board_list.do",
						method:"get",
						data: {"page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
						success: function(data) {
							location.href = "${pageContext.request.contextPath}/board_list.do?order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view+"&page="+page;
						},
						error: function(error) {
							alert("실패");
						}
					});
				}
			});
			
			$("input:radio[name=view]").click(function() {
				
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
						data: {"my_board":my_board, "page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
						success: function(data) {
							location.href = "${pageContext.request.contextPath}/board_list.do?my_board="+my_board+"&order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view+"&page="+page;
						},
						error: function(error) {
							alert("실패");
						}
					});
				}else if(my_board=="") {
					$.ajax({
						url:"${pageContext.request.contextPath}/board_list.do",
						method:"get",
						data: {"page":page, "keyword":keyword, "searchType":searchType, "order_by":order_by, "view":view},
						success: function(data) {
							location.href = "${pageContext.request.contextPath}/board_list.do?order_by="+order_by+"&searchType="+searchType+"&keyword="+keyword+"&view="+view+"&page="+page;
						},
						error: function(error) {
							alert("실패");
						}
					});
				}
			});
			
			$("#my_board").click(function() {
				$("#my_board").val("${scri.my_board}");
				alert($("#my_board").val());
			});
		});
	</script>
</head>
<main style="padding-top:60px;">
	<h3>게시판</h3>
	<!-- 게시판 버튼 -->
	<div class="container row row-cols-2 mb-3" style="padding-right:0.7em; padding-left:0.7em; margin:auto;">
		<form class="col-12" style="padding:0; margin:auto;">
			<!-- 순서 정렬 -->
			<div class="btn-group col-12 col-sm-12 col-md-2 col-lg-2 col-xl-3 g-1" role="group" style="min-width:250px;">
				<c:if test="${scri.order_by=='order_new'}">
					<input type="radio" class="btn-check" name="order_by" id="order_new" value="order_new" checked>
					<label class="btn btn-outline-primary" for="order_new">최신순</label>
					<input type="radio" class="btn-check" name="order_by" id="order_like" value="order_like">
					<label class="btn btn-outline-primary" for="order_like">추천순</label>
					<input type="radio" class="btn-check" name="order_by" id="order_reply" value="order_reply">
					<label class="btn btn-outline-primary" for="order_reply">댓글순</label>
				</c:if>
				<c:if test="${scri.order_by=='order_like'}">
					<input type="radio" class="btn-check" name="order_by" id="order_new" value="order_new">
					<label class="btn btn-outline-primary" for="order_new">최신순</label>
					<input type="radio" class="btn-check" name="order_by" id="order_like" value="order_like" checked>
					<label class="btn btn-outline-primary" for="order_like">추천순</label>
					<input type="radio" class="btn-check" name="order_by" id="order_reply" value="order_reply">
					<label class="btn btn-outline-primary" for="order_reply">댓글순</label>
				</c:if>
				<c:if test="${scri.order_by=='order_reply'}">
					<input type="radio" class="btn-check" name="order_by" id="order_new" value="order_new">
					<label class="btn btn-outline-primary" for="order_new">최신순</label>
					<input type="radio" class="btn-check" name="order_by" id="order_like" value="order_like">
					<label class="btn btn-outline-primary" for="order_like">추천순</label>
					<input type="radio" class="btn-check" name="order_by" id="order_reply" value="order_reply" checked>
					<label class="btn btn-outline-primary" for="order_reply">댓글순</label>
				</c:if>
			</div>
			<!-- 검색 -->
			<div class="btn-group col-12 col-sm-12 col-md-7 col-lg-8 col-xl-8 g-1" style="float:right;">
				<select class="form-select" name="searchType" style="max-width:100px;">
					<c:if test="${scri.searchType=='subject'}">
						<option value="subject" selected>제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</c:if>
					<c:if test="${scri.searchType=='content'}">
						<option value="subject">제목</option>
						<option value="content" selected>내용</option>
						<option value="writer">작성자</option>
					</c:if>
					<c:if test="${scri.searchType=='writer'}">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer" selected>작성자</option>
					</c:if>
				</select>
				<input type="text" class="form-control" placeholder="${scri.keyword}" name="keyword">
				<c:if test="${pm.scri.my_board!=''}">
					<button class="btn btn-outline-primary" type="submit" onclick="location.href='${pageContext.request.contextPath}/board_list.do'"><i class="bi bi-search"></i></button>
				</c:if>
				<c:if test="${pm.scri.my_board==''}">
					<button class="btn btn-outline-primary" type="submit" onclick="location.href='${pageContext.request.contextPath}/board_list.do'"><i class="bi bi-search"></i></button>
				</c:if>
			</div>
			<!-- 게시판 출력 방법 -->
			<div class="btn-group col-1 g-1" role="group">
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
		<!-- 내 글 보기 -->
		<c:if test="${member_nick!=null}">
			<div class="btn-group col-3 col-md-3 col-lg-2 col-xl-1 g-1">
				<button type="button" name="my_board" id="my_board" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board_list.do?my_board=${member_nick}'" value="">내 글 보기</button>
			</div>
		</c:if>
		<!-- 글 작성 -->
		<div class="btn-group col-2 col-md-2 col-lg-1 col-xl-1 g-1" style="float:right;">
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board_write.do'" style="float:right;">글 작성</button>
		</div>
		</form>
	</div>
	<!-- ajax 리스트 형식 -->
	<div id="view"></div>
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
											<h3 class="mb-1 col-12">${boardVo.board_subject}</h3>
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
			<div class="list-group col-12" style="margin:auto; max-width:1320px; padding-right:0.7em; padding-left:0.7em;">
				<a href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}" class="list-group-item list-group-item-action">
					<table class="table table-borderless">
						<tr>
							<td>
								<div class="d-flex">
									<h3 class="mb-1 col-10">${boardVo.board_subject}</h3>
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
	<!-- 페이지네이션 -->
	<nav>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.scri.my_board!=''}">
				<c:if test="${pm.prev==true}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.startPage-1}">Previous</a>
				    </li>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<c:choose>
						<c:when test="${i==scri.page}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			    <c:if test="${pm.next&&pm.endPage>0}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?my_board=${pm.scri.my_board}&order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.endPage+1}">Next</a>
				    </li>
				</c:if>
			</c:if>
			<c:if test="${pm.scri.my_board==''}">
			    <c:if test="${pm.prev==true}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.startPage-1}">Previous</a>
				    </li>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
					<c:choose>
						<c:when test="${i==scri.page}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			    <c:if test="${pm.next&&pm.endPage>0}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/board_list.do?order_by=${pm.scri.order_by}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&view=${pm.scri.view}&page=${pm.endPage+1}">Next</a>
				    </li>
				</c:if>
			</c:if>
		</ul>
	</nav>
</main>
</html>
<%@ include file="./footer.jsp"%>