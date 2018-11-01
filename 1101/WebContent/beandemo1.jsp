<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" />

<jsp:useBean id="login" class="com.example.libs.LoginBean" />
<jsp:setProperty name="login" property="*" />


<%-- <jsp:setProperty property="userid" name="login" value="jimin"/>
<jsp:setProperty property="passwd" name="login" value="123456" /> --%>

ID : <jsp:getProperty name="login" property="userid"/><br />
Password : <jsp:getProperty property="passwd" name="login"/>