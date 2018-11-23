<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />

<jsp:useBean id="ic" class="com.example.libs.controller.InsertContoller" />
<jsp:useBean id="sc" class="com.example.libs.controller.selectController" />

<%
	String zipcode = request.getParameter("zippost1") + request.getParameter("zippost2");  // DB의 zipcode

	MemberVO member = new MemberVO(
			request.getParameter("username"),request.getParameter("userid"),
			request.getParameter("usernickname"),	request.getParameter("passwd"),
			request.getParameter("email"), request.getParameter("tel"),
			zipcode, request.getParameter("address1"),request.getParameter("address2")
	); // 생성자에 9개 세팅하기
			 
	int row = ic.insertMember(member); // 입력 성공시 1을 반환
	pageContext.setAttribute("row", row);
%>

<c:if test="${row eq 1 }">
	<script>
	alert("Insert success");
	location.href="index.html";
	</script>
</c:if>

<c:if test="${row ne 1 }">
	<script>
	alert("Insert failed");
	history.back();
	</script>
</c:if>

