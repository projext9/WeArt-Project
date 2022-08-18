/*
* Copyright 2022 Team We-Art
* Licensed under MIT (https://github.com/projext9/WeArt-Project)
*/
var xhtml = $("html");
var page = 1;
var pagePos = 0;

window.addEventListener("wheel", function(e){ //휠 리스너
    e.preventDefault();
},{passive : false});

$(window).on("wheel", function(e) { //이벤트
    if (xhtml.is(":animated")) return;
    if (e.originalEvent.deltaY > 0) {
        if (page == 9) return;
        page++;
        if (page == 1){
			content1_show();
        } else if (page == 4) {
			content1_hide();
			content2_show();
        } else if (page == 7) {
			content2_hide();
			content3_show();
        }
    } else if (e.originalEvent.deltaY < 0) {
        if (page == 1) return;
        page--;
        if (page == 1){
			content2_hide();
			content1_show();
        } else if (page == 3) {
			content2_hide();
			content1_show();
        } else if (page == 6) {
			content3_hide();
			content2_show();
        }
    }
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
})

window.onload = function refresh() {
    xhtml.animate({scrollTop : pagePos});
    $("#contentBox1").fadeIn("slow")
}

function anchor1() {
	page = 1;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
    content3_hide();
    content1_show();
}

function anchor2() {
	page = 2;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
}

function anchor3() {
	page = 3;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
}

function anchor4() {
	page = 4;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
    content1_hide();
    content2_show();
}

function anchor5() {
	page = 5;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
}

function anchor6() {
	page = 6;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
}

function anchor7() {
	page = 7;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
    content2_hide();
    content3_show();
}

function anchor8() {
	page = 8;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
}

function anchor9() {
	page = 9;
    pagePos = (page-1) * $(window).height();
    xhtml.animate({scrollTop : pagePos},10);
}


function content1_show() {
    $("#contentBox1").fadeIn("slow")
}

function content1_hide() {
    $("#contentBox1").fadeOut("fast")
}

function content2_show() {
    $("#contentBox2").fadeIn("slow")
}

function content2_hide() {
    $("#contentBox2").fadeOut("fast")
}

function content3_show() {
    $("#contentBox3").fadeIn("slow")
}

function content3_hide() {
    $("#contentBox3").fadeOut("fast")
}
