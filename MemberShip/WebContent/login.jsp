<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.example.libs.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:useBean id="sc" class="com.example.libs.controller.selectController" />

<c:set var="flag" value="${sc.loginMember(param.userid, param.password) }" />


<c:if test="${ flag eq 1 }"> <!-- 성공 -->
<%
	session.setAttribute("userid", request.getParameter("userid")); // 로그인 성공시 세션 세팅
	MemberVO member = sc.selectMember(request.getParameter("userid"));
	session.setAttribute("username", member.getUsername()); // 로그인 성공시 세션 세팅
%>
	<script>
		alert("${sessionScope.username}(${param.userid})님! 환영합니다.");
		location.href = "index.html";
		</script>
</c:if>

<c:if test="${ flag eq -1 }"> <!-- 아이디 불일치 -->
	<script>
		alert("해당 아이디가 존재하지 않습니다.\n확인 후 다시 입력해주세요");
		history.back();
	</script>
</c:if>

<c:if test="${ flag eq -0 }"> <!-- 비밀번호 불일치 -->
	<script>
		alert("비밀번호가 일치하지 않습니다.\n확인 후 다시 입력해주세요");
		history.back();
	</script>
</c:if>