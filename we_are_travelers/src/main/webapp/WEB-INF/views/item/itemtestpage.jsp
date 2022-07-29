<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>We-Art Project</title>
 		<link href="${pageContext.request.contextPath}/resources/css/weart_itemorder.css" rel="stylesheet" />
 		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
 		<script>
	 		function fn_getToken() { //체크 된 항목 전송
	 			alert("토큰받기 테스트");
		 		$.ajax({
					method: 'post',
	 			    url: '${pageContext.request.contextPath}/itempaycheck.do',
	 			    data: {	"imp_uid": "imp_665585739619", "merchant_uid": "2022072620520358"},
	 			    cache: false,
					success: function(data) {
						alert("토큰받기 성공");
						},
					error: function(error){ alert("에러!"); }
				})
	 		}
 		</script>
    </head>
	<body>
		<div class="list-group-item-dark w-25 py-2 rounded text-center btns" data-toggle="list" role="tab" onClick="fn_getToken()">토큰받기 테스트<i class="fal fa-arrow-circle-right"></i></div>
    </body>
</html>
