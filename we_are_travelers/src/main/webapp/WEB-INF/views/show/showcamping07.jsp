<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="projext9" />
        <meta name="author" content="projext9" />
		<!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_nav.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_common.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_show.css" rel="stylesheet" />
	</head>
	<body>
		<div style="height: 14vh;">
		</div>
		<section>
			<div class="container-xxl">
<!-- 1번 게시물 -->
				<div style="width: 50vw; height:50vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/wait.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
				</div>
				
				<div id="anchor_row"></div>

			</div>

			<div class="sideBar" id="sideBar">
				<h3 style="text-align: center;">부산광역시</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath}/showcamping01.do">서울</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping02.do">인천</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping03.do">대전</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping04.do">울산</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping05.do">대구</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping06.do">부산</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping07.do">광주</a></li>
				</ul>
				<hr>
				<ul>
					<li><a href="${pageContext.request.contextPath}/showcamping08.do">경기도</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping09.do">강원도</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping10.do">충청/세종</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping11.do">경상도</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping12.do">전라도</a></li>
					<li><a href="${pageContext.request.contextPath}/showcamping13.do">제주도</a></li>
				</ul>
            </div>

		</section>   
	</body>
	<script src="${pageContext.request.contextPath}/resources/js/weart_show.js"></script>
</html>