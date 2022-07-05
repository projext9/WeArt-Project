<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>


</head>
<body>
	<h2>Hello world!</h2>

	<h3>홈 페이지입니다...</h3>

	<hr />

	<c:choose>
		<c:when test="${member_id != null}">
			<!-- 로그인이 이루어진 경우 -->

			<c:if test="${member_grade != 0}">
				<!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
				<a href="/travelers/admin.do">관리자페이지</a>
				<p />
			</c:if>

			<a href="/travelers/memberInfo.do">내정보</a>&nbsp;&nbsp;
			<a href="/travelers/logout.do">로그아웃</a>
			<p />
			<a href="/travelers/fileUpload.do">파일업로드</a>
		</c:when>

		<c:otherwise>
			<!-- 로그인이 이루어지지 않은 경우 -->
			<a href="/travelers/join.do">회원가입</a>
			<p />
			<a href="/travelers/login.do">로그인</a>
		</c:otherwise>
	</c:choose>
	<%
		String APIcode = "bc83f37c00e33dee1d1814e4c4c987aa";
	%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc83f37c00e33dee1d1814e4c4c987aa&libraries=services"></script>
	
	
	<a href = "/travelers/activity.do">액티비티 지도보러가기</a>



</body>
</html>
