<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource  url="jdbc:oracle:thin:@192.168.56.4:1521:orcl" 
 driver="oracle.jdbc.driver.OracleDriver" user="scott" password="tiger" 
 var="conn" />
 
 <sql:update dataSource="${conn}" var="result">
 	INSERT INTO GESIPAN(idx, name, passwd, email, title, contents, writedate, readnum, grp, lev, step)
 	VALUES(board_idx_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, 0, board_idx_seq.CURRVAL, 0, 0)
 	<sql:param value="${param.name}" />
 	<sql:param value="${param.passwd}" />
 	<sql:param value="${param.email}" />
 	<sql:param value="${param.title}" />
 	<sql:param value="${param.contents}" />
 </sql:update>