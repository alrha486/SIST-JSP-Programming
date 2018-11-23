<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="org.mariadb.jdbc.Driver" 
	url="jdbc:mariadb://192.168.56.4:3306/world" user="root" 
	password="javamariadb" var="conn"/>

<sql:query dataSource="${conn}" var="result">
	SELECT ID, Name, CountryCode, District, Population FROM city
	WHERE CountryCode = ?
	<sql:param value="${param.code}"/>
</sql:query>

<results>
	<c:forEach items="${result.getRows()}" var="row">
		<city id="${row.ID}">
			<name>${row.Name}</name>
			<countrycode>${row.CountryCode}</countrycode>
			<district>${row.District}</district>
			<population>${row.Population}</population>
		</city>
	</c:forEach>
</results>

