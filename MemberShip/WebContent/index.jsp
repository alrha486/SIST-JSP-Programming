<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 메인 페이지  -->
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>IT 전문 쇼핑몰 EXAMPLE.COM에 오신 것을 환영합니다.</title>
	<script src="js/jquery.min.js"></script>
	<script>
		$(function(){
			$('#btnLeave').bind('click',function(){
				if(confirm("정말 탈퇴하시겠습니까?") == true){
					location.href="leave.jsp";
				}else{
					return false;				
				}
			});
		});
	</script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<style type="text/css">
		.jumbotron {
			background-image: url("images/digital.jpg");
		}
		body{
			color : white;
		}
	</style>
</head>
<body>
	<div class ="container"> 
	<div class="jumbotron">
		<h1 class="display-3">안녕하세요!</h1>
		<p class="lead">IT 전용 쇼핑몰 EXAMPLE.COM에서 새로운 경험을 맛보세요.</p>
		<hr class="my-4">
		<p>쇼핑몰의 새 강자 EXAMPLE.COM이 해결하겠습니다.</p>
		<p class="lead">
			<c:if test="${empty sessionScope.userid}"> <!-- 세션이 없다면  -->
			<a class="btn btn-warning btn-lg" href="login.html" role="button">로그인</a>
			</c:if>
			
			<c:if test="${not(empty sessionScope.userid)}"> <!-- 세션이 있다면  -->
			[${sessionScope.username}(${sessionScope.userid})]
			<a class="btn btn-info btn-lg" href="info.jsp" role="button">회원정보</a>
			<a class="btn btn-warning btn-lg" href="leave.jsp" role="button" id="btnLeave">회원탈퇴</a>
			<a class="btn btn-danger btn-lg" href="logout.jsp" role="button">로그아웃</a>
			</c:if>
		</p>
	</div>
	</div>
	
</body>
</html>