<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>

<%-- <%= 4 / 0 %> --%>
<%
	String username = request.getParameter("username");
	out.println("귀하의 이름의 길이는 " + username.length());
%>