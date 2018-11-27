<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String passwd = request.getParameter("userpasswd");
	if(userid.equals("javaexpert") && passwd.equals("12345678")){
		session.setAttribute("userid", userid);
	}
%>