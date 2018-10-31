<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>각 나라별 인사 메시지</h1>
<%
	String username = request.getParameter("username");
%>
<jsp:include page="greeting.jsp" flush="true">
	<jsp:param name="country" value="korean" />
	<jsp:param name="username" value="<%= username %>" />
</jsp:include><br>

<jsp:include page="greeting.jsp" flush="true">
	<jsp:param name="country" value="english" />
	<jsp:param name="username" value="<%= username %>" />
</jsp:include><br>

<jsp:include page="greeting.jsp" flush="true">
	<jsp:param name="country" value="japanese" />
	<jsp:param name="username" value="<%= username %>" />
</jsp:include><br>