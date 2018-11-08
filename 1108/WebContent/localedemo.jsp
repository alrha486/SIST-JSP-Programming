<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<%-- <% request.setCharacterEncoding("utf-8");  %> --%>


<form method="post">
	Name : <input type="text" name="username" />
	<input type="submit" />
</form>


<c:if test="${not(empty param.username)}">
	<c:set var="username" value="${param.username}" />
	당신의 이름은 ${username} 이군요.
</c:if>