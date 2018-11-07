<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="num1" value="${param.num1 }" />
<c:set var="num2" value="${param.num2 }" />

<h1>사칙연산</h1>

<c:out value="${num1}"  /> + ${num2} = ${num1 + num2}<br />
<c:out value="${num1}"  /> - ${num2} = ${num1 - num2}<br />
<c:out value="${num1}"  /> * ${num2} = ${num1 * num2}<br />
<c:out value="${num1}"  /> / ${num2} = ${num1 / num2}<br />