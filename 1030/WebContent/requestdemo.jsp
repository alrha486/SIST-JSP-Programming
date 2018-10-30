<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration" %>
<%
	Enumeration<String> names = request.getHeaderNames();
	out.println("<ul>");
	while(names.hasMoreElements()){
		String name = names.nextElement();
		Enumeration<String> values = request.getHeaders(name);
		out.print("<li>" + name + " : ");
		while(values.hasMoreElements()){
			String value = values.nextElement();
			out.print(value + ", ");
		}
		out.println("</li>");
	}
	out.println("</ul>");
%>