<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <%
    	String username = request.getParameter("username");

    %>
    
    <ul>
    	<li>Name : <%=username %></li>
    </ul>