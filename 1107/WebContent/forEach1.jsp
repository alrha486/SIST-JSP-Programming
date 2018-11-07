<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
<c:forEach items="${headerValues}" var="i" >
	<li>${i.key} :
	  	<c:forEach items="${i.value }" var="j" >
	  		${j} &nbsp;&nbsp;&nbsp;
	  	</c:forEach>
	 </li>
</c:forEach>
</ul>