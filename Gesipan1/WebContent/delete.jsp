<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dc" class="com.example.libs.controller.DeleteController" />
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />

<c:if test="${empty param.p_idx}"> <!--  첫 페이지라면  -->
<c:set var="dbpasswd" value="${sc.selectPasswd(param.idx)}" />
</c:if>

<c:if test="${not(empty param.p_idx)}"> <!-- 비어있지 않다면 -->
<c:set var="p_idx" value="${param.p_idx}" />
<c:set var="dbpasswd" value="${param.dbpasswd}" />
<c:set var="userpasswd" value="${param.userpasswd}" />

	<c:if test="${dbpasswd eq userpasswd }">
		${dc.delete(p_idx); ''}
		<script>
			self.close(); // 삭제했다면 이 창을 닫고 
			opener.location.href = "index.html"; // 메인화면으로
		</script> 
	</c:if>
	<c:if test="${dbpasswd ne userpasswd }">
		<script>
			alert("비밀번호가 일치하지 않습니다.\n 확인 후 다시 입력해 주세요.");
			history.back(); // 이전 페이지로
		</script> 		
	</c:if>
</c:if>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제하기</title>
</head>
<body>
	<h3>글을 삭제하시려면 비밀번호를 넣으세요.</h3>
	<form method="post" action="delete.jsp">
		<input type="hidden" name="dbpasswd" value="${dbpasswd}" />
		<!-- hidden type으로 idx값을 자기 자신한테 전송 -->
		<input type="hidden" name="p_idx" value="${param.idx}" />
		비밀번호 : <input type="password" name="userpasswd" /><br />
		<input type="submit" value="삭제하기">
	</form>
</body>
</html>