<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
 	<div class="wrap">
 		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
 		<section>
 		<!-- notice-logo -->
 			<div class="monthly-logo col-12 d-flex justify-content-center align-items-between ">
 				<div class="monthly-logo-text col-4">
 					<h1 class="text-center mt-2">Q&A</h1>
 				</div>
 			</div>
 		<!--  /notice-logo -->	
 			<hr class="mt-3">
 			<div class="d-flex">
 				<label><h2>제목:</h2></label>
 				<h2 class="ml-3">${qna.title}</h2>
 			</div>
 			
 			<hr class="hr-solid">
 			
 			<div>
	 			<!-- 작성한 글 -->
	 			<div class="mt-4 p-4 col-7" > <pre>${qna.content}<pre> </div>
	 			<hr class="hr-solid">
	 			
	 			<!--  작성한 답글 -->
	 			<div class="mt-4 p-4 col-7"><pre>${qna.answer}</pre></div>
	 		</div>	
	 		<!-- /글 -->
 			<!-- button -->
 			<div class="d-flex justify-content-end">
 				<a href="/post/qna/create/view" class="btn btn-info">작성하기</a>
	 			<a href="/post/qna/list/view" class="btn btn-info">목록으로</a>
 			</div>
 		</section>
 		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
 </div>
</body>
</html>		