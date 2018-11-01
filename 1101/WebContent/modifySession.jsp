<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>Session Update</h1>
<%
session.setAttribute("username", "손호준");
session.setAttribute("usergender", "male");
session.setAttribute("userage", 27);
%>

 <h2>Session 3개가 수정되었습니다.</h2>
 <button onclick="javascript:history.back();">돌아가기</button>