/*
* Copyright 2022 Team We-Art
* Licensed under MIT (https://github.com/projext9/WeArt-Project)
*/
var itemTotal = 0;
var postTotal = 0;

function selectAll(selectAll) { //전체 체크
	const chkBox = document.getElementsByName('cart_idx');
	chkBox.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	  })
	sum_itemPrice(frm);
	sum_postPrice(frm);
	sum_totalPrice(frm);
	}

function sum_itemPrice(frm) { //개별 체크 합계
	var sum = 0;
	var count = 0;
	if (typeof(frm.cart_idx.length) == "undefined") {
		if( frm.cart_idx.checked == true ) {
		    sum = parseInt(frm.item_price.value);
		}
	} else {
		count = frm.cart_idx.length;
		for(var i=0; i < count; i++ ) {
			if( frm.cart_idx[i].checked == true ) {
		    	sum += parseInt(frm.item_price[i].value);
			}
		}
	}
	document.getElementById("total_itemPrice").value = sum;
	document.getElementsByName("total_itemPrice").value = sum;
	document.getElementById("total_itemPrice").innerHTML = "&#8361;"+sum;
	hidden_itemPrice = sum;
}

function sum_postPrice(frm) { //개별 체크 택배비 합계
	var sum = 0;
	var count = 0;
	if (typeof(frm.cart_idx.length) == "undefined") {
		if( frm.cart_idx.checked == true ) {
		    sum = parseInt(frm.item_postPrice.value);
		}
	} else {
		count = frm.cart_idx.length;
		for(var i=0; i < count; i++ ) {
			if( frm.cart_idx[i].checked == true ) {
		    	sum += parseInt(frm.item_postPrice[i].value);
			}
		}
	}
	document.getElementById("total_postPrice").value = sum;
	document.getElementsByName("total_postPrice").value = sum;
	document.getElementById("total_postPrice").innerHTML = "&#8361;"+sum;
	hidden_postPrice = sum;
}

function sum_totalPrice(frm) { //개별 체크 최종 합계
	var sum = 0;
	sum = document.getElementById("total_itemPrice").value + document.getElementById("total_postPrice").value;
	document.getElementsByName("total_price").value = sum;
	document.getElementById("total_price").value = sum;
	document.getElementById("total_price").innerHTML = "&#8361;"+sum;
	hidden_price = sum;
}

function fn_itemOrder() { //체크 된 항목 전송
	sum_itemPrice(frm);
	sum_postPrice(frm);
	sum_totalPrice(frm);
	document.getElementById("hidden_itemPrice").value = hidden_itemPrice;
	document.getElementById("hidden_postPrice").value = hidden_postPrice;
	document.getElementById("hidden_price").value = hidden_price;
	var fm = document.frm;
	alert("배송지 입력 실행");
	fm.action = "itemorder.do";
	fm.method = "post";
	fm.submit();
}

function fn_itemDel() { //체크 된 항목 삭제
	var fm2 = document.frm;
	alert("삭제 실행");
	fm2.action = "itemcartdelete.do";
	fm2.method = "post";
	fm2.submit();
}