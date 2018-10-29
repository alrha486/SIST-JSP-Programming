<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
	<li>User Address : <%=request.getRemoteAddr() %></li>
	<li>User ContentType : <%=request.getContentType() %></li>
	<li>Protocol : <%=request.getProtocol() %></li>
	<li>Method : <%=request.getMethod() %></li>
	<li>Request URI : <%=request.getRequestURI() %></li>
	<li>Context Path : <%=request.getContextPath() %></li>
	<li>Server Name : <%=request.getServerName() %></li>
	<li>Server Path : <%=request.getServletPath() %></li>
	<li>Server Port : <%=request.getServerPort() %></li>
</ul>