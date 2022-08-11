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
	.ck-editor__editable {min-height:400px;}
</style>
<script>
	$(function() {
		
		$("#validationCustom02").on("propertychange change paste input", function() {
			if($("#validationCustom02").val().replace(/\s+/g,"")=="") {
				$("#validationCustom02").val(null);
			}
		});
		
	});
</script>
<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
</head>
<main style="padding-top:60px;">
	<form class="row g-1 needs-validation" method="post" action="${pageContext.request.contextPath}/insert_board.do" enctype="multipart/form-data" style="margin:5% 10% 5% 10%;" novalidate>
		<div class="btn-group col-12">
			<div class="col-5 col-md-4 col-xl-2">
				<select class="form-select" name="code" id="validationCustom01" required style="min-width:120px;">
					<option value="" selected disabled hidden>문의 유형</option>
					<option value="mp_inquiry">결제</option>
					<option value="ml_inquiry">로그인</option>
					<option value="md_inquiry">배송</option>
					<option value="mc_inquiry">환불</option>
					<option value="me_inquiry">기타</option>
				</select>
				<div class="invalid-feedback">
					문의 유형을 선택하세요
				</div>
			</div>
			<div class="col-7 col-md-8 col-xl-10">
				<input type="text" name="board_subject" class="form-control" id="validationCustom02" placeholder="제목을 입력하세요" required>
				<div class="invalid-feedback">
					제목을 입력하세요
				</div>
			</div>
		</div>
		<div class="col-12">
			<textarea class="editor" name="board_content" id="validationCustom03" required placeholder="내용을 입력하세요"></textarea>
			<div class="invalid-feedback">
				내용을 입력하세요
			</div>
		</div>
		<div class="col-12">
			<button class="btn btn-primary" type="submit" style="float:right;">확인</button>
		</div>
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
</body>
</html>
<%@ include file="../footer.jsp"%>