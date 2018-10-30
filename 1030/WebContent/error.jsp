<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isErrorPage="true" %>
<div><img src="images/jimin.jpg" width="200" height="200"></div>
<div>서버에 잠시 오류가 발생했습니다. 보다 나은 서비스로 보답하겠습니다.</div>
<%
	if(exception instanceof ArithmeticException){
		out.println("ArithmeticException");
	}else if(exception instanceof NullPointerException){
		out.println("NullPointerException");
	}else if(exception instanceof java.io.IOException){
		out.println("IOException");
	}else if(exception instanceof java.sql.SQLException){
		out.println("SQLException");
	}else{
		out.println("Exception");
	}
%>