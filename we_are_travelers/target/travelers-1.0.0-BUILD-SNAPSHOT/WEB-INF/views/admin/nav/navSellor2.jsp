<%@ page contentType="text/html; charset=UTF-8" %>
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/sellorList.do';">판매자리스트</button>
	    <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="true">승인대기</button>
	    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/noticeSellor.do';">1:1문의(판매자)</button>
	  </div>
	</nav>
	<br><br>