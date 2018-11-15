<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" /> <!-- 들어오는 파라미터 인코딩 세팅 -->
<c:if test="${not(empty param.username) and not(empty param.email)}">
	<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
		url="jdbc:oracle:thin:@192.168.56.4:1521:orcl" user="scott" password="tiger" 
		var="conn"/>
	<sql:query dataSource="${conn}" var="rs">
		SELECT userid FROM MEMBER WHERE username = ? AND email = ?
		<sql:param value="${param.username}"/>
		<sql:param value="${param.email}" />
	</sql:query>	
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<fieldset>
			<legend>가입시 입력하셨던 이름과 Email을 넣고 검색버튼을 눌러주세요.</legend>
			<ul>
				<li>이름 : <input type="text" name="username" /></li>
				<li>Email : <input type="email" name="email" size="50" /></li>
				<li><input type="submit" value="검색" /></li>
				<c:if test="${not(empty param.username) and not(empty param.email)}">
					<c:if test="${rs.getRowCount() eq 0}">
						<li><span style="color:red">일치된 검색 결과가 없습니다. 확인 후 다시 입력해 주세요.</span></li>
					</c:if>
					<c:if test="${rs.getRowCount() ne 0}">
						<c:forEach items="${rs.getRows()}" var="row">
							<li>ID : ${row.userid}</li>
						</c:forEach>
					</c:if>
				</c:if>
			</ul>
		</fieldset>
	</form>
</body>
</html>