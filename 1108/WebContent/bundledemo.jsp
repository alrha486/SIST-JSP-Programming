<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="bundle" var="mybundle" />
출력메세지 : <fmt:message key="sendMessage" bundle="${mybundle}" />