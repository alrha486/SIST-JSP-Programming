<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:catch var="error">
<sql:setDataSource driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://192.168.56.4:3306/world" 
								user="root" password="javamariadb" var="mydatasource"/>
									
	<sql:query dataSource="${mydatasource}" sql="SELECT *FROM city WHERE CountryCode=?" var="rs">
	<sql:param value="KOR"/>
	</sql:query>
	
	<h1 style="text-align:center">한국의 도시 정보</h1>
	<table border="1">
		<thead>
			<tr>
				<th>일련번호</th><th>이름</th><th>지역</th><th>국가코드</th><th>도시인구</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="myrow" items="${rs.getRows()}"> <!-- 행 하나 갖고오는 getRows() -->
				<tr>
					<td>${myrow.ID}</td><td>${myrow.Name}</td>
					<td>${myrow.District}</td><td>${myrow.CountryCode}</td>
					<td>${myrow.Population}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	
</c:catch>	

	
<c:if test="${not(empty error)}">
	Error Message : ${error }
</c:if>
								