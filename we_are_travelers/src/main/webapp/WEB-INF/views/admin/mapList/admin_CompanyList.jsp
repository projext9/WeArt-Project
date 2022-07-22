<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>

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
				<td class="company_name"><a href = "${pageContext.request.contextPath}/admin_mapSearch.do?map_idx=${mapVo.map_idx}">${mapVo.company_name}</a></td>
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
            var region;
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
				level : 10
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

	

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
          
			for (var i = 0; i < addr.length; i++) {

				(function(addr, Company_name) {
				    
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

					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0; font-size:3px; height : 3px">'+Company_name+'</div>'
					        });
					        infowindow.open(map, marker);


						}

					});
				})(addr[i], Company_name[i]);

			}   

		});
	</script>

</body>
</html>
