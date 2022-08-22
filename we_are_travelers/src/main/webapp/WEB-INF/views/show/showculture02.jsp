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
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0201.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor2()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style="height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0202.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor3()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0203.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor4()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
<!-- 2번 게시물 -->
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0204.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor5()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0205.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor6()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>

				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0206.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor7()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
<!-- 3번 게시물 -->
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0207.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor8()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0208.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor9()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>

				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture0209.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div id="anchor_btn2"><button type="button" class="btn btn-secondary" onClick="anchor1()">처음으로</button></div>
				</div>
				
				<div id="anchor_row" style="height: 5vh;"></div>

			</div>

<!-- 1번 게시물 설명 -->
			<div class="contentBox" id="contentBox1">
				<h2>송도 센트럴파크</h2>
				<br>
				<p>주소 : 인천광역시 연수구 송도동 컨벤시아대로 160</p>
				<br>
				<p>송도국제도시의 핵심지구인 국제업부단지 내 첨단업무지구와 주거단지 가운데 위치한 송도 센트럴파크는 도시의 열섬현상을 막고 빗물을 효율적으로 재활용 할 수 있는 최신공법으로 조성되었다. 우리나라 최초로 해수를 끌어와 수상공원을 조성하였으며, 수상택시도 운행을 한다. 주변에 특급호텔들이 있으며, 근거리에 쇼핑몰도 있어 휴양관광지로 각광받고 있다.
					<br><br>
					송도국제도시의 빌딩 숲 사이를 지나다 보면 우리의 옛 건축 한옥을 만나볼 수 있는 한옥마을이 있습니다. 한옥마을은 도심 속 휴식 공간이자 외국인들에게 한옥의 미와 우수성을 알리는 인천의 관광 명소입니다.
					<br><br>
					한옥마을은 한옥호텔, 한옥 식당, 문화체험 등 다양한 시설과 문화체험을 할 수 있습니다. 이곳에서 전통혼례를 하는 부부도 있어, 한국의 옛 문화를 볼 수 있는 기회도 있으며, 조용한 것을 좋아하는 분이라면 산책을 하면서 한옥의 미를 만나볼 수도 있습니다.
					<br><br>
					밤이 되면 빌딩의 조명과 한옥마을의 조명이 어우러져 더욱 멋스러운 한옥마을의 모습을 만나볼 수 있습니다.
				</p>
            </div>

<!-- 2번 게시물 설명 -->
			<div class="contentBox" id="contentBox2">
				<h2>강화 광성보</h2>
				<br>
				<p>주소 : 인천 강화군 불은면 해안동로466번길 27</p>
				<br>
				<p>강화 광성보는 강화해협을 지키던 중요한 요새로 강화 12진보 가운데 하나이다. 1658년(효종 9)에 강화유수 서원이가 광성보를 설치하였고 이후 1679년(숙종 5)에 만들어진 오두돈대, 화도돈대, 광성돈대를 관할하였다. 1745년(영조 21)에는 완전히 돌로 성벽을 고쳐 쌓으면서 ‘안해루’란 성문을 설치했다.
					<br><br>
					현재 광성보에는 신미양요 때 사용한 대포와 포대, 성곽이 비교적 잘 보존돼 있다. 광성보 안에는 광성돈대, 어재연‧어재순 형제의 충절을 기리는 쌍충비각, 이름을 알 수 없는 전사 장병을 모신 신미순의총, 손돌목돈대, 용두돈대가 있고, 강화 전적지 정화기념비가 용두돈대 위에 있다.
					<br><br>
					1998년에는 해변 쪽으로 넓은 휴식 공간을 조성했고, 매년 음력 4월 24일에는 신미양요 때 장렬히 전사한 어재연 장군과 무명용사를 기리는 광성제가 봉행된다. 강화 광성보는 사적이다.
				</p>
            </div>
            
<!-- 3번 게시물 설명 -->
			<div class="contentBox" id="contentBox3">
				<h2>부평도호부관아</h2>
				<br>
				<p>주소 : 인천 계양구 어사대로 20</p>
				<br>
				<p>부평도호부관아는 1677년(숙종 3)에 중수했다는 기록이 있으나 최초 설립 연대는 알 수 없다. 고려시대 1150년(의종 4) 안남도호부로, 1215년(고종 2) 계양도호부였다가 조선시대 1413년(태종 13) 부평부에서 부평도호부로 승격되었는데 이때 관아 건립에 착수한 것으로 추정할 수 있다. 풍치목으로 심어진 은행나무의 수령이 약 600여년쯤 되는 것과도 일치한다. 관아 앞에는 욕은지와 어사대가 있다. 정조는 부평에 들러 부사를 인견하며 어사대에서 활을 쏘고 이곳 욕은지에서 손을 씻은 후 다시 길을 떠났다고 전한다.
				<br><br>
				부평도호부관아는 객사, 동헌, 서헌, 삼문, 근민당, 좌익랑, 우익랑, 동책방, 서책방, 사령청, 향청, 포도청, 훈무당, 부창 등 총 23동 23칸의 건물로 된 웅장한 규모였다. 그러나 이곳에 초등학교를 세우면서 대부분의 건물은 헐어버리고 현존 건물만 학교 운동장 한 모퉁이로 이전하였다.
				<br><br>
				이전 당시에는 1m 높이의 석축 위에 지은 ‘ㄱ’자형 집이었는데, 1968년 다시 옮기면서 석축과 날개를 떼어버리고 ‘一자’ 건물로 바뀌어 정면 6칸, 측면 2칸의 팔작지붕 도리집이 되었다. 이로 미루어 이 건물은 동헌이나 부사의 살림채였던 내아로 추측되고 있다. 부평도호부관아는 인천광역시 유형문화재이다.
				</p>
            </div>

			<div class="sideBar" id="sideBar">
				<h3 style="text-align: center;">인천광역시</h3>
				<ul>
					<li><a href="${pageContext.request.contextPath}/showculture01.do">서울</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture02.do">인천</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture03.do">대전</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture04.do">울산</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture05.do">대구</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture06.do">부산</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture07.do">광주</a></li>
				</ul>
				<hr>
				<ul>
					<li><a href="${pageContext.request.contextPath}/showculture08.do">경기도</a></li>
					<li><a href="${pageContext.request.contextPath}/showculture09.do">강원도</a></li>
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