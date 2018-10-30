<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int age = Integer.parseInt(request.getParameter("userage"));
	if(age < 10) {
		response.sendRedirect("https://jr.naver.com/");
	}else if(age >= 10 && age < 20){
		response.sendRedirect("http://www.ebs.co.kr/main");
	}else if(age >= 20 && age < 65){
%>
	<script>
		location.replace("https://www.wetax.go.kr/main/");
	</script>
<% }else{  %>
	<script>
		location.href = "http://www.federation.or.kr/?ckattempt=1";
	</script>
<% }  %>