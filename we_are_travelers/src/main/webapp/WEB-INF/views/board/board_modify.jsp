<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp"%>
<html>
<head>
<!-- CKEditor5 코드 -->
<script>
	function MyCustomUploadAdapterPlugin(editor) {
		editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
			return new UploadAdapter(loader);
		}
	}
</script>
<!-- /CKEditor5 코드 -->
<style>
	.ck-editor__editable {min-height:500px;}
</style>
<script>
	$(function() {
		$("#board_subject").on("propertychange change paste input", function() {
			if($("#board_subject").val().replace(/\s+/g,"")=="") {
				$("#board_subject").val(null);
			}
		});
		
		// 제목에서 pre태그 제거
		let subject = "${boardVo.board_subject}";
		let board_subject = subject.slice(5, -6);
		$("#board_subject").val(board_subject);
	})
</script>
<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
</head>
<main style="padding-top:60px;">
	<form class="row g-1 needs-validation" method="post" action="${pageContext.request.contextPath}/modify_board.do?board_idx=${boardVo.board_idx}" enctype="multipart/form-data" style="margin:5% 20% 5% 20%;" novalidate>
		<div class="col-md-12">
			<input type="text" name="board_subject" class="form-control" id="board_subject" placeholder="제목을 입력하세요" value="" required>
			<div class="invalid-feedback">
				제목을 입력하세요
			</div>
		</div>
		<div class="col-md-12">
			<textarea class="editor" name="board_content" id="board_content" required placeholder="내용을 입력하세요">${boardVo.board_content}</textarea>
			<div class="invalid-feedback">
				내용을 입력하세요
			</div>
		</div>
		<div class="col-12">
			<button class="btn btn-primary" type="submit" style="float:right;">확인</button>
		</div>
		<input type="hidden" name="code" value="${boardVo.board_code}">
	</form>
</main>
<!-- CKEditor5 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/build/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/UploadAdapter.js"></script>
<script>
	ClassicEditor
		.create( document.querySelector( '.editor' ), {
			extraPlugins: [MyCustomUploadAdapterPlugin],	// 이미지 업로드 어댑터
			licenseKey: '',
			mediaEmbed: {									// 동영상 업로드
			    previewsInData:true
			},
		} )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( error => {
			console.error( 'Oops, something went wrong!' );
			console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
			console.warn( 'Build id: epob765mepsi-71uxdxxu3a3m' );
			console.error( error );
		} );
</script>
<!-- /CKEditor5 -->
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</html>
<%@ include file="../footer.jsp"%>