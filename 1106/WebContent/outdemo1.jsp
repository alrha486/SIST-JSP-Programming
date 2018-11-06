<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

사용자 아이디 : <c:out value="${param.userid}" default="guest" /><br>


<c:out value="<font size='7' color='red' face='Arial'>Hello,World</font>" escapeXml="true" /><br>
<c:out value="<font size='7' color='red' face='Arial'>Hello,World</font>" escapeXml="false" /><br>