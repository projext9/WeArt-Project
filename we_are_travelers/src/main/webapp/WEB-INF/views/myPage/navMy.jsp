<%@ page contentType="text/html; charset=UTF-8" %>
<br><br><br><br><br><br><br><br><br>
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">내정보</button>
	    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/payment.do';">구매내역</button>
	    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" onclick = "location.href = '${pageContext.request.contextPath}/inquiry_list.do';">1:1문의</button>
	  </div>
	</nav>
	