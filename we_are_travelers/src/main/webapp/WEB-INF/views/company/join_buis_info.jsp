<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/weart_company_form.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">	
	   
		$(function() {
			 					
			$('input[type="text"]').on('blur',function() {
				
				$('.next_info').prop('disabled', false);
				
	            if($('.company_name_input').val() && $('.ceo_input').val() && $('.company_address').val() && $('.company_detail_address').val() && $('.company_auth_name').val() != null){
				  $('.next_info').prop('disabled', false).css('background' , 'linear-gradient(to right top, #5151E5, #72EDF2)').css('color' , 'white').css('border', '1px solid white');	
			    }
		    });
		});
	    
	    $(function() {
	    		 
		$("#file").on('change',function(){
			  var fileName = $("#file").val();
			  $(".company_auth_name").val(fileName);
		});
		
		$('.next_info').on('click' , function(){
				
			   var company_name = $('.company_name_input').val();
			   var company_ceo_name = $('.ceo_input').val();
			   var company_phone=$('.phone_input').val();
			   var company_address = $('.company_address').val();
			   var company_deatailaddress = $('.company_detail_address').val();
			   var company_auth = $('.company_auth_name').val();
			    
			if(company_name ==""){	
				$('.company_name_input_check').html('기업명을 입력해주세요').css('color' , 'red' )
				return false;
		    }if(company_ceo_name ==""){	
		    	$('.ceo_input_check').html('대표자를 입력해주세요').css('color' , 'red' )
		    	return false;
		    }if(company_phone ==""){	
		    	$('.phone_input_check').html('연락처를 입력해주세요').css('color' , 'red' )
		    	return false;
		    }if(company_address ==""){	
				$('.address_check').html('주소를 입력해주세요').css('color' , 'red' )
				return false;	
			}if(company_deatailaddress ==""){	
				$('.detail_address_check').html('상세주소를 입력해주세요').css('color' , 'red' )
				return false;
			}if(company_auth ==""){
				$('.company_auth_check').html('사업자등록증명원을 첨부해주세요').css('color' , 'red' )
				return false;
		    }
		});
   });
	    function sample6_execDaumPostcode(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = (data.zonecode + "  " + data.roadAddress);
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = (data.zonecode + data.jibunAddress );
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr =  data.buildingName;
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("company_detailAddress_id").value = extraAddr;
	                
	                } else {
	                    document.getElementById("company_detailAddress_id").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               // document.getElementById("sample6_address").value = data.zonecode;
	                document.getElementById("company_address_id").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("company_detailAddress_id").focus();
	                
	            }
	        }).open();
	     }
		
</script>
</head>

<body class="join_member">
<h1>WeAreTravelers!
<br>&nbsp;&nbsp;for Company
</h1>
<main class="join_cont_info">
<form class="join_form_info" name="joinForm" action="/travelers/join_com_finish.do" method="post" enctype="multipart/form-data">
    
    <input type="hidden" name="company_buis_number" value="${company_buis_number }">
    <input type="hidden" name="company_id" value="${company_id }">
    <input type="hidden" name="company_pwd" value="${company_pwd }">
    
    <div class="multi_box3">
    <progress value="80" max="100"></progress>
    <br>
    <div class="guide_box">
      <h2 class="join_guide1">위아트 계정의
      <br>
      기업정보를 입력해주세요</h2>
    </div>
    </div>
      
<div class="buis_info_area">
    <div class="company_name_wrap">기업명
        <input class="company_name_input" id="company_name_input_id" name="company_name" placeholder="사업자등록증명원 기업명">
     </div>
     <span class="company_name_input_check"></span>   
     
    <div class="ceo_wrap">
    <label>대표자
        <input class="ceo_input" id="ceo_input_id" name="company_ceo_name" placeholder="사업자등록증명원 대표자명">
     </label>   
     </div>
      <span class="ceo_input_check"></span>
      
      <div class="phone_wrap">
    <label>연락처
        <input class="phone_input" id="phone_input_id" name="company_phone" placeholder="기업 연락처" maxlength="11">
     </label>   
     </div>
      <span class="phone_input_check"></span>     
                
      <div class="address_box">
       <label>기업 주소
        <input type="text" class="company_address" id="company_address_id" onclick="sample6_execDaumPostcode()" placeholder="주소찾기" name="address">       
       <span class="address_check"></span>
       </label>
       </div>
       
       <div class="detail_address_box">
        <input type="text" class="company_detail_address" id="company_detailAddress_id" placeholder="상세주소" name="detail_address">
        <span class="detail_address_check"></span>
     </div>
    
      <div class="filebox">
      <span>기업인증</span>
        <input class="company_auth_name" placeholder="사업자등록증명원을 첨부해주세요" readonly>
        <span class="company_auth_check"></span> 
        <label for="file">파일첨부</label>
        <input type="file" class="company_auth" id="file" name="company_auth_origin_file" accept=".jpg,.pdf,.png,.jpeg">
        
    </div>
</div>
     <div class="next_info_wrap">
	     <button type="submit" class="next_info" disabled="disabled" style="font-size:1.3em">다음</button>
	 </div>
	      
</form> 
</main>
</body>
</html>        