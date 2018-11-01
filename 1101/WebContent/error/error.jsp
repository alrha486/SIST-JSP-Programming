<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
    
Message : <%= exception.getMessage() %><br> 
Type : <%= exception.toString() %>
<%
	exception.printStackTrace();
%>