<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="We-Art Project" />
        <meta name="author" content="team We-Art" />
        <title>We-Art Project</title>
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- CSS -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_common.css" rel="stylesheet" />
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
		<script>
			function fn_login() { //로그인 페이지 이동
				location.href="${pageContext.request.contextPath}/login.do";
	 		}
	 		
			function fn_join() { //회원가입 페이지 이동
				location.href="${pageContext.request.contextPath}/joinMember.do";
	 		}
			 
			function fn_logout() { //로그아웃
				location.href="${pageContext.request.contextPath}/logout.do";
	 		}
			function fn_logout_kakao() { //로그아웃
				location.href="https://kauth.kakao.com/oauth/logout?client_id=bd0af17c48ca11ec547a39e63e172346&logout_redirect_uri=http://localhost:8090/travelers/login.do";
	 		}
			function fn_naver_logout() { //로그아웃
				location.href="${pageContext.request.contextPath}/naverLogout.do";
	 		}
			
		</script>
    </head>
	<body>
        <!-- Navigation-->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info" id="navbar_field">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			    <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/assets/weartlogo.png"></a>
				<div class="collapse navbar-collapse" id="navbarCollapse">
	      			<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 문화 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice_list.do?code=n_culture">공지사항</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/culture_page.do">소개</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/attractionList.do">지도</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopculture.do">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board_list.do?code=b_culture">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 액티비티 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice_list.do?code=n_activity">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/activityList.do">지도</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopactivity.do">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board_list.do?code=b_activity">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 낚시 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice_list.do?code=n_fishing">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fishingList.do">지도</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopfishing.do">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board_list.do?code=b_fishing">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 캠핑 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice_list.do?code=n_camping">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/campingList.do">지도</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopcamping.do">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board_list.do?code=b_camping">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 숙박 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice_list.do?code=n_lodgment">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/lodgingList.do">지도</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shopstay.do">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board_list.do?code=b_lodgment">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 마이페이지 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/info_check.do">정보변경</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/payment.do">결제내역</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiry_list.do">1:1문의</a></li>
                            </ul>
						</li>
					</ul>
					${sessionScope.access_Token }				
		<c:choose>
				    <c:when test="${sessionScope.member_id != null && sessionScope.member_regCode == 0 && sessionScope.member_grade == 0}">
					<span>${sessionScope.member_nick }님 환영합니다!</span>&nbsp;
					<button class="btn btn-outline-success" id="btn_nav"  type="button"onClick="fn_logout()">로그아웃</button>
					</c:when>
					 
                     <c:when test="${sessionScope.company_id != null && sessionScope.comapny_auth == 1}">
					<span>${sessionScope.company_name }님 환영합니다!</span>&nbsp;
					<button class="btn btn-outline-success" id="btn_nav"  type="button"onClick="fn_logout()">로그아웃</button>
					 </c:when>
					 
					 <c:when test="${sessionScope.member_id != null && sessionScope.member_grade == 1 }">
					<span>${sessionScope.member_nick }님 환영합니다!</span>
                    <button class="btn btn-outline-success" id="btn_nav" type="button" onClick="location.href='${pageContext.request.contextPath}/memberList.do'">관리자페이지</button>&nbsp;
                    <button class="btn btn-outline-success" id="btn_nav" type="button" onClick="fn_logout()">로그아웃</button>
                    </c:when>
					 
					 <c:when test="${sessionScope.member_id != null && sessionScope.member_regCode == 1}">
					<span>${sessionScope.member_nick }님 환영합니다!</span>&nbsp;
					<button class="kakao_btn" type="button" onClick="fn_logout_kakao()">Kakao 로그아웃</button>
					</c:when>
					
					<c:when test="${sessionScope.member_id != null && sessionScope.member_regCode == 2 }">
					<span>${sessionScope.member_nick }님 환영합니다!</span>&nbsp;
					<button class="naver_btn" type="button" onClick="fn_naver_logout()">Naver 로그아웃</button>
					</c:when>
                  
					<c:otherwise>
					<button class="btn btn-outline-success" id="btn_nav"  type="button" onClick="fn_login()">로그인</button>&nbsp;
					<button class="btn btn-outline-success" id="btn_nav"  type="button"onClick="fn_join()">회원가입</button>
				     </c:otherwise>					
		</c:choose>
				</div>
			</div>
		</nav>