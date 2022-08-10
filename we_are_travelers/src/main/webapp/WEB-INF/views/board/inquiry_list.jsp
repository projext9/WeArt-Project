<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		* > h3 {display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; width:500px;}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		window.onload = function(){
			document.getElementById('code').value = "${pm.scri.board_code}";
			document.getElementById('searchType').value = "${pm.scri.searchType}";
		}
	
		$(function() {
			$("*").css("text-decoration-line", "none");
			$("a > *").css("color", "black");
			$("pre").css({"text-overflow":"ellipsis", "overflow":"hidden"});
		});
	</script>
</head>
<main style="padding-top:60px;">
	<!-- 게시판 버튼 -->
	<div class="container g-3 row row-cols-2 mb-3" style="padding-top:1em; padding-right:0.7em; padding-left:0.7em; margin:auto;">
		<form class="col-12" style="padding:0; margin:auto;">
			<!-- 검색 -->
			<div class="btn-group col-12 g-1">
				<select class="form-select" id="code" name="code" style="max-width:120px;">
					<option value="" selected disabled hidden>문의 유형</option>
					<option value="p_inquiry">결제</option>
					<option value="l_inquiry">로그인</option>
					<option value="d_inquiry">배송</option>
					<option value="c_inquiry">환불</option>
					<option value="e_inquiry">기타</option>
				</select>
				<select class="form-select" id="searchType" name="searchType" style="max-width:100px;">
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" class="form-control" placeholder="${scri.keyword}" name="keyword">
				<button class="btn btn-outline-primary" type="submit" onclick="location.href='${pageContext.request.contextPath}/inquiry_list.do'"><i class="bi bi-search"></i></button>
			</div>
			<!-- 글 작성 -->
			<div class="btn-group col-2 col-md-2 col-lg-1 col-xl-1 g-1" style="float:right; width:83px; margin-top:0.5em;">
				<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/inquiry_write.do?code=${scri.board_code}'" style="float:right;">글 작성</button>
			</div>
		</form>
	</div>
	<!-- 리스트 형식 -->
	<c:forEach var="boardVo" items="${inquiry_list}">
		<div class="list-group col-12" style="margin:auto; max-width:1320px; padding:0 0.7em 0.7em 0.7em; border-radius:1em;">
			<a href="${pageContext.request.contextPath}/inquiry_content.do?board_idx=${boardVo.board_idx}" class="list-group-item list-group-item-action">
				<table class="table table-borderless" style="margin-bottom:0;">
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
								<c:if test="${boardVo.board_reply==0}"><span style="color:red;">답변 대기 중</span></c:if>
								<c:if test="${boardVo.board_reply!=0}"><span style="color:blue;">답변 완료</span></c:if>
							</small>
						</td>
					</tr>
				</table>
			</a>
		</div>
	</c:forEach>
	<!-- 페이지네이션 -->
	<br>
	<nav>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev==true}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/inquiry_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<c:choose>
					<c:when test="${i==scri.page}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/inquiry_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/inquiry_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		    <c:if test="${pm.next&&pm.endPage>0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/inquiry_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
			    </li>
			</c:if>
		</ul>
	</nav>
</main>
</html>
<%@ include file="../footer.jsp"%>