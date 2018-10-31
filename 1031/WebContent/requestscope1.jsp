<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = (String)request.getAttribute("username");
	int userage = (Integer)request.getAttribute("userage");
%>
<h1>Page Scope</h1>
<ul>
	<li>Username : <%= username %></li>
	<li>Userage : <%= userage %></li>
</ul>