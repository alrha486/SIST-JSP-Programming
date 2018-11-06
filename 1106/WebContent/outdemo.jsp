<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.File,java.io.FileReader,java.io.BufferedReader" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	File file = new File(application.getRealPath("./login.jsp"));
	BufferedReader br = new BufferedReader(new FileReader(file));
	String line = null;
%>
<pre>
	<%
	while((line = br.readLine()) != null){	
%>

	<c:out value=" ${line}" escapeXml="true"/>
		
<%
	} 

%><%
	br.close();
%>