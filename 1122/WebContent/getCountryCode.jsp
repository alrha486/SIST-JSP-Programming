<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="org.mariadb.jdbc.Driver" 
	url="jdbc:mariadb://192.168.56.4:3306/world" user="root" 
	password="javamariadb" var="conn"/>

<sql:query dataSource="${conn}" var="result">
	SELECT DISTINCT CountryCode FROM city
</sql:query>

<results>
	<c:forEach items="${result.getRows()}" var="row">
		<countrycode>${row.CountryCode}</countrycode>
	</c:forEach>
</results>
    