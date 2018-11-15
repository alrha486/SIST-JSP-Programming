<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:if test="${empty sessionScope.userid }">
	<script>
		alert("로그인을 먼저 하셔야 로그아웃을 할 수 있습니다.");
		location.href="login.html";
	</script>
</c:if>

<c:if test="${not(empty sessionScope.userid)}">
	<script>
		alert("서비스에 만족하셨습니까? \n ${sessionScope.username}님! 다음에 다시 방문해주세요");
		location.href="index.html";
	</script>
</c:if>

<%
session.invalidate(); // 세션 모두 날리기 !!!!!!!!!!!!!!!!!!!!!!!
response.setHeader("Cache-Control", "no-cache");
response.addHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 1L); 
%>
