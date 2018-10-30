<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>여기는 pagecontextdemo1.jsp입니다.</h1>
<hr />
<%  pageContext.include("/date.jsp"); %>
<hr />
<% pageContext.include("/jimin.html"); %>
<div>All right Reserved.</div>
</body>
</html>








