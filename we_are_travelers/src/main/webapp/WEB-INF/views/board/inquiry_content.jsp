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
		$("pre").css("white-space", "pre-wrap");
		
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
		
		$("#reply_write").click(function() {
			$("#reply_write").css("display", "none");
			$("#reply_content").css("display", "");
		});
		
		$("#reply_cancel").click(function() {
			$("#reply_content").css("display", "none");
			$("#reply_write").css("display", "");
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
		<span class="input-group-text" style="margin-top:0.5em;">답변
			<c:if test="${boardVo.board_reply==0&&member_idx!=null}">
				<button class="btn btn-outline-primary btn-sm" id="reply_write" style="margin-left:auto;">답변 쓰기</button>
			</c:if>
		</span>
		<form class="row g-1 needs-validation" id="reply_content" novalidate style="display:none;">
			<div class="col-md-12" style="margin-top:0.5em;">
				<textarea class="form-control" name="board_content" id="board_content" placeholder="내용을 입력하세요" required></textarea>
				<div class="invalid-feedback">
					내용을 입력하세요
				</div>
				<div style="float:right; margin-top:0.3em;">
					<button type="submit" class="btn btn-outline-primary btn-sm" id="insert_reply">확인</button>
					<button type="button" class="btn btn-outline-danger btn-sm" id="reply_cancel">취소</button>
				</div>
			</div>
		</form>
		<c:forEach var="boardVo" items="${board_reply}">
			<div class="list-group col-12" style="margin-top:0.5em;">
				<div class="d-flex align-items-center" style="display: inline-block !important;">
					<div class="card">
						<div class="card-body">
							<h5 class="mb-1 col-6 col-sm-7 col-md-8 col-lg-9">
								<input type="hidden" id="reply_board_idx" value="${boardVo.board_idx}" style="display:none;">
								<span id="before_reply_content">${boardVo.board_content}</span>
								<input type="text" id="after_reply_content" class="form-control" value="${boardVo.board_content}" placeholder="내용을 입력하세요" required style="display:none;">
							</h5>
							<div class="d-flex justify-content-start">
								<small class="text-muted align-items-center">${boardVo.board_writer} / ${boardVo.board_date}</small>
								<c:if test="${boardVo.board_writer==member_nick}">
									<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
										<button type="button" class="btn btn-outline-primary btn-sm" id="reply_modify" style="margin-right:0.3em;">수정</button>
										<button type="button" data-bs-toggle="modal" data-bs-target="#delete_reply${boardVo.board_idx}" class="btn btn-outline-danger btn-sm" id="reply_delete">삭제</button>
										<button type="button" class="btn btn-outline-primary btn-sm" id="reply_modify_submit" style="display:none; margin-right:0.3em;">확인</button>
										<button type="button" class="btn btn-outline-danger btn-sm" id="reply_modify_cancel" style="display:none;">취소</button>
										<!-- Modal -->
										<div class="modal fade" id="delete_reply${boardVo.board_idx}" tabindex="-1">
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
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</main>
</html>
<%@ include file="../footer.jsp"%>