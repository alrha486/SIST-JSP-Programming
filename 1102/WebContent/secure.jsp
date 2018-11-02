<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="com.example.libs.LoginBean" scope="session" />
<!DOCTYPE html>
<%
	if(login.isVerified()){ // 로그인 상태일 경우 (true)
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용 페이지</title>
</head>
<body style = 'background-color:green'>
	<jsp:getProperty name="login" property="userid" />님!<br>
	<p style='color:orange; font-weight:900'>회원만의 환상적인 서비스를 경험해 보세요.</p>
	<a href="logout.jsp">로그아웃 하기</a>
</body>
</html>
<%
	}else{ 
%>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body style = 'background-color:red'>
	<jsp:getProperty name="login" property="userid" />님!<br>
	<script>
		alert("반드시 로그인을 하셔야 합니다.");
		location.href="login.html";
	</script>
</body>
</html>
<% } %>
