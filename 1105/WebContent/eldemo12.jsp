<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, com.example.libs.DateEL" %>
<% 
	Date today = new Date();
	pageContext.setAttribute("today", today); 	
%>

<body>
	오늘은 <b>${ DateEL.getFormat(today) }</b>
</body>
