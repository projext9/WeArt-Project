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
<title>전체 맵 리스트</title>


</head>
<body>

	<table style="margin-left: auto; margin-right: auto; width: 100%; height: auto; border-collapse: collapse;">
		<tr>
			<td style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td style="border: 1px solid #444444; vertical-align: top; text-align: center; background-color : Aliceblue;">
				<h3 style="margin-left: 25px; font-size: 13px;">
					<strong> 액티비티 소개></strong> <strong><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z" />
</svg></strong> <strong>전국 액티비티 소개</strong>

				</h3> <c:set var="i" value="0" /> <c:forEach var="mapVo" items="${mapList}">
					
						<div class="btn-group">

							<button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${mapVo.map_region}</button>

							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">${mapVo.company_name}</a></li>
							</ul>

						</div>

						<c:set var="i" value="${i+1}" />

						<c:if test="${i == 3}">
							<c:set var="i" value="0" />
							<br>
							<br>
						</c:if>


				

				</c:forEach>



			</td>
			<td style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</table>


	<br>


	<hr>
	



	<%@ include file="../../footer.jsp"%>

</body>
</html>