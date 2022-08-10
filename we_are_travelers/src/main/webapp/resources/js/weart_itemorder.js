/*
* Copyright 2022 Team We-Art
* Licensed under MIT (https://github.com/projext9/WeArt-Project)
*/
$(function(){
	$("#orderLast_msg_text").hide();
	$("#orderLast_msg").change(function() {
			if($("#orderLast_msg_write").is(':selected') == true) {
				$("#orderLast_msg_text").show();
			}  else {
				$("#orderLast_msg_text").hide();
			}
		})
	});

function fn_modalNameChange() {
	document.getElementById("member_name").innerHTML = document.getElementById("modalNameChange").value;
	document.getElementById("orderLast_name").value = document.getElementById("modalNameChange").value;
	$('#modalName').modal('hide');
}

function fn_modalPhoneChange() {
	document.getElementById("member_phone").innerHTML = document.getElementById("modalPhoneChange").value;
	document.getElementById("orderLast_phone").value = document.getElementById("modalPhoneChange").value;
	$('#modalPhone').modal('hide');
}

function fn_AddrChange() {
	var addr1 = document.getElementById("sample4_postcode").value;
	var addr2 = document.getElementById("sample4_roadAddress").value;
	var addr3 = document.getElementById("sample4_extraAddress").value;
	var addr4 = document.getElementById("sample4_detailAddress").value;
	document.getElementById("orderLast_address").value = addr1+addr2+addr3+addr4;
}

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
    fn_AddrChange();
}

function fn_itemPay() { //체크 된 항목 전송
	fn_AddrChange();
	document.getElementById("orderLast_msg_write").value = document.getElementById("orderLast_msg_text").value
	var frmData = $("#frm1, #frm2").serialize();
	var orderLast_num = "";
	$.ajax({
		method: 'post',
	    url: 'itemorderadd.do',
	    data: frmData,
	    dataType: 'html',
	    cache: false,
		success: function(data) {
			orderLast_num = data;
			location.href = "itempay.do?idx="+orderLast_num;
			},
		error: function(error){ alert("에러!"); }
	})
}