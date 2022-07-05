var interval = setInterval(fn_autoCheck, 10000); //길이 자동체크 타미어
var maxSubjectLength = 40; //최대 제목 길이 설정
var maxContentAllLength = 500000; //태그포함 최대 내용 길이 설정
var maxContentLength = 80000; //태그제외 최대 내용 길이 설정

function fn_autoCheck() { //길이 자동체크
	clearInterval(interval) //타이머 정지

	var subjectLength = document.getElementById('subject').value.length; //제목 길이 선언

	oEditors.getById["textarea_content"].exec("UPDATE_CONTENTS_FIELD", []) //네이버 에디터 textarea내용 추출
	var contentValueAll = document.getElementById("textarea_content").value; //태그포함 내용 선언
	var contentValue = document.getElementById("textarea_content").value; //태그제외 내용 선언
	
	contentValue = contentValue.replace(/<br>/ig, ""); //br태그 제외 실행
	contentValue = contentValue.replace(/&nbsp;/ig, ""); //공백 제외 실행
	contentValue = contentValue.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, ""); //html 제외 실행
	
	var contentLengthAll = contentValueAll.length; //태그포함 내용 길이 선언
	var contentLength = contentValue.length; //태그제외 내용 길이 선언
	
	document.getElementById('subjectLength').value = subjectLength; //태그제외 제목 길이 화면 표시
	document.getElementById('contentLength').value = contentLength; //태그제외 내용 길이 화면 표시
	
	if(subjectLength > maxSubjectLength) {
		alert("제목 길이 초과입니다.");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else if(contentLength > maxContentLength) {
		alert("글자수 초과입니다.");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else if (contentLengthAll > maxContentAllLength) {
		alert("태그포함 최대 입력값 초과입니다.");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else {
		interval = setInterval(fn_autoCheck, 10000); //이상 무 타이머 재시작
		return;
	}
}

function fn_check_submit() {
	clearInterval(interval)
	const checkTag = /[<>]/g;
	
	var fm = document.frm; //form 선언
	var subjectValueAll = document.getElementById('subject').value; //제목 내용 선언
	var subjectLength = document.getElementById('subject').value.length; //제목 길이 선언

	oEditors.getById["textarea_content"].exec("UPDATE_CONTENTS_FIELD", []) //네이버 에디터 textarea내용 추출
	var contentValueAll = document.getElementById("textarea_content").value; //태그포함 내용 선언
	var contentValue = document.getElementById("textarea_content").value; //태그제외 내용 선언
	
	contentValue = contentValue.replace(/<br>/ig, "");
	contentValue = contentValue.replace(/&nbsp;/ig, "");
	contentValue = contentValue.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	
	var contentLengthAll = contentValueAll.length; //태그포함 내용 길이 선언
	var contentLength = contentValue.length; //태그제외 내용 길이 선언
	
	document.getElementById('subjectLength').value = subjectLength; //태그제외 제목 길이 화면 표시
	document.getElementById('contentLength').value = contentLength; //태그제외 내용 길이 화면 표시
	
	if (fm.subject.value=="") {
		alert("제목을 입력해주세요");
		fm.subject.focus();
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else if (subjectLength > maxSubjectLength) {
		alert("제목 길이 초과입니다.");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else if(contentValueAll == "<p><br></p>") { //태그포함 내용이 없는 경우
	    alert("내용을 입력해주세요.")
	    oEditors.getById["textarea_content"].exec("FOCUS")
	    interval = setInterval(fn_autoCheck, 10000);
		return
	} else if (contentValue == "") { //내용이 없는 경우
	    alert("내용을 입력해주세요.")
	    oEditors.getById["textarea_content"].exec("FOCUS")
	    interval = setInterval(fn_autoCheck, 10000);
		return
	} else if(contentLength > maxContentLength) {
		alert("글자수 초과입니다.");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else if (contentLengthAll > maxContentAllLength) {
		alert("태그포함 최대 입력값 초과입니다.");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else if (checkTag.test(subjectValueAll)) {
		alert("제목에 특수기호 < >는 사용할 수 없습니다");
		interval = setInterval(fn_autoCheck, 10000);
		return;
	} else {
		fn_submit();
		return;
	}
}