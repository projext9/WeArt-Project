<%@ page contentType="text/html; charset=UTF-8"%>
<style>
.table {
	position: relative;
	width: 80%;
}

.navbar-dark .navbar-nav .nav-link { /* 메뉴 텍스트 색상 */
	color: #FFFFFF;
}

.dropdown-item { /* 드롭다운 아이템 배경색 */
	background-color: #87CDEE;
	color: #FFFFFF;
}

.dropdown-menu { /* 드롭다운 메뉴 배경색 */
	background-color: #87CDEE;
}

ul.dropdown-menu a:hover, ul.dropdown-menu a:focus {
	/* 마우스 및 키보드 탐색기의 배경 색상 */
	background: #0DCAF0;
	color: #FFFFFF;
}

.navbar-dark .navbar-toggler { /* 축소메뉴 배경 테두리색 */
	border-color: #ffffff;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
	<div class="container-fluid">
		<a class="navbar-brand" href="/travelers/memberList.do">관리자페이지</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="/travelers/home.do">Home</a></li>

				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 회원관리 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/travelers/memberList.do">회원리스트</a></li>
						<li><a class="dropdown-item" href="/travelers/orderList.do">구매내역</a></li>
						<li><a class="dropdown-item" href="/travelers/noticeMember.do">1:1문의(일반)</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 게시글관리 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/travelers/boardList.do">게시글리스트</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 댓글관리 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/travelers/replyList.do">댓글리스트</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 판매자관리 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="/travelers/sellorList.do">판매자리스트</a></li>
						<li><a class="dropdown-item" href="/travelers/outstanding.do">승인대기</a></li>
						<li><a class="dropdown-item" href="/travelers/noticeSellor.do">1:1문의(판매자)</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 지도 리스트</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					   	<li><a class="dropdown-item" href="/travelers/admin_CompanyList.do">지도리스트</a></li>
					</ul></li>

			</ul>

			<!--
	      <form class="d-flex" role="search">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	      -->
		</div>
	</div>
</nav>

<br>
<br>
<br>
<br>
<!--
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="/travelers/memberList.do">회원리스트</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/travelers/purchaseList.do">구매내역</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="/travelers/purchaseList.do">1:1문의(일반회원)</a>
	  </li>
	</ul>
	-->