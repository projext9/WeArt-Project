<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<style>
	a {text-decoration-line:none; color:black;}
</style>
</head>
<main style="padding-top:60px;">
        <header>
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		    	<div class="carousel-indicators">
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		      		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    	</div>
		    	<div class="carousel-inner">
					<div class="carousel-item active">
				      	<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386831778-1123SHN1YH42IRMPMLQI/20201230172547741_X4PVBAOC.png?format=750w" aria-hidden="true"></img>
					        <div class="container">
								<div class="carousel-caption text-start">
									<h1 style="text-shadow:5px 5px 5px #000;">이것은 낚시상품</h1>
						            <p>우수한 품질의 중국산 낚시대</p>
						            <p><a class="btn btn-lg btn-primary" href="#">구매하기</a></p>
								</div>
					        </div>
					</div>
					<div class="carousel-item">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386887478-9Z3XA27D8WFVDWKW00QS/20201230173806551_JRT8E1VC.png?format=750w" aria-hidden="true"></img>
						<div class="container">
							<div class="carousel-caption">
								<h1 style="text-shadow:5px 5px 5px #000;">극강의 퀄리티</h1>
								<p style="text-shadow:5px 5px 5px #000;">믿을 수 있는 중국산 제품</p>
								<p><a class="btn btn-lg btn-primary" href="#">구매하기</a></p>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="bd-placeholder-img" style="width:100vw; height:300px;" src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386953314-CWUR9AR80VUENTD1A0EN/image-asset.png?format=750w" aria-hidden="true"></img>
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



<section class="py-5">
		
  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
	<div class="row">
		<div class="col-lg-4">
			<a href="#한옥마을">
				<div class="card shadow-sm" style="width:250px; margin:auto;">
					<div class="ratio ratio-4x3">
					<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386831778-1123SHN1YH42IRMPMLQI/20201230172547741_X4PVBAOC.png?format=750w" class="img-fluid">
					</div>
				</div>
				<div class="card-body" style="text-align:center;">
					<h2>한옥마을</h2>
				</div>
			</a>
		</div>
		<div class="col-lg-4">
			<a href="#고궁 야간 투어">
				<div class="card shadow-sm" style="width:250px; margin:auto;">
					<div class="ratio ratio-4x3">
					<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386887478-9Z3XA27D8WFVDWKW00QS/20201230173806551_JRT8E1VC.png?format=750w" class="img-fluid">
					</div>
				</div>
				<div class="card-body" style="text-align:center;">
					<h2>고궁 야간 투어</h2>
				</div>
			</a>
		</div>
		<div class="col-lg-4">
			<a href="#숭례문 & 남대문시장">
				<div class="card shadow-sm" style="width:250px; margin:auto;">
					<div class="ratio ratio-4x3">
					<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386953314-CWUR9AR80VUENTD1A0EN/image-asset.png?format=750w" class="img-fluid">
					</div>
				</div>
				<div class="card-body" style="text-align:center;">
					<h2>숭례문 & 남대문시장</h2>
				</div>
			</a>
		</div>
    </div>


    <hr class="featurette-divider">
	
	<h2 class="featurette-heading" style="margin-bottom:0.5em;" id="한옥마을">한옥마을</h2>
	
	<div class="row featurette">
		<div class="col-lg-5">
			<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386831778-1123SHN1YH42IRMPMLQI/20201230172547741_X4PVBAOC.png?format=750w" class="img-fluid">
			<small class="fw-bold">북촌 한옥마을</small>
			<div class="d-flex align-items-center">
				<small class="text-muted">북촌 한옥마을 언덕에 오르면 한국의 전통가옥과 서울의 모던한 건축물이 함께 어우러져 조화를 이루는 독특한 풍경을 감상할 수 있다.</small>
			</div>
			<br>
			<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386847864-3Q31S7J3S86LTQOTTWRV/20201230172609410_8KZHQ95B.png?format=750w" class="img-fluid">
			<small class="fw-bold">전주 한옥마을</small>
		</div>
		<div class="col-lg-7" style="margin:auto;">
			<p class="lead">
				한국에는 다양한 형태의 한옥마을이 있다. 최근에는 전통 한옥이 모여 있는 옛 마을과 현대적 한옥을 함께 체험할 수 있는 한옥마을이 새로운 관광코스로 주목받고 있다.
			</p>
			<p class="lead">
				북촌 한옥마을과 남산골 한옥마을은 빌딩 숲을 이루고 있는 서울 한복판에 위치해, 과거와 현재 의 공존을 피부로 느낄 수 있다. 한국 최대 규모의 한옥마을인 전주 한옥마을에는 625채에 달하는 옛 기와집과 현대적 감각이 가미된 현대식 한옥이 공존하고 있다. 단지 구경거리로서의 문화상품이 아니라, 관광객이 전통적인 공간에서 다도나 한지 뜨기 같은 전통 체험을 할 수도 있어 많은 사랑을 받고 있다.
			</p>
			<p class="lead">
				그 밖에 충청남도에 위치한 공주 한옥마을, 강원도에 있는 강릉 오죽헌 한옥마을, 전라남도 영암 의 구림 한옥마을은 전주 한옥마을보다 소박하지만 한국문화를 체험하기에 부족함이 없다.
			</p>
			<p class="lead">
				한옥마을은 아니지만 강원도 강릉에 위치한 선교장에서도 전통 한옥을 체험할 수 있다. 선교장 은 조선 상류층인 사대부가의 가옥으로 300여 년 넘게 원형이 잘 보존되어 있으며 지금도 후손들이 거주하고 있다.
			</p>
		</div>
	</div>

    <hr class="featurette-divider">

	<h2 class="featurette-heading" style="margin-bottom:0.5em; text-align:right;" id="고궁 야간 투어">고궁 야간 투어</h2>
	
	<div class="row featurette">
		<div class="col-lg-7" style="margin:auto;">
			<p class="lead">
				한국 관광에서 빼놓을 수 없는 고궁은 낮과 밤의 정서가 확연하게 다르다. 낮의 고궁은 고즈넉한 분 위기와 호젓함을 경험하기 위해 관광객들이 몰려온다. 그러다 어둠이 찾아오면 고궁은 새롭게 단장을 시작한다. 은은한 조명과 신비로운 음향이 더해지면서 낮과는 또 다른 매력을 뿜어낸다. SNS 등을 통해 이러한 매력이 알려지면서 최근 고궁은 새로운 야간 명소로 떠오르고 있다.
			</p>
			<p class="lead">
				야간에 개장하는 고궁으로는 서울 4대 궁(경복궁, 창덕궁, 창경궁, 덕수궁)과 수원 화성행궁 이 있다. 고궁마다 다르지만 투어 프로그램을 진행하는 곳도 있으며, 홈페이지에서 예약해야 한다.
			</p>
		</div>
		<div class="col-lg-5">
			<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386887478-9Z3XA27D8WFVDWKW00QS/20201230173806551_JRT8E1VC.png?format=750w" class="img-fluid">
			<div class="d-flex align-items-center">
				<small class="text-muted">경복궁 야경 체험은 한국을 대표하는 관광 테마 중 하나다.</small>
			</div>
		</div>
	</div>

    <hr class="featurette-divider">

	<h2 class="featurette-heading" style="margin-bottom:0.5em;" id="숭례문 & 남대문시장">숭례문 & 남대문시장</h2>
	
	<div class="row featurette">
		<div class="col-lg-5">
			<img src="https://images.squarespace-cdn.com/content/v1/586ebc34d482e9c69268b69a/1624386953314-CWUR9AR80VUENTD1A0EN/image-asset.png?format=750w" class="img-fluid">
			<small class="fw-bold">숭례문</small>
			<div class="d-flex align-items-center">
				<small class="text-muted">서울의 성곽은 옛날 중요한 국가시설이 있는 한성부를 보호하기 위해 만든 도성(都城)으로, ‘예를 숭상하는 문’이라는 의미의 숭례문은 국보 제1호로 지정되어 있다.</small>
			</div>
		</div>
		<div class="col-lg-7" style="margin:auto;">
			<p class="lead">
				옛 서울성곽의 남쪽 정문으로, 보통 남대문으로 부르지만 원래 이름은 ‘숭례문’이다. 국보 제1호로 지정됐으며, 현존하는 한국의 성문 건물로는 가장 규모가 크다. 2008년 화재로 훼손되었으나, 복원 공사로 예전의 모습을 갖추게 되었다.
			</p>
			<p class="lead">
				숭례문 동쪽에는 남대문시장이 있다. 볼거리와 쇼핑 아이템, 먹거리가 풍부해 쇼핑객과 관광객이 몰려드는 명소다. 의류, 주방용품, 가전제품, 일용잡화 등 다양한 제품을 저렴하게 구매할 수 있으며 갈치조림 골목, 칼국수 골목 등의 먹거리 골목으로도 유명하다.
			</p>
		</div>
	</div>

    <hr class="featurette-divider">

	</div><!-- /.container -->
        

	</section>
        
</main>
</html>
<%@ include file="footer.jsp"%>