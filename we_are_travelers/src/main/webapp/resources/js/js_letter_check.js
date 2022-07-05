/* check nickname letter */
function fn_letter_nickname() { //eng kor num only accept
	var blank1 = document.getElementById("blank1").value;
	const checkSpecial1 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	const checkBlank1 = /\s/g;
	const checkEngKorNum = /[a-z|A-Z|0-9|가-힣]/g;
	if (blank1=="") {
		alert("빈칸을 채워주세요");
  		return;
	} else if (blank1.lengh >10) {
		alert("최대 글자수(10자) 초과");
  		return;
  	} else if (checkSpecial1.test(blank1)) {
		alert("특수문자 포함 불가능");
  		return;
	} else if (checkBlank1.test(blank1)) {
		alert("공백(스페이스) 포함 불가능");
		return;
	} else if (checkEngKorNum.test(blank1)) {
  		fn_check();
		return;
    } else {
		alert("영어 한글 숫자만 입력 가능");
  		return;
	} 
}

/* check id letter */
function fn_letter_id() { //eng(lowercase) num only accept
	var blank1 = document.getElementById("blank1").value;
	const checkSpecial2 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	const checkBlank2 = /\s/g;
	const checkEngNum = /[a-z|0-9]/g;
	if (blank1=="") {
		alert("빈칸을 채워주세요");
  		return;
	} else if (checkSpecial2.test(blank1)) {
		alert("특수문자는 ~!@#$%^&*()만 가능 합니다");
  		return;
	} else if (checkBlank2.test(blank1)) {
		alert("공백(스페이스) 포함 불가능");
		return;
	} else if (checkEngNum.test(blank1)) {
  		fn_check();
		return;
    } else {
		alert("영어(소문자) 숫자만 입력 가능");
  		return;
	} 
}

/* check password letter */
function fn_letter_pwd() { //eng num sp(specific) only accept
	var blank1 = document.getElementById("blank1").value;
	const checkSpecial3 = /[\{\}\[\]\/?.,;:|`\-_+<>\\\=\'\"]/g;
	const checkBlank3 = /\s/g;
	const checkEngNumSp = /[a-z|A-Z|0-9]/g;
	if (blank1=="") {
		alert("빈칸을 채워주세요");
  		return;
	} else if (checkSpecial3.test(blank1)) {
		alert("특수문자는 ~!@#$%^&*()만 가능 합니다");
  		return;
	} else if (checkBlank3.test(blank1)) {
		alert("공백(스페이스) 포함 불가능");
		return;
	} else if (checkEngNumSp.test(blank1)) {
  		fn_check();
		return;
    } else {
		alert("영어 숫자 지정된 특수문자만 입력 가능");
  		return;
	} 
}