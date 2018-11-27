<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String [] colors = request.getParameterValues("colors");
	out.println("<ul>");
	for(int i = 0 ; i < colors.length ; i++){
		out.println("<li>" + colors[i] + "</li>");
	}
	out.println("</ul>");
%>