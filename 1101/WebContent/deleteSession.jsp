<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Session Delete</h1>
<%
	session.removeAttribute("username");
	session.removeAttribute("usergender");
%>

 <h2>Session 2개(username,userage)가 삭제되었습니다.</h2>
 <button onclick="javascript:history.back();">돌아가기</button>