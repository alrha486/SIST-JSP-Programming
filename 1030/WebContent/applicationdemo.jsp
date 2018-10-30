<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration" %>

<ul>
<%
	Enumeration<String> names = application.getInitParameterNames();
	while(names.hasMoreElements()){
		String name = names.nextElement();
		out.println("<li>" + name + " : " + application.getInitParameter(name) + "</li>");
	}
%>	
</ul>
<%
	application.log("Hello, World");
	System.out.println("Hello, JSP");
%>