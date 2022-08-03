/*
* Copyright 2022 Team We-Art
* Licensed under MIT (https://github.com/projext9/WeArt-Project)
*/
var optionValue = "";
var pieceValue = "";
	
var optionSelect = (target) => {
	optionValue = target.options[target.selectedIndex].value;
	alert("선택된 옵션 value 값=" + optionValue);
}
var pieceSelect = (target) => {
	pieceValue = target.options[target.selectedIndex].value;
	alert("선택된 수량 value 값=" + pieceValue);
}

$(function(){ //장바구니 담기
	$("#additemcart").click(function(){
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/itemcartadd.do",
			data: {
				"optionValue": $("#optionValue option:selected").val(),
				"pieceValue": $("#pieceValue option:selected").val()
			},
			success: function(data){
				if(data == "L") {
					alert("로그인 후 이용해주세요!");
				} else if (data == "Y") {
					alert("장바구니 담기 성공!");
				} else if (data == "N") {
					alert("장바구니 담기 실패!");
				}
			},
			error: function(error){ alert("장바구니 에러발생!"); }
		});
	});
});

function fn_search() { //검색
	var fm = document.frm;
	var itemCode = document.getElementById("itemCode").value;
	if (itemCode == 1) {
		alert(itemCode);
		fm.action = "1.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 2) {
		alert(itemCode);
		fm.action = "2.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 3) {
		alert(itemCode);
		fm.action = "fishingshop.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 4) {
		alert(itemCode);
		fm.action = "3.do";
		fm.method = "get";
		fm.submit();
	} else if (itemCode == 5) {
		alert(itemCode);
			fm.action = "4.do";
			fm.method = "get";
			fm.submit();
	} else {
		alert("에러가 발생했습니다.");
	}
}