<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="browser" value="${header['user-agent']} scope="session"/>

<c:set var="username">
${param.username}
</c:set>

User-agent =  ${ browser } <br>
Name : ${username }
    