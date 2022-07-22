<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<title>Home</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">We-art</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">명소</a>
        </li>
        <li class = "nav-item">
          <a class="nav-link" href="/travelers/activityList.do">액티비티</a>       
        </li>
        <li class = "nav-item">
          <a class="nav-link" href="#">숙박</a>       
        </li>
        <li class = "nav-item">
          <a class="nav-link" href="#">낚시</a>       
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<h2>Hello world!</h2>

<h3>  홈 페이지입니다... </h3>

<hr/>

	<c:choose>
		<c:when test="${member_id != null}"><!-- 로그인이 이루어진 경우 -->
		
			<c:if test="${member_grade != 0}"><!-- member_grade: 0(일반회원), 1(관리자), 2(슈퍼관리자) -->
				<a href="/travelers/admin.do">관리자페이지</a><p/>
			</c:if>
			
			<a href="/travelers/memberInfo.do">내정보</a>&nbsp;&nbsp;
			<a href="/travelers/logout.do">로그아웃</a><p/>
			<a href="/travelers/fileUpload.do">파일업로드</a>
		</c:when>
		
		<c:otherwise><!-- 로그인이 이루어지지 않은 경우 -->
			<a href="/travelers/join.do">회원가입</a><p/>
			<a href="/travelers/login.do">로그인</a>
		</c:otherwise>
	</c:choose>
	<a href ="/travelers/activityList.do">액티비티 리스트 들어가기 </a> <br><br>
	<a href = "/travelers/attractionList.do">명소 리스트 들어가기</a><br><br>
	<a href = "/travelers/fishingList.do">낚시터 리스트 들어가기</a><br><br>
	<a href = "/travelers/campingList.do">캠핑 리스트 들어가기</a><br><br>
	<a href = "/travelers/lodgingList.do">숙박 리스트 들어가기</a><br><br>
	
	<a href = "/travelers/admin_CompanyList.do">관리자 맵리스트</a>
	



</body>
</html>
