<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:catch var="myerror">
	<%=4 / 0 %>
</c:catch>

<c:if test="${not(empty myerror)}">
	Error Message : ${myerror}
</c:if>