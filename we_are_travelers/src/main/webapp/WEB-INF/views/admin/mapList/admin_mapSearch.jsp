<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav/navMain.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="mapVo" items="${mapSearch}">

		<hr>
	

	<br>
	<br>
	<br>
	<table style="margin-left: auto; margin-right: auto; width: 100%; height: auto; border-collapse: collapse;">
			<tr>
				<td style="text-align: center; width: 200px;">&nbsp;</td>
				<td style="text-align: center; width: 80%; position: center;"><br> <br> <h3>&nbsp;</h3>
					<div class="col-md-8" id="map" style="width: 100%; height: 500px; border-radius: 60px 60px 60px 60px; text-align: center;">
						<div class="map_wrap col-md-8" style="text-align: center;">
							<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

							

						</div>

					</div>
					<p class="fw-bolder" style = "color: MediumAquamarine; font-size : 25px;">주소 : ${mapVo.map_addr}</p>
					<p class="fw-bolder" style = "color: MediumAquamarine; font-size : 25px;">업체명 : ${mapVo.company_name}</p></td>
				<td style="text-align: center; width: 200px;">&nbsp;</td>

			</tr>
		</table>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc83f37c00e33dee1d1814e4c4c987aa&libraries=services"></script>
		<script>
			var addr = '<c:out value="${mapVo.map_addr}"/>';
			var company_name = '<c:out value="${mapVo.company_name}"/>';
			var map_image = '<c:out value="${mapVo.map_image}"/>;'
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 6
				// 지도의 확대 레벨
				};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							addr,
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">'
														+ company_name
														+ '</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		
		</script>

	</c:forEach>

</body>
</html>