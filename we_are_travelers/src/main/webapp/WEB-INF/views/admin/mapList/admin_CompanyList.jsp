<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>

<title>관리자 지도 리스트 페이지</title>
<%@ include file="../nav/navMain.jsp"%>
</head>
<body>

	<table style="margin-left: auto; margin-right: auto; width: 100%; height: auto; border-collapse: collapse;">
			<tr>
				<td style="text-align: center; width: 200px;">&nbsp;</td>
				<td style="text-align: center; width: 80%; position: center;"><br> <br> <h3>&nbsp;</h3>
					<div class="col-md-8" id="map" style="width: 100%; height: 500px; border-radius: 60px 60px 60px 60px; text-align: center;">
						<div class="map_wrap col-md-8" style="text-align: center;">
							<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

							

						</div>

					</div>
					
				<td style="text-align: center; width: 200px;">&nbsp;</td>

			</tr>
		</table>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc83f37c00e33dee1d1814e4c4c987aa&libraries=services">
	
	</script>
	


     
    
   <form id="mapForm" action="${pageContext.request.contextPath}/admin_CompanyList.do" method="post">
   
   <br><br>
    <div style = "text-align:center;">
      <input type="radio" value="List" name="map_region" style ="text-align:center;"><Strong>지역별 보기</Strong>
    
     <c:forEach var="region" items="${regionArr}">
    	<c:choose>
	    	<c:when test="${region eq map_region2}">
	    		<input type="radio" value="${region}" name="map_region" style ="text-align:center;" checked><Strong>${region}</Strong>
	    	</c:when>
	    	<c:otherwise>
	    		<input type="radio" value="${region}" name="map_region" style ="text-align:center;"><Strong>${region}</Strong>
	    	</c:otherwise>
    	</c:choose>	
    </c:forEach>
    </div>
	 <br><br>
		<div id="addrList">
			<table style ="margin-left:auto; margin-right:auto; text-align:center;">
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
						<td class="company_name" style = "text-color:blue"><a href="${pageContext.request.contextPath}/admin_mapSearch.do?map_idx=${mapVo.map_idx}">${mapVo.company_name}</a></td>
						<td>${mapVo.map_region}</td>

						<td class="map_addr">${mapVo.map_addr}</td>

						<td>${mapVo.map_date}</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</form>

	<script>
$(function() {
			displayMap();
		
            function displayMap(){   	
				var addr = new Array(); // 주소값을 담을 배열 선언 
				var Company_name = new Array(); //업체 이름을 담을 배열 선언
				$(".map_addr").each(function(index, item) { //class 이름이 map_addr인 값들의 index와 컬럼값을 뽑아옴
					//console.log($(item).text());
					addr[index] = $(item).text(); //인덱스의 길이만큼 배열 addr에 class 이름이 map_addr인 컬럼값들을 뽑아와서 , 배열에 넣어줌
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
								});
	
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
	         }//end of displayMap
            
            
            
	    	$("input:radio").change(function(){
	    		
	    		
	    		
	    		
	    		$("#mapForm").submit();
	    		
	    	});//end of change event
	    	
	    	
	    	
});     
		
	</script>
	

</body>
</html>
