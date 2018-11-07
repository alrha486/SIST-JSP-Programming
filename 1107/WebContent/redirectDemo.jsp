<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="calculator.jsp" var="myurl">
	<c:param name="num1" value="4" />
	<c:param name="num2" value="7" />
</c:url>

<c:redirect url="${myurl}" /> 