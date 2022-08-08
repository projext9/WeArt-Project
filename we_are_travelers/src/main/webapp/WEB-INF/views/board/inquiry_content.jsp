<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
<script>
	$(function() {
		$("*>img").css("max-width", "100%");
		
		$("#insert_reply").click(function() {
			
			let board_idx = $("#board_idx").val();
			let board_content = $("#board_content").val();
			let board_code = "${boardVo.board_code}";

			if(board_content!="") {
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/insert_reply.do",
					data: {"board_idx":board_idx, "board_code":board_code, "board_content":board_content},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: "json",
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/inquiry_content.do?board_idx="+board_idx;
					},
					error: function(error) {
						alert("실패");
					}
				});
			}
		});
		
		$("#reply_modify").click(function() {
			
			$("#reply_modify").css("display", "none");
			$("#reply_delete").css("display", "none");
			$("#before_reply_content").css("display", "none");
			$("#after_reply_content").css("display", "");
			$("#reply_modify_submit").css("display", "");
			$("#reply_modify_cancel").css("display", "");
			
		});
		
		$("#reply_modify_cancel").click(function() {
			
			$("#reply_modify").css("display", "");
			$("#reply_delete").css("display", "");
			$("#before_reply_content").css("display", "");
			$("#after_reply_content").css("display", "none");
			$("#reply_modify_submit").css("display", "none");
			$("#reply_modify_cancel").css("display", "none");
			
		});
		
		$("#reply_modify_submit").click(function() {
			
			let board_originidx = $("#board_idx").val();
			let board_idx = $("#reply_board_idx").val();
			let board_content = $("#after_reply_content").val();
			let board_code = "${boardVo.board_code}";
			
			if(board_content!="") {
				$.ajax({
					type:'post',
					url:"${pageContext.request.contextPath}/modify_reply.do",
					data: {"board_idx":board_idx, "board_code":board_code, "board_content":board_content},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: "json",
					success: function(data) {
						location.href = "${pageContext.request.contextPath}/inquiry_content.do?board_idx="+board_originidx;
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
<main style="padding-top:60px;">
	<div class="container" style="padding-top:1em;">
		<div class="card">
			<div class="card-header d-flex">
				<input type="hidden" id="board_idx" value="${boardVo.board_idx}" style="display:none;">
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
				<div class="d-flex justify-content-between align-items-center">
					<small class="text-muted">
						<c:if test="${boardVo.board_reply==0}"><span style="color:red;">답변 대기 중</span></c:if>
						<c:if test="${boardVo.board_reply!=0}"><span style="color:blue;">답변 완료</span></c:if>
					</small>
					<c:if test="${boardVo.board_writer==member_nick}">
						<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
							<small class="text-muted">
								<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board_modify.do?board_idx=${boardVo.board_idx}'">수정</button>
								<button type="button" data-bs-toggle="modal" data-bs-target="#delete_board" class="btn btn-outline-danger btn-sm">삭제</button>
							</small>
							<!-- Modal -->
							<div class="modal fade" id="delete_board" tabindex="-1">
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
					</c:if>
				</div>
			</div>
		</div>
		<c:if test="${boardVo.board_reply==0}">
			<form class="row g-1 needs-validation" novalidate>
				<div class="col-md-12">
					<span class="input-group-text">답변</span>
					<textarea class="form-control" name="board_content" id="board_content" placeholder="내용을 입력하세요" required></textarea>
					<div class="invalid-feedback">
						내용을 입력하세요
					</div>
					<button class="btn btn-primary d-md-flex justify-content-md-end" id="insert_reply" type="submit" style="margin-left:auto;">확인</button>
				</div>
			</form>
		</c:if>
		<c:forEach var="boardVo" items="${board_reply}">
			<div class="list-group col-12">
				<table class="table table-borderless">
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<h5 class="mb-1 col-4 col-sm-5 col-md-6 col-lg-7 col-xl-8">
									<input type="hidden" id="reply_board_idx" value="${boardVo.board_idx}">
									<span id="before_reply_content">${boardVo.board_content}</span>
									<input type="text" id="after_reply_content" class="form-control" value="${boardVo.board_content}" placeholder="내용을 입력하세요" required style="display:none;">
								</h5>
								<div class="d-flex justify-content-end" style="margin-left:auto;">
									<small class="text-muted">${boardVo.board_writer} / ${boardVo.board_date}</small>
								</div>
								<c:if test="${boardVo.board_writer==member_nick}">
									<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
										<button type="button" class="btn btn-outline-primary btn-sm" id="reply_modify" style="margin-right:0.3em;">수정</button>
										<button type="button" data-bs-toggle="modal" data-bs-target="#delete_reply" class="btn btn-outline-danger btn-sm" id="reply_delete">삭제</button>
										<button type="button" class="btn btn-outline-primary btn-sm" id="reply_modify_submit" style="display:none; margin-right:0.3em;">확인</button>
										<button type="button" class="btn btn-outline-danger btn-sm" id="reply_modify_cancel" style="display:none;">취소</button>
										<!-- Modal -->
										<div class="modal fade" id="delete_reply" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">답변 삭제</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
													</div>
													<div class="modal-body">
														답변을 삭제하시겠습니까?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/delete_reply.do?board_idx=${boardVo.board_idx}&board_originidx=${boardVo.board_originidx}&code=${boardVo.board_code}'">확인</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</main>
</html>
<%@ include file="../footer.jsp"%>