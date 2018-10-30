<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>

귀하의 방문시간은 <p style='font-size:2em;color:red'>
<%
	String pattern = "yyyy년 MM월 dd일 aa hh시 mm분 ss초 입니다.";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	out.println(sdf.format(new Date()));
%>
</p>