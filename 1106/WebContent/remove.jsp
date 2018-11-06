<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>삭제 전</h1>
<c:set var="browser" value="${header['user-agent']}" />
<c:out value="${browser}" /><br>
<h1>삭제 후</h1>
<c:remove var="browser" />
<c:out value="${browser}" /><br>