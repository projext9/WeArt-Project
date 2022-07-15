<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
  .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<title>관리자 지도 관리 페이지</title>
</head>
<body>
	<h2>관리자 맵 리스트</h2>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc83f37c00e33dee1d1814e4c4c987aa&libraries=services">
		
	</script>

	<table border="1px">
		<tr style="color: green;">
			<td>번호</td>
			<td>회사이름</td>
			<td>업체지역</td>
			<td>업체주소</td>
			<td>게시일</td>

		</tr>
		<c:forEach var="mapVo" items="${mapList}">
			<tr>
				<td>${mapVo.map_idx}</td>
				<td class="company_name">${mapVo.company_name}</td>
				<td>${mapVo.map_region}</td>

				<td class="map_addr">${mapVo.map_addr}</td>

				<td>${mapVo.map_date}</td>

			</tr>
			<script>
				// 주소로 좌표를 검색합니다
			</script>
		</c:forEach>

	</table>

	<script>
		$(function() {
			var addr = new Array();
			var Company_name = new Array();

			$(".map_addr").each(function(index, item) {
				//console.log($(item).text());
				addr[index] = $(item).text();

			});

			$(".company_name").each(function(index, item) {
				Company_name[index] = $(item).text();

			});

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.450701, 127.570667), // 지도의 중심좌표
				level : 13
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			function resizeMap() {
				var mapContainer = document.getElementById('map');
				mapContainer.style.width = '650px';
				mapContainer.style.height = '650px';
			}

			function relayout() {

				// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
				// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
				// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
				map.relayout();
			}

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			for (var i = 0; i < addr.length; i++) {

				(function(addr, Company_name) {
					var content = '<div class="wrap">'
							+ '    <div class="info">'
							+ '        <div class="title">'
							+ Company_name
							+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
							+ '        </div>'
							+ '        <div class="body">'
							+ '            <div class="desc">'
							+ '                <div class="ellipsis">' + addr
							+ '</div>' + '            </div>'
							+ '        </div>' + '    </div>' + '</div>';
					geocoder.addressSearch(addr, function(result, status) {
						console.log(addr + "addr의값");

						if (status === kakao.maps.services.Status.OK) {//정상적으로 검색이 완료되었으면
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							}); //어찌됐건 10번은 돌아가니까 찍은거

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
							// 인포윈도우로 장소에 대한 설명을 표시합니다

							var overlay = new kakao.maps.CustomOverlay({
								content : content,
								map : map,
								position : marker.getPosition()
							});

							// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							kakao.maps.event.addListener(marker, 'click',
									function() {
										overlay.setMap(map);
									});

							// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
							function closeOverlay() {
								overlay.setMap(null);
							}

						}

					});
				})(addr[i], Company_name[i]);

			}

		});
	</script>

</body>
</html>
