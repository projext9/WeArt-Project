<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<link href="${pageContext.request.contextPath}/resources/css/weart_itemlist.css" rel="stylesheet" />
    </head>
	<body>
        <!-- Header-->
        <header>
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		    	<div class="carousel-indicators">
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    	</div>
		    	<div class="carousel-inner">
					<div class="carousel-item active">
				      	<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="${pageContext.request.contextPath}/resources/img/fishing2.png" aria-hidden="true"></img>
					        <div class="container">
								<div class="carousel-caption text-start">
									<h1 style="text-shadow:5px 5px 5px #000;">이것은 낚시상품</h1>
						            <p>우수한 품질의 중국산 낚시대</p>
						            <p><a class="btn btn-lg btn-primary" href="#">구매하기</a></p>
								</div>
					        </div>
					</div>
					<div class="carousel-item">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="${pageContext.request.contextPath}/resources/img/fishing3.png" aria-hidden="true"></img>
						<div class="container">
							<div class="carousel-caption">
								<h1 style="text-shadow:5px 5px 5px #000;">극강의 퀄리티</h1>
								<p style="text-shadow:5px 5px 5px #000;">믿을 수 있는 중국산 제품</p>
								<p><a class="btn btn-lg btn-primary" href="#">구매하기</a></p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="${pageContext.request.contextPath}/resources/img/fishing1.png" aria-hidden="true"></img>
						<div class="container">
							<div class="carousel-caption text-end">
								<h1 style="text-shadow:5px 5px 5px #000;">환상적인 중국산 제품</h1>
									<p style="text-shadow: -1px 0 #000, 0 1px 5px #000, 1px 0 5px #000, 0 -1px #000;">저렴하고 우수한 중국산</p>
									<p><a class="btn btn-lg btn-primary" href="#">구매하기</a></p>
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
		</header>
        
        <!-- Section-->
        <section class="py-5">
        
		<div class="search-middle">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-8 col-md-8 col-10" style="float: none; margin:0 auto;">
						<div class="main-menu-search">
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select id="select1">
											<option selected="">All</option>
											<option value="1">option 01</option>
											<option value="2">option 02</option>
											<option value="3">option 03</option>
											<option value="4">option 04</option>
											<option value="5">option 05</option>
										</select>
									</div>
								</div>
								<div class="search-input">
									<input type="text" placeholder="Search">
								</div>
								<div class="search-btn">
									<button><i class="bi bi-search"></i></button>
								</div>
								&nbsp
								&nbsp
								<a href="#"><img class="img-icon" src="${pageContext.request.contextPath}/resources/img/icon/icon_person.png" alt="..." /></a>
								&nbsp
								&nbsp
								<a href="#"><img class="img-icon" src="${pageContext.request.contextPath}/resources/img/icon/icon_cart.png" alt="..." /></a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

					<c:forEach var="itemVo" items="${fishingShopList}">
                    <div class="col mb-5">
                        <div class="card h-100">
							<!-- Hot badge-->
                            <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${itemVo.item_img}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${itemVo.item_name}</h5>
                                    <!-- Product price-->
                                    &#8361; ${itemVo.item_price}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/itemdetail.do?iidx=${itemVo.item_idx}">상세보기</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
            </div>
        </section>
        <%@ include file="footer.jsp"%>
    </body>
</html>
