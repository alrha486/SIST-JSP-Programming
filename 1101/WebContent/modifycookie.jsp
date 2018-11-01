<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>Cookie Update</h1>
<%
	response.addCookie(new Cookie("USERNAME", "손호준"));
	response.addCookie(new Cookie("USERGENDER", "FEMALE"));
	response.addCookie(new Cookie("USERAGE", "30"));
%>

 <h2>Cookie 3개가 수정되었습니다.</h2>
 <button onclick="javascript:history.back();">돌아가기</button>