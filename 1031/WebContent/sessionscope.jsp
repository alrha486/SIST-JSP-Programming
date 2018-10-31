<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	int userage = Integer.parseInt(request.getParameter("userage"));
	
	session.setAttribute("username", username);
	session.setAttribute("userage", userage);
%>
<h1>Page Scope</h1>
<ul>
	<li>Username : <%= username %></li>
	<li>Userage : <%= userage %></li>
</ul>
<a href="sessionscope1.jsp">값 확인하기</a>