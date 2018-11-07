<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="mytoken" value="사과, 배, 딸기, 포도, 복숭아, 레몬" />
<c:forTokens items="${mytoken}" delims="," var="i">
	${i} &nbsp;&nbsp;&nbsp;
</c:forTokens>