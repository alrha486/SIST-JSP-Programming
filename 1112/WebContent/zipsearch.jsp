<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="easy" uri="/WEB-INF/tlds/easy.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호검색</title>
</head>
<body>
	<h3>찾고자 하시는 읍/면/동이름을 입력 후 검색버튼을 눌러주세요.</h3>
	<form method="post">
		읍/면/동이름 : <input type="text" name="keyword" />
		<input type="submit" value="검색" />
	</form>
	<c:if test="${not(empty param.keyword)}">
		<easy:zipsearch keyword="${param.keyword}" />
	</c:if>
</body>
</html>