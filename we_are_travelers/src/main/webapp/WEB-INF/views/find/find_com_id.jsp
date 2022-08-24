<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위아트 기업 아이디 비밀번호찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet" />
</head>
<body>
<a href="${pageContext.request.contextPath}/login.do"><h1>We Are <br>
Travelers! <br>
for Company
</h1></a>
<div style="text-align:center; position:relative; top:160px;">
<h3 class="join_guide_2">찾으실 아이디(이메일)에 해당하는 기업명과 대표자 이름을 입력해주세요</h3>
</div>

<main class="find_id_main">
<form class="find_form_com_id" name="joinForm" action="${pageContext.request.contextPath}/result_com_id.do" method="post">

    
  <div class="info_input_box">
    
       <div class="name_wrap">
    <label>기업명
        <input class="name_input" id="name_input_id" name="company_name" placeholder="기업명을 입력해주세요">
    </label>
        <div class="name_input_check"></div>
     </div>  
 
    <div class="ceo_wrap">
    <label>대표자
        <input class="ceo_input" id="ceo_input_id" name="company_ceo_name" placeholder="사업자등록증명원에 명시된 이름을입력해주세요">
     </label>  
        <div class="ceo_input_check"></div>
     </div>  
     
 </div>
     <br><br>
    <div class="next_wrap_find">
	<button type="submit" class="next_find" value="다음" style="font-size:1.3em">찾기</button>
	</div>
</form>  
</main>
</body>
</html>