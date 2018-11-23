<%@ page language="java" contentType="text/html; charset=UTF-8"
    			pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />
<c:set var="userid" value="${sessionScope.userid}" />
<c:set var="username" value="${sessionScope.username}" />
<c:set var="useremail" value="${sessionScope.useremail}" />
<!-- 카카오로그인 버튼누르면 사용자의 ID값과 이름을 가져옴 -->

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>네이버 회원가입 창</title>
	<style type="text/css">
		ul > li { list-style-type: none; padding: 5px 0px }
	</style>
	<script src="js/jquery.min.js"></script>
	<script>
		$(function(){
			$("#btnClose").click(function(){
				<%
				session.removeAttribute("username");
				%>
				location.href ="index.jsp";
			});
		});
	</script>
	
</head>
<body>
	<h1>네이버 회원가입</h1>  <!-- 카카오 회원가입은 이름,폰번,이메일만 받아서 DB에 저장  -->
		<form action="/CoffeeIn/apiRegister.jsp" method="post" name="myform">
		<ul>
			<li><input type="hidden" name="userid" value="${userid}" /></li>
			<li>Name : <input type="text" name="username"  readonly="readonly" value="${username}" /></li>
			<li>닉네임 : <input type="text" name="usernickname" placeholder="Enter your Nickname" required/></li>
			<li>Email : <input type="email" name="email" value="${useremail}" readonly="readonly" size="40" required="required"></li>
			<li>Tel : <input type="text" name="tel" placeholder="Enter your ID" required="required"></li>
			<li><input type="submit" value="가입하기">&nbsp;&nbsp;
				<input type="reset" value="다시하기">&nbsp;&nbsp;
				<input type="button" value="홈으로" id="btnClose"></li>
		</ul>
	</form>	
</body>
</html>