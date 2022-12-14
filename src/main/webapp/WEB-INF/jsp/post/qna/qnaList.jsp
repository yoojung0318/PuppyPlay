<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 		
 		<!-- monthly-logo -->
 			<div class="monthly-logo col-12 d-flex justify-content-center align-items-between ">
 				<div class="monthly-logo-text col-4">
 					<h1 class="text-center mt-2">Q&A</h1>
 				</div>
 			</div>
 		<!-- /monthly-logo -->
 		
 		<table class="table">
 			<thead class="ml-3">
 				<tr>
		 			<th>no.</th>
		 			<th>제목</th>
		 			<th>글쓴이</th>
		 			<th>날짜</th>
 				</tr>
 			</thead>	
 			<tbody> 		
 			<c:forEach var="qna" items="${qnaList}">
 				<tr>
 					<td>${qna.qna.id}</td>
 					<td><a href="/post/qna/detail/view?id=${qna.qna.id}" class="text-dark">문의합니다.</a></td>
 					<td>${qna.user.loginId}</td>
 					<td><fmt:formatDate value="${qna.qna.createdAt}" pattern="yyyy-MM-dd"/></td>
 				</tr>
 		
 				<!-- answer 바로가기 ( 단, 비어있는 경우 숨김) -->
 				<tr>
 					<c:if test="${not empty qna.qna.answer}">
 						<td> </td>
 						<td colspan="2"><a href="/post/qna/detail/view?id=${qna.qna.id}" class=""> ↳Re)답변 드립니다 :)</a></td>
 						<td><fmt:formatDate value="${qna.qna.updatedAt}" pattern="yyyy-MM-dd"/></td>
 					</c:if>
 				</tr>

	 		</c:forEach>
			
	 				
 			</tbody>	
 		</table>
 		<!--작성하기 버튼 (클릭시, qna/create로 넘거감) -->
 		<div class="d-flex justify-content-end mt-2">
	 			<a href="/post/qna/create/view" class="btn btn-info">작성하기</a>
 		</div>
 		</section>
 		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
 	</div>
 
 	
</body>
</html>