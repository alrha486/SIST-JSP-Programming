<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
 
<c:catch var="error">
<sql:setDataSource var="conn" dataSource="jdbc/myoracle"/>
<sql:transaction dataSource="${conn}">
	<sql:update var="row">
		INSERT INTO emp(empno, ename, job, sal, comm, deptno, hiredate) 
		VALUES(?, ?, ?, ?, ?, ?, ?)
		<sql:param value="${param.empno}" />
		<sql:param value="${param.ename}" />
		<sql:param value="${param.job}" />
		<sql:param value="${param.sal}" />
		<sql:param value="${param.comm}" />
		<sql:param value="${param.deptno}" />
		<sql:dateParam value="<%=new java.util.Date() %>" type="date"/>
	</sql:update>
</sql:transaction>
</c:catch>

<%-- <c:if test="${row eq 1}">
	<script>alert('Insert Success');</script>
</c:if>
<c:if test="${row ne 1}">
	<script>alert('Insert Failure');  history.back(); </script>
</c:if> --%>
<c:if test="${not(empty error)}">
Error Message : <p style="color:red;font-size:1.5em">${error}</p>
</c:if>


