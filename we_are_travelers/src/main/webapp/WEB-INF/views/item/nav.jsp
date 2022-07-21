<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="We-Art Project" />
        <meta name="author" content="team We-Art" />
        <title>We-Art Project</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_common.css" rel="stylesheet" />
    </head>
	<body>
        <!-- Navigation-->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			    <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">We-Art Logo</a>
				<div class="collapse navbar-collapse" id="navbarCollapse">
	      			<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 문화 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 액티비티 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 낚시 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 캠핑 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 숙박 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">&nbsp 마이페이지 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">정보변경</a></li>
                                <li><a class="dropdown-item" href="#!">결제내역</a></li>
                                <li><a class="dropdown-item" href="#!">1:1문의</a></li>
                            </ul>
						</li>
					</ul>
					<button class="btn btn-outline-success" type="submit">로그인</button>
					&nbsp&nbsp
					<button class="btn btn-outline-success" type="submit">회원가입</button>
				</div>
			</div>
		</nav>