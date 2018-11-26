<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />      
<jsp:useBean id="uc" class="com.example.libs.controller.updateController" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<jsp:setProperty name="member" property="userid" value="${sessionScope.userid}"/>
<jsp:setProperty name="member" property="email" value="${param.email}"/>
<jsp:setProperty name="member" property="zipcode" value="${param.zippost1}-${param.zippost2}"/>
<jsp:setProperty name="member" property="address1" value="${param.address1}"/>
<jsp:setProperty name="member" property="address2" value="${param.address2}"/>

<c:set var="row" value="${uc.updateMember(member)}" />

<c:if test="${row eq 1 }">
	<script>
		alert("회원정보가 수정되었습니다.");
		location.href="index.html";
	</script>
	
</c:if>

<c:if test="${row ne 1 }">
	<script>
		history.back();
	</script>
</c:if>