<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cnt" class="com.example.libs.CountBean" scope="page" />

<h1>Page Scope</h1>
방문자수 : <span style="color:red">
			<jsp:getProperty name="cnt" property="count" />
			</span><br />
<a href="pagescopedemo.jsp">다시 방문하기</a>