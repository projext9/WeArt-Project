<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

 <style>
       a{
       text-decoration-line : none;
       text-decoration-color : none;
       color : white;
       }
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/weart_home.css" rel="stylesheet">
    
  </head>
  
  <body>
<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Carousel</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li>
        </ul>
        <form class="d-flex">
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
		<button type="button" class="btn btn-outline-success" ><a href="/travelers/login.do">로그인</a></button>
          <button type="button" class="btn btn-outline-success" ><a href="/travelers/join.do">회원가입</a></button>
          <button type="button" class="btn btn-outline-success" ><a href="/travelers/joinCompany.do">기업회원가입</a></button>
		</c:otherwise>
	</c:choose>
        </form>
      </div>
    </div>
  </nav>
</header>
<body>

</body>
</html>
