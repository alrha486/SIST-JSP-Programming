<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h1>Cookie Setting</h1>
 <%
 	Cookie c1 = new Cookie("USERNAME","호날두");
 	response.addCookie(c1);
 	Cookie c2 = new Cookie("USERGENDER" , "male");
 	response.addCookie(c2);
 	Cookie c3 = new Cookie("USERAGE", "25");
 	response.addCookie(c3);
 %>
 
 <h2>Cookie 3개가 생성되었습니다.</h2>
 <button onclick="javascript:history.back();">돌아가기</button>