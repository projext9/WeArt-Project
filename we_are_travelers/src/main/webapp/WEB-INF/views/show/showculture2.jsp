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
		<style>
			html { overflow: hidden; }
			
			<!-- body { width : initial; } -->
			
			html, body {
			    display: block;
			    width: 100%;
			    height: 100%;
			    margin: 0;
			}

			.section {
			    width: 100%;
			    height: 100%;
				position: relative;
			}
			
			.contentBox {
				display: none;
				width: 30%;
				height: 60%;
				position: fixed;
				bottom: 15vh;
				right: 0%;
				z-index: 1;
				margin: 0;
				max-width: calc(100% - 4em);
				padding: 1em;
				background-color: #000;
				background-color: rgba( 0, 0, 0, 0.7 );
				box-sizing: inherit;
				color:#fff;
			}
			
			.sideBar {
				width: 11%;
				height: 40%;
				position: fixed;
				top: 25vh;
				left: 3%;
				z-index: 1;
				margin: 0;
				max-width: calc(100% - 4em);
				padding: 1em;
				background-color: #00A5FF;
				box-sizing: inherit;
				border-radious: 20px;
				border-radius: 20px;
				color:#fff;
			}

			li a {
				color: #fff;
			}
			
			li a:hover {
				color: #000;
			}

			#anchor_row { height: 16vh; }
			
			#anchor_btn { z-index: 1; position: relative; top: 85%; left: 50%; }
			#anchor_btn2 { z-index: 1; position: relative; top: 90%; left: 50%; }

			.arrow_down span {
			    display: block;
			    width: 30px;
			    height: 30px;
			    border-bottom: 5px solid #fff;
			    border-right: 5px solid #fff;
			    transform: rotate(45deg);
			    margin: -10px;
			    animation: animate 2s infinite;
			}
			.arrow_down span:nth-child(2) {
			    animation-delay: -0.2s;
			}
			.arrow_down span:nth-child(3) {
			    animation-delay: -0.2s;
			}
			@keyframes animate {
			    0% {
			        opacity: 0;
			        transform: rotate(45deg) translate(-20px,-20px);
			    }
			    50% { opacity: 1; }
			    100% {
			        opacity: 0;
			        transform: rotate(45deg) translate(20px,20px);
			    }
			}

		</style>
		<script>
			var xhtml = $("html");
			var page = 1;
		    var pagePos = 0;

			window.addEventListener("wheel", function(e){ //휠 리스너
			    e.preventDefault();
			},{passive : false});
			
			$(window).on("wheel", function(e) { //이벤트
			    if (xhtml.is(":animated")) return;
			    if (e.originalEvent.deltaY > 0) {
			        if (page == 9) return;
			        page++;
			        if (page == 1){
						content1_show();
			        } else if (page == 4) {
						content1_hide();
						content2_show();
			        } else if (page == 7) {
						content2_hide();
						content3_show();
			        }
			    } else if (e.originalEvent.deltaY < 0) {
			        if (page == 1) return;
			        page--;
			        if (page == 1){
						content2_hide();
						content1_show();
			        } else if (page == 3) {
						content2_hide();
						content1_show();
			        } else if (page == 6) {
						content3_hide();
						content2_show();
			        }
			    }
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			})
			
			window.onload = function refresh() {
			    xhtml.animate({scrollTop : pagePos});
			    $("#contentBox1").fadeIn("slow")
			}
			
			function anchor1() {
				page = 1;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			    content3_hide();
			    content1_show();
			}
			
			function anchor2() {
				page = 2;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			}
			
			function anchor3() {
				page = 3;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			}

			function anchor4() {
				page = 4;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			    content1_hide();
			    content2_show();
			}
			
			function anchor5() {
				page = 5;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			}
			
			function anchor6() {
				page = 6;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			}
			
			function anchor7() {
				page = 7;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			    content2_hide();
			    content3_show();
			}
			
			function anchor8() {
				page = 8;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			}
			
			function anchor9() {
				page = 9;
			    pagePos = (page-1) * $(window).height();
			    xhtml.animate({scrollTop : pagePos},10);
			}
			

			function content1_show() {
			    $("#contentBox1").fadeIn("slow")
			}

			function content1_hide() {
			    $("#contentBox1").fadeOut("fast")
			}

			function content2_show() {
			    $("#contentBox2").fadeIn("slow")
			}

			function content2_hide() {
			    $("#contentBox2").fadeOut("fast")
			}
			
			function content3_show() {
			    $("#contentBox3").fadeIn("slow")
			}

			function content3_hide() {
			    $("#contentBox3").fadeOut("fast")
			}
			
		</script>
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
</html>