<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="max" value="${param.max}" />
	<c:set var="sum" value="0" />
<form>
	Max : <input type="number" name="max" /><br>
			<input type="submit" value="계산하기" />
</form>

<c:forEach var="i" begin="1" end="${max}">
	<c:set var="sum" value="${sum + i }" />
</c:forEach>
Result : <input type="text" value="${sum}" />