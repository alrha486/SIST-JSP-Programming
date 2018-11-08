<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="http://localhost:8080/1107/forEach.jsp" var="myurl"/>
<c:import url="${myurl}" var="myimport" />

<h1>Import Demo</h1>
${myimport}
