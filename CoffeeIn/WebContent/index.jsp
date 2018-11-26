<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 메인 페이지  -->
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>2조 프젝</title>
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
		<p class="lead">2조프젝</p>
		<hr class="my-4">
		<p>2조프젝</p>
		<p class="lead">
			<c:if test="${empty sessionScope.username}"> <!-- 세션이 없다면  -->
			<a class="btn btn-warning btn-lg" href="login1.jsp" role="button">로그인</a>
			</c:if>
			
			<c:if test="${not(empty sessionScope.username)}"> <!-- 세션이 있다면  -->
			[${sessionScope.username}]
			<a class="btn btn-info btn-lg" href="info.jsp" role="button">회원정보</a>
			<a class="btn btn-warning btn-lg" href="leave.jsp" role="button" id="btnLeave">회원탈퇴</a>
			<a class="btn btn-danger btn-lg" href="logout.jsp" role="button">로그아웃</a>
			</c:if>
		</p>
	</div>

	</div>
				<a href="p_list.jsp"><h3>상품리스트</h3></a><br>
				<a href="cart.jsp"><h3>장바구니</h3></a><br>

</body>
</html>