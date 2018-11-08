<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="header.jsp" var="myheader"> <!-- header.jsp 를 url코어 변수에 저장 -->
	<c:param name="userid" value="javaexpert" />
</c:url>
<c:url value="footer.html" var="myfooter" /> <!-- footer.html 를 url코어 변수에 저장 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/bootstrap.css" />
	</head>
	<body>
		<c:import url="${myheader}" /> <!-- redirect는 이동, import는 추가 -->
		<p class="text-center text-danger">보다 나은 서비스로 고객의 요청에 응답하겠습니다.</p>
		<c:import url="${myfooter}" /> <!-- redirect는 이동, import는 추가 -->
	</body>
</html>