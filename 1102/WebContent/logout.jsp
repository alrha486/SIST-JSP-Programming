<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="com.example.libs.LoginBean" scope="session" />
<!DOCTYPE html>
<%
	if(!login.isVerified()){ // 로그인 상태일 경우 (true)
%>
	<script>
		alert("로그인을 먼저 하셔야 로그아웃을 할 수 있습니다.");
		location.href="login.html";
	</script>
</body>
</html>
<% }else{ %>
	<script>
		alert("서비스에 만족하셨습니까? \n <%= login.getUserid()%>님! 다음에 다시 방문해주세요.");
		location.replace="login.html";
	</script>
	
<%
}
response.setHeader("Cache-Control", "no-cache");
response.addHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 1L); 

%>
