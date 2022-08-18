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
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor2()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style="height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample2.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor3()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample3.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor4()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
<!-- 2번 게시물 -->
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor5()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor6()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>

				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor7()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
<!-- 3번 게시물 -->
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor8()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor9()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>

				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/itemimg/sample1.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div id="anchor_btn2"><button type="button" class="btn btn-secondary btn-sm" onClick="anchor1()">Top</button></div>
				</div>
				
				<div id="anchor_row" style="height: 5vh;"></div>

			</div>

<!-- 1번 게시물 설명 -->
			<div class="contentBox" id="contentBox1">
				<h2>제목1 이곳은 제목입력칸입니다.</h2>
				<br>
				<p>주소 : 이곳은 주소 입력칸입니다.</p>
				<br>
				<p>설명 : 이곳은 설명 입력칸입니다.</p>
            </div>

<!-- 2번 게시물 설명 -->
			<div class="contentBox" id="contentBox2">
				<h2>제목2 이곳은 제목입력칸입니다.</h2>
				<br>
				<p>주소 : 이곳은 주소 입력칸입니다.</p>
				<br>
				<p>설명 : 이곳은 설명 입력칸입니다.</p>
            </div>
            
<!-- 3번 게시물 설명 -->
			<div class="contentBox" id="contentBox3">
				<h2>제목3 이곳은 제목입력칸입니다.</h2>
				<br>
				<p>주소 : 이곳은 주소 입력칸입니다.</p>
				<br>
				<p>설명 : 이곳은 설명 입력칸입니다.</p>
            </div>

			<div class="sideBar" id="sideBar">
				<h3 style="text-align: center;">서울특별시</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath}/showculture1.do">서울</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture2.do">인천</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture3.do">대전</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture4.do">울산</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture5.do">대구</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture6.do">부산</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture7.do">광주</a></li>
				</ul>
				<hr>
				<ul>
					<li><a href="${pageContext.request.contextPath}/showculture8.do">경기도</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture9.do">강원도</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture10.do">충청/세종</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture11.do">경상도</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture12.do">전라도</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture13.do">제주도</a></li>
				</ul>
            </div>

		</section>   
	</body>
	<script src="${pageContext.request.contextPath}/resources/js/weart_show.js"></script>
</html>