<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8"/>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
	url="jdbc:oracle:thin:@192.168.56.4:1521:orcl" user="scott" 
	password="tiger" var="conn" />

<h2>찾고자하시는 읍/면/동을 입력하신 후 검색버튼을 눌러주세요</h2>
<form method="POST">
	읍/면/동 : <input type="text" name="keyword" />
	<input type="submit" value="검색" />
</form>

<c:if test="${not(empty param.keyword)}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE dong LIKE CONCAT(CONCAT('%',?),'%')
		  
	<sql:param value="${param.keyword}"/>
</sql:query>
	
<table border='1'>
<thead>
	<tr>
		<th>우편번호</th><th>광역시도</th><th>시/군/구</th>
		<th>읍/면/동</th><th>번지</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${rs.getRows()}" var="row">
		<tr id="(${row.zipcode}) ${row.sido} ${row.gugun} ${row.dong}">
			<td>${row.zipcode}</td>
			<td>${row.sido}</td>
			<td>${row.gugun}</td>
			<td>${row.dong}</td>
			<td>${row.bunji}</td>
			<td><a href="javascript:void(0);" onclick='winClose(this.parentNode.parentNode)'>선택</a></td>
		</tr>
	</c:forEach>
</tbody>
</table>
</c:if>

<script>
	function winClose(tr){
		var str = tr.getAttribute('id');
		opener.document.myform.zippost1.value = str.substring(1,4);
		opener.document.myform.zippost2.value = str.substring(5,8);
		opener.document.myform.address1.value = str.substring(10);
		//self.close();
		
	}
</script>
