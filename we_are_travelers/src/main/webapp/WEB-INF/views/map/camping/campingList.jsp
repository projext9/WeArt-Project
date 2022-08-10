<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="We-Art Project" />
<meta name="author" content="team We-Art" />
<title>We-Art Project</title>
<link href="${pageContext.request.contextPath}/resources/css/weart_map.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />
<script>
$(function()
{
	   
	$("input:button").change(function(){
		var map_region = $("input:button").val();
		
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
     			
		   }//end of map_regionList
		   
	});//end of change event
	
	
});
</script>
<meta charset="UTF-8">
<title>Activity Map</title>
</head>
<body>

	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="#777" /></svg>

				<div class="container">
					<div class="carousel-caption text-start">
						<h1>Example headline.</h1>
						<p>Some representative placeholder content for the first slide of the carousel.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="#777" /></svg>

				<div class="container">
					<div class="carousel-caption">
						<h1>Another example headline.</h1>
						<p>Some representative placeholder content for the second slide of the carousel.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">Learn more</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
					<rect width="100%" height="100%" fill="#777" /></svg>

				<div class="container">
					<div class="carousel-caption text-end">
						<h1>One more for good measure.</h1>
						<p>Some representative placeholder content for the third slide of this carousel.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>


	</div>
	<br>
	<br>
	<br>
	<h3 style="margin-left: 25px; font-size: 13px;">
		캠핑 소개>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
</svg>
		전국 캠핑 소개

	</h3>
	<div class="btn-group" role="group" style="float: right">
		<button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">지역별 보기</button>
		<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
		     <li value ="All"><a class= "dropdown-item" href ="#">전체리스트</a></li>
		<c:forEach var = "mapVo" items= "${mapList}">
			<li value ="${mapVo.map_region}"><a class="dropdown-item" href="#">${mapVo.map_region}</a></li>
	    </c:forEach>
		</ul>
	</div>
     
	<br>


	<hr>

	<c:forEach var="mapVo" items="${mapList}">
		<c:if test="${mapVo.map_code == 2}">

			<div class="card mb-3" style="max-width: 90%; margin-left: 100px;">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="${pageContext.request.contextPath}/resources/img/Map_image/camping/${mapVo.map_image}.jpg" class="img-fluid" alt="이미지가없습니다." style="width: 450px; height: 270px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">업체명 : ${mapVo.company_name}</h5>
							<br>
							<p class="card-text">주소지 : ${mapVo.map_addr}</p>
							<p class="card-text">
								<small class="text-muted">
								<button type="button" class="btn btn-info" onclick = "location.href='${pageContext.request.contextPath}/activityMap.do?map_idx=${mapVo.map_idx}'" >위치보기</button>
								
								</small>
							</p>
							<br>

						</div>
					</div>
				</div>
			</div>


			<hr>
		</c:if>
	</c:forEach>

	<%-- <div class="container g-3 row row-cols-2 mb-3" style="margin-left: auto; margin-right: auto;">

				<div class="col-auto col-sm-12 col-md-12 col-lg-12 col-xl-12 g-1" style="border: 1px solid red;">
					<span>${mapVo.map_region}</span><img src="${pageContext.request.contextPath}/resources/img/Map_image/activity/${mapVo.map_image}.jpg" class="img-fluid" alt="이미지가없습니다." style="height: 250px; width: 300px; border: 1px solid red; margin-left: 100px;">
					
						<span style= "vertical-align : top; border: 1px solid red;font-size: 25px; margin-left: 50px;">${mapVo.company_name}</span> 
						<span style ="float : right;border: 1px solid red; margin-right:450px;"><a href="${pageContext.request.contextPath}/activityMap.do?map_idx=${mapVo.map_idx}">위치보기</a></span>
                        <span style = "float : right;border: 1px solid red; text-align : center;
                        ">${mapVo.map_addr}</span>
				</div>

			</div> --%>




	<%--     <br><br>
    <br><br><br><br><br><br>
    <br><br>
    <br><br>
    <br><br> 
	<table border="1px">
		<tr style="color: green;">
			<td>번호</td>
			<td>회사이름</td>
			<td>업체지역</td>
			<td>업체주소</td>
			<td>게시일</td>

		</tr>
		<c:forEach var="mapVo" items="${mapList}">

			<c:if test="${mapVo.map_code == 4}">
				<tr>
					<td>${mapVo.map_idx}</td>
					<td>${mapVo.company_name}</td>
					<td>${mapVo.map_region}</td>
					<td><a href="${pageContext.request.contextPath}/activityMap.do?map_idx=${mapVo.map_idx}">${mapVo.map_addr}</a></td>
					<td>${mapVo.map_date}</td>
				</tr>

			</c:if>
		</c:forEach>
	</table> --%>
	
	

	<%@ include file="../../footer.jsp"%>

</body>
</html>