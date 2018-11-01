<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="color" class="com.example.libs.ColorBean" />
<jsp:setProperty name="color" property="*" />


<div style="font-size:2em">
	<jsp:getProperty name="color" property="name" />님!
</div>
<div style="color:<jsp:getProperty name='color' property='color' />">
귀하가 좋아하시는 색상은 <jsp:getProperty name='color' property='color' />입니다.</div>