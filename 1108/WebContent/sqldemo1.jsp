<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<c:catch var="error">
	<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>    
    <sql:query var="rs" dataSource="${conn}">
    	SELECT empno, ename, sal, hiredate, dname, loc, emp.deptno
    	FROM emp, dept 
    	WHERE emp.deptno = dept.deptno
    </sql:query>
</c:catch>    
<c:if test="${not empty error}">
	<div style="color:red;font-size:2em">Error 발생 : ${error}</div>
</c:if>
<c:if test="${empty error}">    
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>쌍용주식회사 사원명단</title>
	</head>
	<body>
		<h1>쌍용주식회사 사원명단</h1>
		<table border="1">
			<thead>
				<c:forEach items="${rs.getColumnNames()}" var="colName">
					<th>${colName}</th>
				</c:forEach>
			</thead>
			<tbody>
				<c:forEach items="${rs.rows}" var="row">
					<tr>
						<td>${row.empno}</td><td>${row.ename}</td>
						<td><fmt:formatNumber type="currency" currencySymbol="$" 
						value="${row.sal}"/></td>
						<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" 
								value="${row.hiredate}" /></td>
						<td>${row.dname}</td><td>${row.loc}</td>
						<td>${row.deptno}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
	</html>
</c:if>