<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:useBean id="sc" class="com.example.libs.SelectController" />
<c:set var="flag" value="${sc.userLogin(param.userid, param.password) }" scope="session"/>
 


<c:if test="${ flag eq 1 }">
	<c:set var="userid" value="${param.userid}" scope="session" />
	<c:set var="verified" value="true" scope="session" />
	<a href="secure.jsp">회원 전용 페이지로 이동</a>
</c:if>

<c:if test="${ flag eq -1 }">
	<script>
		alert("해당 아이디가 존재하지 않습니다.");
		history.back();
	</script>
</c:if>

<c:if test="${ flag eq -0 }">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
</c:if>