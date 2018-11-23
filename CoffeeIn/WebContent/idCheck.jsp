<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
	url="jdbc:oracle:thin:@192.168.56.4:1521:orcl" user="scott" 
	password="tiger" var="conn" />

	
<c:if test="${not(empty param.userid)}">
 <!-- parameter로 넘어온 keyword값이 null이 아니라면 -->
	<sql:query dataSource="${conn}" var="rs">  
		SELECT userid FROM Member 
		WHERE userid = ?		  
	<sql:param value="${param.userid}"/>
	</sql:query>
	
	
	<c:if test="${rs.getRowCount() eq 1}" > <!-- DB에 있다면 -->
		<span style="color:red">이미 존재하는 ID입니다.</span>
	</c:if>
	
	<c:if test="${rs.getRowCount() ne 1}" > <!-- DB에 있다면 -->
		<span>사용 가능한 ID입니다.</span>
		<script>
			alert("idcheck.jsp호출");
		</script>
	</c:if>
	
</c:if>









