<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <section class="bg-light">
        <div class="container py-4">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center" href="index.do">
                    <span class="text-dark h4">도시</span> <span class="text-primary h4">거북</span>                 
                </a>
            </div>
            <div>
            	<h1 class ="text-dark text-center">환영합니다!</h1>
            	<p class="text-center"> 
            		<span>${name}</span>님의 로그인 성공<br> 이메일 주소는 <strong>${email}</strong>입니다.
            	</p>
            </div>
            <div class="d-grid gap-2">
           		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='index.do'">시작하기</button>
            </div>
        </div>
    </section>

</body>
</html>