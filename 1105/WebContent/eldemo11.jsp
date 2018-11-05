<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aaa" uri="/WEB-INF/tlds/mytld.tld" %>
<%@ page import="java.util.Date " %>
<%
	Date today = new Date();
	pageContext.setAttribute("Today", today);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TLD 실습</title>
</head>
<body>
	오늘은 ${ aaa:formatDate(Today) } 입니다.
</body>
</html>