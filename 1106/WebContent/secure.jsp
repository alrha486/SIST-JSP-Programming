<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="verified" value="${sessionScope.verified}" scope="session"/>
<c:set var="userid" value="${sessionScope.userid}" scope="session" />

<c:if test="${verified ne true }" >
	<script>
		alert("로그인부터 해주세요");
		location.href="login.html";
	</script>    
</c:if>

<c:if test="${verified eq true }" >
	<h1 style="color:blue">${userid}님! 회원만의 환상적인 서비스를 기대해주세요.</h1>
	<a href="logout.jsp">로그아웃</a>
</c:if>