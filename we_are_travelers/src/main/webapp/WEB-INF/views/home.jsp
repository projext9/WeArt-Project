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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/css/weart_common.css" rel="stylesheet" />
	    <style>
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

		.projext9_box { width: 100%; height: 100%; overflow: hidden; margin: 0px auto; position: relative; text-align: center;}
		.projext9 video { width: 100%; display: inline-block; box-sizing: content-box; }
		
		.projext9_div1 {
			width: 80%;
			height: 16%;
			top: 8%;
			left: 10%;
			right: 0%;
			z-index: 1;
			margin: 0;
			max-width: calc(100% - 4em);
			background-color: rgba( 0, 0, 0, 0.7 );
			color:#fff;
			box-sizing: border-box;
			position: absolute;
			display: none;
		}
		
		.projext9_div2 {
			width: 80%;
			height: 27%;
			bottom: 3%;
			left: 10%;
			right: 0%;
			z-index: 1;
			margin: 0;
			max-width: calc(100% - 4em);
			padding-top: 1em;
			background-color: rgba( 0, 0, 0, 0.7 );
			color:#000;
			box-sizing: border-box;
			position: absolute;
			display: none;
		}
		
		.bottom_down {
		    width: 40px;
		    height: 40px;
		    line-height: 40px;
		    background: #0167F3;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    font-size: 16px;
		    color: #fff !important;
		    position: absolute;
		    bottom: 25px;
		    right: 10px;
		    z-index: 1;
		    cursor: pointer;
		    transition: all .3s ease-out 0s;
		    border-radius: 4px;
		}
		
		.bottom_up {
		    width: 40px;
		    height: 40px;
		    line-height: 40px;
		    background: #0167F3;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    font-size: 16px;
		    color: #fff !important;
		    position: absolute;
		    bottom: 270px;
		    right: 10px;
		    z-index: 1;
		    cursor: pointer;
		    transition: all .3s ease-out 0s;
		    border-radius: 4px;
		}
		
		.top_down {
		    width: 40px;
		    height: 40px;
		    line-height: 40px;
		    background: #0167F3;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    font-size: 16px;
		    color: #fff !important;
		    position: absolute;
		    top: 260px;
		    right: 10px;
		    z-index: 1;
		    cursor: pointer;
		    transition: all .3s ease-out 0s;
		    border-radius: 4px;
		}
		
		.top_up {
		    width: 40px;
		    height: 40px;
		    line-height: 40px;
		    background: #0167F3;
		    -webkit-box-pack: center;
		    justify-content: center;
		    -webkit-box-align: center;
		    align-items: center;
		    font-size: 16px;
		    color: #fff !important;
		    position: absolute;
		    top: 130px;
		    right: 10px;
		    z-index: 1;
		    cursor: pointer;
		    transition: all .3s ease-out 0s;
		    border-radius: 4px;
		}
	    </style>
	    <script type="text/javascript">
	    window.onload = function slideUp() {
			$("#projext9_div1").slideDown("slow");
			$("#projext9_div2").slideDown("slow");
	    }
	    
	    function top_hide() {
			$("#projext9_div1").slideUp("slow");
	    }
	    function top_show() {
			$("#projext9_div1").slideDown("slow");
	    }
	    
	    function bottom_hide() {
			$("#projext9_div2").slideUp("slow");
	    }
	    function bottom_show() {
			$("#projext9_div2").slideDown("slow");
	    }
	    
	    $(document).ready(function() {
	    	$("#myModal").modal("show");
	    });

	    </script>
	</head>
	<body>   
		<div class="projext9_box">
			<video muted autoplay loop style="height: 95vh;">
				<source src="resources/assets/videohome.webm" type="video/webm"><!-- https://www.youtube.com/watch?v=N6dp6z-Ie_U -->
			</video>

			<div class="projext9_div1" id="projext9_div1">
			    <div class="row">
			      <div class="col-lg-2" style="padding-top: 5px;">
			        <img src="${pageContext.request.contextPath}/resources/images/culture1.png" width="75" height="75">
			
			        <h3>문화</h3>
			        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/showculture01.do">소개 &raquo;</a></p>
			      </div><!-- /.col-lg-4 -->
			      
			      <div class="col-lg-2" style="padding-top: 5px;">
			        <img src="${pageContext.request.contextPath}/resources/images/activity1.png" width="75" height="75">
			
			        <h3>액티비티</h3>
			        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/showactivity01.do">소개 &raquo;</a></p>
			      </div><!-- /.col-lg-4 -->
			      
			      <div class="col-lg-2" style="padding-top: 5px;">
			        <img src="${pageContext.request.contextPath}/resources/images/fishing1.png" width="75" height="75">
			
			        <h3>낚시</h3>
			        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/showfishing01.do">소개 &raquo;</a></p>
			      </div><!-- /.col-lg-4 -->
			      
			      <div class="col-lg-2" style="padding-top: 5px;">
			        <img src="${pageContext.request.contextPath}/resources/images/camping1.png" width="75" height="75">
			
			        <h3>캠핑</h3>
			        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/showcamping01.do">소개 &raquo;</a></p>
			      </div><!-- /.col-lg-4 -->
			      
			      <div class="col-lg-2" style="padding-top: 5px;">
			        <img src="${pageContext.request.contextPath}/resources/images/hotel1.png" width="75" height="75">
			
			        <h3>숙박</h3>
			        <p><a class="btn btn-secondary" href="${pageContext.request.contextPath}/showstaying01.do">소개 &raquo;</a></p>
			      </div><!-- /.col-lg-4 -->
			      
			    </div><!-- /.row -->
			</div><!-- projext9_div1 -->

			<div class="projext9_div2" id="projext9_div2">

				<div class="container marketing" style="max-width: 1600px; padding-left: 0; padding-right: 0;">
				    
					<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
				    
						<div class="carousel-inner">
				
							<div class="carousel-item active" style="height: 16rem;">
								<div class="container px-4 px-lg-5">
									<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							
							                 <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[0].item_idx}&itemCode=${ItemVoList[0].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[0].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[0].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[1].item_idx}&itemCode=${ItemVoList[1].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[1].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[1].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[2].item_idx}&itemCode=${ItemVoList[2].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[2].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[2].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[3].item_idx}&itemCode=${ItemVoList[3].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[3].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[3].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[4].item_idx}&itemCode=${ItemVoList[4].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[4].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[4].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							
							          </div><!-- row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center -->
							      </div><!-- container px-4 px-lg-5 -->
							</div><!-- carousel-item -->
				
				
							<div class="carousel-item" style="height: 16rem;">
								<div class="container px-4 px-lg-5">
									<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							
							                 <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[5].item_idx}&itemCode=${ItemVoList[5].item_code}'" style="cursor: pointer;">
											<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[5].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
								                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[5].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[6].item_idx}&itemCode=${ItemVoList[6].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[6].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
								                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[6].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[7].item_idx}&itemCode=${ItemVoList[7].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[7].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
									                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[7].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[8].item_idx}&itemCode=${ItemVoList[8].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[8].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[8].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[9].item_idx}&itemCode=${ItemVoList[9].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[9].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[9].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							
							          </div><!-- row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center -->
							      </div><!-- container px-4 px-lg-5 -->
							</div><!-- carousel-item -->
				
				
							<div class="carousel-item" style="height: 16rem;">
								<div class="container px-4 px-lg-5">
									<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							
							                 <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[10].item_idx}&itemCode=${ItemVoList[10].item_code}'" style="cursor: pointer;">
											<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[10].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
								                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[10].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[11].item_idx}&itemCode=${ItemVoList[11].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[11].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
								                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[11].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[12].item_idx}&itemCode=${ItemVoList[12].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[12].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
									                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[12].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[13].item_idx}&itemCode=${ItemVoList[13].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[13].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[13].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							              
							              <div class="col mb-5" style="width: 20%;">
							                     <div class="card h-100" OnClick="location.href ='${pageContext.request.contextPath}/itemdetail.do?iidx=${ItemVoList[14].item_idx}&itemCode=${ItemVoList[14].item_code}'" style="cursor: pointer;">
								<!-- Hot badge-->
							                      <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
							                      <!-- Product image-->
							                      <img class="card-img-top" src="${pageContext.request.contextPath}/resources/itemimg/${ItemVoList[14].item_img}" alt="..." />
							                      <!-- Product details-->
							                      <div class="card-body p-1">
							                          <div class="text-center">
							                              <!-- Product name-->
							                              <h6 class="fw-bolder">${ItemVoList[14].item_name}</h6>
							                          </div>
							                      </div>
							                  </div>
							              </div>
							
							          </div><!-- row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center -->
							      </div><!-- container px-4 px-lg-5 -->
							</div><!-- carousel-item -->
				
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" style="width: 10%; justify-content: left;">
							<span class="carousel-control-prev-icon" aria-hidden="true" style="top: 5%;"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" style="width: 10%; justify-content: right;">
							<span class="carousel-control-next-icon" aria-hidden="true" style="top: 5%;"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>


			</div><!-- projext9_div2 -->
		</div><!-- projext9_box -->

		<div class="top_up" onClick="top_show();" style="background-image:url(${pageContext.request.contextPath}/resources/img/icon/top-show.png); background-size:100% 100%; display: flex;"></div>
		<div class="top_down" onClick="top_hide();" style="background-image:url(${pageContext.request.contextPath}/resources/img/icon/top-hide.png); background-size:100% 100%; display: flex;"></div>


		<div class="bottom_up" onClick="bottom_hide();" style="background-image:url(${pageContext.request.contextPath}/resources/img/icon/bottom-hide.png); background-size:100% 100%; display: flex;"></div>
		<div class="bottom_down" onClick="bottom_show();" style="background-image:url(${pageContext.request.contextPath}/resources/img/icon/bottom-show.png); background-size:100% 100%; display: flex;"></div>
		
		<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">공지사항</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
본 사이트는 자바 스프링을 활용한 비상업목적(개발연습)의 팀 프로젝트로,
<br>
 사용된 컨텐츠의 저작권은 원저작권자에게 있으며, 원저작권자 요청시 삭제하겠습니다.
<br>
Team. We-Art
<br>
테스트 사용자 ID
<br>
test2@test.com   /   암호 : test2
<br>
test3@test.com   /   암호 : test3
<br>
테스트 판매자 ID
<br>
company2@company.com   /   암호 : company2
<br>
company3@company.com   /   암호 : company3
<br>
관리자 ID
<br>
admin@admin.com   /   암호 : admin
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
		
        <%@ include file="footer.jsp"%>
    </body>
</html>
