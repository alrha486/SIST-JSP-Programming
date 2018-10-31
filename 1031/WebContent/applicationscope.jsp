<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	int userage = Integer.parseInt(request.getParameter("userage"));
	
	application.setAttribute("username", username);
	application.setAttribute("userage", userage);
%>
<h1>Page Scope</h1>
<ul>
	<li>Username : <%= username %></li>
	<li>Userage : <%= userage %></li>
</ul>
<a href="applicationscope1.jsp">값 확인하기</a>