<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Cookie Delete</h1>
<%
	
	Cookie c1 = new Cookie("USERNAME", "손호준");
	c1.setMaxAge(0);
	response.addCookie(c1);
	Cookie c2 = new Cookie("USERGENDER", "FEMALE");
	c2.setMaxAge(0);
	response.addCookie(c2);	
	
%>

 <h2>Cookie 3개가 삭제되었습니다.</h2>
 <button onclick="javascript:history.back();">돌아가기</button>