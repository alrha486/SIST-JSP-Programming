<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기는 includedemo.jsp 입니다.</h1>
	<%@ include file="/date.jsp" %>
	<hr>
	<%@ include file="/jimin.html" %>
	<h3>페이지의 끝 </h3>
</body>
</html>