<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<script>
	$(function(){
	$("input:radio").change(function(){
		var map_region = $("input:checked").val();
		
		   $.ajax({
			   
		    	type : 'post',
		    	url : "${pageContext.request.contextPath}/mapRegion.do",
		    	data : {"map_region" : map_region},
		    	success :map_regionList ,
		    	error: function(error){alert("에러발생@");}
		    });

		   
		   function map_regionList(data){
			   
			   var result = '<table border="1px">'+
							'<tr style="color: green;">'+
							'<td>번호</td>'+
							'<td>회사이름</td>'+
							'<td>업체지역</td>'+
							'<td>업체주소</td>'+
							'<td>게시일</td>'+
							'</tr>';
		
    			$.each(data,function(index, item){
    				
    			
    				result+='<tr>'+
							'<td>'+item.map_idx+'</td>'+
							'<td class="company_name"><a href = "${pageContext.request.contextPath}/admin_mapSearch.do?map_idx='+item.map_idx+'">'+item.company_name+'</a></td>'+
							'<td>'+item.map_region+'</td>'+
							'<td class="map_addr">'+item.map_addr+'</td>'+
							'<td>'+item.map_date+'</td>'+
							'</tr>';	
    			
    			
    			});		
    			
    			result+='</table>';
    			
    			$('#addrList').html(result);

		   } 
		
		   
	});
	
});     
 </script>
</script>

	<div id = "addrMapList">
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

		});
	</script>
	</div>
</body>
</html>