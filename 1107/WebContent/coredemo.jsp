<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${ array = {1,4,7,2,9}; sum = array.stream().sum(); ''}

<c:out value="${sum}" />
 