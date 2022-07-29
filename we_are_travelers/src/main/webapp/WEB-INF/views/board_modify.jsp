<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./nav.jsp"%>
<html>
<head>
	<title>write</title>
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
	<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
</head>
<body>
	<main>
		<%-- <form method="post" action="${pageContext.request.contextPath}/modify_board.do?board_idx=${boardVo.board_idx}" enctype="multipart/form-data" style="margin:5% 20% 5% 20%;">
			<input type="text" name="board_subject" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요" value="${boardVo.board_subject}">
			<textarea class="editor" name="board_content">${boardVo.board_content}</textarea>
			<input type="submit" class="btn btn-primary" value="확인">
		</form> --%>
		<form class="row g-1 needs-validation" method="post" action="${pageContext.request.contextPath}/modify_board.do?board_idx=${boardVo.board_idx}" enctype="multipart/form-data" style="margin:5% 20% 5% 20%;" novalidate>
			<div class="col-md-12">
				<input type="text" name="board_subject" class="form-control" id="validationCustom05" placeholder="제목을 입력하세요" value="${boardVo.board_subject}" required>
				<div class="invalid-feedback">
					제목을 입력하세요
				</div>
			</div>
			<div class="col-md-12">
				<textarea class="editor" name="board_content" id="validationCustom05" required placeholder="내용을 입력하세요">${boardVo.board_content}</textarea>
				<div class="invalid-feedback">
					내용을 입력하세요
				</div>
			</div>
			
			<div class="col-12">
				<button class="btn btn-primary" type="submit">확인</button>
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
<%@ include file="./footer.jsp"%>