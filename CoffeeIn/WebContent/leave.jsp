<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dc" class="com.example.libs.controller.deleteController" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="row" value="${dc.deleteMember(sessionScope.userid)}" />


<!--deleteMember 호출해 DB에서 계정을 삭제 했다면 -->
<c:if test="${row eq 1 }"> 
	<%
		session.invalidate(); // 세션 정보 모두 지우기, 반드시 해야함!
	%> 
	<script>
		alert("회원정보가 삭제되었습니다.");
		location.href="index.html";
	</script>
</c:if>


<c:if test="${row ne 1 }">
	<script>
		alert("서버에 잠시 이상이 발생하여 다시 삭제 요청부탁드립니다.");
		history.back(); // index.jsp로 돌아감 
	</script>
</c:if>