<!-- API(카톡,네이버,페이스북 전용 회원가입을 처리하는 페이지) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.libs.model.MemberVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="ic" class="com.example.libs.controller.InsertContoller" />
<jsp:useBean id="sc" class="com.example.libs.controller.selectController" />
<!-- 카카오유저id, 이름, 폰번, 이메일만 넘어옴 -->

<%
	 MemberVO member = new MemberVO( // 카카오 간편 회원가입 전용 생성자 호출
			request.getParameter("userid"),request.getParameter("username"),
			request.getParameter("tel"),request.getParameter("email")
			); // 생성자에 4개 세팅하기 
			 
 	int row = ic.kakaoMember(member); // 입력 성공시 1을 반환
	pageContext.setAttribute("row", row); 
%>

<c:if test="${row eq 1 }">
<%
	session.setAttribute("username", request.getParameter("username")); // 로그인 성공시 세션 세팅
%>

	<script>
	alert("Insert success");
	location.href="index.jsp";
	</script>
</c:if>

<c:if test="${row ne 1 }">
	<script>
	alert("Insert failed");
	history.back();
	</script>
</c:if>
    