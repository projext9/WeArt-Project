<%@ page contentType="text/html; charset=UTF-8" %>
<br><br><br><br><br><br><br><br><br>
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/sellerinfo.do';">내정보</button>
	    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/itemManage.do';">판매상품</button>
	    <button class="nav-link active" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="true" onclick = "location.href = '${pageContext.request.contextPath}/sendManage.do';">배송관리</button>
   	    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/itemwrite.do';">상품등록</button>
	  </div>
	</nav>
