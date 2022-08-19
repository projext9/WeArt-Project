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
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture01.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor2()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style="height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture02.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor3()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture03.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor4()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
<!-- 2번 게시물 -->
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture04.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor5()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture05.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor6()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>

				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture06.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor7()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
<!-- 3번 게시물 -->
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture07.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor8()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>
				
				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture08.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div class="arrow_down" id="anchor_btn" onClick="anchor9()">
						<span></span>
		                <span></span>
		                <span></span>
					</div>
				</div>

				<div id="anchor_row"></div>
				
				<div style=" height:85vh; background-image:url(${pageContext.request.contextPath}/resources/showimg/showculture09.jpg); background-size: 100% 100%; background-repeat:no-repeat;">
					<div id="anchor_btn2"><button type="button" class="btn btn-secondary" onClick="anchor1()">처음으로</button></div>
				</div>
				
				<div id="anchor_row" style="height: 5vh;"></div>

			</div>

<!-- 1번 게시물 설명 -->
			<div class="contentBox" id="contentBox1">
				<h2>N서울타워(남산서울타워)</h2>
				<br>
				<p>주소 : 서울특별시 용산구 남산공원길 105</p>
				<br>
				<p>N서울타워(남산타워)는 탁 트인 서울 전경을 감상할 수 있는 서울의 대표적인 랜드마크다. 전망대 겸 전파송출탑 역할을 하며, 지리적으로 서울 한 가운데 위치한 남산에 있는 덕분에 아름다운 서울 풍경을 360도 파노라마뷰로 즐길 수 있다. N서울타워는 내외국인 여행객이 꼭 가봐야 할 인기 명소 중 하나로, 연인 사이에서는 로맨틱 데이트 장소로도 잘 알려져 있다.
					<br><br>
					N서울타워는 관광과 문화를 동시에 느낄 수 있는 랜드마크다. 멋진 도시 전망은 물론, 서울의 문화와 역사를 배울 수 있는 좋은 기회. 이 밖에도 다양한 가격대의 식사 옵션을 갖추고 있으며, 타워를 구경한 이후에도 주변에 둘러볼 거리가 많다.
					<br><br>
					전망대는 놓치면 후회하는 명소 중의 명소다. 구름과 어깨를 나란히 할 정도로 높은 전망대에서 도시를 내려다보는 경험은 정말 환상적이다. 메인 전망대가 위치한 3층은 천장부터 바닥까지 모두 투명 유리로 돼있어 더욱 아찔한 파노라마 광경을 선사한다.
					<br><br>
					연인의 데이트 명소로 유명한 N서울타워의 또다른 볼거리는 영원한 사랑의 맹세하는 ‘사랑의 자물쇠’ 울타리다. 자물쇠에 이름과 이니셜 혹은 짧은 사랑의 메시지를 적어 전망대 펜스에 걸어둔다.
				</p>
            </div>

<!-- 2번 게시물 설명 -->
			<div class="contentBox" id="contentBox2">
				<h2>명동 쇼핑거리</h2>
				<br>
				<p>주소 : 서울특별시 중구 명동길</p>
				<br>
				<p>명동은 최근 각 브랜드들이 명동 상권에 주요 매장을 공격적으로 오픈하면서 과거의 명성을 되찾고 있다. 특히 4월 말 5월 초 일본의 골든위크가 시작되면 명동은 더 분주해진다. 일본인들에게 익숙한 롯데백화점은 본점과 명품관인 에비뉴엘이 모두 명동 초입에 있다. 뿐만 아니라 신발, 옷에서 액세서리까지 대중적인 가격대의 매장들이 밀집되어 있어 쇼핑을 즐기기에 부담이 없다. 가장 인기 있는 쇼핑 매장은 단연 뷰티 매장. 일본 여심을 사로잡은 더페이스샵, 에뛰드하우스 이외에도 스킨푸드, 미샤, 아리따움, 한스킨, 바닐라코 등의 매장이 화장품 쇼핑 명당으로 손꼽힌다. 자라(ZARA), 포에버 21, 갭(GAP) 등 글로벌 브랜드 최대 매장도 명동에 몰려 있어 외국인 쇼핑객들을 열광시킨다. 길을 따라 들어선 노점들도 명동의 쇼핑을 한층 더 재미나게 만드는 요소다.
					<br><br>
					거대한 쇼핑 도시를 떠올리게 하는 명동은 그야말로 ‘쇼핑천국’. 고급 브랜드부터 화장품, 기념품 등 없는 걸 찾기가 더 힘들 정도로 다양한 물건을 판매한다. 덕분에 서울을 찾는 외국 여행객들의 필수 코스로 자리 잡은 지 오래다. 웬만한 매장에서는 외국어가 가능한 직원이나 외국어 방송이 따로 나올 정도. 대형 쇼핑몰과 고층 백화점, 레스토랑 및 카페, 거리 노점상까지 포함해 명동 쇼핑거리를 다 둘러보려면 하루가 부족하다. 많은 쇼핑객들이 여러 번 이곳을 찾는 이유이기도 하다.
				</p>
            </div>
            
<!-- 3번 게시물 설명 -->
			<div class="contentBox" id="contentBox3">
				<h2>북촌 한옥마을</h2>
				<br>
				<p>주소 : 서울특별시 종로구 계동길 37</p>
				<br>
				<p>예로부터 북촌이라 하여 양반 동네로 알려진 이곳 주택은 모두 조선 시대의 기와집으로서 상류층의 구조 형태를 간직하며 지금까지 보존되어 오고 있다. 원래 이 동네에는 솟을대문이 있는 큰 집 몇 채와 30여 호의 한옥밖에 없었으나, 일제 말기와 6.25 수복 직후 지금의 상태로 늘어났다. 북촌한옥마을은 경복궁과 창덕궁, 종묘의 사이에 위치한 지역으로 서울 600년 역사와 함께해온 우리의 전통 거주 지역이다. 거대한 두 궁궐 사이에 밀접하여 전통한옥군이 위치하고 있으며, 수많은 가지 모양의 골목길을 그대로 보존하고 있어 6백 년 역사도시의 풍경을 극적으로 보여주고 있다. 지금은 전통문화체험관이나 한옥음식점 등으로 활용이 되어 간접적으로나마 조선시대의 분위기를 느낄 수 있는 곳이다.
				<br><br>
					북촌은 풍수지리적으로 빼어난 산줄기 남쪽 기슭에 자리 잡고 있으며 북악과 응봉을 잇고 있어요. 북촌의 북쪽은 위치가 높아서 겨울에 따뜻하고 배수가 원활하며 남쪽으로는 남산까지 보일 정도로 풍경이 트여 있죠.

북촌 뒤로는 해발 463ｍ의 북악산과 아름다운 삼청공원이 있어요. 서쪽에는 경복궁, 동쪽에는 세계문화유산 창덕궁이 있어서 어디를 가도 고즈넉한 분위기가 가득하죠. 북촌에서는 사적 5곳, 서울시 민속자료 4곳, 유형문화재 3곳, 문화재자료 1곳 뿐만 아니라 석정 보름 우물, 광혜원터와 구한국미술관 등 소중한 민족의 역사적 자산을 만나 볼 수 있어요.
				</p>
            </div>

			<div class="sideBar" id="sideBar">
				<h3 style="text-align: center;">울산광역시</h3>
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