<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="nav.jsp"%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="We-Art Project" />
        <meta name="author" content="team We-Art" />
        <title>We-Art Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/weart_common.css" rel="stylesheet" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"rel="stylesheet" />
		<script src="https://kit.fontawesome.com/6c060c00b1.js"crossorigin="anonymous"></script>

    </head>
	<body>
		<!-- Header-->
        <header id="header" sytle="width:1320px;">
<section>
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
    
    </div>
    
    <div class="carousel-inner">
      <div class="carousel-item active">
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/culture.jpg" width="100%" height="100%"></a>
        <!--<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>-->
        <div class="container">
          <div class="carousel-caption" id="culture">
            <h1>문화</h1>
            <br> 
            <h4>보물 제 1764호 낙선재는 창덕궁과 창경궁 경계에 위치하고 있다.맨 좌측에 낙선재가 크게 자리 잡고 그 우측으로 석복헌과</h4>
            <br>
            <h4>수강재가 연이어져 있으며,</h4> 
            <br> 
            <h4> 이들 뒤편에는 화초·석물·꽃담 굴뚝 등으로 가꾸어진 아름다운 화계와 그 위의 꽃담 너머로는 상량정·한정당·취운정이 위치해</h4>
            <br> 
            <h4>있다.</h4>
          </div>
        </div>
      </div>
      
      <div class="carousel-item">
        <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>-->
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/activity.jpg" width="100%" height="100%"></a>
        <div class="container" >
          <div class="carousel-caption" id="activity">
            <h1>액티비티</h1>
            <br>
            <h4>'한계'라고 느낄 때 '한 개'를 더 성장시켜야한다.</h4>
          </div>
        </div>
      </div>
      
      <div class="carousel-item">
        <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>-->
         <a href="#"><img src="${pageContext.request.contextPath}/resources/images/fishing.jpg" width="100%" height="100%"></a>
        <div class="container" >
          <div class="carousel-caption"id="fishing">
            <h1>낚시</h1>
            <br>
            <h4>낚시꾼들은 자기가 잡았던 물고기의 대부분을 잊는다, 하지만 그들은 그들이 보았던 계곡과 강은 잊지 않는다.</h4>    
          </div>
        </div>
      </div>
      
      <div class="carousel-item">
        <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>-->
       <a href="#"><img src="${pageContext.request.contextPath}/resources/images/camping.jpg" width="100%" height="100%"></a>
        <div class="container" >
          <div class="carousel-caption"id="camping">
            <h1>캠핑</h1>
            <br>
            <h4>자연은 착한 안내자다.
            <br>
            <br>
                           현명하고 공정하고 선량하다.</h4>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <!--<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>--> 
       <a href="#"><img src="${pageContext.request.contextPath}/resources/images/hotel.jpg" width="100%" height="100%"></a>
        <div class="container">
          <div class="carousel-caption" id="hotel" >
            <h1>숙박</h1>
            <br>
            <p>여행과 장소의 변화는 우리 마음에 활력을 선사한다</p>
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
</section>
		</header>

  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->
		<!-- Section-->
		<section class="py-5">
		
  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row text-center" >
      <div class="col-lg">
         <a href="#"><img src="${pageContext.request.contextPath}/resources/images/culture1.png" width="100px" height="100px"></a>
        <h2>문화</h2>
        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/culture_page.do">소개 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
        
        
        <div class="col-lg">
         <a href="#"><img src="${pageContext.request.contextPath}/resources/images/activity1.png" width="100px" height="100px"></a>
        <h2>액티비티</h2>
        <p><a class="btn btn-secondary" href="#">소개 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
      
      <div class="col-lg"> 
         <a href="#"><img src="${pageContext.request.contextPath}/resources/images/fishing1.png" width="100px" height="100px"></a>
        <h2>낚시</h2>
        <p><a class="btn btn-secondary" href="#">소개 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      
      
      <div class="col-lg">
        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/camping1.png" width="100px" height="100px"></a>
        <h2>캠핑</h2>
        <p><a class="btn btn-secondary" href="#">소개 &raquo;</a></p>        
      </div><!-- /.col-lg-4 -->
      
      
      <div class="col-lg">
      <a href="#"><img src="${pageContext.request.contextPath}/resources/images/hotel1.png" width="100px" height="100px"></a>
        <h2>숙박</h2>
        <p><a class="btn btn-secondary" href="#">소개 &raquo;</a></p>
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
        

		</section>
        <%@ include file="footer.jsp"%>
    </body>
</html>
