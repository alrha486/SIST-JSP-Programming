<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Map,java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="array" value="{3,4,5,6,7,8,9}" />

<c:forEach items="${array}" var="i" >
	<c:out value="${i }" /> &nbsp;&nbsp;&nbsp;
</c:forEach><br>

<%
	Map<Integer, String> map = new HashMap<Integer,String>();
	map.put(1, "크리스티아누 호날두");
	map.put(2, "리오넬 메시");
	map.put(3, "즐라탄 이브라히모비치");
	map.put(4, "웨인 루니");
%>
<c:set var="PLAYERS" value="<%=map %>" />

<c:forEach items="${PLAYERS}"  var="i">
	${i.key} = ${i.value} <br>
</c:forEach>