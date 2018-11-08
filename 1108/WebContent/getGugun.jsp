<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<sql:setDataSource driver="org.mariadb.jdbc.Driver" 
	url="jdbc:mariadb://192.168.56.4:3306/test" user="root" 
	password="javamariadb" var="conn" />
	
<sql:query dataSource="${conn}" var="rs" 
	sql="SELECT DISTINCT gugun FROM zipcode WHERE sido = ?">
	<sql:param value="${param.listSido} "/>
</sql:query>
<mydata>	
	<c:forEach items="${rs.getRows()}" var="row">
		<gugun>
			<data>${row.gugun}</data>
		</gugun>
	</c:forEach>
</mydata>