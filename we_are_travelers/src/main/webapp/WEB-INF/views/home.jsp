<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_home.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
		 <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"rel="stylesheet" />
		 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
	<body>
        <!-- Navigation-->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			    <a class="navbar-brand" href="#">We-Art Logo</a>
				<div class="collapse navbar-collapse" id="navbarCollapse">
	      			<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"  aria-expanded="false">&nbsp 문화 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"  aria-expanded="false">&nbsp 액티비티 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"  aria-expanded="false">&nbsp 낚시 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"  aria-expanded="false">&nbsp 캠핑 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"  aria-expanded="false">&nbsp 숙박 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">공지사항</a></li>
                                <li><a class="dropdown-item" href="#!">소개</a></li>
                                <li><a class="dropdown-item" href="#!">지도</a></li>
                                <li><a class="dropdown-item" href="#!">쇼핑/예약</a></li>
                                <li><a class="dropdown-item" href="#!">후기게시판</a></li>
                            </ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" aria-expanded="false">&nbsp 마이페이지 &nbsp</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">정보변경</a></li>
                                <li><a class="dropdown-item" href="#!">결제내역</a></li>
                                <li><a class="dropdown-item" href="#!">1:1문의</a></li>
                            </ul>
						</li>
					</ul>
					<c:if test="${sessionScope.list.member_idx == null }">
					<button class="btn btn-outline-success" type="button"><a href="${pageContext.request.contextPath}/login.do">로그인</a></button>
					&nbsp;&nbsp;
					<button class="btn btn-outline-success" type="button"><a href="${pageContext.request.contextPath}/join.do">회원가입</a></button>
				     </c:if>
				    <c:if test="${sessionScope.list.member_id != null }">
					<span>${sessionScope.list.member_nick }님</span>
					&nbsp;&nbsp;
					<a href="/travelers/logout.do">로그아웃</a>
					</c:if>
				
				</div>
			</div>
		</nav>
        
        <!-- Header-->
     <main>

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Example headline.</h1>
            <p>Some representative placeholder content for the first slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Some representative placeholder content for the second slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption text-end">
            <h1>One more for good measure.</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
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


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2>Heading</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2>Heading</h2>
        <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2>Heading</h2>
        <p>And lastly this, the third column of representative placeholder content.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container">
            	<p class="m-0 text-center text-white">
			    <ul>
					<li><a href="<%=request.getContextPath() %>/link.jsp">TEST 소개</a><span>&nbsp;&nbsp; | &nbsp;&nbsp;</span></li>
			        <li><a href="<%=request.getContextPath() %>/link.jsp">이용약관</a><span>&nbsp;&nbsp; | &nbsp;&nbsp;</span></li>
					<li><a href="<%=request.getContextPath() %>/link.jsp">개인정보처리방침</a><span>&nbsp;&nbsp; | &nbsp;&nbsp;</span></li>
			        <li><a href="<%=request.getContextPath() %>/link.jsp">1:1문의</a><span>&nbsp;&nbsp; | &nbsp;&nbsp;</span></li>
			        <li><a href="<%=request.getContextPath() %>/link.jsp">입점문의</a><span>&nbsp;&nbsp;</span></li>
			    </ul>
			    <ul>
					<li>(주)WeArt&nbsp;&nbsp;</li>
					<li>대표 : 홍길동&nbsp;&nbsp;</li>
					<li>전라북도 전주시 덕진구 금암1동 667-52 5층&nbsp;&nbsp;</li>
					<li>사업자등록번호 : 000-00-00000&nbsp;&nbsp;</li>
			    </ul>
			    <ul>
					<li>고객센터 : 1588-0000&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li>개인정보관리책임자 : 홍길동&nbsp;&nbsp;</li>
					<li>개인정보보유기간 : 5년</li>
			    </ul>
			    <div class="copyright">
					<h6>Copyright 2022. Team We-Art. all rights reserved.</h6>
			    </div>
            	</p>
            </div>
        </footer>
        
        
    </body>
</html>
