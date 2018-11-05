<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String [] array = new String[3];
	array[0] = "김태리";
	array[1] = "한지민";
	array[2] = "류준열";
	pageContext.setAttribute("ACTORS", array);
%>

<ul>
	<li>${ACTORS[0]}</li>
	<li>${ACTORS[1]}</li>
	<li>${ACTORS[2]}</li>
</ul>