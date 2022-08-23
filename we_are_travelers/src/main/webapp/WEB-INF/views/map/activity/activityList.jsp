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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/weart_map.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Activity Map</title>


</head>
<body>
<h3 id ="page_top">&nbsp;</h3>

<div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" style ="margin-left:125px; margin-right:125px;">
    <div id = "page_top"class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active" aria-current="true"></button>
    </div>
    <div class="carousel-inner" style ="border-radius :30px;">
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
        <img src="${pageContext.request.contextPath}/resources/img/Map_image/activity/activity1.png" class="img-fluid" alt="이미지가없습니다.">
        <div class="container">
          <div class="carousel-caption text-start">
          
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
         <img src="${pageContext.request.contextPath}/resources/img/Map_image/activity/activity2.png" class="img-fluid" alt="이미지가없습니다.">
        <div class="container">
          <div class="carousel-caption">
            
          </div>
        </div>
      </div>
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
         <img src="${pageContext.request.contextPath}/resources/img/Map_image/activity/activity3.png" class="img-fluid" alt="이미지가없습니다.">
        <div class="container">
          <div class="carousel-caption text-end">
           
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>


	<div class="btn-group" role="group" style="float: right; margin-right:125px;">
		<input type="hidden" id="mapSelect" value="">
		<button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" name="map_region">지역별 보기</button>

		<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
			<li value="All"><a class="dropdown-item" href="${pageContext.request.contextPath}/activityList.do" target="_self">전체리스트</a></li>
			<li value="전북"><a class="dropdown-item" href="${pageContext.request.contextPath}/jeonBuk_Activity.do" target="_self">전북</a></li>
			<li value="전남"><a class="dropdown-item" href="${pageContext.request.contextPath}/jeonNam_Activity.do" target="_self">전남</a></li>
			<li value="충북"><a class="dropdown-item" href="${pageContext.request.contextPath}/chungBuk_Activity.do" target="_self">충북</a></li>
			<li value="충남"><a class="dropdown-item" href="${pageContext.request.contextPath}/chungNam_Activity.do" target="_self">충남</a></li>
			<li value="경북"><a class="dropdown-item" href="${pageContext.request.contextPath}/gyeongBuk_Activity.do" target="_self">경북</a></li>
			<li value="경남"><a class="dropdown-item" href="${pageContext.request.contextPath}/gyeongNam_Activity.do" target="_self">경남</a></li>
			<li value="울산"><a class="dropdown-item" href="${pageContext.request.contextPath}/ulSan_Activity.do" target="_self">울산</a></li>
			<li value="부산"><a class="dropdown-item" href="${pageContext.request.contextPath}/buSan_Activity.do" target="_self">부산</a></li>
			<li value="광주"><a class="dropdown-item" href="${pageContext.request.contextPath}/gwangJu_Activity.do" target="_self">광주</a></li>
			<li value="대전"><a class="dropdown-item" href="${pageContext.request.contextPath}/daeJeon_Activity.do" target="_self">대전</a></li>
			<li value="강원도"><a class="dropdown-item" href="${pageContext.request.contextPath}/gangWondo_Activity.do" target="_self">강원도</a></li>
			<li value="경기도"><a class="dropdown-item" href="${pageContext.request.contextPath}/gyeongGi_do_Activity.do" target="_self">경기도</a></li>
			<li value="서울" id="null"><a class="dropdown-item" href="${pageContext.request.contextPath}/seoul_Activity.do" target="_self">서울</a></li>
			<li value="제주도"><a class="dropdown-item" href="${pageContext.request.contextPath}/jeJu_Activity.do" target="_self">제주</a></li>
		</ul>

	</div>

	<br>


	<hr style="margin-left:125px; margin-right:125px;  background-color: blue;">

	<c:forEach var="mapVo" items="${mapList}">
		<c:if test="${mapVo.map_code == 4}">


			<div class="card mb-3" style="max-width: 100%; float: center; margin-left: 125px; margin-right: 125px; border-radius :30px;">

				<div class="row g-0">
					<div class="col-md-4">

						<img src="${pageContext.request.contextPath}/resources/img/Map_image/activity/${mapVo.map_image}.jpg" class="img-fluid" alt="이미지가없습니다." style="width: 450px; height: 270px;  border-radius :30px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">업체명 : ${mapVo.company_name}</h5>
							<br>
							<p class="card-text">주소지 : ${mapVo.map_addr}</p>
							<p class="card-text">
								<small class="text-muted">
									<button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/activityMap.do?map_idx=${mapVo.map_idx}'">위치보기</button>

								</small>
							</p>
							<span class="card-text">&nbsp;&nbsp;&nbsp;&nbsp;지역 : ${mapVo.map_region}</span> <br>

						</div>
					</div>
				</div>
			</div>


			<hr style="margin-left: 125px; margin-right: 125px;">

		</c:if>
	</c:forEach>
	<div class="fixed-bottom" style="text-align: right; margin-bottom: 400px; margin-right: 50px;">
		<a href="#page_top"> <svg xmlns="http://www.w3.org/2000/svg" width="40px" height="40px" fill="currentColor" class="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
  <path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0z" />
</svg></a>
	</div>
	<div class="fixed-bottom" style="text-align: right; margin-bottom: 350px; margin-right: 50px;">
		<a href="#page_bottom"> <svg xmlns="http://www.w3.org/2000/svg" width="40px" height="40px" fill="currentColor" class="bi bi-arrow-down-square-fill" viewBox="0 0 16 16">
  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5a.5.5 0 0 1 1 0z" />
</svg></a>
	</div>

<h3 id ="page_bottom">&nbsp;</h3>

	<%@ include file="../../footer.jsp"%>

</body>
</html>