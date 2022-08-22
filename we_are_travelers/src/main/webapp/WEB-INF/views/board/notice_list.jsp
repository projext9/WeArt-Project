<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		* > h4 {display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; width:500px;}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		window.onload = function(){
			document.getElementById('searchType').value = "${pm.scri.searchType}";
		}
	
		$(function() {
			$("*").css("text-decoration-line", "none");
			$("h4").css({"white-space":"nowrap", "text-overflow":"ellipsis", "overflow":"hidden"});
		});
	</script>
</head>
<main style="padding-top:115px; color:black;">
	<!-- 게시판 버튼 -->
	<div class="container g-3 row row-cols-2 mb-3" style="padding-top:1em; padding-right:0.7em; padding-left:0.7em; margin:auto;">
		<form class="col-12" style="padding:0; margin:auto;">
			<input type="hidden" name="code" value="${scri.board_code}">
			<!-- 검색 -->
			<div class="btn-group col-12 g-1">
				<select class="form-select" id="searchType" name="searchType" style="max-width:100px;">
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" class="form-control" placeholder="${scri.keyword}" name="keyword">
				<button class="btn btn-outline-primary" type="submit" onclick="location.href='${pageContext.request.contextPath}/notice_list.do'"><i class="bi bi-search"></i></button>
			</div>
			<!-- 글 작성 -->
			<c:if test="${member_grade==1}">
				<div class="btn-group col-2 col-md-2 col-lg-1 col-xl-1 g-1" style="float:right; width:83px; margin-top:0.5em;">
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board_write.do?code=${scri.board_code}'" style="float:right;">글 작성</button>
				</div>
			</c:if>
		</form>
	</div>
	<!-- 리스트 형식 -->
	<c:forEach var="boardVo" items="${board_list}">
		<div class="list-group col-12" style="margin:auto; max-width:1320px; padding:0 0.7em 0.7em 0.7em; border-radius:1em;">
			<a href="${pageContext.request.contextPath}/notice_content.do?board_idx=${boardVo.board_idx}" class="list-group-item list-group-item-action">
				<table class="table table-borderless" style="margin-bottom:0;">
					<tr>
						<td>
							<div class="d-flex">
								<h4 class="mb-0 col-10">${boardVo.board_subject}</h4>
								<div class="d-flex justify-content-end align-items-center" style="margin-left:auto;">
									<small class="text-muted"><c:set var="date" value="${boardVo.board_date}"/>${fn:substring(date,2,11)}</small>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<small class="text-muted">
								<i class="bi bi-eye"></i> ${boardVo.board_hits}
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
					<a class="page-link" href="${pageContext.request.contextPath}/notice_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.startPage-1}">Previous</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<c:choose>
					<c:when test="${i==scri.page}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/notice_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/notice_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		    <c:if test="${pm.next&&pm.endPage>0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/notice_list.do?code=${pm.scri.board_code}&searchType=${pm.scri.searchType}&keyword=${pm.scri.keyword}&page=${pm.endPage+1}">Next</a>
			    </li>
			</c:if>
		</ul>
	</nav>
</main>
</html>
<%@ include file="../footer.jsp"%>