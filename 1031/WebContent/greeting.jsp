<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String country = request.getParameter("country");
	String username = request.getParameter("username");
	
	
	out.println(username + "님! <br>");
	
	switch(country){
	case "korean" : out.println("<p style='color:blue'>밤 사이 안녕하셨습니까?</p>"); break;
	case "english" : out.println("<p style='color:green'>Good Morning!</p>"); break;
	case "japanese" : out.println("<p style='color:red'>오하이오 고자이마스!</p>"); break;
	}
	
%>
