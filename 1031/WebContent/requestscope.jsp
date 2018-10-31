<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	int userage = Integer.parseInt(request.getParameter("userage"));
	
	request.setAttribute("username", username);
	request.setAttribute("userage", userage);
%>
<h1>Page Scope</h1>

<jsp:forward page="requestscope1.jsp">
	<jsp:param name="username" value="<%=username %>">
	<jsp:param name="userage" value="<%=userage %>">
</jsp:forward>