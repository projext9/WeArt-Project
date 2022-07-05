<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>

</head>
<body>
	<form method="POST" action="fileUploadProcess.do" enctype="multipart/form-data">
	    <input type="text" name="title" class="form-control" id="inputTitle" placeholder="제목을 입력하세요">
	    <textarea id="summernote" name="content"></textarea>
	    <input type="submit" class="btn btn-info btn-sm">
	</form>


	
	<script>
	$(document).ready(function() {
		//여기 아래 부분
			$('#summernote').summernote({
				height :300,
				minHeight:null,
				maxHeight:null,
				focus:true,
				lang : "ko-KR",
				placeholder: '내용을 입력해주세요',
				callbacks: {
					onImageUpload : function(files){
						sendFile(files[0]);
					}
				}
			});
		
		/**
		* 이미지 파일 업로드
		*/
			function sendFile(file){
				var data = new FormData();	
				data.append("file",file);
				$.ajax({
					url: "<c:url value='/SharingBBS/upload.do'/>", //////여기 본인 주소! 
					type: "POST",
					enctype: 'multipart/form-data',
					data: data,
					cache: false,
					contentType : false,
					processData : false,
					success: function(image){
						var url = "<c:url value='/upload/"+image.url+"' />" 
						$('#summernote').summernote('insertImage',url);
					},
					error: function(e){console.log(e);}  
				});	
			}
	});
	</script>
</body>
</html>