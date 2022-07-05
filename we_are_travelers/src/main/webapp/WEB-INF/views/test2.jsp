<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>test</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbars/">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	.bd-placeholder-img {font-size: 1.125rem; text-anchor: middle; -webkit-user-select: none; -moz-user-select: none; user-select: none;}
	@media (min-width: 768px) {
		.bd-placeholder-img-lg {font-size: 3.5rem;}
	}
</style>
<script>
	function MyCustomUploadAdapterPlugin(editor) {
	    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
	        return new UploadAdapter(loader);
	    }
	}
</script>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/navbar.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<header>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Expand at sm</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse" id="navbarsExample03">
					<ul class="navbar-nav me-auto mb-2 mb-sm-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Link</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled">Disabled</a>
						</li>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
						</li>
					</ul>
					<form>
						<button type="button" class="btn btn-light">Login</button>
						<button type="button" class="btn btn-light">Sign Up</button>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<!-- /header -->
	<!-- main -->
	<main>
		<form method="post" action="${pageContext.request.contextPath}/fileUploadProcess.do" enctype="multipart/form-data">
			<input type="text" name="subject">
			<textarea class="editor" name="content"></textarea>
			<input type="submit" value="파일업로드">
		</form>
		
		
	
	
	
	
	
	
	
	
	
	
		<script src="${pageContext.request.contextPath}/resources/ckeditor/build/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/resources/ckeditor/UploadAdapter.js"></script>
		<%-- <script src="${pageContext.request.contextPath}/resources/ckeditor/editor.js" type="module"></script>​ --%>
		<script>ClassicEditor
				.create( document.querySelector( '.editor' ), {
					extraPlugins: [MyCustomUploadAdapterPlugin],
					licenseKey: '',
					
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
		<!-- <script type="module">
    	import editor from '${pageContext.request.contextPath}/resources/ckeditor/editor.js'
    		$(document).ready(function () {
       			 editor("#input-content").then(editor => {
        			// some code..
            		// then 이후에 받은 editor를 다른 변수로 받아주시는 편이 좋습니다!
        		})
   	 		})
		</script> -->
	</main>
	<!-- /main -->
	<!-- footer -->
	<footer>
		
	</footer>
	<!-- /footer -->
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>