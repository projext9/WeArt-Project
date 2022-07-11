<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./nav.jsp"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
		<style type="text/css">
        .bgd-danger {
            background: linear-gradient(30deg, red, yellow);
        }
        
        .btn-n {
            color: white;
            background: gray;
            transition: .2s ease;
            transform: skew(0deg);
        }
        
        .btn-n:hover {
            background: red;
            color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, .8);
            transition: .2s ease;
            transform: scale(1.08) translateY(-3px);
        }
        
        .btn-y {
            background: gray;
            color: white;
            transition: .2s ease;
        }
        
        .btn-y:hover {
            background: green;
            color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, .8);
            transition: .2s ease;
            transform: scale(1.08) translateY(-3px);
        }
        
        .card-bg {
            transition: 1s ease;
        }
        
        .card-bg:hover {
            transform: skew(-10deg) scale(1.05);
            transition: 1s ease;
        }
        
        .icons {
            transition: .8s ease;
            cursor: pointer;
        }
        
        .icons:hover {
            color: #007BFF;
            transform: scale(1.05) translateY(-5px);
            transition: .8s ease;
        }
        
        .iconck {
            color: #007BFF;
            transform: scale(1.05) translateY(-5px);
        }
        
        .icon {
            transition: 1s ease;
        }
        
        .icon:hover {
            transform: scale(1.2);
            transition: 1s ease;
        }
        
        .text-trans {
            transition: .5s ease;
        }
        
        .text-trans:hover {
            transform: skew(-15deg);
            transition: .5s ease;
        }
        
        .btns {
            background: #007BFF;
            color: white;
            font-weight: bold;
            font-size: 1em;
            transition: 1s ease;
        }
        
        .btns:hover {
            text-decoration: none;
            color: white;
            box-shadow: 5px 5px 7px rgba(0, 0, 0, .8);
            transform: scale(1.05) translateY(-8px) skew(-10deg);
            transition: 1s ease;
        }
        
        .bg-alert {
            box-shadow: 0 0 3px rgba(0, 0, 0, .8);
        }
        
        .bg-alert-bg {
            box-shadow: 0 0 10px rgba(0, 0, 0, .8);
            transform: scale(1.05);
        }
        
        .w-25 {
            width: 25% !important;
        }
        
        .mrg-ct {
            margin-top: 5px;
            margin-bottom: 5px;
        }
        
        .int-chagne {
            transition: 1s ease;
        }
        
        .int-chagne:hover {
            transform: skew(-15deg);
            transition: 1s ease;
        }
        
        .turn {
            display: block;
            transform: none;
            transition: .5s ease;
        }
        
        .turnb {
            display: block;
            transform: rotate(-180deg);
            transition: .5s ease;
        }
        
        .clps {
            color: #007BFF;
            text-decoration: none !important;
        }
        
        .clps:hover {
            color: #007BFF;
        }
        
        .clps-btn-style {
            transition: .5s ease;
        }
        
        .clps-btn-style:hover {
            color: #007BFF;
            transform: skew(-15deg);
            transition: .5s ease;
        }
        
        p {
            margin-bottom: .5px !important;
        }
    </style>        
    </head>

<body>

    <div class="container">
        <div style="padding-top:100px;"></div>
        <div class="tab-content">
            <div class="tab-pane active" id="step1">
                <div class="row text-center">
                    <div class="col-sm col-12">
                        <div class="alert alert-primary bg-alert-bg" role="alert">
                            1 . 장바구니
                        </div>
                    </div>
                    <div class="col-sm col-12">
                        <div class="alert alert-secondary" role="alert">
                            2 . 배송지 입력
                        </div>
                    </div>
                    <div class="col-sm col-12">
                        <div class="alert alert-secondary" role="alert">
                            3 . 결제
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="accordion" id="accordionExample">
                                        <div class="card border-0">

                                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                                <div class="card-body p-0">
                                                    <div>
                                                        <table class="table table-sm">
                                                            <thead>
                                                                <tr class="ml-3">
                                                                    <th width="5%"></th>
                                                                    <th width="10%"></th>
                                                                    <th class="text-left" width="45%">상품명</th>
                                                                    <th class="text-center" width="15%">수량</th>
                                                                    <th class="text-center" width="25%">소계</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="align-middle text-center">
                                                                        <a href="#delete" data-toggle="modal" data-title="Delete your product ?">
                                                                            <i class="fal fa-trash-alt"></i>
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <div class="rounded" style="background-image: url(https://unsplash.com/photos/ZBwQ2bCbJjw/download?force=true&w=640); width: 60px; height: 60px; background-size: cover;"></div>
                                                                    </td>
                                                                    <td class="align-middle text-left">Spy Suit</td>
                                                                    <td class="align-middle text-center">1 개</td>
                                                                    <td class="align-middle text-center">&#8361; 50,000,000</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="align-middle text-center">
                                                                        <a href="#delete" data-toggle="modal" data-title="Delete your product ?">
                                                                            <i class="fal fa-trash-alt"></i>
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <div class="rounded" style="background-image: url(https://unsplash.com/photos/vOwj38HFrJ0/download?force=true&w=640); width: 60px; height: 60px; background-size: cover;"></div>
                                                                    </td>
                                                                    <td class="align-middle text-left">Hyper Hero Suit</td>
                                                                    <td class="align-middle text-center">2 개</td>
                                                                    <td class="align-middle text-center">&#8361; 50,000,000</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="align-middle text-center">
                                                                        <a href="#delete" data-toggle="modal" data-title="Delete your product ?">
                                                                            <i class="fal fa-trash-alt"></i>
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <div class="rounded" style="background-image: url(https://unsplash.com/photos/FxraOMAkLOs/download?force=true&w=640); width: 60px; height: 60px; background-size: cover;background-position: center center;"></div>
                                                                    </td>
                                                                    <td class="align-middle text-left">Stash Boots</td>
                                                                    <td class="align-middle text-center">1 개</td>
                                                                    <td class="align-middle text-center">&#8361; 50,000,000</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" class="align-middle text-right">배송비</td>
                                                                    <td class="align-middle text-center">&#8361; 3,000</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" class="align-middle text-right">총 가격</td>
                                                                    <td class="align-middle text-center">&#8361; 50,000,000</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>



                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
	            <div class="list-group mt-5 p-0 justify-content-center active" id="allList" role="tablist" style="flex-direction: row;">
	            	<a href="javascript:window.history.back();" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">돌아가기<i class="fal fa-arrow-circle-right"></i></a>
	            	&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#step2" class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab">배송지 입력<i class="fal fa-arrow-circle-right"></i></a>
				</div>


            </div>
	

        <%@ include file="footer.jsp"%>
    </body>
</html>
