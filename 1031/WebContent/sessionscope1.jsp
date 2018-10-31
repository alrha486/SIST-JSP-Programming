<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = (String)session.getAttribute("username");
	int userage = (Integer)session.getAttribute("userage");
%>
<h1>Page Scope</h1>
<ul>
	<li>Username : <%= username %></li>
	<li>Userage : <%= userage %></li>
</ul>