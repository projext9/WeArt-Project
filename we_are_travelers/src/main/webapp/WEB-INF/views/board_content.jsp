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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
<script>
	$(function() {
		$("*>img").css("max-width", "100%");
		
		$("#insert_reply").click(function() {
			
			let board_idx = $("#board_idx").val();
			let board_content = $("#board_content").val();

			if(board_content!="") {
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/insert_reply.do",
					data: {"board_idx":board_idx, "board_content":board_content},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: "json",
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/board_content.do?board_idx="+board_idx;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}
		});
		
		$("input:radio[name=order_by]").click(function() {
			
			let board_idx = "${boardVo.board_idx}";
			let order_by = $("input:radio[name=order_by]:checked").val();
			let page = "${scri.page}";
			
			$.ajax({
				url:"${pageContext.request.contextPath}/board_content.do?board_idx="+board_idx,
				method:"get",
				data: {"board_idx":board_idx, "order_by":order_by, "page":page},
				success: function(data) {
					location.href = "${pageContext.request.contextPath}/board_content.do?board_idx="+board_idx+"&order_by="+order_by+"&page="+page;
				},
				error: function(error) {
					alert("실패");
				}
			});
		});
		
		$("#before_like").click(function() {
			
			let board_idx = "${boardVo.board_idx}";
			let board_like = "1";
			
			$.ajax({
				url:"${pageContext.request.contextPath}/update_like.do",
				method:"POST",
				data: {"board_idx":board_idx, "board_like":board_like},
				success: function(data) {
					$("*>#before_like").css("display", "none");
					$("*>#after_like").css("display", "");
					like_count();
				},
				error: function(error) {
					alert("실패");
				}
			});
		});
		$("#after_like").click(function() {
			
			let board_idx = "${boardVo.board_idx}";
			let board_like = "0";
			
			$.ajax({
				url:"${pageContext.request.contextPath}/update_like.do",
				method:"POST",
				data: {"board_idx":board_idx, "board_like":board_like},
				success: function(data) {
					$("*>#after_like").css("display", "none");
					$("*>#before_like").css("display", "");
					like_count();
				},
				error: function(error) {
					alert("실패");
				}
			});
		});
		
		function like_count() {
			
			let board_idx = "${boardVo.board_idx}";
			
			$.ajax({
				url:"${pageContext.request.contextPath}/like_count.do",
				method:"POST",
				data:{"board_idx":board_idx},
				success:function(data) {
					$("*>#like_count"+board_idx).html(data);
				},
				error: function(error) {
					alert("실패");
				}
			});
		}
		
		like_count();
		
		$("*>#reply_before_like").click(function() {
			
			let board_idx = $("*>#reply_board_idx").val();
			let board_like = "1";
			alert(board_idx);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/update_like.do",
				method:"POST",
				data: {"board_idx":board_idx, "board_like":board_like},
				success: function(data) {
					$("*>#reply_before_like").css("display", "none");
					$("*>#reply_after_like").css("display", "");
					like_count();
				},
				error: function(error) {
					alert("실패");
				}
			});
		});

	});
</script>
</head>
<main style="padding-top:60px;">
	<h3>게시판</h3>
	<div class="container">
		<div class="card">
			<div class="card-header d-flex">
				<h3 class="mb-1 col-9">${boardVo.board_subject}</h3>
				<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
					<small class="text-muted">${boardVo.board_writer} / ${boardVo.board_date}</small>
				</div>
			</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${boardVo.board_content}</p>
				</blockquote>
				<hr>
				<div style="text-align:center; font-size:300%;">
					<span id="before_like"><i class="bi bi-heart"></i></span>
					<span id="after_like" style="display:none;"><i class="bi bi-heart-fill"></i></span>
					<span id="like_count${boardVo.board_idx}"></span>
				</div>
				<hr>
				<div class="d-flex justify-content-between align-items-center">
					<small class="text-muted">
						<span id="before_like"><i class="bi bi-heart"></i></span>
						<span id="after_like" style="display:none;"><i class="bi bi-heart-fill"></i></span>
						<span id="like_count${boardVo.board_idx}"></span>
						<i class="bi bi-chat-dots" name="board_reply" id="board_reply"></i> ${boardVo.board_reply}
						<i class="bi bi-eye" name="board_hits" id="board_hits"></i> ${boardVo.board_hits}
					</small>
					<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
						<small class="text-muted">
							<a href="${pageContext.request.contextPath}/board_modify.do?board_idx=${boardVo.board_idx}">수정</a>
							<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</a>
						</small>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">게시글 삭제</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
									</div>
									<div class="modal-body">
										게시글을 삭제하시겠습니까?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/delete_board.do?board_idx=${boardVo.board_idx}'">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form class="row g-1 needs-validation" novalidate>
			<div class="col-md-12">
				<input type="hidden" name="board_idx" id="board_idx" value="${boardVo.board_idx}">
				<span class="input-group-text">댓글 </span>
				<textarea class="form-control" name="board_content" id="board_content" placeholder="내용을 입력하세요" required></textarea>
				<div class="invalid-feedback">
					내용을 입력하세요
				</div>
				<button class="btn btn-primary" id="insert_reply" type="submit">확인</button>
			</div>
		</form>
		<!-- 순서 정렬 -->
		<div class="btn-group col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1 g-1" role="group" style="min-width:250px;">
			<c:if test="${scri.order_by=='order_new'}">
				<input type="radio" class="btn-check" name="order_by" id="order_new" value="order_new" checked>
				<label class="btn btn-outline-primary" for="order_new">최신순</label>
				<input type="radio" class="btn-check" name="order_by" id="order_like" value="order_like">
				<label class="btn btn-outline-primary" for="order_like">추천순</label>
			</c:if>
			<c:if test="${scri.order_by=='order_like'}">
				<input type="radio" class="btn-check" name="order_by" id="order_new" value="order_new">
				<label class="btn btn-outline-primary" for="order_new">최신순</label>
				<input type="radio" class="btn-check" name="order_by" id="order_like" value="order_like" checked>
				<label class="btn btn-outline-primary" for="order_like">추천순</label>
			</c:if>
		</div>
		<c:forEach var="boardVo" items="${board_reply}">
			<div class="list-group col-12" style="margin:auto; max-width:1320px;">
				<table class="table table-borderless">
					<tr>
						<td>
							<div class="d-flex">
								<h5 class="mb-1 col-10">
									<input type="hidden" id="reply_board_idx" value="${boardVo.board_idx}">
									<span id="reply_before_like" value="${boardVo.board_idx}"><i class="bi bi-heart"></i></span>
									<span id="reply_after_like" value="${boardVo.board_idx}" style="display:none;"><i class="bi bi-heart-fill"></i></span>
									<span id="like_count${boardVo.board_idx}"></span>
									<span>${boardVo.board_content}</span>
								</h5>
								<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
									<small class="text-muted">${boardVo.board_writer} / ${boardVo.board_date}</small>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<!-- 페이지네이션 -->
	<nav>
		<ul class="pagination justify-content-center">
		    <c:if test="${pm.prev==true}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?order_by=${pm.scri.order_by}&page=${pm.startPage-1}">Previous</a>
			    </li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<c:choose>
					<c:when test="${i==scri.page}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}&order_by=${pm.scri.order_by}&page=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}&order_by=${pm.scri.order_by}&page=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		    <c:if test="${pm.next&&pm.endPage>0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/board_content.do?board_idx=${boardVo.board_idx}&order_by=${pm.scri.order_by}&page=${pm.endPage+1}">Next</a>
			    </li>
			</c:if>
		</ul>
	</nav>
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</main>
</html>
<%@ include file="./footer.jsp"%>