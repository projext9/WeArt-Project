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
	});
</script>
</head>
<main style="padding-top:60px;">
	<div class="container" style="padding-top:1em;">
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
				<div class="d-flex justify-content-between align-items-center">
					<small class="text-muted">
						<i class="bi bi-eye" name="board_hits" id="board_hits"></i> ${boardVo.board_hits}
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
	</div>
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</main>
</html>
<%@ include file="../footer.jsp"%>