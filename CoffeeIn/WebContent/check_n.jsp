<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<jsp:useBean id="sc" class="com.example.libs.controller.selectController" />

<c:set var="userid" value="${sessionScope.userid}" /> <!-- 카카오 -->
<c:set var="username" value="${sessionScope.username}" /> <!-- 카카오 , 네이버-->
<c:set var="username" value="${sessionScope.useremail}" /> <!-- 카카오 , 네이버-->

<c:set var="n_member" value="${sc.selectMember(userid)}" /> <!-- 카카오 -->
<c:set var="naver" value="${n_member.userid}" />

<%
	String username = (String)session.getAttribute("username");
%>
<!-- 카카오톡 아이디가 DB에 없다면 -->
<c:if test="${empty naver}" > 
	<script>
	location.href="naverjoin.jsp";
	</script>
</c:if>

<!-- 카카오톡 아이디가 DB에 있다면 -->
<c:if test="${not(empty naver)}" >
	<%
	session.setAttribute("username", username); // 로그인 성공시 세션 세팅
	%>
	<script>
	location.href="index.html";
	</script>
</c:if>


