<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>선수 명단</h1>
<ul>
	<c:forEach items="${mymap}" var="player">
		<li>${player.key} : ${player.value}</li>
	</c:forEach>
</ul>